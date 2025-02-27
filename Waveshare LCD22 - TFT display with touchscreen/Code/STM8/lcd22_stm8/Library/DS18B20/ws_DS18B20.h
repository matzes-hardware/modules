/********************************************************************************************************
*
* File                : ws_ds18b20.h
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
#include <ws_onewire.h>

//-----DS18B20×ª»»ÎÂ¶È-----
void convertDs18b20(void) 
{ 
    resetOnewire(); 
    wOnewire(0xcc); 
    wOnewire(0x44); 
}
//------------DS18BB0¶ÁÎÂ¶È----------
u8 readTemp(void) 
{ 
	u8 temp1,temp2;
	convertDs18b20();
	resetOnewire(); 
	wOnewire(0xcc); 
	wOnewire(0xbe); 	
	temp1=rOnewire(); 
	temp2=rOnewire(); 
	temp2=temp2<<4;
	temp1=temp1>>4;
	temp2|=temp1;

	return (temp2&0x7F);
}