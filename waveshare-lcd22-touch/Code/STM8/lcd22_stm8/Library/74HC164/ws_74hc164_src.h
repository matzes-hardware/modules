/********************************************************************************************************
*
* File                : ws_74hc164_src.h
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

#ifndef _WS_74HC164_SRC_H_
#define _WS_74HC164_SRC_H_


void hc164SetDat(u8 dat)
{
	u8 i;
	for(i=0;i<8;i++)
	{
		HC164_CLR_CLK;
		if(dat&0x80)
		{
			HC164_SET_DATA;
			HC164_SET_CLK;
		}
		else
		{
			HC164_CLR_DATA;
			HC164_SET_CLK;
		}
		dat = dat<<1;
	}
}

void hc164Init(void)
{
	HC164_OUT_DATA;
	HC164_OUT_CLK;
}
#endif /*_WS_74HC164_SRC_H_*/
