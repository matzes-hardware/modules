#include <stm8s208mb.h>
#include "NRF24L01.h"
#include <ws_spi.h>
#include "stdio.h"
#include <system.h>


#define	RX_DR			0x40
#define	TX_DS			0x20
#define	MAX_RT			0x10

u8 TX_ADDRESS[TX_ADR_WIDTH] = {0xb2,0xb2,0xb3,0xb4,0x01};  // 定义一个静态发送地址



u8 RX_BUF[TX_PLOAD_WIDTH];

u8 TX_BUF[TX_PLOAD_WIDTH];

/*配置MISO and MOSI SCLK 为复用功能（推挽）输出  SPI1  */
/*配置SPI NRF24L01+片选	GPIOB_PIN_15     	CSN   	通用推挽输出模式 */
/*配置SPI NRF24L01+模式选择	GPIOB_PIN_14    CE		通用推挽输出模式*/
/*配置SPI NRF24L01+中断信号	 GPIOB_PIN_13   IRQ		上拉输入模式*/




static void delay1us(u8 t)
{
delay_us(t);
} 

/****向寄存器reg写一个字节，同时返回状态字节**************/
u8 SPI_RW_Reg(u8 reg,u8 value)
{
	u8 status;
	CSN_0;
	status=SPI1_communication(reg);   //select register  and write value to it
	SPI1_communication(value);   
	CSN_1;
	return(status); 
}
/****向寄存器reg读一个字节，同时返回状态字节**************/
u8 SPI_Read_Reg(u8 reg)
{
	u8 status;
	CSN_0;
	SPI1_communication(reg);
	status=SPI1_communication(0);   //select register  and write value to it
	CSN_1;
	return(status);
}
/********读出bytes字节的数据*************************/
u8 SPI_Read_Buf(u8 reg,u8 *pBuf,u8 bytes)
{
	u8 status,byte_ctr;
	CSN_0;
	status=SPI1_communication(reg);       
	for(byte_ctr=0;byte_ctr<bytes;byte_ctr++)
		pBuf[byte_ctr]=SPI1_communication(0);
	CSN_1;
	return(status);
}

/****************写入bytes字节的数据*******************/
u8 SPI_Write_Buf(u8 reg,u8 *pBuf,u8 bytes)
{
	u8 status,byte_ctr;
	CSN_0;
	status=SPI1_communication(reg); 
	delay1us(1);
	for(byte_ctr=0;byte_ctr<bytes;byte_ctr++)
		SPI1_communication(*pBuf++);
	CSN_1;
	return(status);
}

/*接收函数，返回1表示有数据收到，否则没有数据接收到**/
u8 nRF24L01_RxPacket(u8* rx_buf)
{
    u8 status,revale=0;
	CE_0;
	delay1us(10);
	status=SPI1_communication(STATUS);	// 读取状态寄存其来判断数据接收状况
//	CE_0;
//	status=0x40;
	printf("STATUS接受状态：0x%2x\r\n",status);

	if(status & RX_DR)				// 判断是否接收到数据
	{
//		CE_1;
		SPI_Read_Buf(RD_RX_PLOAD,rx_buf,TX_PLOAD_WIDTH);// read receive payload from RX_FIFO buffer
//		CE_0;
		revale =1;			//读取数据完成标志
	}
	SPI_RW_Reg(WRITE_REG_NRF24L01 + STATUS,status);   //接收到数据后RX_DR,TX_DS,MAX_PT都置高为1，通过写1来清楚中断标志
	CE_1;
	return revale;	
}

 /****************发送函数***************************/
void nRF24L01_TxPacket(unsigned char * tx_buf)
{
	CE_0;			//StandBy I模式	
	SPI_Write_Buf(WRITE_REG_NRF24L01 + RX_ADDR_P0, TX_ADDRESS, TX_ADR_WIDTH); // 装载接收端地址
	SPI_Write_Buf(WR_TX_PLOAD, tx_buf, TX_PLOAD_WIDTH); 			 // 装载数据	
	SPI_RW_Reg(WRITE_REG_NRF24L01 + CONFIG, 0x0e);   		 // IRQ收发完成中断响应，16位CRC，主发送
	CE_1;		 //置高CE，激发数据发送
	delay1us(10);
}

void RX_Mode(void)
{
	CE_0;
  	SPI_Write_Buf(WRITE_REG_NRF24L01 + RX_ADDR_P0, TX_ADDRESS, TX_ADR_WIDTH);  // 接收设备接收通道0使用和发送设备相同的发送地址
  	SPI_RW_Reg(WRITE_REG_NRF24L01 + RX_PW_P0, TX_PLOAD_WIDTH);  // 接收通道0选择和发送通道相同有效数据宽度 
 
  	SPI_RW_Reg(WRITE_REG_NRF24L01 + EN_AA, 0x3f);               // 使能接收通道0自动应答
  	SPI_RW_Reg(WRITE_REG_NRF24L01 + EN_RXADDR, 0x3f);           // 使能接收通道0
  	SPI_RW_Reg(WRITE_REG_NRF24L01 + RF_CH, 40);                 // 选择射频通道0x40

  	SPI_RW_Reg(WRITE_REG_NRF24L01 + RF_SETUP, 0x07);            // 数据传输率1Mbps，发射功率0dBm，低噪声放大器增益
  	SPI_RW_Reg(WRITE_REG_NRF24L01 + CONFIG, 0x0f);              // CRC使能，16位CRC校验，上电，接收模式
  	CE_1;
}

