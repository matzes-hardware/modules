#include <stm8s208mb.h>
#include "NRF24L01.h"
#include <ws_spi.h>
#include "stdio.h"
#include <system.h>


#define	RX_DR			0x40
#define	TX_DS			0x20
#define	MAX_RT			0x10

u8 TX_ADDRESS[TX_ADR_WIDTH] = {0xb2,0xb2,0xb3,0xb4,0x01};  // ����һ����̬���͵�ַ



u8 RX_BUF[TX_PLOAD_WIDTH];

u8 TX_BUF[TX_PLOAD_WIDTH];

/*����MISO and MOSI SCLK Ϊ���ù��ܣ����죩���  SPI1  */
/*����SPI NRF24L01+Ƭѡ	GPIOB_PIN_15     	CSN   	ͨ���������ģʽ */
/*����SPI NRF24L01+ģʽѡ��	GPIOB_PIN_14    CE		ͨ���������ģʽ*/
/*����SPI NRF24L01+�ж��ź�	 GPIOB_PIN_13   IRQ		��������ģʽ*/




static void delay1us(u8 t)
{
delay_us(t);
} 

/****��Ĵ���regдһ���ֽڣ�ͬʱ����״̬�ֽ�**************/
u8 SPI_RW_Reg(u8 reg,u8 value)
{
	u8 status;
	CSN_0;
	status=SPI1_communication(reg);   //select register  and write value to it
	SPI1_communication(value);   
	CSN_1;
	return(status); 
}
/****��Ĵ���reg��һ���ֽڣ�ͬʱ����״̬�ֽ�**************/
u8 SPI_Read_Reg(u8 reg)
{
	u8 status;
	CSN_0;
	SPI1_communication(reg);
	status=SPI1_communication(0);   //select register  and write value to it
	CSN_1;
	return(status);
}
/********����bytes�ֽڵ�����*************************/
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

/****************д��bytes�ֽڵ�����*******************/
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

/*���պ���������1��ʾ�������յ�������û�����ݽ��յ�**/
u8 nRF24L01_RxPacket(u8* rx_buf)
{
    u8 status,revale=0;
	CE_0;
	delay1us(10);
	status=SPI1_communication(STATUS);	// ��ȡ״̬�Ĵ������ж����ݽ���״��
//	CE_0;
//	status=0x40;
	printf("STATUS����״̬��0x%2x\r\n",status);

	if(status & RX_DR)				// �ж��Ƿ���յ�����
	{
//		CE_1;
		SPI_Read_Buf(RD_RX_PLOAD,rx_buf,TX_PLOAD_WIDTH);// read receive payload from RX_FIFO buffer
//		CE_0;
		revale =1;			//��ȡ������ɱ�־
	}
	SPI_RW_Reg(WRITE_REG_NRF24L01 + STATUS,status);   //���յ����ݺ�RX_DR,TX_DS,MAX_PT���ø�Ϊ1��ͨ��д1������жϱ�־
	CE_1;
	return revale;	
}

 /****************���ͺ���***************************/
void nRF24L01_TxPacket(unsigned char * tx_buf)
{
	CE_0;			//StandBy Iģʽ	
	SPI_Write_Buf(WRITE_REG_NRF24L01 + RX_ADDR_P0, TX_ADDRESS, TX_ADR_WIDTH); // װ�ؽ��ն˵�ַ
	SPI_Write_Buf(WR_TX_PLOAD, tx_buf, TX_PLOAD_WIDTH); 			 // װ������	
	SPI_RW_Reg(WRITE_REG_NRF24L01 + CONFIG, 0x0e);   		 // IRQ�շ�����ж���Ӧ��16λCRC��������
	CE_1;		 //�ø�CE���������ݷ���
	delay1us(10);
}

