/********************************************************************************************************
*
* File                : PS2.H
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

#ifndef PS2_H
#define PS2_H

#if defined(STM8S207EX)

#define SET_SDA		sbi(PA_ODR,5)
#define CLR_SDA		cbi(PA_ODR,5)
#define GET_SDA		gbi(PA_IDR,5)
#define OUT_SDA` 	sbi(PA_DDR,5);sbi(PA_CR1,5);
#define IN_SDA 		cbi(PA_DDR,5);sbi(PA_CR1,5);

#define SET_SCK		sbi(PA_ODR,4)
#define CLR_SCK		cbi(PA_ODR,4)
#define GET_SCK		gbi(PA_IDR,4)
#define OUT_SCK 	sbi(PA_DDR,4);sbi(PA_CR1,4);
#define IN_SCK 		cbi(PA_DDR,4);sbi(PA_CR1,4);

#elif defined(STM8S105EX)

#define SET_SDA		sbi(PD_ODR,3)
#define CLR_SDA		cbi(PD_ODR,3)
#define GET_SDA		gbi(PD_IDR,3)
#define OUT_SDA 	sbi(PD_DDR,3);sbi(PD_CR1,3);
#define IN_SDA 		cbi(PD_DDR,3);sbi(PD_CR1,3);

#define SET_SCK		sbi(PD_ODR,4)
#define CLR_SCK		cbi(PD_ODR,4)
#define GET_SCK		gbi(PD_IDR,4)
#define OUT_SCK 	sbi(PD_DDR,4);sbi(PD_CR1,4);
#define IN_SCK 		cbi(PD_DDR,4);sbi(PD_CR1,4);

#elif defined(EXSTM8Q48A)

#define SET_SDA		sbi(PA_ODR,5)
#define CLR_SDA		cbi(PA_ODR,5)
#define GET_SDA		gbi(PA_IDR,5)
#define OUT_SDA 	sbi(PA_DDR,5);sbi(PA_CR1,5);
#define IN_SDA 		cbi(PA_DDR,5);sbi(PA_CR1,5);

#define SET_SCK		sbi(PA_ODR,4)
#define CLR_SCK		cbi(PA_ODR,4)
#define GET_SCK		gbi(PA_IDR,4)
#define OUT_SCK 	sbi(PA_DDR,4);sbi(PA_CR1,4);
#define IN_SCK 		cbi(PA_DDR,4);sbi(PA_CR1,4);

#elif defined(EXSTM8Q80A)

#define SET_SDA		sbi(PA_ODR,5)
#define CLR_SDA		cbi(PA_ODR,5)
#define GET_SDA		gbi(PA_IDR,5)
#define OUT_SDA 	sbi(PA_DDR,5);sbi(PD_CR1,5);
#define IN_SDA 		cbi(PA_DDR,5);sbi(PD_CR1,5);

#define SET_SCK		sbi(PA_ODR,4)
#define CLR_SCK		cbi(PA_ODR,4)
#define GET_SCK		gbi(PA_IDR,4)
#define OUT_SCK 	sbi(PA_DDR,4);sbi(PA_CR1,4);
#define IN_SCK 		cbi(PA_DDR,4);sbi(PA_CR1,4);

#elif defined(Open8s208)

#define SET_SDA		sbi(PH_ODR,6)
#define CLR_SDA		cbi(PH_ODR,6)
#define GET_SDA		gbi(PH_IDR,6)
#define OUT_SDA 	sbi(PH_DDR,6);sbi(PH_CR1,6);
#define IN_SDA 		cbi(PH_DDR,6);sbi(PH_CR1,6);

#define SET_SCK		sbi(PH_ODR,7)
#define CLR_SCK		cbi(PH_ODR,7)
#define GET_SCK		gbi(PH_IDR,7)
#define OUT_SCK 	sbi(PH_DDR,7);sbi(PH_CR1,7);
#define IN_SCK 		cbi(PH_DDR,7);sbi(PH_CR1,7);

#else
	#error missing interface for PS2
#endif

#define DELAY() _asm("nop");_asm("nop");_asm("nop");_asm("nop");_asm("nop");

_Bool rcvF=0; 	//是否收到字符标志
u8 keyVal; 			//键值

/*
u8 code SetConfigs[] = 
{

}

u8 code GetConfigs[] = 
{

}
*/

@near u8 unshifted[][2]=
{
	0x1C, 'a',
	0x32, 'b',
	0x21, 'c',
	0x23, 'd',
	0x24, 'e',
	0x2B, 'f',
	0x34, 'g',
	0x33, 'h',
	0x43, 'i',
	0x3B, 'j',
	0x42, 'k',
	0x4B, 'l',
	0x3A, 'm',
	0x31, 'n',
	0x44, 'o',
	0x4D, 'p',
	0x15, 'q',
	0x2D, 'r',
	0x1B, 's',
	0x2C, 't',
	0x3C, 'u',
	0x2A, 'v',
	0x1D, 'w',
	0x22, 'x',
	0x35, 'y',
	0x1A, 'z',
	0x45, '0',
	0x16, '1',
	0x1E, '2',
	0x26, '3',
	0x25, '4',
	0x2E, '5',
	0x36, '6',
	0x3D, '7',
	0x3E, '8',
	0x46, '9',
	0x0E, '`',
	0x4E, '-',
	0x55, '=',
	0x5D, '\\',
	0x29, ' ',
	0x54, '[',
	0x5B, ']',
	0x4C, ';',
	0x52, '\'',
	0x41, ',',
	0x49, '.',
	0x4A, '/',
	0x71, '.',
	0x70, '0',
	0x69, '1',
	0x72, '2',
	0x7A, '3',
	0x6B, '4',
	0x73, '5',
	0x74, '6',
	0x6C, '7',
	0x75, '8',
	0x7D, '9',
	0x66, ' ',		// back
};

@near u8 shifted[][2]=
{
	0x1C, 'A',
	0x32, 'B',
	0x21, 'C',
	0x23, 'D',
	0x24, 'E',
	0x2B, 'F',
	0x34, 'G',
	0x33, 'H',
	0x43, 'I',
	0x3B, 'J',
	0x42, 'K',
	0x4B, 'L',
	0x3A, 'M',
	0x31, 'N',
	0x44, 'O',
	0x4D, 'P',
	0x15, 'Q',
	0x2D, 'R',
	0x1B, 'S',
	0x2C, 'T',
	0x3C, 'U',
	0x2A, 'V',
	0x1D, 'W',
	0x22, 'X',
	0x35, 'Y',
	0x1A, 'Z',
	0x45, '0',
	0x16, '1',
	0x1E, '2',
	0x26, '3',
	0x25, '4',
	0x2E, '5',
	0x36, '6',
	0x3D, '7',
	0x3E, '8',
	0x46, '9',
	0x0E, '~',
	0x4E, '_',
	0x55, '+',
	0x5D, '|',
	0x29, ' ',
	0x54, '{',
	0x5B, '}',
	0x4C, ':',
	0x52, '"',
	0x41, '<',
	0x49, '>',
	0x4A, '?',
	0x71, '.',
	0x70, '0',
	0x69, '1',
	0x72, '2',
	0x7A, '3',
	0x6B, '4',
	0x73, '5',
	0x74, '6',
	0x6C, '7',
	0x75, '8',
	0x7D, '9',
	0x66, ' ',		// back
};

#include <ws_PS2_SRC.h>

#endif /*PS2_H*/