/********************************************************************************************************
*
* File                : ws_74HC164.h
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

#ifndef _WS_74HC164_H_
#define _WS_74HC164_H_

#if defined(STM8S207EX)
#define HC164_OUT_DATA	sbi(PC_DDR,1);sbi(PC_CR1,1);sbi(PC_CR2,1);     // 数据口
#define HC164_SET_DATA	sbi(PC_ODR,1)
#define HC164_CLR_DATA	cbi(PC_ODR,1)

#define HC164_OUT_CLK  	sbi(PE_DDR,5);sbi(PC_CR1,5);sbi(PC_CR2,5);	   // 脉冲口
#define HC164_SET_CLK 	sbi(PE_ODR,5)
#define HC164_CLR_CLK  	cbi(PE_ODR,5)

#elif defined(STM8S105EX)
//数据口
#define HC164_OUT_DATA	sbi(PC_DDR,3);sbi(PC_CR1,3);sbi(PC_CR2,3);
#define HC164_SET_DATA	sbi(PC_ODR,3)
#define HC164_CLR_DATA	cbi(PC_ODR,3)
//脉冲口
#define HC164_OUT_CLK  	sbi(PC_DDR,4);sbi(PC_CR1,4);sbi(PC_CR2,4);
#define HC164_SET_CLK 	sbi(PC_ODR,4)
#define HC164_CLR_CLK  	cbi(PC_ODR,4)

#elif defined(EXSTM8Q48a207)
//数据口
#define HC164_OUT_DATA	sbi(PC_DDR,1);sbi(PC_CR1,1);sbi(PC_CR2,1);
#define HC164_SET_DATA	sbi(PC_ODR,1)
#define HC164_CLR_DATA	cbi(PC_ODR,1)

//脉冲口
#define HC164_OUT_CLK  	sbi(PE_DDR,5);sbi(PE_CR1,5);sbi(PE_CR2,5);
#define HC164_SET_CLK 	sbi(PE_ODR,5)
#define HC164_CLR_CLK  	cbi(PE_ODR,5)

#elif defined(EXSTM8Q80a208_207)
//数据口
#define HC164_OUT_DATA	sbi(PC_DDR,1);sbi(PC_CR1,1);sbi(PC_CR2,1);
#define HC164_SET_DATA	sbi(PC_ODR,1)
#define HC164_CLR_DATA	cbi(PC_ODR,1)

//脉冲口
#define HC164_OUT_CLK  	sbi(PC_DDR,0);sbi(PC_CR1,0);sbi(PC_CR2,0);
#define HC164_SET_CLK 	sbi(PC_ODR,0)
#define HC164_CLR_CLK  	cbi(PC_ODR,0)

#else
	#error missing interface for 74HC164
#endif

#include <ws_74hc164_src.h>

#endif /*_74HC164_H_*/