void RX_Mode(void)
{
	CE_0;
  	SPI_Write_Buf(WRITE_REG_NRF24L01 + RX_ADDR_P0, TX_ADDRESS, TX_ADR_WIDTH);  // �����豸����ͨ��0ʹ�úͷ����豸��ͬ�ķ��͵�ַ
  	SPI_RW_Reg(WRITE_REG_NRF24L01 + RX_PW_P0, TX_PLOAD_WIDTH);  // ����ͨ��0ѡ��ͷ���ͨ����ͬ��Ч���ݿ�� 
 
  	SPI_RW_Reg(WRITE_REG_NRF24L01 + EN_AA, 0x3f);               // ʹ�ܽ���ͨ��0�Զ�Ӧ��
  	SPI_RW_Reg(WRITE_REG_NRF24L01 + EN_RXADDR, 0x3f);           // ʹ�ܽ���ͨ��0
  	SPI_RW_Reg(WRITE_REG_NRF24L01 + RF_CH, 40);                 // ѡ����Ƶͨ��0x40

  	SPI_RW_Reg(WRITE_REG_NRF24L01 + RF_SETUP, 0x07);            // ���ݴ�����1Mbps�����书��0dBm���������Ŵ�������
  	SPI_RW_Reg(WRITE_REG_NRF24L01 + CONFIG, 0x0f);              // CRCʹ�ܣ�16λCRCУ�飬�ϵ磬����ģʽ
  	CE_1;
}

void TX_Mode(u8 * tx_buf)
{
	CE_0;
  	SPI_Write_Buf(WRITE_REG_NRF24L01 + TX_ADDR, TX_ADDRESS, TX_ADR_WIDTH);     // д�뷢�͵�ַ
  	SPI_Write_Buf(WRITE_REG_NRF24L01 + RX_ADDR_P0, TX_ADDRESS, TX_ADR_WIDTH);  // Ϊ��Ӧ������豸������ͨ��0��ַ�ͷ��͵�ַ��ͬ
  	SPI_Write_Buf(WR_TX_PLOAD, tx_buf, TX_PLOAD_WIDTH); 			 // װ������
  	SPI_RW_Reg(WRITE_REG_NRF24L01 + EN_AA, 0x3f);       // ʹ�ܽ���ͨ��0�Զ�Ӧ��
  	SPI_RW_Reg(WRITE_REG_NRF24L01 + EN_RXADDR, 0x3f);   // ʹ�ܽ���ͨ��0
  	SPI_RW_Reg(WRITE_REG_NRF24L01 + SETUP_RETR, 0x0a);  // �Զ��ط���ʱ�ȴ�250us+86us���Զ��ط�10��
  	SPI_RW_Reg(WRITE_REG_NRF24L01 + RF_CH, 40);         // ѡ����Ƶͨ��0x40
  	SPI_RW_Reg(WRITE_REG_NRF24L01 + RF_SETUP, 0x07);    // ���ݴ�����1Mbps�����书��0dBm���������Ŵ�������
	SPI_RW_Reg(WRITE_REG_NRF24L01 + RX_PW_P0, TX_PLOAD_WIDTH);  // ����ͨ��0ѡ��ͷ���ͨ����ͬ��Ч���ݿ��
  	SPI_RW_Reg(WRITE_REG_NRF24L01 + CONFIG, 0x0e);      // CRCʹ�ܣ�16λCRCУ�飬�ϵ�
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

/****************** ���ú���********************************/
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
	status=SPI_Read_Reg(STATUS);	// ��ȡ״̬�Ĵ������ж����ݽ���״��
	if(status&TX_DS)	/*tx_ds == 0x20*/
	{
		printf("STATUS=0x%2x\r\n",status);
			
		SPI_RW_Reg(WRITE_REG_NRF24L01 + STATUS, 0x20);      // ���TX����IRQ���ͣ�	
	}
	else if(status&MAX_RT)
		{
			printf("Send to achieve maximum number of sending!!\r\n");	
			SPI_RW_Reg(WRITE_REG_NRF24L01 + STATUS, 0x10);      // ���TX����IRQ���ͣ�			
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
	status=SPI_Read_Reg(STATUS);	// ��ȡ״̬�Ĵ������ж����ݽ���״��
	printf("STATUS=��0x%x\r\n",status);
	if(status & 0x40)			//�����жϱ�־λ
	{
		SPI_Read_Buf(RD_RX_PLOAD,RX_BUF,TX_PLOAD_WIDTH);// read receive payload from RX_FIFO buffer
		SPI_RW_Reg(WRITE_REG_NRF24L01 + STATUS, 0x40);      // ���TX����IRQ����
		printf("Receiving data:0x%x\r\n",RX_BUF[0]);	
	}  
	CE_1;

}









