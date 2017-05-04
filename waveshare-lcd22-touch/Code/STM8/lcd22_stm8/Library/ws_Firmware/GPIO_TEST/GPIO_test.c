#include <GPIO_TEST.h>

#include <ws_uart3.h>
#include <GPIO.h>


extern u8 Flag;

u8 PX,PY;
void GPIO_ALL_TEST(void)
{
	u8 i=0;
	//printf("请按图1跳线\r\n");
	UART_send("\r\nGPIO焊接测试：\r\n",22);
	GPIOtest_Configuration();
  GPIO_test_single();

	//printf("一共%d个管脚参加测试，有以上管脚短路了。",i);
	//GPIOdeint();
	//printf("\r\n\r\n");
}



void GPIOtest_Configuration(void)
{
PA_DDR=0XFF;
PB_DDR=0XFF;
PC_DDR=0XFF;
PD_DDR=0XFF;
PE_DDR=0XFF;
PF_DDR=0XFF;
PG_DDR=0XFF;
PH_DDR=0XFF;
PI_DDR=0XFF;

PA_CR1=0XFF;
PB_CR1=0XFF;
PC_CR1=0XFF;
PD_CR1=0XFF;
PE_CR1=0XFF;
PF_CR1=0XFF;
PG_CR1=0XFF;
PH_CR1=0XFF;
PI_CR1=0XFF;

PA_ODR=0X00;
PB_ODR=0X00;
PC_ODR=0X00;
PD_ODR=0X00;
PE_ODR=0X00;
PF_ODR=0X00;
PG_ODR=0X00;
PH_ODR=0X00;
PI_ODR=0X00;
}

