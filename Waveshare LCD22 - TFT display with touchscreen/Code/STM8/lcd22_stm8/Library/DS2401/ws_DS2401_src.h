/********************************************************************************************************
*
* File                : ws_DS2401_src.h
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

#ifndef WS_DS2401_SRC_H_
#define WS_DS2401_SRC_H_

#include <ws_onewire.h>

void getDs2401Number(u8 *tmp)
{
	u8 i;
	resetOnewire();	//先复位onewire
	wOnewire(0x33);	//发"Read_ROM"指令	
	for(i=0;i<8;i++)
	{
		*(tmp+i)=rOnewire();
	}
}

#endif /*WS_DS2401_SRC_H_*/