   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2850                     ; 32 void TOUCH_init(void)
2850                     ; 33 {
2852                     	switch	.text
2853  0000               _TOUCH_init:
2857                     ; 34 PD_DDR=0XFF;
2859  0000 35ff5011      	mov	_PD_DDR,#255
2860                     ; 37 	PC_DDR=0x7f;
2862  0004 357f500c      	mov	_PC_DDR,#127
2863                     ; 38 	PC_CR1=0XFF;
2865  0008 35ff500d      	mov	_PC_CR1,#255
2866                     ; 39 }
2869  000c 81            	ret
2906                     ; 42 void TOUCH_WRITE_REG(unsigned int index)
2906                     ; 43 {
2907                     	switch	.text
2908  000d               _TOUCH_WRITE_REG:
2910  000d 89            	pushw	x
2911       00000000      OFST:	set	0
2914                     ; 45 	LCD_RS_L();
2916  000e 72195014      	bres	_PE_ODR,#4
2917                     ; 46 	TOUCH_nCS_L();
2920  0012 721f500f      	bres	_PD_ODR,#7
2921                     ; 48     SPI0_communication((unsigned char)(index>>8));    //00000000 000000000
2924  0016 9e            	ld	a,xh
2925  0017 cd0000        	call	_SPI0_communication
2927                     ; 49     SPI0_communication((unsigned char)(index));
2929  001a 7b02          	ld	a,(OFST+2,sp)
2930  001c cd0000        	call	_SPI0_communication
2932                     ; 51 	TOUCH_nCS_H();
2934  001f 721e500f      	bset	_PD_ODR,#7
2935                     ; 52 	LCD_RS_H();
2938  0023 72185014      	bset	_PE_ODR,#4
2939                     ; 54 }
2943  0027 85            	popw	x
2944  0028 81            	ret
2992                     ; 63 void TOUCH_WRITE_COMMAND(unsigned int index,unsigned int data)
2992                     ; 64 {
2993                     	switch	.text
2994  0029               _TOUCH_WRITE_COMMAND:
2996  0029 89            	pushw	x
2997       00000000      OFST:	set	0
3000                     ; 67 	LCD_RS_L();
3002  002a 72195014      	bres	_PE_ODR,#4
3003                     ; 68 	TOUCH_nCS_L();
3006  002e 721f500f      	bres	_PD_ODR,#7
3007                     ; 70     SPI0_communication((unsigned char)(index>>8));    //00000000 000000000
3010  0032 9e            	ld	a,xh
3011  0033 cd0000        	call	_SPI0_communication
3013                     ; 71     SPI0_communication((unsigned char)(index));
3015  0036 7b02          	ld	a,(OFST+2,sp)
3016  0038 cd0000        	call	_SPI0_communication
3018                     ; 72 	LCD_CS_H();
3020  003b 72145023      	bset	_PH_ODR,#2
3021                     ; 74 	LCD_RS_H();
3024  003f 72185014      	bset	_PE_ODR,#4
3025                     ; 76 	TOUCH_nCS_L();
3028  0043 721f500f      	bres	_PD_ODR,#7
3029                     ; 77     SPI0_communication((unsigned char)(data>>8));    //00000000 000000000
3032  0047 7b05          	ld	a,(OFST+5,sp)
3033  0049 cd0000        	call	_SPI0_communication
3035                     ; 78     SPI0_communication((unsigned char)(data));
3037  004c 7b06          	ld	a,(OFST+6,sp)
3038  004e cd0000        	call	_SPI0_communication
3040                     ; 79 	TOUCH_nCS_H();
3042  0051 721e500f      	bset	_PD_ODR,#7
3043                     ; 81 }
3047  0055 85            	popw	x
3048  0056 81            	ret
3083                     ; 90 void TOUCH_WRITE_DATA(unsigned int data)
3083                     ; 91 {
3084                     	switch	.text
3085  0057               _TOUCH_WRITE_DATA:
3087  0057 89            	pushw	x
3088       00000000      OFST:	set	0
3091                     ; 92     SPI0_communication((unsigned char)(data>>8));    //00000000 000000000
3093  0058 9e            	ld	a,xh
3094  0059 cd0000        	call	_SPI0_communication
3096                     ; 93     SPI0_communication((unsigned char)(data));
3098  005c 7b02          	ld	a,(OFST+2,sp)
3099  005e cd0000        	call	_SPI0_communication
3101                     ; 94 }
3104  0061 85            	popw	x
3105  0062 81            	ret
3170                     ; 106 unsigned int GetTouchADC (unsigned char data)
3170                     ; 107 {	  
3171                     	switch	.text
3172  0063               _GetTouchADC:
3174  0063 88            	push	a
3175  0064 5204          	subw	sp,#4
3176       00000004      OFST:	set	4
3179                     ; 110 	LCD_CS_H()
3181  0066 72145023      	bset	_PH_ODR,#2
3182                     ; 111 	TOUCH_nCS_L();
3184  006a 721f500f      	bres	_PD_ODR,#7
3185                     ; 113 	delay_us(2);
3188  006e ae0002        	ldw	x,#2
3189  0071 cd0000        	call	_delay_us
3191                     ; 114 	SPI0_communication(data);
3193  0074 7b05          	ld	a,(OFST+1,sp)
3194  0076 cd0000        	call	_SPI0_communication
3196                     ; 115 	delay_us(2);              // 延时等待转换完成
3198  0079 ae0002        	ldw	x,#2
3199  007c cd0000        	call	_delay_us
3201                     ; 116 	NUMH=SPI0_communication(0x00);
3203  007f 4f            	clr	a
3204  0080 cd0000        	call	_SPI0_communication
3206  0083 5f            	clrw	x
3207  0084 97            	ld	xl,a
3208  0085 1f01          	ldw	(OFST-3,sp),x
3209                     ; 117 	NUML=SPI0_communication(0x00);
3211  0087 4f            	clr	a
3212  0088 cd0000        	call	_SPI0_communication
3214  008b 5f            	clrw	x
3215  008c 97            	ld	xl,a
3216  008d 1f03          	ldw	(OFST-1,sp),x
3217                     ; 118 	Num=((NUMH)<<8)+NUML; 	
3219  008f 1e01          	ldw	x,(OFST-3,sp)
3220  0091 4f            	clr	a
3221  0092 02            	rlwa	x,a
3222  0093 72fb03        	addw	x,(OFST-1,sp)
3223  0096 1f03          	ldw	(OFST-1,sp),x
3224                     ; 119 	Num>>=4;                // 只有高12位有效.
3226  0098 a604          	ld	a,#4
3227  009a               L61:
3228  009a 0403          	srl	(OFST-1,sp)
3229  009c 0604          	rrc	(OFST+0,sp)
3230  009e 4a            	dec	a
3231  009f 26f9          	jrne	L61
3232                     ; 120 	TOUCH_nCS_H();
3234  00a1 721e500f      	bset	_PD_ODR,#7
3235                     ; 122 	return(Num);   
3238  00a5 1e03          	ldw	x,(OFST-1,sp)
3241  00a7 5b05          	addw	sp,#5
3242  00a9 81            	ret
3323                     ; 138 unsigned int GetTouchADCEx(unsigned char cmd_code)
3323                     ; 139 {
3324                     	switch	.text
3325  00aa               _GetTouchADCEx:
3327  00aa 88            	push	a
3328  00ab 521e          	subw	sp,#30
3329       0000001e      OFST:	set	30
3332                     ; 142 	unsigned int sum=0;
3334  00ad 1e05          	ldw	x,(OFST-25,sp)
3335                     ; 145 	for(i=0;i<READ_TIMES;i++)
3337  00af 5f            	clrw	x
3338  00b0 1f1d          	ldw	(OFST-1,sp),x
3339  00b2               L3712:
3340                     ; 147 		buf[i]=GetTouchADC(cmd_code);	    
3342  00b2 7b1f          	ld	a,(OFST+1,sp)
3343  00b4 adad          	call	_GetTouchADC
3345  00b6 9096          	ldw	y,sp
3346  00b8 72a90009      	addw	y,#OFST-21
3347  00bc 1703          	ldw	(OFST-27,sp),y
3348  00be 161d          	ldw	y,(OFST-1,sp)
3349  00c0 9058          	sllw	y
3350  00c2 72f903        	addw	y,(OFST-27,sp)
3351  00c5 90ff          	ldw	(y),x
3352                     ; 145 	for(i=0;i<READ_TIMES;i++)
3354  00c7 1e1d          	ldw	x,(OFST-1,sp)
3355  00c9 1c0001        	addw	x,#1
3356  00cc 1f1d          	ldw	(OFST-1,sp),x
3359  00ce 1e1d          	ldw	x,(OFST-1,sp)
3360  00d0 a3000a        	cpw	x,#10
3361  00d3 25dd          	jrult	L3712
3362                     ; 149 	for(i=0;i<READ_TIMES-1; i++)//排序
3364  00d5 5f            	clrw	x
3365  00d6 1f1d          	ldw	(OFST-1,sp),x
3366  00d8               L1022:
3367                     ; 151 		for(j=i+1;j<READ_TIMES;j++)
3369  00d8 1e1d          	ldw	x,(OFST-1,sp)
3370  00da 5c            	incw	x
3371  00db 1f07          	ldw	(OFST-23,sp),x
3373  00dd 2065          	jra	L3122
3374  00df               L7022:
3375                     ; 153 			if(buf[i]>buf[j])//升序排列
3377  00df 96            	ldw	x,sp
3378  00e0 1c0009        	addw	x,#OFST-21
3379  00e3 1f03          	ldw	(OFST-27,sp),x
3380  00e5 1e1d          	ldw	x,(OFST-1,sp)
3381  00e7 58            	sllw	x
3382  00e8 72fb03        	addw	x,(OFST-27,sp)
3383  00eb 9096          	ldw	y,sp
3384  00ed 72a90009      	addw	y,#OFST-21
3385  00f1 1701          	ldw	(OFST-29,sp),y
3386  00f3 1607          	ldw	y,(OFST-23,sp)
3387  00f5 9058          	sllw	y
3388  00f7 72f901        	addw	y,(OFST-29,sp)
3389  00fa fe            	ldw	x,(x)
3390  00fb 90f3          	cpw	x,(y)
3391  00fd 233e          	jrule	L7122
3392                     ; 155 				temp=buf[i];
3394  00ff 96            	ldw	x,sp
3395  0100 1c0009        	addw	x,#OFST-21
3396  0103 1f03          	ldw	(OFST-27,sp),x
3397  0105 1e1d          	ldw	x,(OFST-1,sp)
3398  0107 58            	sllw	x
3399  0108 72fb03        	addw	x,(OFST-27,sp)
3400  010b fe            	ldw	x,(x)
3401  010c 1f05          	ldw	(OFST-25,sp),x
3402                     ; 156 				buf[i]=buf[j];
3404  010e 96            	ldw	x,sp
3405  010f 1c0009        	addw	x,#OFST-21
3406  0112 1f03          	ldw	(OFST-27,sp),x
3407  0114 1e07          	ldw	x,(OFST-23,sp)
3408  0116 58            	sllw	x
3409  0117 72fb03        	addw	x,(OFST-27,sp)
3410  011a 9096          	ldw	y,sp
3411  011c 72a90009      	addw	y,#OFST-21
3412  0120 1701          	ldw	(OFST-29,sp),y
3413  0122 161d          	ldw	y,(OFST-1,sp)
3414  0124 9058          	sllw	y
3415  0126 72f901        	addw	y,(OFST-29,sp)
3416  0129 89            	pushw	x
3417  012a fe            	ldw	x,(x)
3418  012b 90ff          	ldw	(y),x
3419  012d 85            	popw	x
3420                     ; 157 				buf[j]=temp;
3422  012e 96            	ldw	x,sp
3423  012f 1c0009        	addw	x,#OFST-21
3424  0132 1f03          	ldw	(OFST-27,sp),x
3425  0134 1e07          	ldw	x,(OFST-23,sp)
3426  0136 58            	sllw	x
3427  0137 72fb03        	addw	x,(OFST-27,sp)
3428  013a 1605          	ldw	y,(OFST-25,sp)
3429  013c ff            	ldw	(x),y
3430  013d               L7122:
3431                     ; 151 		for(j=i+1;j<READ_TIMES;j++)
3433  013d 1e07          	ldw	x,(OFST-23,sp)
3434  013f 1c0001        	addw	x,#1
3435  0142 1f07          	ldw	(OFST-23,sp),x
3436  0144               L3122:
3439  0144 1e07          	ldw	x,(OFST-23,sp)
3440  0146 a3000a        	cpw	x,#10
3441  0149 2594          	jrult	L7022
3442                     ; 149 	for(i=0;i<READ_TIMES-1; i++)//排序
3444  014b 1e1d          	ldw	x,(OFST-1,sp)
3445  014d 1c0001        	addw	x,#1
3446  0150 1f1d          	ldw	(OFST-1,sp),x
3449  0152 1e1d          	ldw	x,(OFST-1,sp)
3450  0154 a30009        	cpw	x,#9
3451  0157 2403cc00d8    	jrult	L1022
3452                     ; 161 	sum=0;
3454  015c 5f            	clrw	x
3455  015d 1f05          	ldw	(OFST-25,sp),x
3456                     ; 162 	for(i=LOST_VAL;i<READ_TIMES-LOST_VAL;i++)sum+=buf[i];
3458  015f ae0004        	ldw	x,#4
3459  0162 1f1d          	ldw	(OFST-1,sp),x
3460  0164               L1222:
3463  0164 96            	ldw	x,sp
3464  0165 1c0009        	addw	x,#OFST-21
3465  0168 1f03          	ldw	(OFST-27,sp),x
3466  016a 1e1d          	ldw	x,(OFST-1,sp)
3467  016c 58            	sllw	x
3468  016d 72fb03        	addw	x,(OFST-27,sp)
3469  0170 fe            	ldw	x,(x)
3470  0171 72fb05        	addw	x,(OFST-25,sp)
3471  0174 1f05          	ldw	(OFST-25,sp),x
3474  0176 1e1d          	ldw	x,(OFST-1,sp)
3475  0178 1c0001        	addw	x,#1
3476  017b 1f1d          	ldw	(OFST-1,sp),x
3479  017d 1e1d          	ldw	x,(OFST-1,sp)
3480  017f a30006        	cpw	x,#6
3481  0182 25e0          	jrult	L1222
3482                     ; 163 	temp=sum/(READ_TIMES-2*LOST_VAL);
3484  0184 1e05          	ldw	x,(OFST-25,sp)
3485  0186 54            	srlw	x
3486  0187 1f05          	ldw	(OFST-25,sp),x
3487                     ; 164 	return temp;   
3489  0189 1e05          	ldw	x,(OFST-25,sp)
3492  018b 5b1f          	addw	sp,#31
3493  018d 81            	ret
3557                     ; 174 unsigned char Read_ADS(unsigned int *x_ad,unsigned int *y_ad)
3557                     ; 175 {
3558                     	switch	.text
3559  018e               _Read_ADS:
3561  018e 89            	pushw	x
3562  018f 5204          	subw	sp,#4
3563       00000004      OFST:	set	4
3566                     ; 177 	xtemp=GetTouchADCEx(CMD_READ_X);    //有筛选的读取X轴AD转换结果
3568  0191 a6d0          	ld	a,#208
3569  0193 cd00aa        	call	_GetTouchADCEx
3571  0196 1f01          	ldw	(OFST-3,sp),x
3572                     ; 178 	ytemp=GetTouchADCEx(CMD_READ_Y);	    //有筛选的读取Y轴AD转换结果											   
3574  0198 a690          	ld	a,#144
3575  019a cd00aa        	call	_GetTouchADCEx
3577  019d 1f03          	ldw	(OFST-1,sp),x
3578                     ; 179 	if(xtemp<100||ytemp<100)
3580  019f 1e01          	ldw	x,(OFST-3,sp)
3581  01a1 a30064        	cpw	x,#100
3582  01a4 2507          	jrult	L3622
3584  01a6 1e03          	ldw	x,(OFST-1,sp)
3585  01a8 a30064        	cpw	x,#100
3586  01ab 2404          	jruge	L1622
3587  01ad               L3622:
3588                     ; 180         return 1;   //读数失败
3590  01ad a601          	ld	a,#1
3592  01af 200b          	jra	L42
3593  01b1               L1622:
3594                     ; 181 	*x_ad=xtemp;
3596  01b1 1e05          	ldw	x,(OFST+1,sp)
3597  01b3 1601          	ldw	y,(OFST-3,sp)
3598  01b5 ff            	ldw	(x),y
3599                     ; 182 	*y_ad=ytemp;        
3601  01b6 1e09          	ldw	x,(OFST+5,sp)
3602  01b8 1603          	ldw	y,(OFST-1,sp)
3603  01ba ff            	ldw	(x),y
3604                     ; 183 	return 0;//读数成功
3606  01bb 4f            	clr	a
3608  01bc               L42:
3610  01bc 5b06          	addw	sp,#6
3611  01be 81            	ret
3702                     ; 196 unsigned char Read_ADS2(unsigned long *x_ad,unsigned long *y_ad) 
3702                     ; 197 {
3703                     	switch	.text
3704  01bf               _Read_ADS2:
3706  01bf 89            	pushw	x
3707  01c0 5209          	subw	sp,#9
3708       00000009      OFST:	set	9
3711                     ; 202     res=Read_ADS(&x1,&y1);  // 第一次读取ADC值 
3713  01c2 96            	ldw	x,sp
3714  01c3 1c0004        	addw	x,#OFST-5
3715  01c6 89            	pushw	x
3716  01c7 96            	ldw	x,sp
3717  01c8 1c0004        	addw	x,#OFST-5
3718  01cb adc1          	call	_Read_ADS
3720  01cd 85            	popw	x
3721  01ce 6b01          	ld	(OFST-8,sp),a
3722                     ; 203     if(res==1)  return(1);	// 如果读数失败，返回1
3724  01d0 7b01          	ld	a,(OFST-8,sp)
3725  01d2 a101          	cp	a,#1
3726  01d4 2604          	jrne	L3332
3729  01d6 a601          	ld	a,#1
3731  01d8 2016          	jra	L03
3732  01da               L3332:
3733                     ; 204     res=Read_ADS(&x2,&y2);	// 第二次读取ADC值   
3735  01da 96            	ldw	x,sp
3736  01db 1c0008        	addw	x,#OFST-1
3737  01de 89            	pushw	x
3738  01df 96            	ldw	x,sp
3739  01e0 1c0008        	addw	x,#OFST-1
3740  01e3 ada9          	call	_Read_ADS
3742  01e5 85            	popw	x
3743  01e6 6b01          	ld	(OFST-8,sp),a
3744                     ; 205     if(res==1)  return(1);   	// 如果读数失败，返回1
3746  01e8 7b01          	ld	a,(OFST-8,sp)
3747  01ea a101          	cp	a,#1
3748  01ec 2605          	jrne	L5332
3751  01ee a601          	ld	a,#1
3753  01f0               L03:
3755  01f0 5b0b          	addw	sp,#11
3756  01f2 81            	ret
3757  01f3               L5332:
3758                     ; 206     if(((x2<=x1&&x1<x2+ERR_RANGE)||(x1<=x2&&x2<x1+ERR_RANGE))//前后两次采样在+-50内
3758                     ; 207         &&((y2<=y1&&y1<y2+ERR_RANGE)||(y1<=y2&&y2<y1+ERR_RANGE)))
3760  01f3 1e06          	ldw	x,(OFST-3,sp)
3761  01f5 1302          	cpw	x,(OFST-7,sp)
3762  01f7 2209          	jrugt	L3432
3764  01f9 1e06          	ldw	x,(OFST-3,sp)
3765  01fb 1c0032        	addw	x,#50
3766  01fe 1302          	cpw	x,(OFST-7,sp)
3767  0200 220f          	jrugt	L1432
3768  0202               L3432:
3770  0202 1e02          	ldw	x,(OFST-7,sp)
3771  0204 1306          	cpw	x,(OFST-3,sp)
3772  0206 2246          	jrugt	L7332
3774  0208 1e02          	ldw	x,(OFST-7,sp)
3775  020a 1c0032        	addw	x,#50
3776  020d 1306          	cpw	x,(OFST-3,sp)
3777  020f 233d          	jrule	L7332
3778  0211               L1432:
3780  0211 1e08          	ldw	x,(OFST-1,sp)
3781  0213 1304          	cpw	x,(OFST-5,sp)
3782  0215 2209          	jrugt	L7432
3784  0217 1e08          	ldw	x,(OFST-1,sp)
3785  0219 1c0032        	addw	x,#50
3786  021c 1304          	cpw	x,(OFST-5,sp)
3787  021e 220f          	jrugt	L5432
3788  0220               L7432:
3790  0220 1e04          	ldw	x,(OFST-5,sp)
3791  0222 1308          	cpw	x,(OFST-1,sp)
3792  0224 2228          	jrugt	L7332
3794  0226 1e04          	ldw	x,(OFST-5,sp)
3795  0228 1c0032        	addw	x,#50
3796  022b 1308          	cpw	x,(OFST-1,sp)
3797  022d 231f          	jrule	L7332
3798  022f               L5432:
3799                     ; 209         *x_ad=(x1+x2)/2;
3801  022f 1e02          	ldw	x,(OFST-7,sp)
3802  0231 72fb06        	addw	x,(OFST-3,sp)
3803  0234 54            	srlw	x
3804  0235 cd0000        	call	c_uitolx
3806  0238 1e0a          	ldw	x,(OFST+1,sp)
3807  023a cd0000        	call	c_rtol
3809                     ; 210         *y_ad=(y1+y2)/2;
3811  023d 1e04          	ldw	x,(OFST-5,sp)
3812  023f 72fb08        	addw	x,(OFST-1,sp)
3813  0242 54            	srlw	x
3814  0243 cd0000        	call	c_uitolx
3816  0246 1e0e          	ldw	x,(OFST+5,sp)
3817  0248 cd0000        	call	c_rtol
3819                     ; 211         return 0;	 // 正确读取，返回0
3821  024b 4f            	clr	a
3823  024c 20a2          	jra	L03
3824  024e               L7332:
3825                     ; 213     else return 1;	 // 前后不在+-50内，读数错误 
3827  024e a601          	ld	a,#1
3829  0250 209e          	jra	L03
3853                     .const:	section	.text
3854  0000               L43:
3855  0000 ffffb0c0      	dc.l	-20288
3856  0004               L63:
3857  0004 0000076c      	dc.l	1900
3858  0008               L04:
3859  0008 00000140      	dc.l	320
3860  000c               L24:
3861  000c 00004100      	dc.l	16640
3862                     ; 219 void convert_ad_to_xy(void)
3862                     ; 220 {
3863                     	switch	.text
3864  0252               _convert_ad_to_xy:
3868                     ; 228     touch_dot.x=(240*touch_dot.x_ad_val -2100*240)/ 1900;
3870  0252 ae0006        	ldw	x,#_touch_dot+4
3871  0255 cd0000        	call	c_ltor
3873  0258 a6f0          	ld	a,#240
3874  025a cd0000        	call	c_smul
3876  025d ae0000        	ldw	x,#L43
3877  0260 cd0000        	call	c_lsub
3879  0263 ae0004        	ldw	x,#L63
3880  0266 cd0000        	call	c_ludv
3882  0269 be02          	ldw	x,c_lreg+2
3883  026b bf02          	ldw	_touch_dot,x
3884                     ; 229     touch_dot.y=(320*touch_dot.y_ad_val -2100*320)/ 1900;
3886  026d ae000a        	ldw	x,#_touch_dot+8
3887  0270 cd0000        	call	c_ltor
3889  0273 ae0008        	ldw	x,#L04
3890  0276 cd0000        	call	c_lmul
3892  0279 ae000c        	ldw	x,#L24
3893  027c cd0000        	call	c_lsub
3895  027f ae0004        	ldw	x,#L63
3896  0282 cd0000        	call	c_ludv
3898  0285 be02          	ldw	x,c_lreg+2
3899  0287 bf04          	ldw	_touch_dot+2,x
3900                     ; 231 }
3903  0289 81            	ret
3929                     ; 236 unsigned char Read_Once(void)
3929                     ; 237 {
3930                     	switch	.text
3931  028a               _Read_Once:
3935                     ; 239 	if(Read_ADS2(&touch_dot.x_ad_val,&touch_dot.y_ad_val)==0)	// 如果读取数据成功
3937  028a ae000a        	ldw	x,#_touch_dot+8
3938  028d 89            	pushw	x
3939  028e ae0006        	ldw	x,#_touch_dot+4
3940  0291 cd01bf        	call	_Read_ADS2
3942  0294 85            	popw	x
3943  0295 4d            	tnz	a
3944  0296 2604          	jrne	L3732
3945                     ; 242 		convert_ad_to_xy();   // 把读到的ADC值转变成TFT坐标值
3947  0298 adb8          	call	_convert_ad_to_xy
3949                     ; 243 		return 0;	// 返回0，表示成功
3951  029a 4f            	clr	a
3954  029b 81            	ret
3955  029c               L3732:
3956                     ; 245 	else return 1;	// 如果读取数据失败，返回1表示失败
3958  029c a601          	ld	a,#1
3961  029e 81            	ret
3987                     ; 250 unsigned char Read_Continue(void)
3987                     ; 251 {
3988                     	switch	.text
3989  029f               _Read_Continue:
3993                     ; 253 	if(Read_ADS2( &touch_dot.x_ad_val,&touch_dot.y_ad_val )==0)	 // 如果读取数据成功
3995  029f ae000a        	ldw	x,#_touch_dot+8
3996  02a2 89            	pushw	x
3997  02a3 ae0006        	ldw	x,#_touch_dot+4
3998  02a6 cd01bf        	call	_Read_ADS2
4000  02a9 85            	popw	x
4001  02aa 4d            	tnz	a
4002  02ab 2604          	jrne	L7042
4003                     ; 255 		convert_ad_to_xy();   // 把读到的ADC值转变成TFT坐标值
4005  02ad ada3          	call	_convert_ad_to_xy
4007                     ; 256 		return 0;	   // 返回0，表示成功
4009  02af 4f            	clr	a
4012  02b0 81            	ret
4013  02b1               L7042:
4014                     ; 258 	else return 1;	   // 如果读取数据失败，返回1表示失败
4016  02b1 a601          	ld	a,#1
4019  02b3 81            	ret
4098                     	xdef	_GetTouchADCEx
4099                     	xdef	_TOUCH_WRITE_DATA
4100                     	xdef	_TOUCH_WRITE_COMMAND
4101                     	xdef	_TOUCH_WRITE_REG
4102                     	switch	.ubsct
4103  0000               _p_touch_dot:
4104  0000 0000          	ds.b	2
4105                     	xdef	_p_touch_dot
4106  0002               _touch_dot:
4107  0002 000000000000  	ds.b	13
4108                     	xdef	_touch_dot
4109                     	xdef	_convert_ad_to_xy
4110                     	xdef	_Read_Continue
4111                     	xdef	_Read_Once
4112                     	xdef	_Read_ADS2
4113                     	xdef	_Read_ADS
4114                     	xdef	_GetTouchADC
4115                     	xdef	_TOUCH_init
4116                     	xref	_SPI0_communication
4117                     	xref	_delay_us
4118                     	xref.b	c_lreg
4138                     	xref	c_lmul
4139                     	xref	c_ludv
4140                     	xref	c_lsub
4141                     	xref	c_smul
4142                     	xref	c_ltor
4143                     	xref	c_rtol
4144                     	xref	c_uitolx
4145                     	end
