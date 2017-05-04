/********************************************************************************************************
*
* File                : ws_lcd1602_src.h
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

#ifndef _WS_LCD1602_SRC_H_
#define _WS_LCD1602_SRC_H_

_Bool lcd1602_busy(void)
{
	_Bool result;
	RS_CLR;
	RW_SET;
	EN_SET;
	delay(5);
	PORT_busy;
	result=(busy & 0x80);
	EN_CLR;
	return result;
}

void lcd1602_write_com(u8 com)
{
	while(lcd1602_busy());
	RS_CLR;
	RW_CLR;
	EN_CLR;
	PORT_OUT;
	PORT=com;
	EN_SET;
	delay(5);
	EN_CLR;
}

void lcd1602_write_data(u8 dat)
{
	while(lcd1602_busy());
	RS_SET;
	RW_CLR;
	EN_CLR;
	PORT_OUT;
	PORT=dat;
	EN_SET;
	delay(5);
	EN_CLR;
}

void lcd1602_gotoxy(u8 x,u8 y)
{
	u8 add;
	if(y==0)
		add=0x80+x;
	else
		add=0xc0+x;
	lcd1602_write_com(add);
	
}

void lcd1602_init(void)
{
	delay(100);
	lcd1602_write_com(0x38);
	lcd1602_write_com(0x0c);
	lcd1602_write_com(0x06);
	lcd1602_write_com(0x01);
}

void lcd1602_display(u8 *str)
{
	while(*str)
	{
		lcd1602_write_data(*str);
		str++;
		delay(5);
	}
}

void lcd1602_setGCRAM(u8 add,u8 *str)
{
	u8 i;
	lcd1602_write_com(0x40|(add<<3));
	for(i=0;i<8;i++)
	{
		lcd1602_write_data(*str);
		str++;
	}
	delay(5);
}

#endif /*_WS_LCD1602_SRC_H_*/