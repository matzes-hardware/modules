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
	static u8 rcvBits = 0;	//���մ������жϴ���
	
	OUT_SCK; 		   			//����"SCK_DDR"Ϊ���
	DELAY();
	SET_SCK;					//"SCK_PORT"���"1"
	DELAY();
	
	IN_SCK;						//����"SCK_DDR"Ϊ����
	DELAY();
	if(!GET_SCK)
	{
		if((rcvBits>0) && (rcvBits<9))
		{ 
			keyVal=keyVal>>1; 	//������LSB��ʽ
			//IN_SDA;			//���жԼ�������������ʱ��ע����������л�
			//DELAY();
			if(GET_SDA) 
	 			keyVal=keyVal|0x80; 
		}
		rcvBits++;
		while(!GET_SCK); 		//�ȴ�PS/2CLK����
	
		if(rcvBits>10)
		{
			rcvBits=0; 			//����11�α�ʾ������һ֡����
			rcvF=1; 			//��ʶ���ַ��Ѿ�����
		}
	}
}


u8 keyHandle(u8 val) 
{
	u8 i;
	static _Bool isUp=0;			//�����ͷŶ�����־
	static _Bool shift=0;		//shift�����±�־
	rcvF = 0; 
	//PRESS_DATA_PORT = val;		//״ָ̬ʾ
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
//					����д����Ϊ����KEIL��UNIXC��׼�����ܲ��ø�д��

					for(i=0;unshifted[i][0]!=val && i<59; i++);
					if(unshifted[i][0] == val) 
						{
							//SHIFT_DATA_PORT = val;
							val = unshifted[i][1];
							return val;
						}
						
											//״ָ̬ʾ
					
				} 
				else			// If shift pressed
				{			
					//for(i=0; unshifted[i][0]!=val && unshifted[i][0]; i++);
//					����д����Ϊ����KEIL��UNIXC��׼�����ܲ��ø�д��

					for(i=0;shifted[i][0]!=val && i<59; i++);
					
						if(shifted[i][0] == val) 
						{
							//SHIFT_DATA_PORT = val;
							 val = shifted[i][1];
							return val;
						}//״ָ̬ʾ
					
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