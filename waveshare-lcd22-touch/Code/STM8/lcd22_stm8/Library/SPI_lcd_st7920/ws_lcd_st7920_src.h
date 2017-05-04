/********************************************************************************************************
*
* File                : ws_lcd_st7920_src.h
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

#ifndef _WS_LCD_ST7920_SRC_H_
#define _WS_LCD_ST7920_SRC_H_

#include <stdarg.h>
#include <ws_spi.h>

void st7920LcdInit(void)
{
	u8 i;
	SPI_Init();
	delay_ms(100);
	PE_DDR|=0x01;
	PE_CR1|=0x01;
	PE_CR2|=0x00;
	sendCodeST7920(0x0c);//整体显示
	sendCodeST7920(0x01);//清屏
	sendCodeST7920(0x02);
	for(i=0;i<64;i++)
		lcd_buffer[i]=' ';
	//memset(lcd_buffer,' ',sizeof(lcd_buffer));
}

void sendCodeST7920(u8 Lcd_cmd)
{
	E_CLK
	LCD_DELAY()
	E_SET
	SPI_sendchar(0xF8);
	SPI_sendchar(Lcd_cmd & 0xF0);
	SPI_sendchar(Lcd_cmd << 4);
	LCD_DELAY()
	E_CLK
	LCD_DELAY()
}

void sendDataST7920(u8 Lcd_data)
{
	E_CLK
	LCD_DELAY()
	E_SET
	SPI_sendchar(0xFA);
	SPI_sendchar(Lcd_data & 0xF0);
	SPI_sendchar(Lcd_data << 4);
	LCD_DELAY()
	E_CLK
	LCD_DELAY()
}

void refreshLCD(const u8 *lcd_stack)
{
	u8 addr;
	sendCodeST7920(0x02);	//地址归位
	for(addr=0;addr<16;addr++)
	{
		sendDataST7920(*(lcd_stack + addr));
	}
	for(addr=32;addr<48;addr++)
	{
		sendDataST7920(*(lcd_stack + addr));
	}
	for(addr=16;addr<32;addr++)
	{
		sendDataST7920(*(lcd_stack + addr));
	}
	
	for(addr=48;addr<64;addr++)
	{
		sendDataST7920(*(lcd_stack + addr));
	}
}

void decToAscii(u8* str,u16 dec,u8 width)
{
	while(width)
	{
		switch(width)
		{
			case 5:
			{
				*str = (dec / 10000 + '0');
				dec %= 10000;
				break;
			}			
			case 4:
			{
				*str = (dec / 1000 + '0');
				dec %= 1000;
				break;
			}
			case 3:
			{
				*str = (dec/100+'0');
				dec %= 100;
				break;
			}
			case 2:
			{
				*str = (dec/10+'0');
				dec %= 10;
				break;
			}
			case 1:
			{
				*str = (dec+'0');
				break;
			}
			default: *str = '0';
		}
		width--;
		str++;
	}
}

void hexToAscii(u8* str,u16 hex,u8 width)
{
	u16 tmp;
	while(width)
	{
		switch(width)
		{		
			case 4:
			{
				tmp = (hex >> 12);
				if(tmp > 9) *str = tmp + ('A' - 10);
				else *str = tmp + '0';
				break;
			}
			case 3:
			{
				tmp = (hex >> 8) & 0x000F;
				if(tmp > 9) *str = tmp + ('A' - 10);
				else *str = tmp + '0';
				break;
			}
			case 2:
			{
				tmp = (hex >> 4) & 0x000F;
				if(tmp > 9) *str = tmp + ('A' - 10);
				else *str = tmp + '0';
				break;
			}
			case 1:
			{
				tmp = hex & 0x000F;
				if(tmp > 9) *str = tmp + ('A' - 10);
				else *str = tmp + '0';
				break;
			}
			default: *str = '0';
		}
		width--;
		str++;
	}
}

void showLine(const u8 x,const u8 y,u8* lcd_stack,char * str,...)
{
	u8 coordinate = 16 * y + x;
	u8 i;
	va_list marker;
	va_start(marker,str); // Initialize variable arguments.  
	for(i=0;i<64;i++)
	{
		
	}
	while(*str != '\0')
	{
		if(coordinate > 64) break;	//防止堆栈溢出

		if(*str == '\\')
		{
			str++;
			lcd_stack[coordinate] = *str;
		}
		else if(*str == '%')
		{
			str++;
			if (*str == 'd' || *str == 'D')
			{
				str++;
				decToAscii(&lcd_stack[coordinate],va_arg(marker,u16),(*str-'0'));
				coordinate += (*str-'0'-1);
			}
			else if(*str == 'c' || *str == 'C')
			{
				lcd_stack[coordinate] = va_arg(marker,u16);
			}
			else if(*str == 'x' || *str == 'X')
			{
				str++;
				hexToAscii(&lcd_stack[coordinate],va_arg(marker,u16),(*str - '0'));
				coordinate += (*str - '0' - 1);
			}
		}
		//如有新的转义符指令请添加在这里
		else
		{
			lcd_stack[coordinate] = *str;
		}
		str++;
		coordinate++;
	}
	va_end( marker ); // Reset variable arguments. 
} 

#endif /*_WS_LCD_ST7920_SRC_H_*/