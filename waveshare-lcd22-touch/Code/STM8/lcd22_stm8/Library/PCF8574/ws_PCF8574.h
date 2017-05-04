/********************************************************************************************************
*
* File                : ws_PCF8574.h
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

#ifndef _WS_PCF8574_H
#define _WS_PCF8574_H

#include <ws_i2c.h>

void PCF8574_Init(void)
{
	I2C_Init();
}

void PCF8574_WriteAByte(u8 data)
{
	I2C_Start();
	I2C_SendDAdr(0x40);
	I2C_SendDat(data);
	I2C_stop();
}

#endif /*_WS_PCF8574_H*/
