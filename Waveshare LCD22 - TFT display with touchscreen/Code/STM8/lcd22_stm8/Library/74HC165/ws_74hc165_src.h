/********************************************************************************************************
*
* File                : ws_74hc165_src.h
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


#ifndef _WS_74HC165_SRC_H_
#define _WS_74HC165_SRC_H_


u8 hc165GetDat(void)
{
	u8 i,dat=0;
	HC165_CLR_PL;
	HC165_SET_PL;
	for(i=0;i<8;i++)
	{
		HC165_CLR_TXD;
		dat=dat<<1;
		if(HC165_GET_RXD)
		{
			dat|=0x01;
		}
		HC165_SET_TXD;
	}
	return dat;
}

void hc165Init(void)
{
	HC165_OUT_PL;
	HC165_OUT_TXD;
	HC165_IN_RXD;
}
#endif /*_WS_74HC165_SRC_H_*/
