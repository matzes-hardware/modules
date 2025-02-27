 /*
*========================================================================================================
*
* File                : lcd_22.c
* Hardware Environment:	OpenPIC16F877A && lcd22 &&  3v voltage && 4M/8M crystal oscillator
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

#include "clk.h"

void LCD_test(void);
void DisplayString(u8 *s,u8 x,u8 y,u8 Reverse);


void init_mcu(void)
{ADCON1=0X07;
	TRISA=0x01;     //////////////////
  	TRISD=0x0;
	TRISC0=0;
TRISC1=0;
TRISC2=0;
}


void main(void)
{
	////init_clk();
	init_mcu();
	init_lcd();
    //	while(1);
    LCD_test();
	TRISB=0;PORTB=0XF0;delay_ms(100);
	//DisplayString("WaveShare",6,9,0);
//	DisplayString("WaveShare",6,10,1);
	TRISB=0;PORTB=0X0f;delay_ms(100);
	while(1){
		
		delay_ms(5);

	//	draw_lcd();
		if(!PENIRQ){
			if(get_point_xy()){
				draw_lcd();
							  }
		}
	}
}
