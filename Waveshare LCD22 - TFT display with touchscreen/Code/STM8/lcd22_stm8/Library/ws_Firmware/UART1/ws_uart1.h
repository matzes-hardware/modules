/********************************************************************************************************
*
* File                : ws_UAER1.h
* Hardware Environment: 
* Build Environment   : ST Visual Develop 4.1.6
* Version             : V1.0
* By                  : Xiao xian hui
*
*                                  (c) Copyright 2005-2010, WaveShare
*                                       http://www.waveShare.net
*                                          All Rights Reserved
*
*********************************************************************************************************/

#ifndef _WS_UART1_H
#define _WS_UART1_H

#include <ws_lcd_st7920.h>

void Init_UART1(void)
{
		UART1_CR1=0x00;
		UART1_CR2=0x00;
		UART1_CR3=0x00;
		
		// 设置波特率，必须注意以下几点：
		//    (1) 必须先写BRR2
		//    (2) BRR1存放的是分频系数的第11位到第4位，
		//    (3) BRR2存放的是分频系数的第15位到第12位，和第3位
		//        到第0位
		// 例如对于波特率位9600时，分频系数=2000000/9600=208
		// 对应的十六进制数为00D0，BBR1=0D,BBR2=00


		UART1_BRR2=0x00;
		UART1_BRR1=0x0d;
		
		UART1_CR2=0x2c;//允许接收，发送，开接收中断
		
}

void UART1_sendchar(u8 data)
{
		while((UART1_SR & 0x80)==0x00);
		UART1_DR=data;
}

@far @interrupt void UART1_Recv_IRQHandler (void)
{
	u8 data;
	data=UART1_DR;
	showLine(6,2,lcd_buffer,"0x%x2",(u16)data);
	return;
}

#endif /*_WS_UART3_H*/