/********************************************************************************************************
*
* File                : ws_lcd1602.h
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

#ifndef _WS_LCD1602_H_
#define _WS_LCD1602_H_

#define PORT_busy PB_DDR=0x00;PB_CR1=0xff;
#define busy PB_IDR

#define PORT_OUT PB_DDR=0xff;PB_CR1=0xff;
#define PORT PB_ODR
#define EN_SET sbi(PC_DDR,5);sbi(PC_CR1,5);sbi(PC_ODR,5);
#define EN_CLR sbi(PC_DDR,5);sbi(PC_CR1,5);cbi(PC_ODR,5);

#define RW_SET sbi(PC_DDR,6);sbi(PC_CR1,6);sbi(PC_ODR,6);
#define RW_CLR sbi(PC_DDR,6);sbi(PC_CR1,6);cbi(PC_ODR,6);

#define RS_SET sbi(PC_DDR,3);sbi(PC_CR1,3);sbi(PC_ODR,3);
#define RS_CLR sbi(PC_DDR,3);sbi(PC_CR1,3);cbi(PC_ODR,3);

void delay(u8 z) 
{ 
	u8 x,y; 
	for(x=z;x>0;x--) 
		for(y=110;y>0;y--); 
}  

#include "ws_lcd1602_src.h"

#endif /*_WS_LCD1602_H_*/