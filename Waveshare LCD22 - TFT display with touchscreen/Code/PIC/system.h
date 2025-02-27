/********************************************************************************************************
*
* File                : system.h
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

#ifndef _SYSTEM_H
#define _SYSTEM_H

typedef signed long  s32;
typedef signed short s16;
typedef signed char  s8;

typedef signed long  const sc32;  /* Read Only */
typedef signed short const sc16;  /* Read Only */
typedef signed char  const sc8;   /* Read Only */

typedef volatile signed long  vs32;
typedef volatile signed short vs16;
typedef volatile signed char  vs8;

typedef volatile signed long  const vsc32;  /* Read Only */
typedef volatile signed short const vsc16;  /* Read Only */
typedef volatile signed char  const vsc8;   /* Read Only */

typedef unsigned long  u32;
typedef unsigned short u16;
typedef unsigned char  u8;

typedef unsigned long  const uc32;  /* Read Only */
typedef unsigned short const uc16;  /* Read Only */
typedef unsigned char  const uc8;   /* Read Only */

typedef volatile unsigned long  vu32;
typedef volatile unsigned short vu16;
typedef volatile unsigned char  vu8;

typedef volatile unsigned long  const vuc32;  /* Read Only */
typedef volatile unsigned short const vuc16;  /* Read Only */
typedef volatile unsigned char  const vuc8;   /* Read Only */

#define LCD_DELAY() _asm("nop");_asm("nop");_asm("nop");_asm("nop");_asm("nop");

/* io configs */
#define sbi(io,bit)		( io  |=  (1<<bit) )
//example:sbi(PA_ODR,0);sbi(PA_DDR,0);
#define cbi(io,bit)		( io  &= ~(1<<bit) )	
//example:cbi(PA_ODR,0);cbi(PA_DDR,0);
#define gbi(pin ,bit)	( pin &   (1<<bit) )	
//example: gbi(PA_IDR,0);

void delay_ms(u16 ms);
void delay_us(u16 us);

#endif /*_SYSTEM_H*/