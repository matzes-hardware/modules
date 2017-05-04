   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2850                     ; 32 void TOUCH_init(void)
2850                     ; 33 {
2852                     	switch	.text
2853  0000               _TOUCH_init:
2857                     ; 34 PD_DDR=0XF0;
2859  0000 35f05011      	mov	_PD_DDR,#240
2860                     ; 35 PD_DDR=0XFF;
2862  0004 35ff5011      	mov	_PD_DDR,#255
2863                     ; 36 PD_DDR=0X00;
2865  0008 725f5011      	clr	_PD_DDR
2866                     ; 38 	PC_DDR=0x7f;
2868  000c 357f500c      	mov	_PC_DDR,#127
2869                     ; 39 	PC_CR1=0XFF;
2871  0010 35ff500d      	mov	_PC_CR1,#255
2872                     ; 40 }
2875  0014 81            	ret
2912                     ; 43 void TOUCH_WRITE_REG(unsigned int index)
2912                     ; 44 {
2913                     	switch	.text
2914  0015               _TOUCH_WRITE_REG:
2916  0015 89            	pushw	x
2917       00000000      OFST:	set	0
2920                     ; 46 	LCD_RS_L();
2922  0016 72195014      	bres	_PE_ODR,#4
2923                     ; 47 	TOUCH_nCS_L();
2926  001a 721f500f      	bres	_PD_ODR,#7
2927                     ; 49     SPI0_communication((unsigned char)(index>>8));    //00000000 000000000
2930  001e 9e            	ld	a,xh
2931  001f cd0000        	call	_SPI0_communication
2933                     ; 50     SPI0_communication((unsigned char)(index));
2935  0022 7b02          	ld	a,(OFST+2,sp)
2936  0024 cd0000        	call	_SPI0_communication
2938                     ; 52 	TOUCH_nCS_H();
2940  0027 721e500f      	bset	_PD_ODR,#7
2941                     ; 53 	LCD_RS_H();
2944  002b 72185014      	bset	_PE_ODR,#4
2945                     ; 55 }
2949  002f 85            	popw	x
2950  0030 81            	ret
2998                     ; 64 void TOUCH_WRITE_COMMAND(unsigned int index,unsigned int data)
2998                     ; 65 {
2999                     	switch	.text
3000  0031               _TOUCH_WRITE_COMMAND:
3002  0031 89            	pushw	x
3003       00000000      OFST:	set	0
3006                     ; 68 	LCD_RS_L();
3008  0032 72195014      	bres	_PE_ODR,#4
3009                     ; 69 	TOUCH_nCS_L();
3012  0036 721f500f      	bres	_PD_ODR,#7
3013                     ; 71     SPI0_communication((unsigned char)(index>>8));    //00000000 000000000
3016  003a 9e            	ld	a,xh
3017  003b cd0000        	call	_SPI0_communication
3019                     ; 72     SPI0_communication((unsigned char)(index));
3021  003e 7b02          	ld	a,(OFST+2,sp)
3022  0040 cd0000        	call	_SPI0_communication
3024                     ; 73 	LCD_CS_H();
3026  0043 72145023      	bset	_PH_ODR,#2
3027                     ; 75 	LCD_RS_H();
3030  0047 72185014      	bset	_PE_ODR,#4
3031                     ; 77 	TOUCH_nCS_L();
3034  004b 721f500f      	bres	_PD_ODR,#7
3035                     ; 78     SPI0_communication((unsigned char)(data>>8));    //00000000 000000000
3038  004f 7b05          	ld	a,(OFST+5,sp)
3039  0051 cd0000        	call	_SPI0_communication
3041                     ; 79     SPI0_communication((unsigned char)(data));
3043  0054 7b06          	ld	a,(OFST+6,sp)
3044  0056 cd0000        	call	_SPI0_communication
3046                     ; 80 	TOUCH_nCS_H();
3048  0059 721e500f      	bset	_PD_ODR,#7
3049                     ; 82 }
3053  005d 85            	popw	x
3054  005e 81            	ret
3089                     ; 91 void TOUCH_WRITE_DATA(unsigned int data)
3089                     ; 92 {
3090                     	switch	.text
3091  005f               _TOUCH_WRITE_DATA:
3093  005f 89            	pushw	x
3094       00000000      OFST:	set	0
3097                     ; 93     SPI0_communication((unsigned char)(data>>8));    //00000000 000000000
3099  0060 9e            	ld	a,xh
3100  0061 cd0000        	call	_SPI0_communication
3102                     ; 94     SPI0_communication((unsigned char)(data));
3104  0064 7b02          	ld	a,(OFST+2,sp)
3105  0066 cd0000        	call	_SPI0_communication
3107                     ; 95 }
3110  0069 85            	popw	x
3111  006a 81            	ret
3176                     ; 107 unsigned int GetTouchADC (unsigned char data)
3176                     ; 108 {	  
3177                     	switch	.text
3178  006b               _GetTouchADC:
3180  006b 88            	push	a
3181  006c 5204          	subw	sp,#4
3182       00000004      OFST:	set	4
3185                     ; 111 	LCD_CS_H()
3187  006e 72145023      	bset	_PH_ODR,#2
3188                     ; 112 	TOUCH_nCS_L();
3190  0072 721f500f      	bres	_PD_ODR,#7
3191                     ; 114 	delay_us(2);
3194  0076 ae0002        	ldw	x,#2
3195  0079 cd0000        	call	_delay_us
3197                     ; 115 	SPI0_communication(data);
3199  007c 7b05          	ld	a,(OFST+1,sp)
3200  007e cd0000        	call	_SPI0_communication
3202                     ; 116 	delay_us(2);              // 延时等待转换完成
3204  0081 ae0002        	ldw	x,#2
3205  0084 cd0000        	call	_delay_us
3207                     ; 117 	NUMH=SPI0_communication(0x00);
3209  0087 4f            	clr	a
3210  0088 cd0000        	call	_SPI0_communication
3212  008b 5f            	clrw	x
3213  008c 97            	ld	xl,a
3214  008d 1f01          	ldw	(OFST-3,sp),x
3215                     ; 118 	NUML=SPI0_communication(0x00);
3217  008f 4f            	clr	a
3218  0090 cd0000        	call	_SPI0_communication
3220  0093 5f            	clrw	x
3221  0094 97            	ld	xl,a
3222  0095 1f03          	ldw	(OFST-1,sp),x
3223                     ; 119 	Num=((NUMH)<<8)+NUML; 	
3225  0097 1e01          	ldw	x,(OFST-3,sp)
3226  0099 4f            	clr	a
3227  009a 02            	rlwa	x,a
3228  009b 72fb03        	addw	x,(OFST-1,sp)
3229  009e 1f03          	ldw	(OFST-1,sp),x
3230                     ; 120 	Num>>=4;                // 只有高12位有效.
3232  00a0 a604          	ld	a,#4
3233  00a2               L61:
3234  00a2 0403          	srl	(OFST-1,sp)
3235  00a4 0604          	rrc	(OFST+0,sp)
3236  00a6 4a            	dec	a
3237  00a7 26f9          	jrne	L61
3238                     ; 121 	TOUCH_nCS_H();
3240  00a9 721e500f      	bset	_PD_ODR,#7
3241                     ; 123 	return(Num);   
3244  00ad 1e03          	ldw	x,(OFST-1,sp)
3247  00af 5b05          	addw	sp,#5
3248  00b1 81            	ret
3329                     ; 139 unsigned int GetTouchADCEx(unsigned char cmd_code)
3329                     ; 140 {
3330                     	switch	.text
3331  00b2               _GetTouchADCEx:
3333  00b2 88            	push	a
3334  00b3 521e          	subw	sp,#30
3335       0000001e      OFST:	set	30
3338                     ; 143 	unsigned int sum=0;
3340  00b5 1e05          	ldw	x,(OFST-25,sp)
3341                     ; 146 	for(i=0;i<READ_TIMES;i++)
3343  00b7 5f            	clrw	x
3344  00b8 1f1d          	ldw	(OFST-1,sp),x
3345  00ba               L3712:
3346                     ; 148 		buf[i]=GetTouchADC(cmd_code);	    
3348  00ba 7b1f          	ld	a,(OFST+1,sp)
3349  00bc adad          	call	_GetTouchADC
3351  00be 9096          	ldw	y,sp
3352  00c0 72a90009      	addw	y,#OFST-21
3353  00c4 1703          	ldw	(OFST-27,sp),y
3354  00c6 161d          	ldw	y,(OFST-1,sp)
3355  00c8 9058          	sllw	y
3356  00ca 72f903        	addw	y,(OFST-27,sp)
3357  00cd 90ff          	ldw	(y),x
3358                     ; 146 	for(i=0;i<READ_TIMES;i++)
3360  00cf 1e1d          	ldw	x,(OFST-1,sp)
3361  00d1 1c0001        	addw	x,#1
3362  00d4 1f1d          	ldw	(OFST-1,sp),x
3365  00d6 1e1d          	ldw	x,(OFST-1,sp)
3366  00d8 a3000a        	cpw	x,#10
3367  00db 25dd          	jrult	L3712
3368                     ; 150 	for(i=0;i<READ_TIMES-1; i++)//排序
3370  00dd 5f            	clrw	x
3371  00de 1f1d          	ldw	(OFST-1,sp),x
3372  00e0               L1022:
3373                     ; 152 		for(j=i+1;j<READ_TIMES;j++)
3375  00e0 1e1d          	ldw	x,(OFST-1,sp)
3376  00e2 5c            	incw	x
3377  00e3 1f07          	ldw	(OFST-23,sp),x
3379  00e5 2065          	jra	L3122
3380  00e7               L7022:
3381                     ; 154 			if(buf[i]>buf[j])//升序排列
3383  00e7 96            	ldw	x,sp
3384  00e8 1c0009        	addw	x,#OFST-21
3385  00eb 1f03          	ldw	(OFST-27,sp),x
3386  00ed 1e1d          	ldw	x,(OFST-1,sp)
3387  00ef 58            	sllw	x
3388  00f0 72fb03        	addw	x,(OFST-27,sp)
3389  00f3 9096          	ldw	y,sp
3390  00f5 72a90009      	addw	y,#OFST-21
3391  00f9 1701          	ldw	(OFST-29,sp),y
3392  00fb 1607          	ldw	y,(OFST-23,sp)
3393  00fd 9058          	sllw	y
3394  00ff 72f901        	addw	y,(OFST-29,sp)
3395  0102 fe            	ldw	x,(x)
3396  0103 90f3          	cpw	x,(y)
3397  0105 233e          	jrule	L7122
3398                     ; 156 				temp=buf[i];
3400  0107 96            	ldw	x,sp
3401  0108 1c0009        	addw	x,#OFST-21
3402  010b 1f03          	ldw	(OFST-27,sp),x
3403  010d 1e1d          	ldw	x,(OFST-1,sp)
3404  010f 58            	sllw	x
3405  0110 72fb03        	addw	x,(OFST-27,sp)
3406  0113 fe            	ldw	x,(x)
3407  0114 1f05          	ldw	(OFST-25,sp),x
3408                     ; 157 				buf[i]=buf[j];
3410  0116 96            	ldw	x,sp
3411  0117 1c0009        	addw	x,#OFST-21
3412  011a 1f03          	ldw	(OFST-27,sp),x
3413  011c 1e07          	ldw	x,(OFST-23,sp)
3414  011e 58            	sllw	x
3415  011f 72fb03        	addw	x,(OFST-27,sp)
3416  0122 9096          	ldw	y,sp
3417  0124 72a90009      	addw	y,#OFST-21
3418  0128 1701          	ldw	(OFST-29,sp),y
3419  012a 161d          	ldw	y,(OFST-1,sp)
3420  012c 9058          	sllw	y
3421  012e 72f901        	addw	y,(OFST-29,sp)
3422  0131 89            	pushw	x
3423  0132 fe            	ldw	x,(x)
3424  0133 90ff          	ldw	(y),x
3425  0135 85            	popw	x
3426                     ; 158 				buf[j]=temp;
3428  0136 96            	ldw	x,sp
3429  0137 1c0009        	addw	x,#OFST-21
3430  013a 1f03          	ldw	(OFST-27,sp),x
3431  013c 1e07          	ldw	x,(OFST-23,sp)
3432  013e 58            	sllw	x
3433  013f 72fb03        	addw	x,(OFST-27,sp)
3434  0142 1605          	ldw	y,(OFST-25,sp)
3435  0144 ff            	ldw	(x),y
3436  0145               L7122:
3437                     ; 152 		for(j=i+1;j<READ_TIMES;j++)
3439  0145 1e07          	ldw	x,(OFST-23,sp)
3440  0147 1c0001        	addw	x,#1
3441  014a 1f07          	ldw	(OFST-23,sp),x
3442  014c               L3122:
3445  014c 1e07          	ldw	x,(OFST-23,sp)
3446  014e a3000a        	cpw	x,#10
3447  0151 2594          	jrult	L7022
3448                     ; 150 	for(i=0;i<READ_TIMES-1; i++)//排序
3450  0153 1e1d          	ldw	x,(OFST-1,sp)
3451  0155 1c0001        	addw	x,#1
3452  0158 1f1d          	ldw	(OFST-1,sp),x
3455  015a 1e1d          	ldw	x,(OFST-1,sp)
3456  015c a30009        	cpw	x,#9
3457  015f 2403cc00e0    	jrult	L1022
3458                     ; 162 	sum=0;
3460  0164 5f            	clrw	x
3461  0165 1f05          	ldw	(OFST-25,sp),x
3462                     ; 163 	for(i=LOST_VAL;i<READ_TIMES-LOST_VAL;i++)sum+=buf[i];
3464  0167 ae0004        	ldw	x,#4
3465  016a 1f1d          	ldw	(OFST-1,sp),x
3466  016c               L1222:
3469  016c 96            	ldw	x,sp
3470  016d 1c0009        	addw	x,#OFST-21
3471  0170 1f03          	ldw	(OFST-27,sp),x
3472  0172 1e1d          	ldw	x,(OFST-1,sp)
3473  0174 58            	sllw	x
3474  0175 72fb03        	addw	x,(OFST-27,sp)
3475  0178 fe            	ldw	x,(x)
3476  0179 72fb05        	addw	x,(OFST-25,sp)
3477  017c 1f05          	ldw	(OFST-25,sp),x
3480  017e 1e1d          	ldw	x,(OFST-1,sp)
3481  0180 1c0001        	addw	x,#1
3482  0183 1f1d          	ldw	(OFST-1,sp),x
3485  0185 1e1d          	ldw	x,(OFST-1,sp)
3486  0187 a30006        	cpw	x,#6
3487  018a 25e0          	jrult	L1222
3488                     ; 164 	temp=sum/(READ_TIMES-2*LOST_VAL);
3490  018c 1e05          	ldw	x,(OFST-25,sp)
3491  018e 54            	srlw	x
3492  018f 1f05          	ldw	(OFST-25,sp),x
3493                     ; 165 	return temp;   
3495  0191 1e05          	ldw	x,(OFST-25,sp)
3498  0193 5b1f          	addw	sp,#31
3499  0195 81            	ret
3563                     ; 175 unsigned char Read_ADS(unsigned int *x_ad,unsigned int *y_ad)
3563                     ; 176 {
3564                     	switch	.text
3565  0196               _Read_ADS:
3567  0196 89            	pushw	x
3568  0197 5204          	subw	sp,#4
3569       00000004      OFST:	set	4
3572                     ; 178 	xtemp=GetTouchADCEx(CMD_READ_X);    //有筛选的读取X轴AD转换结果
3574  0199 a6d0          	ld	a,#208
3575  019b cd00b2        	call	_GetTouchADCEx
3577  019e 1f01          	ldw	(OFST-3,sp),x
3578                     ; 179 	ytemp=GetTouchADCEx(CMD_READ_Y);	    //有筛选的读取Y轴AD转换结果											   
3580  01a0 a690          	ld	a,#144
3581  01a2 cd00b2        	call	_GetTouchADCEx
3583  01a5 1f03          	ldw	(OFST-1,sp),x
3584                     ; 180 	if(xtemp<100||ytemp<100)
3586  01a7 1e01          	ldw	x,(OFST-3,sp)
3587  01a9 a30064        	cpw	x,#100
3588  01ac 2507          	jrult	L3622
3590  01ae 1e03          	ldw	x,(OFST-1,sp)
3591  01b0 a30064        	cpw	x,#100
3592  01b3 2404          	jruge	L1622
3593  01b5               L3622:
3594                     ; 181         return 1;   //读数失败
3596  01b5 a601          	ld	a,#1
3598  01b7 200b          	jra	L42
3599  01b9               L1622:
3600                     ; 182 	*x_ad=xtemp;
3602  01b9 1e05          	ldw	x,(OFST+1,sp)
3603  01bb 1601          	ldw	y,(OFST-3,sp)
3604  01bd ff            	ldw	(x),y
3605                     ; 183 	*y_ad=ytemp;        
3607  01be 1e09          	ldw	x,(OFST+5,sp)
3608  01c0 1603          	ldw	y,(OFST-1,sp)
3609  01c2 ff            	ldw	(x),y
3610                     ; 184 	return 0;//读数成功
3612  01c3 4f            	clr	a
3614  01c4               L42:
3616  01c4 5b06          	addw	sp,#6
3617  01c6 81            	ret
3708                     ; 197 unsigned char Read_ADS2(unsigned long *x_ad,unsigned long *y_ad) 
3708                     ; 198 {
3709                     	switch	.text
3710  01c7               _Read_ADS2:
3712  01c7 89            	pushw	x
3713  01c8 5209          	subw	sp,#9
3714       00000009      OFST:	set	9
3717                     ; 203     res=Read_ADS(&x1,&y1);  // 第一次读取ADC值 
3719  01ca 96            	ldw	x,sp
3720  01cb 1c0004        	addw	x,#OFST-5
3721  01ce 89            	pushw	x
3722  01cf 96            	ldw	x,sp
3723  01d0 1c0004        	addw	x,#OFST-5
3724  01d3 adc1          	call	_Read_ADS
3726  01d5 85            	popw	x
3727  01d6 6b01          	ld	(OFST-8,sp),a
3728                     ; 204     if(res==1)  return(1);	// 如果读数失败，返回1
3730  01d8 7b01          	ld	a,(OFST-8,sp)
3731  01da a101          	cp	a,#1
3732  01dc 2604          	jrne	L3332
3735  01de a601          	ld	a,#1
3737  01e0 2016          	jra	L03
3738  01e2               L3332:
3739                     ; 205     res=Read_ADS(&x2,&y2);	// 第二次读取ADC值   
3741  01e2 96            	ldw	x,sp
3742  01e3 1c0008        	addw	x,#OFST-1
3743  01e6 89            	pushw	x
3744  01e7 96            	ldw	x,sp
3745  01e8 1c0008        	addw	x,#OFST-1
3746  01eb ada9          	call	_Read_ADS
3748  01ed 85            	popw	x
3749  01ee 6b01          	ld	(OFST-8,sp),a
3750                     ; 206     if(res==1)  return(1);   	// 如果读数失败，返回1
3752  01f0 7b01          	ld	a,(OFST-8,sp)
3753  01f2 a101          	cp	a,#1
3754  01f4 2605          	jrne	L5332
3757  01f6 a601          	ld	a,#1
3759  01f8               L03:
3761  01f8 5b0b          	addw	sp,#11
3762  01fa 81            	ret
3763  01fb               L5332:
3764                     ; 207     if(((x2<=x1&&x1<x2+ERR_RANGE)||(x1<=x2&&x2<x1+ERR_RANGE))//前后两次采样在+-50内
3764                     ; 208         &&((y2<=y1&&y1<y2+ERR_RANGE)||(y1<=y2&&y2<y1+ERR_RANGE)))
3766  01fb 1e06          	ldw	x,(OFST-3,sp)
3767  01fd 1302          	cpw	x,(OFST-7,sp)
3768  01ff 2209          	jrugt	L3432
3770  0201 1e06          	ldw	x,(OFST-3,sp)
3771  0203 1c0032        	addw	x,#50
3772  0206 1302          	cpw	x,(OFST-7,sp)
3773  0208 220f          	jrugt	L1432
3774  020a               L3432:
3776  020a 1e02          	ldw	x,(OFST-7,sp)
3777  020c 1306          	cpw	x,(OFST-3,sp)
3778  020e 2246          	jrugt	L7332
3780  0210 1e02          	ldw	x,(OFST-7,sp)
3781  0212 1c0032        	addw	x,#50
3782  0215 1306          	cpw	x,(OFST-3,sp)
3783  0217 233d          	jrule	L7332
3784  0219               L1432:
3786  0219 1e08          	ldw	x,(OFST-1,sp)
3787  021b 1304          	cpw	x,(OFST-5,sp)
3788  021d 2209          	jrugt	L7432
3790  021f 1e08          	ldw	x,(OFST-1,sp)
3791  0221 1c0032        	addw	x,#50
3792  0224 1304          	cpw	x,(OFST-5,sp)
3793  0226 220f          	jrugt	L5432
3794  0228               L7432:
3796  0228 1e04          	ldw	x,(OFST-5,sp)
3797  022a 1308          	cpw	x,(OFST-1,sp)
3798  022c 2228          	jrugt	L7332
3800  022e 1e04          	ldw	x,(OFST-5,sp)
3801  0230 1c0032        	addw	x,#50
3802  0233 1308          	cpw	x,(OFST-1,sp)
3803  0235 231f          	jrule	L7332
3804  0237               L5432:
3805                     ; 210         *x_ad=(x1+x2)/2;
3807  0237 1e02          	ldw	x,(OFST-7,sp)
3808  0239 72fb06        	addw	x,(OFST-3,sp)
3809  023c 54            	srlw	x
3810  023d cd0000        	call	c_uitolx
3812  0240 1e0a          	ldw	x,(OFST+1,sp)
3813  0242 cd0000        	call	c_rtol
3815                     ; 211         *y_ad=(y1+y2)/2;
3817  0245 1e04          	ldw	x,(OFST-5,sp)
3818  0247 72fb08        	addw	x,(OFST-1,sp)
3819  024a 54            	srlw	x
3820  024b cd0000        	call	c_uitolx
3822  024e 1e0e          	ldw	x,(OFST+5,sp)
3823  0250 cd0000        	call	c_rtol
3825                     ; 212         return 0;	 // 正确读取，返回0
3827  0253 4f            	clr	a
3829  0254 20a2          	jra	L03
3830  0256               L7332:
3831                     ; 214     else return 1;	 // 前后不在+-50内，读数错误 
3833  0256 a601          	ld	a,#1
3835  0258 209e          	jra	L03
3859                     .const:	section	.text
3860  0000               L43:
3861  0000 ffffb0c0      	dc.l	-20288
3862  0004               L63:
3863  0004 0000076c      	dc.l	1900
3864  0008               L04:
3865  0008 00000140      	dc.l	320
3866  000c               L24:
3867  000c 00004100      	dc.l	16640
3868                     ; 220 void convert_ad_to_xy(void)
3868                     ; 221 {
3869                     	switch	.text
3870  025a               _convert_ad_to_xy:
3874                     ; 229     touch_dot.x=(240*touch_dot.x_ad_val -2100*240)/ 1900;
3876  025a ae0006        	ldw	x,#_touch_dot+4
3877  025d cd0000        	call	c_ltor
3879  0260 a6f0          	ld	a,#240
3880  0262 cd0000        	call	c_smul
3882  0265 ae0000        	ldw	x,#L43
3883  0268 cd0000        	call	c_lsub
3885  026b ae0004        	ldw	x,#L63
3886  026e cd0000        	call	c_ludv
3888  0271 be02          	ldw	x,c_lreg+2
3889  0273 bf02          	ldw	_touch_dot,x
3890                     ; 230     touch_dot.y=(320*touch_dot.y_ad_val -2100*320)/ 1900;
3892  0275 ae000a        	ldw	x,#_touch_dot+8
3893  0278 cd0000        	call	c_ltor
3895  027b ae0008        	ldw	x,#L04
3896  027e cd0000        	call	c_lmul
3898  0281 ae000c        	ldw	x,#L24
3899  0284 cd0000        	call	c_lsub
3901  0287 ae0004        	ldw	x,#L63
3902  028a cd0000        	call	c_ludv
3904  028d be02          	ldw	x,c_lreg+2
3905  028f bf04          	ldw	_touch_dot+2,x
3906                     ; 232 }
3909  0291 81            	ret
3935                     ; 237 unsigned char Read_Once(void)
3935                     ; 238 {
3936                     	switch	.text
3937  0292               _Read_Once:
3941                     ; 240 	if(Read_ADS2(&touch_dot.x_ad_val,&touch_dot.y_ad_val)==0)	// 如果读取数据成功
3943  0292 ae000a        	ldw	x,#_touch_dot+8
3944  0295 89            	pushw	x
3945  0296 ae0006        	ldw	x,#_touch_dot+4
3946  0299 cd01c7        	call	_Read_ADS2
3948  029c 85            	popw	x
3949  029d 4d            	tnz	a
3950  029e 2604          	jrne	L3732
3951                     ; 243 		convert_ad_to_xy();   // 把读到的ADC值转变成TFT坐标值
3953  02a0 adb8          	call	_convert_ad_to_xy
3955                     ; 244 		return 0;	// 返回0，表示成功
3957  02a2 4f            	clr	a
3960  02a3 81            	ret
3961  02a4               L3732:
3962                     ; 246 	else return 1;	// 如果读取数据失败，返回1表示失败
3964  02a4 a601          	ld	a,#1
3967  02a6 81            	ret
3993                     ; 251 unsigned char Read_Continue(void)
3993                     ; 252 {
3994                     	switch	.text
3995  02a7               _Read_Continue:
3999                     ; 254 	if(Read_ADS2( &touch_dot.x_ad_val,&touch_dot.y_ad_val )==0)	 // 如果读取数据成功
4001  02a7 ae000a        	ldw	x,#_touch_dot+8
4002  02aa 89            	pushw	x
4003  02ab ae0006        	ldw	x,#_touch_dot+4
4004  02ae cd01c7        	call	_Read_ADS2
4006  02b1 85            	popw	x
4007  02b2 4d            	tnz	a
4008  02b3 2604          	jrne	L7042
4009                     ; 256 		convert_ad_to_xy();   // 把读到的ADC值转变成TFT坐标值
4011  02b5 ada3          	call	_convert_ad_to_xy
4013                     ; 257 		return 0;	   // 返回0，表示成功
4015  02b7 4f            	clr	a
4018  02b8 81            	ret
4019  02b9               L7042:
4020                     ; 259 	else return 1;	   // 如果读取数据失败，返回1表示失败
4022  02b9 a601          	ld	a,#1
4025  02bb 81            	ret
4104                     	xdef	_GetTouchADCEx
4105                     	xdef	_TOUCH_WRITE_DATA
4106                     	xdef	_TOUCH_WRITE_COMMAND
4107                     	xdef	_TOUCH_WRITE_REG
4108                     	switch	.ubsct
4109  0000               _p_touch_dot:
4110  0000 0000          	ds.b	2
4111                     	xdef	_p_touch_dot
4112  0002               _touch_dot:
4113  0002 000000000000  	ds.b	13
4114                     	xdef	_touch_dot
4115                     	xdef	_convert_ad_to_xy
4116                     	xdef	_Read_Continue
4117                     	xdef	_Read_Once
4118                     	xdef	_Read_ADS2
4119                     	xdef	_Read_ADS
4120                     	xdef	_GetTouchADC
4121                     	xdef	_TOUCH_init
4122                     	xref	_SPI0_communication
4123                     	xref	_delay_us
4124                     	xref.b	c_lreg
4144                     	xref	c_lmul
4145                     	xref	c_ludv
4146                     	xref	c_lsub
4147                     	xref	c_smul
4148                     	xref	c_ltor
4149                     	xref	c_rtol
4150                     	xref	c_uitolx
4151                     	end
