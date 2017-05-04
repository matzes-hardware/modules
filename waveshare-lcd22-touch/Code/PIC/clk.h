 /*
*========================================================================================================
*
* File                : clk.h
* Hardware Environment:
* Build Environment   : MPLAB IDE
* Version             : V8.76
* By                  : Zhou Jie
*
*                                  (c) Copyright 2011-2016, WaveShare
*                                       http://www.waveShare.net
*                                          All Rights Reserved
*
*========================================================================================================
*/
#ifndef _CLK_H
#define _CLK_H
#include<pic18.h>
#include "lcd_22.h"
/*
#if defined HSI_16M
void CLK_Init(void)
{
	CLK_SWR=0xe1;
	CLK_CKDIVR=0x00;
	CLK_SWCR|=0x02;      //开启切换
	while((CLK_SWCR & 0x01)==0x01);
	CLK_SWCR&=(~0x02);      //关闭切换
}
#elif defined HSE
void CLK_Init(void)
{
	//启用外部高速晶振且0分频
	CLK_SWR=0xb4;
	CLK_CKDIVR=0x00;
	CLK_SWCR|=0x02;      //开启切换
	while((CLK_SWCR & 0x01)==0x01);
	CLK_SWCR&=(~0x02);      //关闭切换
}
#elif defined HSI_2M

#else
	#error has not define Crystal
#endif*/

#endif /*clk_h*/
