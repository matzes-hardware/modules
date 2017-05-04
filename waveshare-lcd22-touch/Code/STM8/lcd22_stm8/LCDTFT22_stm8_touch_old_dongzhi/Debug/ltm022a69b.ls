   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2853                     ; 33 void SPI0_Init(void)
2853                     ; 34 {
2855                     	switch	.text
2856  0000               _SPI0_Init:
2860                     ; 37 	PC_DDR=0x7f;
2862  0000 357f500c      	mov	_PC_DDR,#127
2863                     ; 38 	PC_CR1=0XFF;
2865  0004 35ff500d      	mov	_PC_CR1,#255
2866                     ; 40 	PH_DDR=0xFf;
2868  0008 35ff5025      	mov	_PH_DDR,#255
2869                     ; 41 	PH_CR1=0XFF;
2871  000c 35ff5026      	mov	_PH_CR1,#255
2872                     ; 43 	SPI_CR1&=(~0x38);   //波特率
2874  0010 c65200        	ld	a,_SPI_CR1
2875  0013 a4c7          	and	a,#199
2876  0015 c75200        	ld	_SPI_CR1,a
2877                     ; 45 	SPI_CR1|=0x03;   //时钟格式
2879  0018 c65200        	ld	a,_SPI_CR1
2880  001b aa03          	or	a,#3
2881  001d c75200        	ld	_SPI_CR1,a
2882                     ; 48 	SPI_CR2|=0x03;   //配置NSS脚为1
2884  0020 c65201        	ld	a,_SPI_CR2
2885  0023 aa03          	or	a,#3
2886  0025 c75201        	ld	_SPI_CR2,a
2887                     ; 49 	SPI_CR1|=0x04;   //配置为主设备
2889  0028 72145200      	bset	_SPI_CR1,#2
2890                     ; 50 	SPI_CR1|=0x40;   //开启SPI
2892  002c 721c5200      	bset	_SPI_CR1,#6
2893                     ; 55 }
2896  0030 81            	ret
2932                     ; 61 unsigned char SPI0_communication(unsigned char send_char)
2932                     ; 62 {
2933                     	switch	.text
2934  0031               _SPI0_communication:
2938                     ; 64 	SPI_DR = send_char;               //启动数据传输
2940  0031 c75204        	ld	_SPI_DR,a
2942  0034               L3402:
2943                     ; 65 	while(!(SPI_SR & 0x01));    //等待传输结束
2945  0034 c65203        	ld	a,_SPI_SR
2946  0037 a501          	bcp	a,#1
2947  0039 27f9          	jreq	L3402
2948                     ; 66 	return SPI_DR;
2950  003b c65204        	ld	a,_SPI_DR
2953  003e 81            	ret
2999                     ; 72 void LCD_WRITE_REG(unsigned int index)
2999                     ; 73 {
3000                     	switch	.text
3001  003f               _LCD_WRITE_REG:
3003  003f 89            	pushw	x
3004  0040 89            	pushw	x
3005       00000002      OFST:	set	2
3008                     ; 75 	LCD_RS_L();
3010  0041 72195014      	bres	_PE_ODR,#4
3011                     ; 76 	LCD_CS_L();
3014  0045 72155023      	bres	_PH_ODR,#2
3015                     ; 77 	value_index=index;
3018  0049 1f01          	ldw	(OFST-1,sp),x
3019                     ; 78 	value_index =value_index>>8;
3021  004b 7b01          	ld	a,(OFST-1,sp)
3022  004d 6b02          	ld	(OFST+0,sp),a
3023  004f 0f01          	clr	(OFST-1,sp)
3024                     ; 79     SPI0_communication((unsigned char)(value_index));    //00000000 000000000
3026  0051 7b02          	ld	a,(OFST+0,sp)
3027  0053 addc          	call	_SPI0_communication
3029                     ; 81 	value_index=index;
3031  0055 1e03          	ldw	x,(OFST+1,sp)
3032  0057 1f01          	ldw	(OFST-1,sp),x
3033                     ; 82 	value_index &=0x00ff;
3035  0059 0f01          	clr	(OFST-1,sp)
3036                     ; 83     SPI0_communication((unsigned char)(index));
3038  005b 7b04          	ld	a,(OFST+2,sp)
3039  005d add2          	call	_SPI0_communication
3041                     ; 84 	LCD_CS_H();
3043  005f 72145023      	bset	_PH_ODR,#2
3044                     ; 85 	LCD_RS_H();
3047  0063 72185014      	bset	_PE_ODR,#4
3048                     ; 86 }
3052  0067 5b04          	addw	sp,#4
3053  0069 81            	ret
3099                     ; 96 void LCD_SEND_COMMAND(unsigned int index,unsigned int data)
3099                     ; 97 {
3100                     	switch	.text
3101  006a               _LCD_SEND_COMMAND:
3103  006a 89            	pushw	x
3104       00000000      OFST:	set	0
3107                     ; 99 	LCD_RS_L();
3109  006b 72195014      	bres	_PE_ODR,#4
3110                     ; 100 	LCD_CS_L();
3113  006f 72155023      	bres	_PH_ODR,#2
3114                     ; 101     SPI0_communication((unsigned char)(index>>8));    //00000000 000000000
3117  0073 9e            	ld	a,xh
3118  0074 adbb          	call	_SPI0_communication
3120                     ; 102     SPI0_communication((unsigned char)(index));
3122  0076 7b02          	ld	a,(OFST+2,sp)
3123  0078 adb7          	call	_SPI0_communication
3125                     ; 103 	LCD_CS_H();
3127  007a 72145023      	bset	_PH_ODR,#2
3128                     ; 105 	LCD_RS_H();
3131  007e 72185014      	bset	_PE_ODR,#4
3132                     ; 106 	LCD_CS_L();
3135  0082 72155023      	bres	_PH_ODR,#2
3136                     ; 107     SPI0_communication((unsigned char)(data>>8));    //00000000 000000000
3139  0086 7b05          	ld	a,(OFST+5,sp)
3140  0088 ada7          	call	_SPI0_communication
3142                     ; 108     SPI0_communication((unsigned char)(data));
3144  008a 7b06          	ld	a,(OFST+6,sp)
3145  008c ada3          	call	_SPI0_communication
3147                     ; 109 	LCD_CS_H();
3149  008e 72145023      	bset	_PH_ODR,#2
3150                     ; 110 }
3154  0092 85            	popw	x
3155  0093 81            	ret
3201                     ; 120 void LCD_WRITE_COMMAND(unsigned int index,unsigned int data)
3201                     ; 121 {
3202                     	switch	.text
3203  0094               _LCD_WRITE_COMMAND:
3205  0094 89            	pushw	x
3206       00000000      OFST:	set	0
3209                     ; 123 	LCD_RS_L();
3211  0095 72195014      	bres	_PE_ODR,#4
3212                     ; 124 	LCD_CS_L();
3215  0099 72155023      	bres	_PH_ODR,#2
3216                     ; 125     SPI0_communication((unsigned char)(index>>8));    //00000000 000000000
3219  009d 9e            	ld	a,xh
3220  009e ad91          	call	_SPI0_communication
3222                     ; 126     SPI0_communication((unsigned char)(index));
3224  00a0 7b02          	ld	a,(OFST+2,sp)
3225  00a2 ad8d          	call	_SPI0_communication
3227                     ; 127 	LCD_CS_H();
3229  00a4 72145023      	bset	_PH_ODR,#2
3230                     ; 129 	LCD_RS_H();
3233  00a8 72185014      	bset	_PE_ODR,#4
3234                     ; 131 	LCD_CS_L();
3237  00ac 72155023      	bres	_PH_ODR,#2
3238                     ; 132     SPI0_communication((unsigned char)(data>>8));    //00000000 000000000
3241  00b0 7b05          	ld	a,(OFST+5,sp)
3242  00b2 cd0031        	call	_SPI0_communication
3244                     ; 133     SPI0_communication((unsigned char)(data));
3246  00b5 7b06          	ld	a,(OFST+6,sp)
3247  00b7 cd0031        	call	_SPI0_communication
3249                     ; 134 	LCD_CS_H();
3251  00ba 72145023      	bset	_PH_ODR,#2
3252                     ; 135 }
3256  00be 85            	popw	x
3257  00bf 81            	ret
3292                     ; 144 void LCD_WRITE_DATA(unsigned int data)
3292                     ; 145 {
3293                     	switch	.text
3294  00c0               _LCD_WRITE_DATA:
3296  00c0 89            	pushw	x
3297       00000000      OFST:	set	0
3300                     ; 146     SPI0_communication((unsigned char)(data>>8));    //00000000 000000000
3302  00c1 9e            	ld	a,xh
3303  00c2 cd0031        	call	_SPI0_communication
3305                     ; 147     SPI0_communication((unsigned char)(data));
3307  00c5 7b02          	ld	a,(OFST+2,sp)
3308  00c7 cd0031        	call	_SPI0_communication
3310                     ; 148 }
3313  00ca 85            	popw	x
3314  00cb 81            	ret
3340                     ; 156 void lcd_ctrl_port_init()
3340                     ; 157 {
3341                     	switch	.text
3342  00cc               _lcd_ctrl_port_init:
3346                     ; 158 PE_DDR=0xff;
3348  00cc 35ff5016      	mov	_PE_DDR,#255
3349                     ; 159 PE_CR1=0xff;
3351  00d0 35ff5017      	mov	_PE_CR1,#255
3352                     ; 160 PE_CR2=0x00;
3354  00d4 725f5018      	clr	_PE_CR2
3355                     ; 163 }
3358  00d8 81            	ret
3387                     ; 171 void lcd_init(void)
3387                     ; 172 {
3388                     	switch	.text
3389  00d9               _lcd_init:
3393                     ; 173     lcd_ctrl_port_init();
3395  00d9 adf1          	call	_lcd_ctrl_port_init
3397                     ; 174     SPI0_Init();
3399  00db cd0000        	call	_SPI0_Init
3401                     ; 175 	LCD_RST_L();
3403  00de 72175014      	bres	_PE_ODR,#3
3404                     ; 178 	delay_us(500);
3407  00e2 ae01f4        	ldw	x,#500
3408  00e5 cd0000        	call	_delay_us
3410                     ; 179 	LCD_RST_H();
3412  00e8 72165014      	bset	_PE_ODR,#3
3413                     ; 181 	delay_us(500);
3416  00ec ae01f4        	ldw	x,#500
3417  00ef cd0000        	call	_delay_us
3419                     ; 184 	LCD_WRITE_COMMAND(0x0003,0x0001);	//Soft reset (reset pulse occurs by writing in "1")
3421  00f2 ae0001        	ldw	x,#1
3422  00f5 89            	pushw	x
3423  00f6 ae0003        	ldw	x,#3
3424  00f9 ad99          	call	_LCD_WRITE_COMMAND
3426  00fb 85            	popw	x
3427                     ; 187 	LCD_WRITE_COMMAND(0x003A,0x0001);	//Oscillator control (0:oscillator stop, 1: oscillator operation)
3429  00fc ae0001        	ldw	x,#1
3430  00ff 89            	pushw	x
3431  0100 ae003a        	ldw	x,#58
3432  0103 ad8f          	call	_LCD_WRITE_COMMAND
3434  0105 85            	popw	x
3435                     ; 188 	delay_us(100);
3437  0106 ae0064        	ldw	x,#100
3438  0109 cd0000        	call	_delay_us
3440                     ; 191 	LCD_WRITE_COMMAND(0x0024,0x007B);	//amplitude setting
3442  010c ae007b        	ldw	x,#123
3443  010f 89            	pushw	x
3444  0110 ae0024        	ldw	x,#36
3445  0113 cd0094        	call	_LCD_WRITE_COMMAND
3447  0116 85            	popw	x
3448                     ; 192 	delay_us(10);
3450  0117 ae000a        	ldw	x,#10
3451  011a cd0000        	call	_delay_us
3453                     ; 193 	LCD_WRITE_COMMAND(0x0025,0x003B);	//amplitude setting	
3455  011d ae003b        	ldw	x,#59
3456  0120 89            	pushw	x
3457  0121 ae0025        	ldw	x,#37
3458  0124 cd0094        	call	_LCD_WRITE_COMMAND
3460  0127 85            	popw	x
3461                     ; 194 	LCD_WRITE_COMMAND(0x0026,0x0034);	//amplitude setting
3463  0128 ae0034        	ldw	x,#52
3464  012b 89            	pushw	x
3465  012c ae0026        	ldw	x,#38
3466  012f cd0094        	call	_LCD_WRITE_COMMAND
3468  0132 85            	popw	x
3469                     ; 195 	delay_us(10);
3471  0133 ae000a        	ldw	x,#10
3472  0136 cd0000        	call	_delay_us
3474                     ; 196 	LCD_WRITE_COMMAND(0x0027,0x0004);	//amplitude setting	
3476  0139 ae0004        	ldw	x,#4
3477  013c 89            	pushw	x
3478  013d ae0027        	ldw	x,#39
3479  0140 cd0094        	call	_LCD_WRITE_COMMAND
3481  0143 85            	popw	x
3482                     ; 197 	LCD_WRITE_COMMAND(0x0052,0x0025);	//circuit setting 1
3484  0144 ae0025        	ldw	x,#37
3485  0147 89            	pushw	x
3486  0148 ae0052        	ldw	x,#82
3487  014b cd0094        	call	_LCD_WRITE_COMMAND
3489  014e 85            	popw	x
3490                     ; 198 	delay_us(10);
3492  014f ae000a        	ldw	x,#10
3493  0152 cd0000        	call	_delay_us
3495                     ; 199 	LCD_WRITE_COMMAND(0x0053,0x0033);	//circuit setting 2	
3497  0155 ae0033        	ldw	x,#51
3498  0158 89            	pushw	x
3499  0159 ae0053        	ldw	x,#83
3500  015c cd0094        	call	_LCD_WRITE_COMMAND
3502  015f 85            	popw	x
3503                     ; 200 	LCD_WRITE_COMMAND(0x0061,0x001C);	//adjustment V10 positive polarity
3505  0160 ae001c        	ldw	x,#28
3506  0163 89            	pushw	x
3507  0164 ae0061        	ldw	x,#97
3508  0167 cd0094        	call	_LCD_WRITE_COMMAND
3510  016a 85            	popw	x
3511                     ; 201 	delay_us(10);
3513  016b ae000a        	ldw	x,#10
3514  016e cd0000        	call	_delay_us
3516                     ; 202 	LCD_WRITE_COMMAND(0x0062,0x002C);	//adjustment V9 negative polarity
3518  0171 ae002c        	ldw	x,#44
3519  0174 89            	pushw	x
3520  0175 ae0062        	ldw	x,#98
3521  0178 cd0094        	call	_LCD_WRITE_COMMAND
3523  017b 85            	popw	x
3524                     ; 203 	LCD_WRITE_COMMAND(0x0063,0x0022);	//adjustment V34 positive polarity
3526  017c ae0022        	ldw	x,#34
3527  017f 89            	pushw	x
3528  0180 ae0063        	ldw	x,#99
3529  0183 cd0094        	call	_LCD_WRITE_COMMAND
3531  0186 85            	popw	x
3532                     ; 204 	delay_us(10);
3534  0187 ae000a        	ldw	x,#10
3535  018a cd0000        	call	_delay_us
3537                     ; 205 	LCD_WRITE_COMMAND(0x0064,0x0027);	//adjustment V31 negative polarity
3539  018d ae0027        	ldw	x,#39
3540  0190 89            	pushw	x
3541  0191 ae0064        	ldw	x,#100
3542  0194 cd0094        	call	_LCD_WRITE_COMMAND
3544  0197 85            	popw	x
3545                     ; 206 	delay_us(10);
3547  0198 ae000a        	ldw	x,#10
3548  019b cd0000        	call	_delay_us
3550                     ; 207 	LCD_WRITE_COMMAND(0x0065,0x0014);	//adjustment V61 negative polarity
3552  019e ae0014        	ldw	x,#20
3553  01a1 89            	pushw	x
3554  01a2 ae0065        	ldw	x,#101
3555  01a5 cd0094        	call	_LCD_WRITE_COMMAND
3557  01a8 85            	popw	x
3558                     ; 208 	delay_us(10);
3560  01a9 ae000a        	ldw	x,#10
3561  01ac cd0000        	call	_delay_us
3563                     ; 209 	LCD_WRITE_COMMAND(0x0066,0x0010);	//adjustment V61 negative polarity
3565  01af ae0010        	ldw	x,#16
3566  01b2 89            	pushw	x
3567  01b3 ae0066        	ldw	x,#102
3568  01b6 cd0094        	call	_LCD_WRITE_COMMAND
3570  01b9 85            	popw	x
3571                     ; 212 	LCD_WRITE_COMMAND(0x002E,0x002D);
3573  01ba ae002d        	ldw	x,#45
3574  01bd 89            	pushw	x
3575  01be ae002e        	ldw	x,#46
3576  01c1 cd0094        	call	_LCD_WRITE_COMMAND
3578  01c4 85            	popw	x
3579                     ; 215 	LCD_WRITE_COMMAND(0x0019,0x0000);	//DC/DC output setting
3581  01c5 5f            	clrw	x
3582  01c6 89            	pushw	x
3583  01c7 ae0019        	ldw	x,#25
3584  01ca cd0094        	call	_LCD_WRITE_COMMAND
3586  01cd 85            	popw	x
3587                     ; 216 	delay_us(200);
3589  01ce ae00c8        	ldw	x,#200
3590  01d1 cd0000        	call	_delay_us
3592                     ; 217 	LCD_WRITE_COMMAND(0x001A,0x1000);	//DC/DC frequency setting
3594  01d4 ae1000        	ldw	x,#4096
3595  01d7 89            	pushw	x
3596  01d8 ae001a        	ldw	x,#26
3597  01db cd0094        	call	_LCD_WRITE_COMMAND
3599  01de 85            	popw	x
3600                     ; 218 	LCD_WRITE_COMMAND(0x001B,0x0023);	//DC/DC rising setting
3602  01df ae0023        	ldw	x,#35
3603  01e2 89            	pushw	x
3604  01e3 ae001b        	ldw	x,#27
3605  01e6 cd0094        	call	_LCD_WRITE_COMMAND
3607  01e9 85            	popw	x
3608                     ; 219 	LCD_WRITE_COMMAND(0x001C,0x0C01);	//Regulator voltage setting
3610  01ea ae0c01        	ldw	x,#3073
3611  01ed 89            	pushw	x
3612  01ee ae001c        	ldw	x,#28
3613  01f1 cd0094        	call	_LCD_WRITE_COMMAND
3615  01f4 85            	popw	x
3616                     ; 220 	LCD_WRITE_COMMAND(0x001D,0x0000);	//Regulator current setting
3618  01f5 5f            	clrw	x
3619  01f6 89            	pushw	x
3620  01f7 ae001d        	ldw	x,#29
3621  01fa cd0094        	call	_LCD_WRITE_COMMAND
3623  01fd 85            	popw	x
3624                     ; 221 	LCD_WRITE_COMMAND(0x001E,0x0009);	//VCOM output setting
3626  01fe ae0009        	ldw	x,#9
3627  0201 89            	pushw	x
3628  0202 ae001e        	ldw	x,#30
3629  0205 cd0094        	call	_LCD_WRITE_COMMAND
3631  0208 85            	popw	x
3632                     ; 222 	LCD_WRITE_COMMAND(0x001F,0x0035);	//VCOM amplitude setting	
3634  0209 ae0035        	ldw	x,#53
3635  020c 89            	pushw	x
3636  020d ae001f        	ldw	x,#31
3637  0210 cd0094        	call	_LCD_WRITE_COMMAND
3639  0213 85            	popw	x
3640                     ; 223 	LCD_WRITE_COMMAND(0x0020,0x0015);	//VCOMM cencter setting	
3642  0214 ae0015        	ldw	x,#21
3643  0217 89            	pushw	x
3644  0218 ae0020        	ldw	x,#32
3645  021b cd0094        	call	_LCD_WRITE_COMMAND
3647  021e 85            	popw	x
3648                     ; 224 	LCD_WRITE_COMMAND(0x0018,0x1E7B);	//DC/DC operation setting
3650  021f ae1e7b        	ldw	x,#7803
3651  0222 89            	pushw	x
3652  0223 ae0018        	ldw	x,#24
3653  0226 cd0094        	call	_LCD_WRITE_COMMAND
3655  0229 85            	popw	x
3656                     ; 227 	LCD_WRITE_COMMAND(0x0008,0x0000);	//Minimum X address in window access mode
3658  022a 5f            	clrw	x
3659  022b 89            	pushw	x
3660  022c ae0008        	ldw	x,#8
3661  022f cd0094        	call	_LCD_WRITE_COMMAND
3663  0232 85            	popw	x
3664                     ; 228 	LCD_WRITE_COMMAND(0x0009,0x00EF);	//Maximum X address in window access mode
3666  0233 ae00ef        	ldw	x,#239
3667  0236 89            	pushw	x
3668  0237 ae0009        	ldw	x,#9
3669  023a cd0094        	call	_LCD_WRITE_COMMAND
3671  023d 85            	popw	x
3672                     ; 229 	LCD_WRITE_COMMAND(0x000a,0x0000);	//Minimum Y address in window access mode
3674  023e 5f            	clrw	x
3675  023f 89            	pushw	x
3676  0240 ae000a        	ldw	x,#10
3677  0243 cd0094        	call	_LCD_WRITE_COMMAND
3679  0246 85            	popw	x
3680                     ; 230 	LCD_WRITE_COMMAND(0x000b,0x013F);	//Maximum Y address in window access mode
3682  0247 ae013f        	ldw	x,#319
3683  024a 89            	pushw	x
3684  024b ae000b        	ldw	x,#11
3685  024e cd0094        	call	_LCD_WRITE_COMMAND
3687  0251 85            	popw	x
3688                     ; 233 	LCD_WRITE_COMMAND(0x0029,0x0000);	//[LCDSIZE]  X MIN. size set
3690  0252 5f            	clrw	x
3691  0253 89            	pushw	x
3692  0254 ae0029        	ldw	x,#41
3693  0257 cd0094        	call	_LCD_WRITE_COMMAND
3695  025a 85            	popw	x
3696                     ; 234 	LCD_WRITE_COMMAND(0x002A,0x0000);	//[LCDSIZE]  Y MIN. size set
3698  025b 5f            	clrw	x
3699  025c 89            	pushw	x
3700  025d ae002a        	ldw	x,#42
3701  0260 cd0094        	call	_LCD_WRITE_COMMAND
3703  0263 85            	popw	x
3704                     ; 235 	LCD_WRITE_COMMAND(0x002B,0x00EF);	//[LCDSIZE]  X MAX. size set
3706  0264 ae00ef        	ldw	x,#239
3707  0267 89            	pushw	x
3708  0268 ae002b        	ldw	x,#43
3709  026b cd0094        	call	_LCD_WRITE_COMMAND
3711  026e 85            	popw	x
3712                     ; 236 	LCD_WRITE_COMMAND(0x002C,0x013F);	//[LCDSIZE]  Y MAX. size set	
3714  026f ae013f        	ldw	x,#319
3715  0272 89            	pushw	x
3716  0273 ae002c        	ldw	x,#44
3717  0276 cd0094        	call	_LCD_WRITE_COMMAND
3719  0279 85            	popw	x
3720                     ; 239 	LCD_WRITE_COMMAND(0x0032,0x0002);
3722  027a ae0002        	ldw	x,#2
3723  027d 89            	pushw	x
3724  027e ae0032        	ldw	x,#50
3725  0281 cd0094        	call	_LCD_WRITE_COMMAND
3727  0284 85            	popw	x
3728                     ; 242 	LCD_WRITE_COMMAND(0x0033,0x0000);
3730  0285 5f            	clrw	x
3731  0286 89            	pushw	x
3732  0287 ae0033        	ldw	x,#51
3733  028a cd0094        	call	_LCD_WRITE_COMMAND
3735  028d 85            	popw	x
3736                     ; 245 	LCD_WRITE_COMMAND(0x0037,0x0000);
3738  028e 5f            	clrw	x
3739  028f 89            	pushw	x
3740  0290 ae0037        	ldw	x,#55
3741  0293 cd0094        	call	_LCD_WRITE_COMMAND
3743  0296 85            	popw	x
3744                     ; 248 	LCD_WRITE_COMMAND(0x003B,0x0001);
3746  0297 ae0001        	ldw	x,#1
3747  029a 89            	pushw	x
3748  029b ae003b        	ldw	x,#59
3749  029e cd0094        	call	_LCD_WRITE_COMMAND
3751  02a1 85            	popw	x
3752                     ; 251 	LCD_WRITE_COMMAND(0x0004,0x0000);	//GS = 0: 260-k color (64 gray scale), GS = 1: 8 color (2 gray scale)
3754  02a2 5f            	clrw	x
3755  02a3 89            	pushw	x
3756  02a4 ae0004        	ldw	x,#4
3757  02a7 cd0094        	call	_LCD_WRITE_COMMAND
3759  02aa 85            	popw	x
3760                     ; 254 	LCD_WRITE_COMMAND(0x0005,0x0010);	//Window access control (0: Normal access, 1: Window access)
3762  02ab ae0010        	ldw	x,#16
3763  02ae 89            	pushw	x
3764  02af ae0005        	ldw	x,#5
3765  02b2 cd0094        	call	_LCD_WRITE_COMMAND
3767  02b5 85            	popw	x
3768                     ; 257 	LCD_WRITE_COMMAND(0x0001,0x0000);
3770  02b6 5f            	clrw	x
3771  02b7 89            	pushw	x
3772  02b8 ae0001        	ldw	x,#1
3773  02bb cd0094        	call	_LCD_WRITE_COMMAND
3775  02be 85            	popw	x
3776                     ; 260 	LCD_WRITE_COMMAND(0x0000,0x0000);	//display on
3778  02bf 5f            	clrw	x
3779  02c0 89            	pushw	x
3780  02c1 5f            	clrw	x
3781  02c2 cd0094        	call	_LCD_WRITE_COMMAND
3783  02c5 85            	popw	x
3784                     ; 262 	delay_us(20);
3786  02c6 ae0014        	ldw	x,#20
3787  02c9 cd0000        	call	_delay_us
3789                     ; 264 	lcd_clear_screen(0XFF);
3791  02cc ae00ff        	ldw	x,#255
3792  02cf ad01          	call	_lcd_clear_screen
3794                     ; 265 }
3797  02d1 81            	ret
3854                     ; 276 void lcd_clear_screen(unsigned int color_background)
3854                     ; 277 {
3855                     	switch	.text
3856  02d2               _lcd_clear_screen:
3858  02d2 89            	pushw	x
3859  02d3 5204          	subw	sp,#4
3860       00000004      OFST:	set	4
3863                     ; 280 	LCD_WRITE_COMMAND(0x08,0x00);
3865  02d5 5f            	clrw	x
3866  02d6 89            	pushw	x
3867  02d7 ae0008        	ldw	x,#8
3868  02da cd0094        	call	_LCD_WRITE_COMMAND
3870  02dd 85            	popw	x
3871                     ; 281 	LCD_WRITE_COMMAND(0x0a,0x0000);
3873  02de 5f            	clrw	x
3874  02df 89            	pushw	x
3875  02e0 ae000a        	ldw	x,#10
3876  02e3 cd0094        	call	_LCD_WRITE_COMMAND
3878  02e6 85            	popw	x
3879                     ; 282 	LCD_WRITE_COMMAND(0x09,0xEF);
3881  02e7 ae00ef        	ldw	x,#239
3882  02ea 89            	pushw	x
3883  02eb ae0009        	ldw	x,#9
3884  02ee cd0094        	call	_LCD_WRITE_COMMAND
3886  02f1 85            	popw	x
3887                     ; 283 	LCD_WRITE_COMMAND(0x0b,0x013F);
3889  02f2 ae013f        	ldw	x,#319
3890  02f5 89            	pushw	x
3891  02f6 ae000b        	ldw	x,#11
3892  02f9 cd0094        	call	_LCD_WRITE_COMMAND
3894  02fc 85            	popw	x
3895                     ; 285 	LCD_WRITE_COMMAND(0x06,0x0000);
3897  02fd 5f            	clrw	x
3898  02fe 89            	pushw	x
3899  02ff ae0006        	ldw	x,#6
3900  0302 cd0094        	call	_LCD_WRITE_COMMAND
3902  0305 85            	popw	x
3903                     ; 286 	LCD_WRITE_COMMAND(0x07,0x0000);
3905  0306 5f            	clrw	x
3906  0307 89            	pushw	x
3907  0308 ae0007        	ldw	x,#7
3908  030b cd0094        	call	_LCD_WRITE_COMMAND
3910  030e 85            	popw	x
3911                     ; 288 	LCD_WRITE_REG(0x0E);	//RAM Write index
3913  030f ae000e        	ldw	x,#14
3914  0312 cd003f        	call	_LCD_WRITE_REG
3916                     ; 290 	LCD_CS_L();
3918  0315 72155023      	bres	_PH_ODR,#2
3919                     ; 291 	LCD_RS_H();
3922  0319 72185014      	bset	_PE_ODR,#4
3923                     ; 293 	for(i=0;i<320;i++)
3926  031d 5f            	clrw	x
3927  031e 1f01          	ldw	(OFST-3,sp),x
3928  0320               L1222:
3929                     ; 295 		for(j=0;j<240;j++)
3931  0320 5f            	clrw	x
3932  0321 1f03          	ldw	(OFST-1,sp),x
3933  0323               L7222:
3934                     ; 297 		  LCD_WRITE_DATA( color_background );
3936  0323 1e05          	ldw	x,(OFST+1,sp)
3937  0325 cd00c0        	call	_LCD_WRITE_DATA
3939                     ; 295 		for(j=0;j<240;j++)
3941  0328 1e03          	ldw	x,(OFST-1,sp)
3942  032a 1c0001        	addw	x,#1
3943  032d 1f03          	ldw	(OFST-1,sp),x
3946  032f 1e03          	ldw	x,(OFST-1,sp)
3947  0331 a300f0        	cpw	x,#240
3948  0334 25ed          	jrult	L7222
3949                     ; 293 	for(i=0;i<320;i++)
3951  0336 1e01          	ldw	x,(OFST-3,sp)
3952  0338 1c0001        	addw	x,#1
3953  033b 1f01          	ldw	(OFST-3,sp),x
3956  033d 1e01          	ldw	x,(OFST-3,sp)
3957  033f a30140        	cpw	x,#320
3958  0342 25dc          	jrult	L1222
3959                     ; 300 	LCD_RS_L();
3961  0344 72195014      	bres	_PE_ODR,#4
3962                     ; 301 	LCD_CS_H();
3965  0348 72145023      	bset	_PH_ODR,#2
3966                     ; 302 }
3970  034c 5b06          	addw	sp,#6
3971  034e 81            	ret
4064                     ; 315 void lcd_clear_area(unsigned int color_front, 
4064                     ; 316                     unsigned char x, 
4064                     ; 317                     unsigned int y, 
4064                     ; 318                     unsigned int width, 
4064                     ; 319                     unsigned height)
4064                     ; 320 {
4065                     	switch	.text
4066  034f               _lcd_clear_area:
4068  034f 89            	pushw	x
4069  0350 5204          	subw	sp,#4
4070       00000004      OFST:	set	4
4073                     ; 323 	LCD_WRITE_COMMAND( 0x08, x ); 	//x start point
4075  0352 7b09          	ld	a,(OFST+5,sp)
4076  0354 5f            	clrw	x
4077  0355 97            	ld	xl,a
4078  0356 89            	pushw	x
4079  0357 ae0008        	ldw	x,#8
4080  035a cd0094        	call	_LCD_WRITE_COMMAND
4082  035d 85            	popw	x
4083                     ; 324 	LCD_WRITE_COMMAND( 0x0a, y ); 	//y start point
4085  035e 1e0a          	ldw	x,(OFST+6,sp)
4086  0360 89            	pushw	x
4087  0361 ae000a        	ldw	x,#10
4088  0364 cd0094        	call	_LCD_WRITE_COMMAND
4090  0367 85            	popw	x
4091                     ; 325 	LCD_WRITE_COMMAND( 0x09, x + width - 1 );	//x end point
4093  0368 7b09          	ld	a,(OFST+5,sp)
4094  036a 5f            	clrw	x
4095  036b 97            	ld	xl,a
4096  036c 72fb0c        	addw	x,(OFST+8,sp)
4097  036f 5a            	decw	x
4098  0370 89            	pushw	x
4099  0371 ae0009        	ldw	x,#9
4100  0374 cd0094        	call	_LCD_WRITE_COMMAND
4102  0377 85            	popw	x
4103                     ; 326 	LCD_WRITE_COMMAND( 0x0b, y + height - 1 );	//y end point
4105  0378 1e0a          	ldw	x,(OFST+6,sp)
4106  037a 72fb0e        	addw	x,(OFST+10,sp)
4107  037d 5a            	decw	x
4108  037e 89            	pushw	x
4109  037f ae000b        	ldw	x,#11
4110  0382 cd0094        	call	_LCD_WRITE_COMMAND
4112  0385 85            	popw	x
4113                     ; 328 	LCD_WRITE_COMMAND( 0x06, x );
4115  0386 7b09          	ld	a,(OFST+5,sp)
4116  0388 5f            	clrw	x
4117  0389 97            	ld	xl,a
4118  038a 89            	pushw	x
4119  038b ae0006        	ldw	x,#6
4120  038e cd0094        	call	_LCD_WRITE_COMMAND
4122  0391 85            	popw	x
4123                     ; 329 	LCD_WRITE_COMMAND( 0x07, y );
4125  0392 1e0a          	ldw	x,(OFST+6,sp)
4126  0394 89            	pushw	x
4127  0395 ae0007        	ldw	x,#7
4128  0398 cd0094        	call	_LCD_WRITE_COMMAND
4130  039b 85            	popw	x
4131                     ; 331 	LCD_WRITE_REG( 0x0E );
4133  039c ae000e        	ldw	x,#14
4134  039f cd003f        	call	_LCD_WRITE_REG
4136                     ; 333 	LCD_CS_L();
4138  03a2 72155023      	bres	_PH_ODR,#2
4139                     ; 334 	LCD_RS_H();
4142  03a6 72185014      	bset	_PE_ODR,#4
4143                     ; 336 	for( i = 0; i < height; i++ )
4146  03aa 5f            	clrw	x
4147  03ab 1f01          	ldw	(OFST-3,sp),x
4149  03ad 201e          	jra	L7032
4150  03af               L3032:
4151                     ; 338 		for( j = 0; j < width; j++ )
4153  03af 5f            	clrw	x
4154  03b0 1f03          	ldw	(OFST-1,sp),x
4156  03b2 200c          	jra	L7132
4157  03b4               L3132:
4158                     ; 340 			LCD_WRITE_DATA( color_front );
4160  03b4 1e05          	ldw	x,(OFST+1,sp)
4161  03b6 cd00c0        	call	_LCD_WRITE_DATA
4163                     ; 338 		for( j = 0; j < width; j++ )
4165  03b9 1e03          	ldw	x,(OFST-1,sp)
4166  03bb 1c0001        	addw	x,#1
4167  03be 1f03          	ldw	(OFST-1,sp),x
4168  03c0               L7132:
4171  03c0 1e03          	ldw	x,(OFST-1,sp)
4172  03c2 130c          	cpw	x,(OFST+8,sp)
4173  03c4 25ee          	jrult	L3132
4174                     ; 336 	for( i = 0; i < height; i++ )
4176  03c6 1e01          	ldw	x,(OFST-3,sp)
4177  03c8 1c0001        	addw	x,#1
4178  03cb 1f01          	ldw	(OFST-3,sp),x
4179  03cd               L7032:
4182  03cd 1e01          	ldw	x,(OFST-3,sp)
4183  03cf 130e          	cpw	x,(OFST+10,sp)
4184  03d1 25dc          	jrult	L3032
4185                     ; 344 	LCD_CS_H();
4187  03d3 72145023      	bset	_PH_ODR,#2
4188                     ; 345 }
4192  03d7 5b06          	addw	sp,#6
4193  03d9 81            	ret
4237                     ; 354 void lcd_set_cursor(unsigned char x, unsigned int y)
4237                     ; 355 {
4238                     	switch	.text
4239  03da               _lcd_set_cursor:
4241  03da 88            	push	a
4242       00000000      OFST:	set	0
4245                     ; 356   	if( (x > 320) || (y > 240) )
4247  03db 1e04          	ldw	x,(OFST+4,sp)
4248  03dd a300f1        	cpw	x,#241
4249  03e0 2502          	jrult	L5432
4250                     ; 358 		return;
4253  03e2 84            	pop	a
4254  03e3 81            	ret
4255  03e4               L5432:
4256                     ; 360 	LCD_WRITE_COMMAND( 0x06, x );
4258  03e4 7b01          	ld	a,(OFST+1,sp)
4259  03e6 5f            	clrw	x
4260  03e7 97            	ld	xl,a
4261  03e8 89            	pushw	x
4262  03e9 ae0006        	ldw	x,#6
4263  03ec cd0094        	call	_LCD_WRITE_COMMAND
4265  03ef 85            	popw	x
4266                     ; 361 	LCD_WRITE_COMMAND( 0x07, y );
4268  03f0 1e04          	ldw	x,(OFST+4,sp)
4269  03f2 89            	pushw	x
4270  03f3 ae0007        	ldw	x,#7
4271  03f6 cd0094        	call	_LCD_WRITE_COMMAND
4273  03f9 85            	popw	x
4274                     ; 362 }
4277  03fa 84            	pop	a
4278  03fb 81            	ret
4391                     ; 372 void lcd_display_char(  unsigned char ch_asc, 
4391                     ; 373                         unsigned int color_front,
4391                     ; 374                         unsigned int color_background, 
4391                     ; 375                         unsigned char postion_x, 
4391                     ; 376                         unsigned char postion_y)
4391                     ; 377 {
4392                     	switch	.text
4393  03fc               _lcd_display_char:
4395  03fc 88            	push	a
4396  03fd 5205          	subw	sp,#5
4397       00000005      OFST:	set	5
4400                     ; 379 	const unsigned char *p = 0;
4402  03ff 1e01          	ldw	x,(OFST-4,sp)
4403                     ; 381 	LCD_WRITE_COMMAND(0x08,postion_x*8); 	//x start point
4405  0401 7b0d          	ld	a,(OFST+8,sp)
4406  0403 97            	ld	xl,a
4407  0404 a608          	ld	a,#8
4408  0406 42            	mul	x,a
4409  0407 89            	pushw	x
4410  0408 ae0008        	ldw	x,#8
4411  040b cd0094        	call	_LCD_WRITE_COMMAND
4413  040e 85            	popw	x
4414                     ; 382 	LCD_WRITE_COMMAND(0x0a,postion_y*16); 	//y start point
4416  040f 7b0e          	ld	a,(OFST+9,sp)
4417  0411 97            	ld	xl,a
4418  0412 a610          	ld	a,#16
4419  0414 42            	mul	x,a
4420  0415 89            	pushw	x
4421  0416 ae000a        	ldw	x,#10
4422  0419 cd0094        	call	_LCD_WRITE_COMMAND
4424  041c 85            	popw	x
4425                     ; 383 	LCD_WRITE_COMMAND(0x09,postion_x*8+7);	//x end point
4427  041d 7b0d          	ld	a,(OFST+8,sp)
4428  041f 97            	ld	xl,a
4429  0420 a608          	ld	a,#8
4430  0422 42            	mul	x,a
4431  0423 1c0007        	addw	x,#7
4432  0426 89            	pushw	x
4433  0427 ae0009        	ldw	x,#9
4434  042a cd0094        	call	_LCD_WRITE_COMMAND
4436  042d 85            	popw	x
4437                     ; 384 	LCD_WRITE_COMMAND(0x0b,postion_y*16+15);	//y end point
4439  042e 7b0e          	ld	a,(OFST+9,sp)
4440  0430 97            	ld	xl,a
4441  0431 a610          	ld	a,#16
4442  0433 42            	mul	x,a
4443  0434 1c000f        	addw	x,#15
4444  0437 89            	pushw	x
4445  0438 ae000b        	ldw	x,#11
4446  043b cd0094        	call	_LCD_WRITE_COMMAND
4448  043e 85            	popw	x
4449                     ; 386 	LCD_WRITE_COMMAND(0x06,postion_x*8);	//RAM X address(0 ~ FF, actually 0 ~ EF)	
4451  043f 7b0d          	ld	a,(OFST+8,sp)
4452  0441 97            	ld	xl,a
4453  0442 a608          	ld	a,#8
4454  0444 42            	mul	x,a
4455  0445 89            	pushw	x
4456  0446 ae0006        	ldw	x,#6
4457  0449 cd0094        	call	_LCD_WRITE_COMMAND
4459  044c 85            	popw	x
4460                     ; 387 	LCD_WRITE_COMMAND(0x07,postion_y*16);	//RAM Y address(0 ~ 1FF, actually 0 ~ 13F)
4462  044d 7b0e          	ld	a,(OFST+9,sp)
4463  044f 97            	ld	xl,a
4464  0450 a610          	ld	a,#16
4465  0452 42            	mul	x,a
4466  0453 89            	pushw	x
4467  0454 ae0007        	ldw	x,#7
4468  0457 cd0094        	call	_LCD_WRITE_COMMAND
4470  045a 85            	popw	x
4471                     ; 389 	LCD_WRITE_REG(0x0E);	//RAM Write index(prepare to write data)
4473  045b ae000e        	ldw	x,#14
4474  045e cd003f        	call	_LCD_WRITE_REG
4476                     ; 391 	LCD_CS_L();
4478  0461 72155023      	bres	_PH_ODR,#2
4479                     ; 392 	LCD_RS_H();
4482  0465 72185014      	bset	_PE_ODR,#4
4483                     ; 394 	p = ascii;
4486  0469 ae0000        	ldw	x,#_ascii
4487  046c 1f01          	ldw	(OFST-4,sp),x
4488                     ; 395 	p += ch_asc*16;
4490  046e 7b06          	ld	a,(OFST+1,sp)
4491  0470 97            	ld	xl,a
4492  0471 a610          	ld	a,#16
4493  0473 42            	mul	x,a
4494  0474 72fb01        	addw	x,(OFST-4,sp)
4495  0477 1f01          	ldw	(OFST-4,sp),x
4496                     ; 396 	for(j=0;j<16;j++)
4498  0479 0f03          	clr	(OFST-2,sp)
4499  047b               L5242:
4500                     ; 398 		b=*(p+j);
4502  047b 7b01          	ld	a,(OFST-4,sp)
4503  047d 97            	ld	xl,a
4504  047e 7b02          	ld	a,(OFST-3,sp)
4505  0480 1b03          	add	a,(OFST-2,sp)
4506  0482 2401          	jrnc	L43
4507  0484 5c            	incw	x
4508  0485               L43:
4509  0485 02            	rlwa	x,a
4510  0486 f6            	ld	a,(x)
4511  0487 6b05          	ld	(OFST+0,sp),a
4512                     ; 399 		for(i=0;i<8;i++)
4514  0489 0f04          	clr	(OFST-1,sp)
4515  048b               L3342:
4516                     ; 401 			if( b & 0x80 )
4518  048b 7b05          	ld	a,(OFST+0,sp)
4519  048d a580          	bcp	a,#128
4520  048f 2707          	jreq	L1442
4521                     ; 403 				LCD_WRITE_DATA(color_front);
4523  0491 1e09          	ldw	x,(OFST+4,sp)
4524  0493 cd00c0        	call	_LCD_WRITE_DATA
4527  0496 2005          	jra	L3442
4528  0498               L1442:
4529                     ; 407 				LCD_WRITE_DATA(color_background);
4531  0498 1e0b          	ldw	x,(OFST+6,sp)
4532  049a cd00c0        	call	_LCD_WRITE_DATA
4534  049d               L3442:
4535                     ; 409 			b=b<<1;			
4537  049d 0805          	sll	(OFST+0,sp)
4538                     ; 399 		for(i=0;i<8;i++)
4540  049f 0c04          	inc	(OFST-1,sp)
4543  04a1 7b04          	ld	a,(OFST-1,sp)
4544  04a3 a108          	cp	a,#8
4545  04a5 25e4          	jrult	L3342
4546                     ; 396 	for(j=0;j<16;j++)
4548  04a7 0c03          	inc	(OFST-2,sp)
4551  04a9 7b03          	ld	a,(OFST-2,sp)
4552  04ab a110          	cp	a,#16
4553  04ad 25cc          	jrult	L5242
4554                     ; 413 	LCD_CS_H();
4556  04af 72145023      	bset	_PH_ODR,#2
4557                     ; 414 }
4561  04b3 5b06          	addw	sp,#6
4562  04b5 81            	ret
4634                     ; 426 void lcd_display_string(unsigned char *str, 
4634                     ; 427 						unsigned int color_front, 
4634                     ; 428 						unsigned int color_background, 
4634                     ; 429 						unsigned char x, 
4634                     ; 430 						unsigned char y )
4634                     ; 431 {
4635                     	switch	.text
4636  04b6               _lcd_display_string:
4638  04b6 89            	pushw	x
4639       00000000      OFST:	set	0
4642  04b7 202f          	jra	L5052
4643  04b9               L3052:
4644                     ; 434 		lcd_display_char( *str, color_front, color_background, x, y);
4646  04b9 7b0a          	ld	a,(OFST+10,sp)
4647  04bb 88            	push	a
4648  04bc 7b0a          	ld	a,(OFST+10,sp)
4649  04be 88            	push	a
4650  04bf 1e09          	ldw	x,(OFST+9,sp)
4651  04c1 89            	pushw	x
4652  04c2 1e09          	ldw	x,(OFST+9,sp)
4653  04c4 89            	pushw	x
4654  04c5 1e07          	ldw	x,(OFST+7,sp)
4655  04c7 f6            	ld	a,(x)
4656  04c8 cd03fc        	call	_lcd_display_char
4658  04cb 5b06          	addw	sp,#6
4659                     ; 435 		if(++x>=30)
4661  04cd 0c09          	inc	(OFST+9,sp)
4662  04cf 7b09          	ld	a,(OFST+9,sp)
4663  04d1 a11e          	cp	a,#30
4664  04d3 250c          	jrult	L1152
4665                     ; 437 			x=0;
4667  04d5 0f09          	clr	(OFST+9,sp)
4668                     ; 438 			if(++y>=20)
4670  04d7 0c0a          	inc	(OFST+10,sp)
4671  04d9 7b0a          	ld	a,(OFST+10,sp)
4672  04db a114          	cp	a,#20
4673  04dd 2502          	jrult	L1152
4674                     ; 440 				y=0;
4676  04df 0f0a          	clr	(OFST+10,sp)
4677  04e1               L1152:
4678                     ; 443 		str ++;
4680  04e1 1e01          	ldw	x,(OFST+1,sp)
4681  04e3 1c0001        	addw	x,#1
4682  04e6 1f01          	ldw	(OFST+1,sp),x
4683  04e8               L5052:
4684                     ; 432 	while (*str) 
4686  04e8 1e01          	ldw	x,(OFST+1,sp)
4687  04ea 7d            	tnz	(x)
4688  04eb 26cc          	jrne	L3052
4689                     ; 445 }
4692  04ed 85            	popw	x
4693  04ee 81            	ret
4806                     ; 461 void lcd_display_GB2312( unsigned char gb, 
4806                     ; 462 						unsigned int color_front, 
4806                     ; 463 						unsigned int color_background, 
4806                     ; 464 						unsigned char postion_x, 
4806                     ; 465 						unsigned char postion_y )
4806                     ; 466 {
4807                     	switch	.text
4808  04ef               _lcd_display_GB2312:
4810  04ef 88            	push	a
4811  04f0 5205          	subw	sp,#5
4812       00000005      OFST:	set	5
4815                     ; 470 	LCD_WRITE_COMMAND(0x08,postion_x*16); 	//x start point
4817  04f2 7b0d          	ld	a,(OFST+8,sp)
4818  04f4 97            	ld	xl,a
4819  04f5 a610          	ld	a,#16
4820  04f7 42            	mul	x,a
4821  04f8 89            	pushw	x
4822  04f9 ae0008        	ldw	x,#8
4823  04fc cd0094        	call	_LCD_WRITE_COMMAND
4825  04ff 85            	popw	x
4826                     ; 471 	LCD_WRITE_COMMAND(0x0a,postion_y*16); 	//y start point
4828  0500 7b0e          	ld	a,(OFST+9,sp)
4829  0502 97            	ld	xl,a
4830  0503 a610          	ld	a,#16
4831  0505 42            	mul	x,a
4832  0506 89            	pushw	x
4833  0507 ae000a        	ldw	x,#10
4834  050a cd0094        	call	_LCD_WRITE_COMMAND
4836  050d 85            	popw	x
4837                     ; 472 	LCD_WRITE_COMMAND(0x09,postion_x*16+15);	//x end point
4839  050e 7b0d          	ld	a,(OFST+8,sp)
4840  0510 97            	ld	xl,a
4841  0511 a610          	ld	a,#16
4842  0513 42            	mul	x,a
4843  0514 1c000f        	addw	x,#15
4844  0517 89            	pushw	x
4845  0518 ae0009        	ldw	x,#9
4846  051b cd0094        	call	_LCD_WRITE_COMMAND
4848  051e 85            	popw	x
4849                     ; 473 	LCD_WRITE_COMMAND(0x0b,postion_y*16+15);	//y end point
4851  051f 7b0e          	ld	a,(OFST+9,sp)
4852  0521 97            	ld	xl,a
4853  0522 a610          	ld	a,#16
4854  0524 42            	mul	x,a
4855  0525 1c000f        	addw	x,#15
4856  0528 89            	pushw	x
4857  0529 ae000b        	ldw	x,#11
4858  052c cd0094        	call	_LCD_WRITE_COMMAND
4860  052f 85            	popw	x
4861                     ; 474 	LCD_WRITE_COMMAND(0x06,postion_x*16);	
4863  0530 7b0d          	ld	a,(OFST+8,sp)
4864  0532 97            	ld	xl,a
4865  0533 a610          	ld	a,#16
4866  0535 42            	mul	x,a
4867  0536 89            	pushw	x
4868  0537 ae0006        	ldw	x,#6
4869  053a cd0094        	call	_LCD_WRITE_COMMAND
4871  053d 85            	popw	x
4872                     ; 475 	LCD_WRITE_COMMAND(0x07,postion_y*16);
4874  053e 7b0e          	ld	a,(OFST+9,sp)
4875  0540 97            	ld	xl,a
4876  0541 a610          	ld	a,#16
4877  0543 42            	mul	x,a
4878  0544 89            	pushw	x
4879  0545 ae0007        	ldw	x,#7
4880  0548 cd0094        	call	_LCD_WRITE_COMMAND
4882  054b 85            	popw	x
4883                     ; 477 	LCD_WRITE_REG(0x0E);	//RAM Write index
4885  054c ae000e        	ldw	x,#14
4886  054f cd003f        	call	_LCD_WRITE_REG
4888                     ; 479 	LCD_CS_L();
4890  0552 72155023      	bres	_PH_ODR,#2
4891                     ; 480 	LCD_RS_H();
4894  0556 72185014      	bset	_PE_ODR,#4
4895                     ; 482 	p = (unsigned char *)GB2312;
4898  055a ae0000        	ldw	x,#_GB2312
4899  055d 1f01          	ldw	(OFST-4,sp),x
4900                     ; 483 	p += gb*32;
4902  055f 7b06          	ld	a,(OFST+1,sp)
4903  0561 97            	ld	xl,a
4904  0562 a620          	ld	a,#32
4905  0564 42            	mul	x,a
4906  0565 72fb01        	addw	x,(OFST-4,sp)
4907  0568 1f01          	ldw	(OFST-4,sp),x
4908                     ; 484 	for(j=0;j<32;j++)
4910  056a 0f03          	clr	(OFST-2,sp)
4911  056c               L3752:
4912                     ; 486 		b=*(p+j);
4914  056c 7b01          	ld	a,(OFST-4,sp)
4915  056e 97            	ld	xl,a
4916  056f 7b02          	ld	a,(OFST-3,sp)
4917  0571 1b03          	add	a,(OFST-2,sp)
4918  0573 2401          	jrnc	L24
4919  0575 5c            	incw	x
4920  0576               L24:
4921  0576 02            	rlwa	x,a
4922  0577 f6            	ld	a,(x)
4923  0578 6b05          	ld	(OFST+0,sp),a
4924                     ; 487 		for(i=0;i<8;i++)
4926  057a 0f04          	clr	(OFST-1,sp)
4927  057c               L1062:
4928                     ; 489 			if(b&0x80)
4930  057c 7b05          	ld	a,(OFST+0,sp)
4931  057e a580          	bcp	a,#128
4932  0580 2707          	jreq	L7062
4933                     ; 491 				LCD_WRITE_DATA(color_front);
4935  0582 1e09          	ldw	x,(OFST+4,sp)
4936  0584 cd00c0        	call	_LCD_WRITE_DATA
4939  0587 2005          	jra	L1162
4940  0589               L7062:
4941                     ; 495 				LCD_WRITE_DATA(color_background);
4943  0589 1e0b          	ldw	x,(OFST+6,sp)
4944  058b cd00c0        	call	_LCD_WRITE_DATA
4946  058e               L1162:
4947                     ; 497 			b=b<<1;
4949  058e 0805          	sll	(OFST+0,sp)
4950                     ; 487 		for(i=0;i<8;i++)
4952  0590 0c04          	inc	(OFST-1,sp)
4955  0592 7b04          	ld	a,(OFST-1,sp)
4956  0594 a108          	cp	a,#8
4957  0596 25e4          	jrult	L1062
4958                     ; 484 	for(j=0;j<32;j++)
4960  0598 0c03          	inc	(OFST-2,sp)
4963  059a 7b03          	ld	a,(OFST-2,sp)
4964  059c a120          	cp	a,#32
4965  059e 25cc          	jrult	L3752
4966                     ; 501 	LCD_CS_H();
4968  05a0 72145023      	bset	_PH_ODR,#2
4969                     ; 502 }
4973  05a4 5b06          	addw	sp,#6
4974  05a6 81            	ret
5077                     ; 511 void lcd_display_image( const unsigned char *img, 
5077                     ; 512 					unsigned char x, 
5077                     ; 513 					unsigned int y, 
5077                     ; 514 					unsigned int width, 
5077                     ; 515 					unsigned height )
5077                     ; 516 {
5078                     	switch	.text
5079  05a7               _lcd_display_image:
5081  05a7 89            	pushw	x
5082  05a8 5206          	subw	sp,#6
5083       00000006      OFST:	set	6
5086                     ; 521 	LCD_WRITE_COMMAND( 0x08, x ); 	//x start point
5088  05aa 7b0b          	ld	a,(OFST+5,sp)
5089  05ac 5f            	clrw	x
5090  05ad 97            	ld	xl,a
5091  05ae 89            	pushw	x
5092  05af ae0008        	ldw	x,#8
5093  05b2 cd0094        	call	_LCD_WRITE_COMMAND
5095  05b5 85            	popw	x
5096                     ; 522 	LCD_WRITE_COMMAND( 0x0a, y ); 	//y start point
5098  05b6 1e0c          	ldw	x,(OFST+6,sp)
5099  05b8 89            	pushw	x
5100  05b9 ae000a        	ldw	x,#10
5101  05bc cd0094        	call	_LCD_WRITE_COMMAND
5103  05bf 85            	popw	x
5104                     ; 523 	LCD_WRITE_COMMAND( 0x09, x + width - 1 );	//x end point
5106  05c0 7b0b          	ld	a,(OFST+5,sp)
5107  05c2 5f            	clrw	x
5108  05c3 97            	ld	xl,a
5109  05c4 72fb0e        	addw	x,(OFST+8,sp)
5110  05c7 5a            	decw	x
5111  05c8 89            	pushw	x
5112  05c9 ae0009        	ldw	x,#9
5113  05cc cd0094        	call	_LCD_WRITE_COMMAND
5115  05cf 85            	popw	x
5116                     ; 524 	LCD_WRITE_COMMAND( 0x0b, y + height - 1 );	//y end point
5118  05d0 1e0c          	ldw	x,(OFST+6,sp)
5119  05d2 72fb10        	addw	x,(OFST+10,sp)
5120  05d5 5a            	decw	x
5121  05d6 89            	pushw	x
5122  05d7 ae000b        	ldw	x,#11
5123  05da cd0094        	call	_LCD_WRITE_COMMAND
5125  05dd 85            	popw	x
5126                     ; 526 	LCD_WRITE_COMMAND( 0x06, x );
5128  05de 7b0b          	ld	a,(OFST+5,sp)
5129  05e0 5f            	clrw	x
5130  05e1 97            	ld	xl,a
5131  05e2 89            	pushw	x
5132  05e3 ae0006        	ldw	x,#6
5133  05e6 cd0094        	call	_LCD_WRITE_COMMAND
5135  05e9 85            	popw	x
5136                     ; 527 	LCD_WRITE_COMMAND( 0x07, y );
5138  05ea 1e0c          	ldw	x,(OFST+6,sp)
5139  05ec 89            	pushw	x
5140  05ed ae0007        	ldw	x,#7
5141  05f0 cd0094        	call	_LCD_WRITE_COMMAND
5143  05f3 85            	popw	x
5144                     ; 529 	LCD_WRITE_REG( 0x0E );
5146  05f4 ae000e        	ldw	x,#14
5147  05f7 cd003f        	call	_LCD_WRITE_REG
5149                     ; 531 	LCD_CS_L();
5151  05fa 72155023      	bres	_PH_ODR,#2
5152                     ; 532 	LCD_RS_H();
5155  05fe 72185014      	bset	_PE_ODR,#4
5156                     ; 534 	for( i = 0; i < height; i++ )
5159  0602 5f            	clrw	x
5160  0603 1f01          	ldw	(OFST-5,sp),x
5162  0605 2036          	jra	L1762
5163  0607               L5662:
5164                     ; 536 		for( j = 0; j < width; j++ )
5166  0607 5f            	clrw	x
5167  0608 1f05          	ldw	(OFST-1,sp),x
5169  060a 2024          	jra	L1072
5170  060c               L5762:
5171                     ; 540 			data16 = ( *(img + 1) << 8 ) | (*img);
5173  060c 1e07          	ldw	x,(OFST+1,sp)
5174  060e e601          	ld	a,(1,x)
5175  0610 5f            	clrw	x
5176  0611 97            	ld	xl,a
5177  0612 4f            	clr	a
5178  0613 02            	rlwa	x,a
5179  0614 01            	rrwa	x,a
5180  0615 1607          	ldw	y,(OFST+1,sp)
5181  0617 90fa          	or	a,(y)
5182  0619 02            	rlwa	x,a
5183  061a 1f03          	ldw	(OFST-3,sp),x
5184  061c 01            	rrwa	x,a
5185                     ; 541 			LCD_WRITE_DATA( data16 );
5187  061d 1e03          	ldw	x,(OFST-3,sp)
5188  061f cd00c0        	call	_LCD_WRITE_DATA
5190                     ; 542 			img += 2;
5192  0622 1e07          	ldw	x,(OFST+1,sp)
5193  0624 1c0002        	addw	x,#2
5194  0627 1f07          	ldw	(OFST+1,sp),x
5195                     ; 536 		for( j = 0; j < width; j++ )
5197  0629 1e05          	ldw	x,(OFST-1,sp)
5198  062b 1c0001        	addw	x,#1
5199  062e 1f05          	ldw	(OFST-1,sp),x
5200  0630               L1072:
5203  0630 1e05          	ldw	x,(OFST-1,sp)
5204  0632 130e          	cpw	x,(OFST+8,sp)
5205  0634 25d6          	jrult	L5762
5206                     ; 534 	for( i = 0; i < height; i++ )
5208  0636 1e01          	ldw	x,(OFST-5,sp)
5209  0638 1c0001        	addw	x,#1
5210  063b 1f01          	ldw	(OFST-5,sp),x
5211  063d               L1762:
5214  063d 1e01          	ldw	x,(OFST-5,sp)
5215  063f 1310          	cpw	x,(OFST+10,sp)
5216  0641 25c4          	jrult	L5662
5217                     ; 545 	LCD_CS_H();
5219  0643 72145023      	bset	_PH_ODR,#2
5220                     ; 546 }
5224  0647 5b08          	addw	sp,#8
5225  0649 81            	ret
5228                     .const:	section	.text
5229  0000               _color:
5230  0000 f800          	dc.w	-2048
5231  0002 07e0          	dc.w	2016
5232  0004 001f          	dc.w	31
5233  0006 ffe0          	dc.w	-32
5234  0008 0000          	dc.w	0
5235  000a ffff          	dc.w	-1
5236  000c 07ff          	dc.w	2047
5237  000e f81f          	dc.w	-2017
5304                     ; 572 void lcd_display_test(void)
5304                     ; 573 {
5305                     	switch	.text
5306  064a               _lcd_display_test:
5308  064a 5207          	subw	sp,#7
5309       00000007      OFST:	set	7
5312                     ; 578 	lcd_clear_screen(RED);
5314  064c aef800        	ldw	x,#63488
5315  064f cd02d2        	call	_lcd_clear_screen
5317                     ; 579     delay_us(600);
5319  0652 ae0258        	ldw	x,#600
5320  0655 cd0000        	call	_delay_us
5322                     ; 581 	LCD_WRITE_COMMAND(0x08,0x00);		//x start point
5324  0658 5f            	clrw	x
5325  0659 89            	pushw	x
5326  065a ae0008        	ldw	x,#8
5327  065d cd0094        	call	_LCD_WRITE_COMMAND
5329  0660 85            	popw	x
5330                     ; 582 	LCD_WRITE_COMMAND(0x0a,0x0000);	//y start point
5332  0661 5f            	clrw	x
5333  0662 89            	pushw	x
5334  0663 ae000a        	ldw	x,#10
5335  0666 cd0094        	call	_LCD_WRITE_COMMAND
5337  0669 85            	popw	x
5338                     ; 583 	LCD_WRITE_COMMAND(0x09,0xEF);		//x end point
5340  066a ae00ef        	ldw	x,#239
5341  066d 89            	pushw	x
5342  066e ae0009        	ldw	x,#9
5343  0671 cd0094        	call	_LCD_WRITE_COMMAND
5345  0674 85            	popw	x
5346                     ; 584 	LCD_WRITE_COMMAND(0x0b,0x013F);	//y end point
5348  0675 ae013f        	ldw	x,#319
5349  0678 89            	pushw	x
5350  0679 ae000b        	ldw	x,#11
5351  067c cd0094        	call	_LCD_WRITE_COMMAND
5353  067f 85            	popw	x
5354                     ; 586 	LCD_WRITE_COMMAND(0x06,0x0000);
5356  0680 5f            	clrw	x
5357  0681 89            	pushw	x
5358  0682 ae0006        	ldw	x,#6
5359  0685 cd0094        	call	_LCD_WRITE_COMMAND
5361  0688 85            	popw	x
5362                     ; 587 	LCD_WRITE_COMMAND(0x07,0x0000);
5364  0689 5f            	clrw	x
5365  068a 89            	pushw	x
5366  068b ae0007        	ldw	x,#7
5367  068e cd0094        	call	_LCD_WRITE_COMMAND
5369  0691 85            	popw	x
5370                     ; 588 	LCD_WRITE_REG(0x0E);	//prepare to send data
5372  0692 ae000e        	ldw	x,#14
5373  0695 cd003f        	call	_LCD_WRITE_REG
5375                     ; 590 	for(n=0;n<8;n++)
5377  0698 0f05          	clr	(OFST-2,sp)
5378  069a               L7372:
5379                     ; 592 		LCD_CS_L();
5381  069a 72155023      	bres	_PH_ODR,#2
5382                     ; 593 		LCD_RS_H();
5385  069e 72185014      	bset	_PE_ODR,#4
5386                     ; 594 		temp=color[n];
5389  06a2 7b05          	ld	a,(OFST-2,sp)
5390  06a4 5f            	clrw	x
5391  06a5 97            	ld	xl,a
5392  06a6 58            	sllw	x
5393  06a7 de0000        	ldw	x,(_color,x)
5394  06aa 1f03          	ldw	(OFST-4,sp),x
5395                     ; 595 		for(num=40*240;num>0;num--)
5397  06ac ae2580        	ldw	x,#9600
5398  06af 1f06          	ldw	(OFST-1,sp),x
5399  06b1               L5472:
5400                     ; 597 			LCD_WRITE_DATA(temp);
5402  06b1 1e03          	ldw	x,(OFST-4,sp)
5403  06b3 cd00c0        	call	_LCD_WRITE_DATA
5405                     ; 595 		for(num=40*240;num>0;num--)
5407  06b6 1e06          	ldw	x,(OFST-1,sp)
5408  06b8 1d0001        	subw	x,#1
5409  06bb 1f06          	ldw	(OFST-1,sp),x
5412  06bd 1e06          	ldw	x,(OFST-1,sp)
5413  06bf 26f0          	jrne	L5472
5414                     ; 590 	for(n=0;n<8;n++)
5416  06c1 0c05          	inc	(OFST-2,sp)
5419  06c3 7b05          	ld	a,(OFST-2,sp)
5420  06c5 a108          	cp	a,#8
5421  06c7 25d1          	jrult	L7372
5422                     ; 601 	delay_us(600);
5424  06c9 ae0258        	ldw	x,#600
5425  06cc cd0000        	call	_delay_us
5427                     ; 604 	for(n=0;n<8;n++)
5429  06cf 0f05          	clr	(OFST-2,sp)
5430  06d1               L3572:
5431                     ; 606 		LCD_WRITE_COMMAND(0x08,0x00);
5433  06d1 5f            	clrw	x
5434  06d2 89            	pushw	x
5435  06d3 ae0008        	ldw	x,#8
5436  06d6 cd0094        	call	_LCD_WRITE_COMMAND
5438  06d9 85            	popw	x
5439                     ; 607 		LCD_WRITE_COMMAND(0x0a,0x0000);
5441  06da 5f            	clrw	x
5442  06db 89            	pushw	x
5443  06dc ae000a        	ldw	x,#10
5444  06df cd0094        	call	_LCD_WRITE_COMMAND
5446  06e2 85            	popw	x
5447                     ; 608 		LCD_WRITE_COMMAND(0x09,0xEF);
5449  06e3 ae00ef        	ldw	x,#239
5450  06e6 89            	pushw	x
5451  06e7 ae0009        	ldw	x,#9
5452  06ea cd0094        	call	_LCD_WRITE_COMMAND
5454  06ed 85            	popw	x
5455                     ; 609 		LCD_WRITE_COMMAND(0x0b,0x013F);
5457  06ee ae013f        	ldw	x,#319
5458  06f1 89            	pushw	x
5459  06f2 ae000b        	ldw	x,#11
5460  06f5 cd0094        	call	_LCD_WRITE_COMMAND
5462  06f8 85            	popw	x
5463                     ; 611 		LCD_WRITE_COMMAND(0x06,0x0000);
5465  06f9 5f            	clrw	x
5466  06fa 89            	pushw	x
5467  06fb ae0006        	ldw	x,#6
5468  06fe cd0094        	call	_LCD_WRITE_COMMAND
5470  0701 85            	popw	x
5471                     ; 612 		LCD_WRITE_COMMAND(0x07,0x0000);
5473  0702 5f            	clrw	x
5474  0703 89            	pushw	x
5475  0704 ae0007        	ldw	x,#7
5476  0707 cd0094        	call	_LCD_WRITE_COMMAND
5478  070a 85            	popw	x
5479                     ; 614 		LCD_WRITE_REG(0x0E);
5481  070b ae000e        	ldw	x,#14
5482  070e cd003f        	call	_LCD_WRITE_REG
5484                     ; 616 		LCD_CS_L();
5486  0711 72155023      	bres	_PH_ODR,#2
5487                     ; 617 		LCD_RS_H();
5490  0715 72185014      	bset	_PE_ODR,#4
5491                     ; 619 	    temp=color[n];
5494  0719 7b05          	ld	a,(OFST-2,sp)
5495  071b 5f            	clrw	x
5496  071c 97            	ld	xl,a
5497  071d 58            	sllw	x
5498  071e de0000        	ldw	x,(_color,x)
5499  0721 1f03          	ldw	(OFST-4,sp),x
5500                     ; 620 		for(i=0;i<240;i++)
5502  0723 5f            	clrw	x
5503  0724 1f01          	ldw	(OFST-6,sp),x
5504  0726               L1672:
5505                     ; 622 			for(num=0;num<320;num++)
5507  0726 5f            	clrw	x
5508  0727 1f06          	ldw	(OFST-1,sp),x
5509  0729               L7672:
5510                     ; 624 		  		LCD_WRITE_DATA(temp);
5512  0729 1e03          	ldw	x,(OFST-4,sp)
5513  072b cd00c0        	call	_LCD_WRITE_DATA
5515                     ; 622 			for(num=0;num<320;num++)
5517  072e 1e06          	ldw	x,(OFST-1,sp)
5518  0730 1c0001        	addw	x,#1
5519  0733 1f06          	ldw	(OFST-1,sp),x
5522  0735 1e06          	ldw	x,(OFST-1,sp)
5523  0737 a30140        	cpw	x,#320
5524  073a 25ed          	jrult	L7672
5525                     ; 620 		for(i=0;i<240;i++)
5527  073c 1e01          	ldw	x,(OFST-6,sp)
5528  073e 1c0001        	addw	x,#1
5529  0741 1f01          	ldw	(OFST-6,sp),x
5532  0743 1e01          	ldw	x,(OFST-6,sp)
5533  0745 a300f0        	cpw	x,#240
5534  0748 25dc          	jrult	L1672
5535                     ; 627         delay_us(60);
5537  074a ae003c        	ldw	x,#60
5538  074d cd0000        	call	_delay_us
5540                     ; 628         delay_us(60);
5542  0750 ae003c        	ldw	x,#60
5543  0753 cd0000        	call	_delay_us
5545                     ; 629         delay_us(60);
5547  0756 ae003c        	ldw	x,#60
5548  0759 cd0000        	call	_delay_us
5550                     ; 604 	for(n=0;n<8;n++)
5552  075c 0c05          	inc	(OFST-2,sp)
5555  075e 7b05          	ld	a,(OFST-2,sp)
5556  0760 a108          	cp	a,#8
5557  0762 2403cc06d1    	jrult	L3572
5558                     ; 633 	LCD_CS_H();
5560  0767 72145023      	bset	_PH_ODR,#2
5561                     ; 634 	delay_us(50);
5564  076b ae0032        	ldw	x,#50
5565  076e cd0000        	call	_delay_us
5567                     ; 636 	lcd_clear_screen(GREEN);
5569  0771 ae07e0        	ldw	x,#2016
5570  0774 cd02d2        	call	_lcd_clear_screen
5572                     ; 638 }
5575  0777 5b07          	addw	sp,#7
5576  0779 81            	ret
5630                     ; 640 void Swap(unsigned int *a , unsigned int *b)	//for BresenhamLine
5630                     ; 641 {
5631                     	switch	.text
5632  077a               _Swap:
5634  077a 89            	pushw	x
5635  077b 89            	pushw	x
5636       00000002      OFST:	set	2
5639                     ; 643 	tmp = *a ;
5641  077c fe            	ldw	x,(x)
5642  077d 1f01          	ldw	(OFST-1,sp),x
5643                     ; 644 	*a = *b ;
5645  077f 1e07          	ldw	x,(OFST+5,sp)
5646  0781 1603          	ldw	y,(OFST+1,sp)
5647  0783 89            	pushw	x
5648  0784 fe            	ldw	x,(x)
5649  0785 90ff          	ldw	(y),x
5650  0787 85            	popw	x
5651                     ; 645 	*b = tmp ;
5653  0788 1e07          	ldw	x,(OFST+5,sp)
5654  078a 1601          	ldw	y,(OFST-1,sp)
5655  078c ff            	ldw	(x),y
5656                     ; 646 } 
5659  078d 5b04          	addw	sp,#4
5660  078f 81            	ret
5713                     ; 655 void lcd_draw_dot(unsigned int color_front,
5713                     ; 656                   unsigned char x,
5713                     ; 657                   unsigned int y)
5713                     ; 658 {
5714                     	switch	.text
5715  0790               _lcd_draw_dot:
5717  0790 89            	pushw	x
5718       00000000      OFST:	set	0
5721                     ; 659 	LCD_SEND_COMMAND( 0x06, x );
5723  0791 7b05          	ld	a,(OFST+5,sp)
5724  0793 5f            	clrw	x
5725  0794 97            	ld	xl,a
5726  0795 89            	pushw	x
5727  0796 ae0006        	ldw	x,#6
5728  0799 cd006a        	call	_LCD_SEND_COMMAND
5730  079c 85            	popw	x
5731                     ; 660 	LCD_SEND_COMMAND( 0x07, y );
5733  079d 1e06          	ldw	x,(OFST+6,sp)
5734  079f 89            	pushw	x
5735  07a0 ae0007        	ldw	x,#7
5736  07a3 cd006a        	call	_LCD_SEND_COMMAND
5738  07a6 85            	popw	x
5739                     ; 661 	LCD_SEND_COMMAND( 0x0E, color_front );
5741  07a7 1e01          	ldw	x,(OFST+1,sp)
5742  07a9 89            	pushw	x
5743  07aa ae000e        	ldw	x,#14
5744  07ad cd006a        	call	_LCD_SEND_COMMAND
5746  07b0 85            	popw	x
5747                     ; 662 }
5750  07b1 85            	popw	x
5751  07b2 81            	ret
5804                     ; 672 void lcd_draw_bigdot(unsigned int   color_front,
5804                     ; 673                      unsigned int    x,
5804                     ; 674                      unsigned int    y )
5804                     ; 675 {
5805                     	switch	.text
5806  07b3               _lcd_draw_bigdot:
5808  07b3 89            	pushw	x
5809       00000000      OFST:	set	0
5812                     ; 676     lcd_draw_dot(color_front,x,y);
5814  07b4 1e07          	ldw	x,(OFST+7,sp)
5815  07b6 89            	pushw	x
5816  07b7 7b08          	ld	a,(OFST+8,sp)
5817  07b9 88            	push	a
5818  07ba 1e04          	ldw	x,(OFST+4,sp)
5819  07bc add2          	call	_lcd_draw_dot
5821  07be 5b03          	addw	sp,#3
5822                     ; 677     lcd_draw_dot(color_front,x,y+1);
5824  07c0 1e07          	ldw	x,(OFST+7,sp)
5825  07c2 5c            	incw	x
5826  07c3 89            	pushw	x
5827  07c4 7b08          	ld	a,(OFST+8,sp)
5828  07c6 88            	push	a
5829  07c7 1e04          	ldw	x,(OFST+4,sp)
5830  07c9 adc5          	call	_lcd_draw_dot
5832  07cb 5b03          	addw	sp,#3
5833                     ; 678     lcd_draw_dot(color_front,x,y-1);
5835  07cd 1e07          	ldw	x,(OFST+7,sp)
5836  07cf 5a            	decw	x
5837  07d0 89            	pushw	x
5838  07d1 7b08          	ld	a,(OFST+8,sp)
5839  07d3 88            	push	a
5840  07d4 1e04          	ldw	x,(OFST+4,sp)
5841  07d6 adb8          	call	_lcd_draw_dot
5843  07d8 5b03          	addw	sp,#3
5844                     ; 680     lcd_draw_dot(color_front,x+1,y);
5846  07da 1e07          	ldw	x,(OFST+7,sp)
5847  07dc 89            	pushw	x
5848  07dd 7b08          	ld	a,(OFST+8,sp)
5849  07df 4c            	inc	a
5850  07e0 88            	push	a
5851  07e1 1e04          	ldw	x,(OFST+4,sp)
5852  07e3 adab          	call	_lcd_draw_dot
5854  07e5 5b03          	addw	sp,#3
5855                     ; 681     lcd_draw_dot(color_front,x+1,y+1);
5857  07e7 1e07          	ldw	x,(OFST+7,sp)
5858  07e9 5c            	incw	x
5859  07ea 89            	pushw	x
5860  07eb 7b08          	ld	a,(OFST+8,sp)
5861  07ed 4c            	inc	a
5862  07ee 88            	push	a
5863  07ef 1e04          	ldw	x,(OFST+4,sp)
5864  07f1 ad9d          	call	_lcd_draw_dot
5866  07f3 5b03          	addw	sp,#3
5867                     ; 682     lcd_draw_dot(color_front,x+1,y-1);
5869  07f5 1e07          	ldw	x,(OFST+7,sp)
5870  07f7 5a            	decw	x
5871  07f8 89            	pushw	x
5872  07f9 7b08          	ld	a,(OFST+8,sp)
5873  07fb 4c            	inc	a
5874  07fc 88            	push	a
5875  07fd 1e04          	ldw	x,(OFST+4,sp)
5876  07ff ad8f          	call	_lcd_draw_dot
5878  0801 5b03          	addw	sp,#3
5879                     ; 684     lcd_draw_dot(color_front,x-1,y);    
5881  0803 1e07          	ldw	x,(OFST+7,sp)
5882  0805 89            	pushw	x
5883  0806 7b08          	ld	a,(OFST+8,sp)
5884  0808 4a            	dec	a
5885  0809 88            	push	a
5886  080a 1e04          	ldw	x,(OFST+4,sp)
5887  080c ad82          	call	_lcd_draw_dot
5889  080e 5b03          	addw	sp,#3
5890                     ; 685     lcd_draw_dot(color_front,x-1,y+1);
5892  0810 1e07          	ldw	x,(OFST+7,sp)
5893  0812 5c            	incw	x
5894  0813 89            	pushw	x
5895  0814 7b08          	ld	a,(OFST+8,sp)
5896  0816 4a            	dec	a
5897  0817 88            	push	a
5898  0818 1e04          	ldw	x,(OFST+4,sp)
5899  081a cd0790        	call	_lcd_draw_dot
5901  081d 5b03          	addw	sp,#3
5902                     ; 686     lcd_draw_dot(color_front,x-1,y-1);
5904  081f 1e07          	ldw	x,(OFST+7,sp)
5905  0821 5a            	decw	x
5906  0822 89            	pushw	x
5907  0823 7b08          	ld	a,(OFST+8,sp)
5908  0825 4a            	dec	a
5909  0826 88            	push	a
5910  0827 1e04          	ldw	x,(OFST+4,sp)
5911  0829 cd0790        	call	_lcd_draw_dot
5913  082c 5b03          	addw	sp,#3
5914                     ; 688 }
5917  082e 85            	popw	x
5918  082f 81            	ret
6080                     ; 697 unsigned char lcd_draw_line(  
6080                     ; 698 						unsigned int line_color,
6080                     ; 699                         unsigned int x1,
6080                     ; 700                         unsigned int y1,
6080                     ; 701                         unsigned int x2,
6080                     ; 702                         unsigned int y2 )
6080                     ; 703 {
6081                     	switch	.text
6082  0830               _lcd_draw_line:
6084  0830 89            	pushw	x
6085  0831 5214          	subw	sp,#20
6086       00000014      OFST:	set	20
6089                     ; 709 	lcd_draw_dot( line_color , x1 , y1 );
6091  0833 1e1b          	ldw	x,(OFST+7,sp)
6092  0835 89            	pushw	x
6093  0836 7b1c          	ld	a,(OFST+8,sp)
6094  0838 88            	push	a
6095  0839 1e18          	ldw	x,(OFST+4,sp)
6096  083b cd0790        	call	_lcd_draw_dot
6098  083e 5b03          	addw	sp,#3
6099                     ; 710 	if( x1 == x2 && y1 == y2 )	/*如果两点重合，结束后面的动作*/
6101  0840 1e19          	ldw	x,(OFST+5,sp)
6102  0842 131d          	cpw	x,(OFST+9,sp)
6103  0844 260c          	jrne	L5023
6105  0846 1e1b          	ldw	x,(OFST+7,sp)
6106  0848 131f          	cpw	x,(OFST+11,sp)
6107  084a 2606          	jrne	L5023
6108                     ; 712 		return 1;
6110  084c a601          	ld	a,#1
6112  084e ac110911      	jpf	L07
6113  0852               L5023:
6114                     ; 714 	iTag = 0;
6116  0852 5f            	clrw	x
6117  0853 1f0d          	ldw	(OFST-7,sp),x
6118                     ; 715 	dx = ( x2 - x1 );
6120  0855 1e1d          	ldw	x,(OFST+9,sp)
6121  0857 72f019        	subw	x,(OFST+5,sp)
6122  085a 1f07          	ldw	(OFST-13,sp),x
6123                     ; 716 	dy = ( y2 - y1 );
6125  085c 1e1f          	ldw	x,(OFST+11,sp)
6126  085e 72f01b        	subw	x,(OFST+7,sp)
6127  0861 1f09          	ldw	(OFST-11,sp),x
6128                     ; 717 	if( dx < dy )	/*如果dy为计长方向，则交换纵横坐标*/
6130  0863 1e07          	ldw	x,(OFST-13,sp)
6131  0865 1309          	cpw	x,(OFST-11,sp)
6132  0867 242c          	jruge	L7023
6133                     ; 719 		iTag = 1 ;
6135  0869 ae0001        	ldw	x,#1
6136  086c 1f0d          	ldw	(OFST-7,sp),x
6137                     ; 720 		Swap ( &x1, &y1 );
6139  086e 96            	ldw	x,sp
6140  086f 1c001b        	addw	x,#OFST+7
6141  0872 89            	pushw	x
6142  0873 96            	ldw	x,sp
6143  0874 1c001b        	addw	x,#OFST+7
6144  0877 cd077a        	call	_Swap
6146  087a 85            	popw	x
6147                     ; 721 		Swap ( &x2, &y2 );
6149  087b 96            	ldw	x,sp
6150  087c 1c001f        	addw	x,#OFST+11
6151  087f 89            	pushw	x
6152  0880 96            	ldw	x,sp
6153  0881 1c001f        	addw	x,#OFST+11
6154  0884 cd077a        	call	_Swap
6156  0887 85            	popw	x
6157                     ; 722 		Swap ( &dx, &dy );
6159  0888 96            	ldw	x,sp
6160  0889 1c0009        	addw	x,#OFST-11
6161  088c 89            	pushw	x
6162  088d 96            	ldw	x,sp
6163  088e 1c0009        	addw	x,#OFST-11
6164  0891 cd077a        	call	_Swap
6166  0894 85            	popw	x
6167  0895               L7023:
6168                     ; 724 	tx = ( x2 - x1 ) > 0 ? 1 : -1;	   /*确定是增1还是减1*/
6170  0895 1e1d          	ldw	x,(OFST+9,sp)
6171  0897 72f019        	subw	x,(OFST+5,sp)
6172  089a 2705          	jreq	L06
6173  089c ae0001        	ldw	x,#1
6174  089f 2003          	jra	L26
6175  08a1               L06:
6176  08a1 aeffff        	ldw	x,#65535
6177  08a4               L26:
6178  08a4 1f01          	ldw	(OFST-19,sp),x
6179                     ; 725 	ty = ( y2 - y1 ) > 0 ? 1 : -1;
6181  08a6 1e1f          	ldw	x,(OFST+11,sp)
6182  08a8 72f01b        	subw	x,(OFST+7,sp)
6183  08ab 2705          	jreq	L46
6184  08ad ae0001        	ldw	x,#1
6185  08b0 2003          	jra	L66
6186  08b2               L46:
6187  08b2 aeffff        	ldw	x,#65535
6188  08b5               L66:
6189  08b5 1f03          	ldw	(OFST-17,sp),x
6190                     ; 726 	x = x1;
6192  08b7 1e19          	ldw	x,(OFST+5,sp)
6193  08b9 1f13          	ldw	(OFST-1,sp),x
6194                     ; 727 	y = y1;
6196  08bb 1e1b          	ldw	x,(OFST+7,sp)
6197  08bd 1f11          	ldw	(OFST-3,sp),x
6198                     ; 728 	inc1 = 2 * dy;
6200  08bf 1e09          	ldw	x,(OFST-11,sp)
6201  08c1 58            	sllw	x
6202  08c2 1f0b          	ldw	(OFST-9,sp),x
6203                     ; 729 	inc2 = 2 * ( dy - dx );
6205  08c4 1e09          	ldw	x,(OFST-11,sp)
6206  08c6 72f007        	subw	x,(OFST-13,sp)
6207  08c9 58            	sllw	x
6208  08ca 1f05          	ldw	(OFST-15,sp),x
6209                     ; 730 	d = inc1 - dx ;
6211  08cc 1e0b          	ldw	x,(OFST-9,sp)
6212  08ce 72f007        	subw	x,(OFST-13,sp)
6213  08d1 1f0f          	ldw	(OFST-5,sp),x
6215  08d3 2035          	jra	L5123
6216  08d5               L1123:
6217                     ; 739 			y += ty ;
6219  08d5 1e11          	ldw	x,(OFST-3,sp)
6220  08d7 72fb03        	addw	x,(OFST-17,sp)
6221  08da 1f11          	ldw	(OFST-3,sp),x
6222                     ; 740 			d += inc2 ;
6224  08dc 1e0f          	ldw	x,(OFST-5,sp)
6225  08de 72fb05        	addw	x,(OFST-15,sp)
6226  08e1 1f0f          	ldw	(OFST-5,sp),x
6227                     ; 742 		if( iTag )
6229  08e3 1e0d          	ldw	x,(OFST-7,sp)
6230  08e5 270f          	jreq	L1223
6231                     ; 744 			lcd_draw_dot ( line_color, y, x ) ;
6233  08e7 1e13          	ldw	x,(OFST-1,sp)
6234  08e9 89            	pushw	x
6235  08ea 7b14          	ld	a,(OFST+0,sp)
6236  08ec 88            	push	a
6237  08ed 1e18          	ldw	x,(OFST+4,sp)
6238  08ef cd0790        	call	_lcd_draw_dot
6240  08f2 5b03          	addw	sp,#3
6242  08f4 200d          	jra	L3223
6243  08f6               L1223:
6244                     ; 748 			lcd_draw_dot ( line_color, x, y ) ;
6246  08f6 1e11          	ldw	x,(OFST-3,sp)
6247  08f8 89            	pushw	x
6248  08f9 7b16          	ld	a,(OFST+2,sp)
6249  08fb 88            	push	a
6250  08fc 1e18          	ldw	x,(OFST+4,sp)
6251  08fe cd0790        	call	_lcd_draw_dot
6253  0901 5b03          	addw	sp,#3
6254  0903               L3223:
6255                     ; 750 		x += tx ;
6257  0903 1e13          	ldw	x,(OFST-1,sp)
6258  0905 72fb01        	addw	x,(OFST-19,sp)
6259  0908 1f13          	ldw	(OFST-1,sp),x
6260  090a               L5123:
6261                     ; 731 	while( x != x2 )	 /*循环画点*/
6263  090a 1e13          	ldw	x,(OFST-1,sp)
6264  090c 131d          	cpw	x,(OFST+9,sp)
6265  090e 26c5          	jrne	L1123
6266                     ; 752 	return 0;
6268  0910 4f            	clr	a
6270  0911               L07:
6272  0911 5b16          	addw	sp,#22
6273  0913 81            	ret
6325                     ; 758 unsigned long mypow(unsigned char m,unsigned char n)
6325                     ; 759 {
6326                     	switch	.text
6327  0914               _mypow:
6329  0914 89            	pushw	x
6330  0915 5204          	subw	sp,#4
6331       00000004      OFST:	set	4
6334                     ; 760 	unsigned long result=1;	 
6336  0917 ae0001        	ldw	x,#1
6337  091a 1f03          	ldw	(OFST-1,sp),x
6338  091c ae0000        	ldw	x,#0
6339  091f 1f01          	ldw	(OFST-3,sp),x
6341  0921 2011          	jra	L7523
6342  0923               L3523:
6343                     ; 761 	while(n--)result*=m;    
6345  0923 7b05          	ld	a,(OFST+1,sp)
6346  0925 b703          	ld	c_lreg+3,a
6347  0927 3f02          	clr	c_lreg+2
6348  0929 3f01          	clr	c_lreg+1
6349  092b 3f00          	clr	c_lreg
6350  092d 96            	ldw	x,sp
6351  092e 1c0001        	addw	x,#OFST-3
6352  0931 cd0000        	call	c_lgmul
6354  0934               L7523:
6357  0934 7b06          	ld	a,(OFST+2,sp)
6358  0936 0a06          	dec	(OFST+2,sp)
6359  0938 4d            	tnz	a
6360  0939 26e8          	jrne	L3523
6361                     ; 762 	return result;
6363  093b 96            	ldw	x,sp
6364  093c 1c0001        	addw	x,#OFST-3
6365  093f cd0000        	call	c_ltor
6369  0942 5b06          	addw	sp,#6
6370  0944 81            	ret
6460                     	switch	.const
6461  0010               L67:
6462  0010 0000000a      	dc.l	10
6463                     ; 770 void lcd_display_number(unsigned int x,
6463                     ; 771                         unsigned int y,
6463                     ; 772                         unsigned long num,
6463                     ; 773                         unsigned char num_len )
6463                     ; 774 {         	
6464                     	switch	.text
6465  0945               _lcd_display_number:
6467  0945 89            	pushw	x
6468  0946 5207          	subw	sp,#7
6469       00000007      OFST:	set	7
6472                     ; 776 	unsigned char enshow=0;		 // 此变量用来去掉最高位的0	
6474  0948 0f05          	clr	(OFST-2,sp)
6475                     ; 778 	for(t=0;t<num_len;t++)
6477  094a 0f07          	clr	(OFST+0,sp)
6479  094c 2079          	jra	L5333
6480  094e               L1333:
6481                     ; 780 		temp=(num/mypow(10,num_len-t-1))%10;
6483  094e 7b12          	ld	a,(OFST+11,sp)
6484  0950 1007          	sub	a,(OFST+0,sp)
6485  0952 4a            	dec	a
6486  0953 97            	ld	xl,a
6487  0954 a60a          	ld	a,#10
6488  0956 95            	ld	xh,a
6489  0957 adbb          	call	_mypow
6491  0959 96            	ldw	x,sp
6492  095a 1c0001        	addw	x,#OFST-6
6493  095d cd0000        	call	c_rtol
6495  0960 96            	ldw	x,sp
6496  0961 1c000e        	addw	x,#OFST+7
6497  0964 cd0000        	call	c_ltor
6499  0967 96            	ldw	x,sp
6500  0968 1c0001        	addw	x,#OFST-6
6501  096b cd0000        	call	c_ludv
6503  096e ae0010        	ldw	x,#L67
6504  0971 cd0000        	call	c_lumd
6506  0974 b603          	ld	a,c_lreg+3
6507  0976 6b06          	ld	(OFST-1,sp),a
6508                     ; 781 		if(enshow==0&&t<(num_len-1))
6510  0978 0d05          	tnz	(OFST-2,sp)
6511  097a 2632          	jrne	L1433
6513  097c 9c            	rvf
6514  097d 7b12          	ld	a,(OFST+11,sp)
6515  097f 5f            	clrw	x
6516  0980 97            	ld	xl,a
6517  0981 5a            	decw	x
6518  0982 7b07          	ld	a,(OFST+0,sp)
6519  0984 905f          	clrw	y
6520  0986 9097          	ld	yl,a
6521  0988 90bf01        	ldw	c_y+1,y
6522  098b b301          	cpw	x,c_y+1
6523  098d 2d1f          	jrsle	L1433
6524                     ; 783 			if(temp==0)
6526  098f 0d06          	tnz	(OFST-1,sp)
6527  0991 2617          	jrne	L3433
6528                     ; 786                 lcd_display_char(' ',BLACK,WHITE,x+t,y);
6530  0993 7b0d          	ld	a,(OFST+6,sp)
6531  0995 88            	push	a
6532  0996 7b0a          	ld	a,(OFST+3,sp)
6533  0998 1b08          	add	a,(OFST+1,sp)
6534  099a 88            	push	a
6535  099b aeffff        	ldw	x,#65535
6536  099e 89            	pushw	x
6537  099f 5f            	clrw	x
6538  09a0 89            	pushw	x
6539  09a1 a620          	ld	a,#32
6540  09a3 cd03fc        	call	_lcd_display_char
6542  09a6 5b06          	addw	sp,#6
6543                     ; 787 				continue;
6545  09a8 201b          	jra	L3333
6546  09aa               L3433:
6547                     ; 788 			}else enshow=1; 
6549  09aa a601          	ld	a,#1
6550  09ac 6b05          	ld	(OFST-2,sp),a
6551  09ae               L1433:
6552                     ; 792         lcd_display_char(temp+'0',BLACK,WHITE,x+t,y); 
6554  09ae 7b0d          	ld	a,(OFST+6,sp)
6555  09b0 88            	push	a
6556  09b1 7b0a          	ld	a,(OFST+3,sp)
6557  09b3 1b08          	add	a,(OFST+1,sp)
6558  09b5 88            	push	a
6559  09b6 aeffff        	ldw	x,#65535
6560  09b9 89            	pushw	x
6561  09ba 5f            	clrw	x
6562  09bb 89            	pushw	x
6563  09bc 7b0c          	ld	a,(OFST+5,sp)
6564  09be ab30          	add	a,#48
6565  09c0 cd03fc        	call	_lcd_display_char
6567  09c3 5b06          	addw	sp,#6
6568  09c5               L3333:
6569                     ; 778 	for(t=0;t<num_len;t++)
6571  09c5 0c07          	inc	(OFST+0,sp)
6572  09c7               L5333:
6575  09c7 7b07          	ld	a,(OFST+0,sp)
6576  09c9 1112          	cp	a,(OFST+11,sp)
6577  09cb 2581          	jrult	L1333
6578                     ; 794 } 
6581  09cd 5b09          	addw	sp,#9
6582  09cf 81            	ret
6607                     	xdef	_mypow
6608                     	xdef	_Swap
6609                     	xdef	_LCD_SEND_COMMAND
6610                     	xdef	_lcd_ctrl_port_init
6611                     	xref	_GB2312
6612                     	xref	_ascii
6613                     	xdef	_color
6614                     	xdef	_lcd_display_test
6615                     	xdef	_lcd_display_number
6616                     	xdef	_lcd_draw_line
6617                     	xdef	_lcd_draw_bigdot
6618                     	xdef	_lcd_draw_dot
6619                     	xdef	_lcd_display_image
6620                     	xdef	_lcd_display_GB2312
6621                     	xdef	_lcd_display_string
6622                     	xdef	_lcd_display_char
6623                     	xdef	_lcd_set_cursor
6624                     	xdef	_lcd_clear_area
6625                     	xdef	_lcd_clear_screen
6626                     	xdef	_lcd_init
6627                     	xdef	_LCD_WRITE_DATA
6628                     	xdef	_LCD_WRITE_COMMAND
6629                     	xdef	_LCD_WRITE_REG
6630                     	xdef	_SPI0_communication
6631                     	xdef	_SPI0_Init
6632                     	xref	_delay_us
6633                     	xref.b	c_lreg
6634                     	xref.b	c_y
6653                     	xref	c_lumd
6654                     	xref	c_ludv
6655                     	xref	c_rtol
6656                     	xref	c_ltor
6657                     	xref	c_lgmul
6658                     	end
