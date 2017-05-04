/********************************************************************************************************
*
* File                : ws_lcd_st7920.h
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

#ifndef _WS_LCD_ST7920_H_
#define _WS_LCD_ST7920_H_

#define E_CLK PE_ODR&=(~0x01);
#define E_SET PE_ODR|=0x01;

void sendCodeST7920(u8 Lcd_cmd);
void sendDataST7920(u8 Lcd_data);
void st7920LcdInit(void);
void refreshLCD(const u8 *lcd_stack);
void decToAscii(u8* str,u16 dec,u8 width);
void hexToAscii(u8* str,u16 hex,u8 width);
void showLine(const u8 x,const u8 y,u8* lcd_stack,char * str,...);

u8 lcd_buffer[64];

#include "ws_lcd_st7920_src.h"

#endif /*_WS_LCD_ST7920_H_*/
