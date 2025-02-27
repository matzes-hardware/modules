/********************************************************************************************************
*
* File                : ws_PCF8591.h
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

#ifndef _WS_PCF8591_H_
#define _WS_PCF8591_H_

#include <ws_i2c.h>

#define MODE0 	0x00	//Channel0 = AIN0;
						//Channel1 = AIN1;
						//Channel2 = AIN2;
						//Channel3 = AIN3;
#define MODE1 	0x10	//Channel0 = AIN3-AIN0;
						//Channel1 = AIN3-AIN1
						//Channel2 = AIN3-AIN2;
#define MODE2 	0x20	//Channel0 = AIN0;
						//Channel1 = AIN1;
						//Channel2 = AIN3-AIN2;
#define MODE3 	0x30	//Channel0 = AIN1-AIN0;
						//Channel1 = AIN3-AIN2;
#define CHNL0 	0		//Using Channel0
#define CHNL1 	1		//Using Channel1
#define CHNL2 	2		//Using Channel2
#define CHNL3 	3		//Using Channel3

#define DAouputEn	0x40	//0x50 or 0x60 or 0x70 is also ok!

#define WD_DADR 0x90
#define RD_DADR 0x91

void PCF8591_WriteAByte(u8 dat)
{
	I2C_Start();
	I2C_SendDAdr(WD_DADR);
	I2C_SendDat(dat);
	I2C_stop();
}

u8 PCF8591_ReadAByte(void)
{
	u8 dat;
	I2C_Start();
	I2C_NAck();
	I2C_SendDAdr(RD_DADR);
	dat=I2C_RcvDat();
	I2C_stop();
	I2C_Ack();
	return dat;
}

void PCF8591_getAD(u8 mode,u8 chan,u8 *ADC)
{
	PCF8591_WriteAByte(mode|chan);
	ADC[0]=PCF8591_ReadAByte();
}
/*
void PCF8591_setDA(u8 val)
{
	PCF8591_WriteAByte(DAouputEn,val);
}*/

#endif /*_WS_PCF8591_H_*/
