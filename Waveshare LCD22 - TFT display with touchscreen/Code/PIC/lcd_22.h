 /*
*========================================================================================================
*
* File                : lcd_22.h
* Hardware Environment:
* Build Environment   : MPLAB IDE
* Version             : V8.76
* By                  : Zhou Jie
*
*                                  (c) Copyright 2011-2016, WaveShare
*                                       http://www.waveShare.net
*                                          All Rights Reserved
*
*========================================================================================================
*/
#ifndef LCD_22_H
#define LCD_22_H

#include<pic18.h>
#include "system.h"

#define LCD22_SPI
//#define LCD22_PAN
#define  PENIRQ			     RA0   //IN

#define en_touch() 			 {RA4=0;}// T_CS 
#define dis_touch() 		 {RA4=1;}

#define reset_clr			{RD0=0;}//RST    
#define reset_set			{RD0=1;}//

#define en_lcd() 			  {RA1=0;}// CS
#define dis_lcd() 			 {RA1=1;}//

#define en_lcd_data() 	     {RA2=1;}// RS
#define en_lcd_index() 	     {RA2=0;}//



#ifdef 	LCD22_PAN
#define LCD_DATA      PORTB//PB_ODR
//#define lcd_wr_clk() 		{TRISA=0x10;RA3=0;RA3=1;}//hou sbi(PC_ODR,2);
#endif

#define SAMP_COUNT 			5
#define SAMP_THRESHOLD 	     5

#define TOUCH_CMD_X 		0xD0
#define TOUCH_CMD_Y 		0x90

#define COLOR_YELLOW 		0xFFE0
#define COLOR_BLACK 		0x0000
#define COLOR_WHITE 		0xFFFF
#define COLOR_INIT 			COLOR_YELLOW

#define DOT_WIDTH 4

typedef struct xy
{
	u16 x;
	u16 y;
}xy_t;

#define TOUCH_MAX_CACHE 8
volatile xy_t touch_xy_buffer[TOUCH_MAX_CACHE];
volatile u8 touch_wr_index;
volatile u8 touch_rd_index;
volatile u8 touch_counter;
/**/
void init_lcd_spi(void);
void init_touch_spi(void);
void post_data(u16 data);
void post_cmd(u16 index, u16 cmd);
/**/
u16 get_touch_data(u16 cmd);
xy_t get_touch_xy(void);
u8 get_point_xy(void);
u8 draw_lcd(void);
void init_lcd(void);

#endif