void TX_Mode(u8 * tx_buf)
{
	CE_0;
  	SPI_Write_Buf(WRITE_REG_NRF24L01 + TX_ADDR, TX_ADDRESS, TX_ADR_WIDTH);     // 写入发送地址
  	SPI_Write_Buf(WRITE_REG_NRF24L01 + RX_ADDR_P0, TX_ADDRESS, TX_ADR_WIDTH);  // 为了应答接收设备，接收通道0地址和发送地址相同
  	SPI_Write_Buf(WR_TX_PLOAD, tx_buf, TX_PLOAD_WIDTH); 			 // 装载数据
  	SPI_RW_Reg(WRITE_REG_NRF24L01 + EN_AA, 0x3f);       // 使能接收通道0自动应答
  	SPI_RW_Reg(WRITE_REG_NRF24L01 + EN_RXADDR, 0x3f);   // 使能接收通道0
  	SPI_RW_Reg(WRITE_REG_NRF24L01 + SETUP_RETR, 0x0a);  // 自动重发延时等待250us+86us，自动重发10次
  	SPI_RW_Reg(WRITE_REG_NRF24L01 + RF_CH, 40);         // 选择射频通道0x40
  	SPI_RW_Reg(WRITE_REG_NRF24L01 + RF_SETUP, 0x07);    // 数据传输率1Mbps，发射功率0dBm，低噪声放大器增益
	SPI_RW_Reg(WRITE_REG_NRF24L01 + RX_PW_P0, TX_PLOAD_WIDTH);  // 接收通道0选择和发送通道相同有效数据宽度
  	SPI_RW_Reg(WRITE_REG_NRF24L01 + CONFIG, 0x0e);      // CRC使能，16位CRC校验，上电
	CE_1;
	delay1us(10);
} 

void nRF24L01_Initial(void)
{

	/*CE CSN Initial*/
PC_DDR=0X7F;
PC_CR1=0XFF;
PC_CR2=0X00;
PI_DDR=0XF7;
PI_CR1=0XFF;
PI_CR2=0X00;
PI_ODR|=(1<<1);
	/*IRQ CSN Initial*/
	//LPC_GPIO0->DIR|=(1<<9);

	//LPC_GPIO0->DIR&=~(1<<8);
	//LPC_GPIO0->DATA|=(1<<8);
//PE_ODR=0x00;
	CSN_1;
	CE_0; 
SPI_Init();
}

/****************** 配置函数********************************/
void nRF24L01_Config(void)
{

	SPI_RW_Reg(WRITE_REG_NRF24L01 + CONFIG, 0x0e); // Set PWR_UP bit, enable CRC(2 bytes) &Prim:RX. RX_DR enabled..
	SPI_RW_Reg(WRITE_REG_NRF24L01 + EN_AA, 0x3f);
	SPI_RW_Reg(WRITE_REG_NRF24L01 + EN_RXADDR, 0x3f); // Enable Pipe0
//	SPI_RW_Reg(WRITE_REG_NRF24L01 + SETUP_AW, 0x02); // Setup address width=5 bytes
//	SPI_RW_Reg(WRITE_REG_NRF24L01 + SETUP_RETR, 0x1a); // 500us + 86us, 10 retrans...
	SPI_RW_Reg(WRITE_REG_NRF24L01 + RF_CH, 40);
	SPI_RW_Reg(WRITE_REG_NRF24L01 + RF_SETUP,0x07); // TX_PWR:0dBm, Datarate:2Mbps,
}
 
void NRF24L01_Send(void)
{
    u8 status=0x00;
	TX_Mode(TX_BUF);
	//while(IRQ);
	CE_0;
	delay1us(10);
	status=SPI_Read_Reg(STATUS);	// 读取状态寄存其来判断数据接收状况
	if(status&TX_DS)	/*tx_ds == 0x20*/
	{
		printf("STATUS=0x%2x\r\n",status);
			
		SPI_RW_Reg(WRITE_REG_NRF24L01 + STATUS, 0x20);      // 清除TX，让IRQ拉低；	
	}
	else if(status&MAX_RT)
		{
			printf("Send to achieve maximum number of sending!!\r\n");	
			SPI_RW_Reg(WRITE_REG_NRF24L01 + STATUS, 0x10);      // 清除TX，让IRQ拉低；			
		}
	CE_1;
}

void NRF24L01_Receive(void)
{   
    u8 status=0x01;  
	SPI_Init();
	RX_Mode();
	while(IRQ);
	CE_0;
	delay1us(10);
	status=SPI_Read_Reg(STATUS);	// 读取状态寄存其来判断数据接收状况
	printf("STATUS=：0x%x\r\n",status);
	if(status & 0x40)			//接受中断标志位
	{
		SPI_Read_Buf(RD_RX_PLOAD,RX_BUF,TX_PLOAD_WIDTH);// read receive payload from RX_FIFO buffer
		SPI_RW_Reg(WRITE_REG_NRF24L01 + STATUS, 0x40);      // 清除TX，让IRQ拉低
		printf("Receiving data:0x%x\r\n",RX_BUF[0]);	
	}  
	CE_1;

}









