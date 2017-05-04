/********************************************************************************************************
*
* File                : PS2_src.H
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

#ifndef PS2_SRC_H
#define PS2_SRC_H

void PS2_Init(void)
{
	IN_SDA;
}

void check(void)
{
	static u8 rcvBits = 0;	//接收次数，中断次数
	
	OUT_SCK; 		   			//设置"SCK_DDR"为输出
	DELAY();
	SET_SCK;					//"SCK_PORT"输出"1"
	DELAY();
	
	IN_SCK;						//设置"SCK_DDR"为输入
	DELAY();
	if(!GET_SCK)
	{
		if((rcvBits>0) && (rcvBits<9))
		{ 
			keyVal=keyVal>>1; 	//数据是LSB格式
			//IN_SDA;			//当有对键盘有属性设置时，注意输入输出切换
			//DELAY();
			if(GET_SDA) 
	 			keyVal=keyVal|0x80; 
		}
		rcvBits++;
		while(!GET_SCK); 		//等待PS/2CLK拉高
	
		if(rcvBits>10)
		{
			rcvBits=0; 			//接收11次表示接收完一帧数据
			rcvF=1; 			//标识有字符已经输入
		}
	}
}


u8 keyHandle(u8 val) 
{
	u8 i;
	static _Bool isUp=0;			//按键释放动作标志
	static _Bool shift=0;		//shift键按下标志
	rcvF = 0; 
	//PRESS_DATA_PORT = val;		//状态指示
	if(!isUp)
	{
		switch(val)
		{
			case 0xF0 :			// a relase action
				isUp = 1;
				break;
			case 0x12 :			// Left shift
				shift = 1;
				break;
			case 0x59 :			// Right shift
				shift = 1;
				break;
			default:
				if(!shift)		// If shift not pressed
				{ 

					//for(i=0; unshifted[i][0]!=val && unshifted[i][0];i++);
//					上述写法较为灵活，但KEIL非UNIXC标准，不能采用该写法

					for(i=0;unshifted[i][0]!=val && i<59; i++);
					if(unshifted[i][0] == val) 
						{
							//SHIFT_DATA_PORT = val;
							val = unshifted[i][1];
							return val;
						}
						
											//状态指示
					
				} 
				else			// If shift pressed
				{			
					//for(i=0; unshifted[i][0]!=val && unshifted[i][0]; i++);
//					上述写法较为灵活，但KEIL非UNIXC标准，不能采用该写法

					for(i=0;shifted[i][0]!=val && i<59; i++);
					
						if(shifted[i][0] == val) 
						{
							//SHIFT_DATA_PORT = val;
							 val = shifted[i][1];
							return val;
						}//状态指示
					
				}
		}
	}
	else 
	{
		isUp=0;					
		switch(val)
		{
			case 0x12 :			// Left SHIFT
				shift = 0;
				break;
			case 0x59 :			// Right SHIFT
				shift = 0;
				break;
		}
	}
	return 0xff;
}

#endif /*PS2_SRC_H*/