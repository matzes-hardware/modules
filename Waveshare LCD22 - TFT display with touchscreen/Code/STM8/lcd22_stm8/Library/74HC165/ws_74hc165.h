/********************************************************************************************************
*
* File                : ws_74hc165.h
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


#ifndef _WS_74HC165_H_
#define _WS_74HC165_H_
//#include <stm8s207r8.h>
	
#define HC165_IN_RXD	cbi(PD_ODR,6);cbi(PD_CR1,6);cbi(PD_CR2,6);	   //数据口
#define HC165_GET_RXD	 gbi(PD_IDR,6)

#define HC165_OUT_TXD  	sbi(PD_DDR,5);sbi(PD_CR1,5);sbi(PD_CR2,5);	   //脉冲口
#define HC165_SET_TXD 	sbi(PD_ODR,5)
#define HC165_CLR_TXD  	cbi(PD_ODR,5)

#define HC165_OUT_PL	sbi(PE_DDR,2);sbi(PE_CR1,2);sbi(PE_CR2,2);	   //锁存口
#define HC165_SET_PL	sbi(PE_ODR,2)
#define HC165_CLR_PL	cbi(PE_ODR,2)

#include <ws_74hc165_src.h>
#endif /*_WS_74HC165_H_*/