void GPIO_test_single()
{
	u8 i,buff;
	for(i=0;i<8;i++)
	{
	PA_DDR=~(0x01<<i);
	buff=PA_IDR&(0x01<<i);
		if(buff==0)
		{
		PX=1;
		PY=i;
		GPIO_test_Px();
		}
  }
	
		for(i=0;i<8;i++)
	{
	PB_DDR=~(0x01<<i);
	buff=PB_IDR&(0x01<<i);
		if(buff==0)
		{
		PX=2;
		PY=i;
		GPIO_test_Px();
		}
  }
	
			for(i=0;i<8;i++)
	{
	PC_DDR=~(0x01<<i);
	buff=PC_IDR&(0x01<<i);
		if(buff==0)
		{
		PX=3;
		PY=i;
		GPIO_test_Px();
		}
  }
	
			for(i=0;i<8;i++)
	{
	PD_DDR=~(0x01<<i);
	buff=PD_IDR&(0x01<<i);
		if(buff==0)
		{
		PX=4;
		PY=i;
		GPIO_test_Px();
		}
  }
	
			for(i=0;i<8;i++)
	{
	PE_DDR=~(0x01<<i);
	buff=PE_IDR&(0x01<<i);
		if(buff==0)
		{
		PX=5;
		PY=i;
		GPIO_test_Px();
		}
  }
	
	
	
	

	
}
void GPIO_test_Px()
{
		switch(PX)
	{
	case 1:UART_send("PA有短路"，8);GPIO_test_Py();break;
	case 2:UART_send("PB有短路"，8);GPIO_test_Py();break;
	case 3:UART_send("PC有短路"，8);GPIO_test_Py();break;
	case 4:UART_send("PE有短路"，8);GPIO_test_Py();break;
	case 5:UART_send("PF有短路"，8);GPIO_test_Py();break;
	case 6:UART_send("PE有短路"，8);GPIO_test_Py();break;
	case 7:UART_send("PG有短路"，8);GPIO_test_Py();break;
	case 8:UART_send("PH有短路"，8);GPIO_test_Py();break;
	}
		
}
void GPIO_test_Py()
{
	switch(PY)
{
	case 1:UART_send(" P0短路 "，8);break;
	case 2:UART_send(" P1短路 "，8);break;
	case 3:UART_send(" P2短路 "，8);break;
	case 4:UART_send(" P3短路 "，8);break;
	case 5:UART_send(" P4短路 "，8);break;
	case 6:UART_send(" P5短路 "，8);break;
	case 7:UART_send(" P6短路 "，8);break;
	case 8:UART_send(" P7短路 "，8);break;
}

}
/*
void GPIO_All_IPU(void)
{
  GPIO_InitTypeDef GPIO_InitStructure;
  USART_InitTypeDef USART_InitStructure; 

	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_All;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;

	GPIO_Init(GPIOB,&GPIO_InitStructure);
	GPIO_Init(GPIOC,&GPIO_InitStructure);
	GPIO_Init(GPIOD,&GPIO_InitStructure);
	GPIO_Init(GPIOE,&GPIO_InitStructure);
	GPIO_Init(GPIOF,&GPIO_InitStructure);
	GPIO_Init(GPIOG,&GPIO_InitStructure);
	GPIO_Init(GPIOA,&GPIO_InitStructure);

			
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9;	         
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP; 
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz; 
  GPIO_Init(GPIOA, &GPIO_InitStructure);		   

  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10;	        
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;  
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz; 
  GPIO_Init(GPIOA, &GPIO_InitStructure);

  USART_InitStructure.USART_BaudRate = 115200;
  USART_InitStructure.USART_WordLength = USART_WordLength_8b;
  USART_InitStructure.USART_StopBits = USART_StopBits_1;
  USART_InitStructure.USART_Parity = USART_Parity_No;
  USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
  USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;

  USART_Init(USART1, &USART_InitStructure); 
  USART_ClearFlag(USART1,USART_FLAG_TC);
  USART_ITConfig(USART1, USART_IT_RXNE, ENABLE);
  //USART_ITConfig(USART1, USART_IT_TXE, ENABLE);
  USART_Cmd(USART1, ENABLE);
}
void GPIO_ALL_TEST2(void)
{
	GPIO_InitTypeDef GPIO_InitStruct;

	RCC_APB2PeriphClockCmd(  RCC_APB2Periph_GPIOA
                         | RCC_APB2Periph_GPIOB
                         | RCC_APB2Periph_GPIOC
                         | RCC_APB2Periph_GPIOD
                         | RCC_APB2Periph_GPIOE
                         | RCC_APB2Periph_GPIOF
                         | RCC_APB2Periph_GPIOG,
                         ENABLE);


  printf("\r\n\r\n **************** 接口开路测试开始\r\n\r\n");

 
  GPIO_All_IPU();
	GPIO_InitStruct.GPIO_Pin = GPIO_Pin_8;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_Out_PP;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_10MHz;
	GPIO_Init(GPIOB,&GPIO_InitStruct);
  GPIO_ResetBits(GPIOB,GPIO_Pin_8);
  if(GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_8)
   | GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_9))
  {
    printf("CAN 接口存在开路！\r\n\r\n");
  }


  GPIO_All_IPU();
	GPIO_InitStruct.GPIO_Pin = GPIO_Pin_4;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_Out_PP;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_10MHz;
	GPIO_Init(GPIOA,&GPIO_InitStruct);
  GPIO_ResetBits(GPIOA,GPIO_Pin_4);
  if(GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_0)
   | GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_1)
   | GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_2)
   | GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_3)
   | GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_4))
  {
    printf("USART2 接口存在开路！\r\n\r\n");
  }

  GPIO_All_IPU();
	GPIO_InitStruct.GPIO_Pin = GPIO_Pin_4;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_Out_PP;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_10MHz;
	GPIO_Init(GPIOA,&GPIO_InitStruct);
  GPIO_ResetBits(GPIOA,GPIO_Pin_4);
  if(GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_4)
   | GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_5)
   | GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_6)
   | GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_7))
  {
    printf("SPI1 接口存在开路！\r\n\r\n");
  }


  GPIO_All_IPU();
	GPIO_InitStruct.GPIO_Pin = GPIO_Pin_12;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_Out_PP;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_10MHz;
	GPIO_Init(GPIOB,&GPIO_InitStruct);
  GPIO_ResetBits(GPIOB,GPIO_Pin_12);
  if(GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_12)
   | GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_13)
   | GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_14)
   | GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_15))
  {
    printf("SPI2 接口存在开路！\r\n\r\n");
  }


  GPIO_All_IPU();
	GPIO_InitStruct.GPIO_Pin = GPIO_Pin_5;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_Out_PP;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_10MHz;
	GPIO_Init(GPIOB,&GPIO_InitStruct);
  GPIO_ResetBits(GPIOB,GPIO_Pin_5);
  if(GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_5)
   | GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_6)
   | GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_7))
  {
    printf("I2C1 接口存在开路！\r\n\r\n");
  }


  GPIO_All_IPU();
	GPIO_InitStruct.GPIO_Pin = GPIO_Pin_0;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_Out_PP;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_10MHz;
	GPIO_Init(GPIOC,&GPIO_InitStruct);
  GPIO_ResetBits(GPIOC,GPIO_Pin_0);
  if(GPIO_ReadInputDataBit(GPIOC,GPIO_Pin_0)
   | GPIO_ReadInputDataBit(GPIOC,GPIO_Pin_1)
   | GPIO_ReadInputDataBit(GPIOC,GPIO_Pin_2)
   | GPIO_ReadInputDataBit(GPIOC,GPIO_Pin_3)
   | GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_0)
   | GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_1)
   | GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_2)
   | GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_3))
  {
    printf("8Bit IO 接口存在开路！\r\n\r\n");
  }
	
  GPIO_All_IPU();
	GPIO_InitStruct.GPIO_Pin = GPIO_Pin_8;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_Out_PP;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_10MHz;
	GPIO_Init(GPIOA,&GPIO_InitStruct);
  GPIO_ResetBits(GPIOA,GPIO_Pin_8);
  if(GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_8)
   | GPIO_ReadInputDataBit(GPIOC,GPIO_Pin_8)
   | GPIO_ReadInputDataBit(GPIOC,GPIO_Pin_9)
   | GPIO_ReadInputDataBit(GPIOC,GPIO_Pin_10)
   | GPIO_ReadInputDataBit(GPIOC,GPIO_Pin_11)
   | GPIO_ReadInputDataBit(GPIOC,GPIO_Pin_12)
   | GPIO_ReadInputDataBit(GPIOD,GPIO_Pin_2))
  {
    printf("SD 接口存在开路！\r\n\r\n");
  }

  printf("\r\n\r\n -------- 接口开路测试结束\r\n");

}
*/
#endif /*_GPIO_H*/
