 /*
*========================================================================================================
*
* File                : system.c
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
#include "system.h"
void delay_ms(u16 ms)
{
			u8 i;
			while(ms!=0)
			{
				for(i=0;i<250;i++)
				{}
				for(i=0;i<75;i++)
				{}
				ms--;
			}
}

void delay_us(u16 us)
{
			u8 i;
			while(us!=0)
			{
				for(i=0;i<25;i++)
				{}
				for(i=0;i<7;i++)
				{}
				us--;
			}
}
