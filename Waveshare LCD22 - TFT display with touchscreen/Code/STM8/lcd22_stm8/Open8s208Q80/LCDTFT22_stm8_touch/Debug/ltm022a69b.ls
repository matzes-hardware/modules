   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2855                     ; 33 void SPI0_Init(void)
2855                     ; 34 {
2857                     	switch	.text
2858  0000               _SPI0_Init:
2862                     ; 37 	PC_DDR=0x7f;
2864  0000 357f500c      	mov	_PC_DDR,#127
2865                     ; 38 	PC_CR1=0XFF;
2867  0004 35ff500d      	mov	_PC_CR1,#255
2868                     ; 40 	PD_DDR=0XFF;
2870  0008 35ff5011      	mov	_PD_DDR,#255
2871                     ; 41 	PD_CR1=0XFF;
2873  000c 35ff5012      	mov	_PD_CR1,#255
2874                     ; 42    PH_DDR=0XFF;
2876  0010 35ff5025      	mov	_PH_DDR,#255
2877                     ; 43 	PH_CR1=0XFF; 
2879  0014 35ff5026      	mov	_PH_CR1,#255
2880                     ; 44 	SPI_CR1&=(~0x38);   //波特率
2882  0018 c65200        	ld	a,_SPI_CR1
2883  001b a4c7          	and	a,#199
2884  001d c75200        	ld	_SPI_CR1,a
2885                     ; 46 	SPI_CR1|=0x03;   //时钟格式
2887  0020 c65200        	ld	a,_SPI_CR1
2888  0023 aa03          	or	a,#3
2889  0025 c75200        	ld	_SPI_CR1,a
2890                     ; 49 	SPI_CR2|=0x03;   //配置NSS脚为1
2892  0028 c65201        	ld	a,_SPI_CR2
2893  002b aa03          	or	a,#3
2894  002d c75201        	ld	_SPI_CR2,a
2895                     ; 50 	SPI_CR1|=0x04;   //配置为主设备
2897  0030 72145200      	bset	_SPI_CR1,#2
2898                     ; 51 	SPI_CR1|=0x40;   //开启SPI
2900  0034 721c5200      	bset	_SPI_CR1,#6
2901                     ; 56 }
2904  0038 81            	ret
2940                     ; 62 unsigned char SPI0_communication(unsigned char send_char)
2940                     ; 63 {
2941                     	switch	.text
2942  0039               _SPI0_communication:
2946                     ; 65 	SPI_DR = send_char;               //启动数据传输
2948  0039 c75204        	ld	_SPI_DR,a
2950  003c               L3402:
2951                     ; 66 	while(!(SPI_SR & 0x01));    //等待传输结束
2953  003c c65203        	ld	a,_SPI_SR
2954  003f a501          	bcp	a,#1
2955  0041 27f9          	jreq	L3402
2956                     ; 67 	return SPI_DR;
2958  0043 c65204        	ld	a,_SPI_DR
2961  0046 81            	ret
3007                     ; 73 void LCD_WRITE_REG(unsigned int index)
3007                     ; 74 {
3008                     	switch	.text
3009  0047               _LCD_WRITE_REG:
3011  0047 89            	pushw	x
3012  0048 89            	pushw	x
3013       00000002      OFST:	set	2
3016                     ; 76 	LCD_RS_L();
3018  0049 72195014      	bres	_PE_ODR,#4
3019                     ; 77 	LCD_CS_L();
3022  004d 72155023      	bres	_PH_ODR,#2
3023                     ; 78 	value_index=index;
3026  0051 1f01          	ldw	(OFST-1,sp),x
3027                     ; 79 	value_index =value_index>>8;
3029  0053 7b01          	ld	a,(OFST-1,sp)
3030  0055 6b02          	ld	(OFST+0,sp),a
3031  0057 0f01          	clr	(OFST-1,sp)
3032                     ; 80     SPI0_communication((unsigned char)(value_index));    //00000000 000000000
3034  0059 7b02          	ld	a,(OFST+0,sp)
3035  005b addc          	call	_SPI0_communication
3037                     ; 82 	value_index=index;
3039  005d 1e03          	ldw	x,(OFST+1,sp)
3040  005f 1f01          	ldw	(OFST-1,sp),x
3041                     ; 83 	value_index &=0x00ff;
3043  0061 0f01          	clr	(OFST-1,sp)
3044                     ; 84     SPI0_communication((unsigned char)(index));
3046  0063 7b04          	ld	a,(OFST+2,sp)
3047  0065 add2          	call	_SPI0_communication
3049                     ; 85 	LCD_CS_H();
3051  0067 72145023      	bset	_PH_ODR,#2
3052                     ; 86 	LCD_RS_H();
3055  006b 72185014      	bset	_PE_ODR,#4
3056                     ; 87 }
3060  006f 5b04          	addw	sp,#4
3061  0071 81            	ret
3107                     ; 97 void LCD_SEND_COMMAND(unsigned int index,unsigned int data)
3107                     ; 98 {
3108                     	switch	.text
3109  0072               _LCD_SEND_COMMAND:
3111  0072 89            	pushw	x
3112       00000000      OFST:	set	0
3115                     ; 100 	LCD_RS_L();
3117  0073 72195014      	bres	_PE_ODR,#4
3118                     ; 101 	LCD_CS_L();
3121  0077 72155023      	bres	_PH_ODR,#2
3122                     ; 102     SPI0_communication((unsigned char)(index>>8));    //00000000 000000000
3125  007b 9e            	ld	a,xh
3126  007c adbb          	call	_SPI0_communication
3128                     ; 103     SPI0_communication((unsigned char)(index));
3130  007e 7b02          	ld	a,(OFST+2,sp)
3131  0080 adb7          	call	_SPI0_communication
3133                     ; 104 	LCD_CS_H();
3135  0082 72145023      	bset	_PH_ODR,#2
3136                     ; 106 	LCD_RS_H();
3139  0086 72185014      	bset	_PE_ODR,#4
3140                     ; 107 	LCD_CS_L();
3143  008a 72155023      	bres	_PH_ODR,#2
3144                     ; 108     SPI0_communication((unsigned char)(data>>8));    //00000000 000000000
3147  008e 7b05          	ld	a,(OFST+5,sp)
3148  0090 ada7          	call	_SPI0_communication
3150                     ; 109     SPI0_communication((unsigned char)(data));
3152  0092 7b06          	ld	a,(OFST+6,sp)
3153  0094 ada3          	call	_SPI0_communication
3155                     ; 110 	LCD_CS_H();
3157  0096 72145023      	bset	_PH_ODR,#2
3158                     ; 111 }
3162  009a 85            	popw	x
3163  009b 81            	ret
3209                     ; 121 void LCD_WRITE_COMMAND(unsigned int index,unsigned int data)
3209                     ; 122 {
3210                     	switch	.text
3211  009c               _LCD_WRITE_COMMAND:
3213  009c 89            	pushw	x
3214       00000000      OFST:	set	0
3217                     ; 124 	LCD_RS_L();
3219  009d 72195014      	bres	_PE_ODR,#4
3220                     ; 125 	LCD_CS_L();
3223  00a1 72155023      	bres	_PH_ODR,#2
3224                     ; 126     SPI0_communication((unsigned char)(index>>8));    //00000000 000000000
3227  00a5 9e            	ld	a,xh
3228  00a6 ad91          	call	_SPI0_communication
3230                     ; 127     SPI0_communication((unsigned char)(index));
3232  00a8 7b02          	ld	a,(OFST+2,sp)
3233  00aa ad8d          	call	_SPI0_communication
3235                     ; 128 	LCD_CS_H();
3237  00ac 72145023      	bset	_PH_ODR,#2
3238                     ; 130 	LCD_RS_H();
3241  00b0 72185014      	bset	_PE_ODR,#4
3242                     ; 132 	LCD_CS_L();
3245  00b4 72155023      	bres	_PH_ODR,#2
3246                     ; 133     SPI0_communication((unsigned char)(data>>8));    //00000000 000000000
3249  00b8 7b05          	ld	a,(OFST+5,sp)
3250  00ba cd0039        	call	_SPI0_communication
3252                     ; 134     SPI0_communication((unsigned char)(data));
3254  00bd 7b06          	ld	a,(OFST+6,sp)
3255  00bf cd0039        	call	_SPI0_communication
3257                     ; 135 	LCD_CS_H();
3259  00c2 72145023      	bset	_PH_ODR,#2
3260                     ; 136 }
3264  00c6 85            	popw	x
3265  00c7 81            	ret
3300                     ; 145 void LCD_WRITE_DATA(unsigned int data)
3300                     ; 146 {
3301                     	switch	.text
3302  00c8               _LCD_WRITE_DATA:
3304  00c8 89            	pushw	x
3305       00000000      OFST:	set	0
3308                     ; 147     SPI0_communication((unsigned char)(data>>8));    //00000000 000000000
3310  00c9 9e            	ld	a,xh
3311  00ca cd0039        	call	_SPI0_communication
3313                     ; 148     SPI0_communication((unsigned char)(data));
3315  00cd 7b02          	ld	a,(OFST+2,sp)
3316  00cf cd0039        	call	_SPI0_communication
3318                     ; 149 }
3321  00d2 85            	popw	x
3322  00d3 81            	ret
3348                     ; 157 void lcd_ctrl_port_init()
3348                     ; 158 {
3349                     	switch	.text
3350  00d4               _lcd_ctrl_port_init:
3354                     ; 159 PE_DDR=0xff;
3356  00d4 35ff5016      	mov	_PE_DDR,#255
3357                     ; 160 PE_CR1=0xff;
3359  00d8 35ff5017      	mov	_PE_CR1,#255
3360                     ; 161 PE_CR2=0x00;
3362  00dc 725f5018      	clr	_PE_CR2
3363                     ; 164 }
3366  00e0 81            	ret
3395                     ; 172 void lcd_init(void)
3395                     ; 173 {
3396                     	switch	.text
3397  00e1               _lcd_init:
3401                     ; 174 	lcd_ctrl_port_init();
3403  00e1 adf1          	call	_lcd_ctrl_port_init
3405                     ; 175 	SPI0_Init();
3407  00e3 cd0000        	call	_SPI0_Init
3409                     ; 176 	LCD_RST_L();
3411  00e6 72175014      	bres	_PE_ODR,#3
3412                     ; 179 	delay_us(500);
3415  00ea ae01f4        	ldw	x,#500
3416  00ed cd0000        	call	_delay_us
3418                     ; 180 	LCD_RST_H();
3420  00f0 72165014      	bset	_PE_ODR,#3
3421                     ; 182 	delay_us(500);
3424  00f4 ae01f4        	ldw	x,#500
3425  00f7 cd0000        	call	_delay_us
3427                     ; 185 	LCD_WRITE_COMMAND( 0x000, 0x0001 ); /* oschilliation start */
3429  00fa ae0001        	ldw	x,#1
3430  00fd 89            	pushw	x
3431  00fe 5f            	clrw	x
3432  00ff ad9b          	call	_LCD_WRITE_COMMAND
3434  0101 85            	popw	x
3435                     ; 186 	delay_us( 10 );
3437  0102 ae000a        	ldw	x,#10
3438  0105 cd0000        	call	_delay_us
3440                     ; 188 	LCD_WRITE_COMMAND( 0x100, 0x0000 ); /*power supply setup*/	
3442  0108 5f            	clrw	x
3443  0109 89            	pushw	x
3444  010a ae0100        	ldw	x,#256
3445  010d ad8d          	call	_LCD_WRITE_COMMAND
3447  010f 85            	popw	x
3448                     ; 189 	LCD_WRITE_COMMAND( 0x101, 0x0000 ); 
3450  0110 5f            	clrw	x
3451  0111 89            	pushw	x
3452  0112 ae0101        	ldw	x,#257
3453  0115 ad85          	call	_LCD_WRITE_COMMAND
3455  0117 85            	popw	x
3456                     ; 190 	LCD_WRITE_COMMAND( 0x102, 0x3110 ); 
3458  0118 ae3110        	ldw	x,#12560
3459  011b 89            	pushw	x
3460  011c ae0102        	ldw	x,#258
3461  011f cd009c        	call	_LCD_WRITE_COMMAND
3463  0122 85            	popw	x
3464                     ; 191 	LCD_WRITE_COMMAND( 0x103, 0xe200 ); 
3466  0123 aee200        	ldw	x,#57856
3467  0126 89            	pushw	x
3468  0127 ae0103        	ldw	x,#259
3469  012a cd009c        	call	_LCD_WRITE_COMMAND
3471  012d 85            	popw	x
3472                     ; 192 	LCD_WRITE_COMMAND( 0x110, 0x009d ); 
3474  012e ae009d        	ldw	x,#157
3475  0131 89            	pushw	x
3476  0132 ae0110        	ldw	x,#272
3477  0135 cd009c        	call	_LCD_WRITE_COMMAND
3479  0138 85            	popw	x
3480                     ; 193 	LCD_WRITE_COMMAND( 0x111, 0x0022 ); 
3482  0139 ae0022        	ldw	x,#34
3483  013c 89            	pushw	x
3484  013d ae0111        	ldw	x,#273
3485  0140 cd009c        	call	_LCD_WRITE_COMMAND
3487  0143 85            	popw	x
3488                     ; 194 	LCD_WRITE_COMMAND( 0x100, 0x0120 ); 
3490  0144 ae0120        	ldw	x,#288
3491  0147 89            	pushw	x
3492  0148 ae0100        	ldw	x,#256
3493  014b cd009c        	call	_LCD_WRITE_COMMAND
3495  014e 85            	popw	x
3496                     ; 195 	delay_us( 20 );
3498  014f ae0014        	ldw	x,#20
3499  0152 cd0000        	call	_delay_us
3501                     ; 197 	LCD_WRITE_COMMAND( 0x100, 0x3120 );
3503  0155 ae3120        	ldw	x,#12576
3504  0158 89            	pushw	x
3505  0159 ae0100        	ldw	x,#256
3506  015c cd009c        	call	_LCD_WRITE_COMMAND
3508  015f 85            	popw	x
3509                     ; 198 	delay_us( 80 );
3511  0160 ae0050        	ldw	x,#80
3512  0163 cd0000        	call	_delay_us
3514                     ; 200 	LCD_WRITE_COMMAND( 0x001, 0x0100 );
3516  0166 ae0100        	ldw	x,#256
3517  0169 89            	pushw	x
3518  016a ae0001        	ldw	x,#1
3519  016d cd009c        	call	_LCD_WRITE_COMMAND
3521  0170 85            	popw	x
3522                     ; 201 	LCD_WRITE_COMMAND( 0x002, 0x0000 );
3524  0171 5f            	clrw	x
3525  0172 89            	pushw	x
3526  0173 ae0002        	ldw	x,#2
3527  0176 cd009c        	call	_LCD_WRITE_COMMAND
3529  0179 85            	popw	x
3530                     ; 202 	LCD_WRITE_COMMAND( 0x003, 0x1230 );
3532  017a ae1230        	ldw	x,#4656
3533  017d 89            	pushw	x
3534  017e ae0003        	ldw	x,#3
3535  0181 cd009c        	call	_LCD_WRITE_COMMAND
3537  0184 85            	popw	x
3538                     ; 203 	LCD_WRITE_COMMAND( 0x006, 0x0000 );
3540  0185 5f            	clrw	x
3541  0186 89            	pushw	x
3542  0187 ae0006        	ldw	x,#6
3543  018a cd009c        	call	_LCD_WRITE_COMMAND
3545  018d 85            	popw	x
3546                     ; 204 	LCD_WRITE_COMMAND( 0x007, 0x0101 );
3548  018e ae0101        	ldw	x,#257
3549  0191 89            	pushw	x
3550  0192 ae0007        	ldw	x,#7
3551  0195 cd009c        	call	_LCD_WRITE_COMMAND
3553  0198 85            	popw	x
3554                     ; 205 	LCD_WRITE_COMMAND( 0x008, 0x0808 );
3556  0199 ae0808        	ldw	x,#2056
3557  019c 89            	pushw	x
3558  019d ae0008        	ldw	x,#8
3559  01a0 cd009c        	call	_LCD_WRITE_COMMAND
3561  01a3 85            	popw	x
3562                     ; 206 	LCD_WRITE_COMMAND( 0x009, 0x0000 );
3564  01a4 5f            	clrw	x
3565  01a5 89            	pushw	x
3566  01a6 ae0009        	ldw	x,#9
3567  01a9 cd009c        	call	_LCD_WRITE_COMMAND
3569  01ac 85            	popw	x
3570                     ; 207 	LCD_WRITE_COMMAND( 0x00b, 0x0000 );
3572  01ad 5f            	clrw	x
3573  01ae 89            	pushw	x
3574  01af ae000b        	ldw	x,#11
3575  01b2 cd009c        	call	_LCD_WRITE_COMMAND
3577  01b5 85            	popw	x
3578                     ; 208 	LCD_WRITE_COMMAND( 0x00c, 0x0000 );
3580  01b6 5f            	clrw	x
3581  01b7 89            	pushw	x
3582  01b8 ae000c        	ldw	x,#12
3583  01bb cd009c        	call	_LCD_WRITE_COMMAND
3585  01be 85            	popw	x
3586                     ; 209 	LCD_WRITE_COMMAND( 0x00d, 0x0018 );
3588  01bf ae0018        	ldw	x,#24
3589  01c2 89            	pushw	x
3590  01c3 ae000d        	ldw	x,#13
3591  01c6 cd009c        	call	_LCD_WRITE_COMMAND
3593  01c9 85            	popw	x
3594                     ; 211 	LCD_WRITE_COMMAND( 0x012, 0x0000 );
3596  01ca 5f            	clrw	x
3597  01cb 89            	pushw	x
3598  01cc ae0012        	ldw	x,#18
3599  01cf cd009c        	call	_LCD_WRITE_COMMAND
3601  01d2 85            	popw	x
3602                     ; 212 	LCD_WRITE_COMMAND( 0x013, 0x0000 );
3604  01d3 5f            	clrw	x
3605  01d4 89            	pushw	x
3606  01d5 ae0013        	ldw	x,#19
3607  01d8 cd009c        	call	_LCD_WRITE_COMMAND
3609  01db 85            	popw	x
3610                     ; 213 	LCD_WRITE_COMMAND( 0x018, 0x0000 );
3612  01dc 5f            	clrw	x
3613  01dd 89            	pushw	x
3614  01de ae0018        	ldw	x,#24
3615  01e1 cd009c        	call	_LCD_WRITE_COMMAND
3617  01e4 85            	popw	x
3618                     ; 214 	LCD_WRITE_COMMAND( 0x019, 0x0000 );
3620  01e5 5f            	clrw	x
3621  01e6 89            	pushw	x
3622  01e7 ae0019        	ldw	x,#25
3623  01ea cd009c        	call	_LCD_WRITE_COMMAND
3625  01ed 85            	popw	x
3626                     ; 216 	LCD_WRITE_COMMAND( 0x203, 0x0000 );
3628  01ee 5f            	clrw	x
3629  01ef 89            	pushw	x
3630  01f0 ae0203        	ldw	x,#515
3631  01f3 cd009c        	call	_LCD_WRITE_COMMAND
3633  01f6 85            	popw	x
3634                     ; 217 	LCD_WRITE_COMMAND( 0x204, 0x0000 );
3636  01f7 5f            	clrw	x
3637  01f8 89            	pushw	x
3638  01f9 ae0204        	ldw	x,#516
3639  01fc cd009c        	call	_LCD_WRITE_COMMAND
3641  01ff 85            	popw	x
3642                     ; 219 	LCD_WRITE_COMMAND( 0x210, 0x0000 );
3644  0200 5f            	clrw	x
3645  0201 89            	pushw	x
3646  0202 ae0210        	ldw	x,#528
3647  0205 cd009c        	call	_LCD_WRITE_COMMAND
3649  0208 85            	popw	x
3650                     ; 220 	LCD_WRITE_COMMAND( 0x211, 0x00ef );
3652  0209 ae00ef        	ldw	x,#239
3653  020c 89            	pushw	x
3654  020d ae0211        	ldw	x,#529
3655  0210 cd009c        	call	_LCD_WRITE_COMMAND
3657  0213 85            	popw	x
3658                     ; 221 	LCD_WRITE_COMMAND( 0x212, 0x0000 );
3660  0214 5f            	clrw	x
3661  0215 89            	pushw	x
3662  0216 ae0212        	ldw	x,#530
3663  0219 cd009c        	call	_LCD_WRITE_COMMAND
3665  021c 85            	popw	x
3666                     ; 222 	LCD_WRITE_COMMAND( 0x213, 0x013f );
3668  021d ae013f        	ldw	x,#319
3669  0220 89            	pushw	x
3670  0221 ae0213        	ldw	x,#531
3671  0224 cd009c        	call	_LCD_WRITE_COMMAND
3673  0227 85            	popw	x
3674                     ; 223 	LCD_WRITE_COMMAND( 0x214, 0x0000 );
3676  0228 5f            	clrw	x
3677  0229 89            	pushw	x
3678  022a ae0214        	ldw	x,#532
3679  022d cd009c        	call	_LCD_WRITE_COMMAND
3681  0230 85            	popw	x
3682                     ; 224 	LCD_WRITE_COMMAND( 0x215, 0x0000 );
3684  0231 5f            	clrw	x
3685  0232 89            	pushw	x
3686  0233 ae0215        	ldw	x,#533
3687  0236 cd009c        	call	_LCD_WRITE_COMMAND
3689  0239 85            	popw	x
3690                     ; 225 	LCD_WRITE_COMMAND( 0x216, 0x0000 );
3692  023a 5f            	clrw	x
3693  023b 89            	pushw	x
3694  023c ae0216        	ldw	x,#534
3695  023f cd009c        	call	_LCD_WRITE_COMMAND
3697  0242 85            	popw	x
3698                     ; 226 	LCD_WRITE_COMMAND( 0x217, 0x0000 );
3700  0243 5f            	clrw	x
3701  0244 89            	pushw	x
3702  0245 ae0217        	ldw	x,#535
3703  0248 cd009c        	call	_LCD_WRITE_COMMAND
3705  024b 85            	popw	x
3706                     ; 229 	LCD_WRITE_COMMAND( 0x300, 0x5343);
3708  024c ae5343        	ldw	x,#21315
3709  024f 89            	pushw	x
3710  0250 ae0300        	ldw	x,#768
3711  0253 cd009c        	call	_LCD_WRITE_COMMAND
3713  0256 85            	popw	x
3714                     ; 230 	LCD_WRITE_COMMAND( 0x301, 0x1021);
3716  0257 ae1021        	ldw	x,#4129
3717  025a 89            	pushw	x
3718  025b ae0301        	ldw	x,#769
3719  025e cd009c        	call	_LCD_WRITE_COMMAND
3721  0261 85            	popw	x
3722                     ; 231 	LCD_WRITE_COMMAND( 0x302, 0x0003);
3724  0262 ae0003        	ldw	x,#3
3725  0265 89            	pushw	x
3726  0266 ae0302        	ldw	x,#770
3727  0269 cd009c        	call	_LCD_WRITE_COMMAND
3729  026c 85            	popw	x
3730                     ; 232 	LCD_WRITE_COMMAND( 0x303, 0x0011);
3732  026d ae0011        	ldw	x,#17
3733  0270 89            	pushw	x
3734  0271 ae0303        	ldw	x,#771
3735  0274 cd009c        	call	_LCD_WRITE_COMMAND
3737  0277 85            	popw	x
3738                     ; 233 	LCD_WRITE_COMMAND( 0x304, 0x050a);
3740  0278 ae050a        	ldw	x,#1290
3741  027b 89            	pushw	x
3742  027c ae0304        	ldw	x,#772
3743  027f cd009c        	call	_LCD_WRITE_COMMAND
3745  0282 85            	popw	x
3746                     ; 234 	LCD_WRITE_COMMAND( 0x305, 0x4342);
3748  0283 ae4342        	ldw	x,#17218
3749  0286 89            	pushw	x
3750  0287 ae0305        	ldw	x,#773
3751  028a cd009c        	call	_LCD_WRITE_COMMAND
3753  028d 85            	popw	x
3754                     ; 235 	LCD_WRITE_COMMAND( 0x306, 0x1100);
3756  028e ae1100        	ldw	x,#4352
3757  0291 89            	pushw	x
3758  0292 ae0306        	ldw	x,#774
3759  0295 cd009c        	call	_LCD_WRITE_COMMAND
3761  0298 85            	popw	x
3762                     ; 236 	LCD_WRITE_COMMAND( 0x307, 0x0003);
3764  0299 ae0003        	ldw	x,#3
3765  029c 89            	pushw	x
3766  029d ae0307        	ldw	x,#775
3767  02a0 cd009c        	call	_LCD_WRITE_COMMAND
3769  02a3 85            	popw	x
3770                     ; 237 	LCD_WRITE_COMMAND( 0x308, 0x1201);
3772  02a4 ae1201        	ldw	x,#4609
3773  02a7 89            	pushw	x
3774  02a8 ae0308        	ldw	x,#776
3775  02ab cd009c        	call	_LCD_WRITE_COMMAND
3777  02ae 85            	popw	x
3778                     ; 238 	LCD_WRITE_COMMAND( 0x309, 0x050a);
3780  02af ae050a        	ldw	x,#1290
3781  02b2 89            	pushw	x
3782  02b3 ae0309        	ldw	x,#777
3783  02b6 cd009c        	call	_LCD_WRITE_COMMAND
3785  02b9 85            	popw	x
3786                     ; 241 	LCD_WRITE_COMMAND( 0x400, 0x4027 );
3788  02ba ae4027        	ldw	x,#16423
3789  02bd 89            	pushw	x
3790  02be ae0400        	ldw	x,#1024
3791  02c1 cd009c        	call	_LCD_WRITE_COMMAND
3793  02c4 85            	popw	x
3794                     ; 242 	LCD_WRITE_COMMAND( 0x401, 0x0000 );
3796  02c5 5f            	clrw	x
3797  02c6 89            	pushw	x
3798  02c7 ae0401        	ldw	x,#1025
3799  02ca cd009c        	call	_LCD_WRITE_COMMAND
3801  02cd 85            	popw	x
3802                     ; 243 	LCD_WRITE_COMMAND( 0x402, 0x0000 );	/* First screen drive position (1) */   	
3804  02ce 5f            	clrw	x
3805  02cf 89            	pushw	x
3806  02d0 ae0402        	ldw	x,#1026
3807  02d3 cd009c        	call	_LCD_WRITE_COMMAND
3809  02d6 85            	popw	x
3810                     ; 244 	LCD_WRITE_COMMAND( 0x403, 0x013f );	/* First screen drive position (2) */   	
3812  02d7 ae013f        	ldw	x,#319
3813  02da 89            	pushw	x
3814  02db ae0403        	ldw	x,#1027
3815  02de cd009c        	call	_LCD_WRITE_COMMAND
3817  02e1 85            	popw	x
3818                     ; 245 	LCD_WRITE_COMMAND( 0x404, 0x0000 );
3820  02e2 5f            	clrw	x
3821  02e3 89            	pushw	x
3822  02e4 ae0404        	ldw	x,#1028
3823  02e7 cd009c        	call	_LCD_WRITE_COMMAND
3825  02ea 85            	popw	x
3826                     ; 247 	LCD_WRITE_COMMAND( 0x200, 0x0000 );
3828  02eb 5f            	clrw	x
3829  02ec 89            	pushw	x
3830  02ed ae0200        	ldw	x,#512
3831  02f0 cd009c        	call	_LCD_WRITE_COMMAND
3833  02f3 85            	popw	x
3834                     ; 248 	LCD_WRITE_COMMAND( 0x201, 0x0000 );
3836  02f4 5f            	clrw	x
3837  02f5 89            	pushw	x
3838  02f6 ae0201        	ldw	x,#513
3839  02f9 cd009c        	call	_LCD_WRITE_COMMAND
3841  02fc 85            	popw	x
3842                     ; 250 	LCD_WRITE_COMMAND( 0x100, 0x7120 );
3844  02fd ae7120        	ldw	x,#28960
3845  0300 89            	pushw	x
3846  0301 ae0100        	ldw	x,#256
3847  0304 cd009c        	call	_LCD_WRITE_COMMAND
3849  0307 85            	popw	x
3850                     ; 251 	LCD_WRITE_COMMAND( 0x007, 0x0103 );
3852  0308 ae0103        	ldw	x,#259
3853  030b 89            	pushw	x
3854  030c ae0007        	ldw	x,#7
3855  030f cd009c        	call	_LCD_WRITE_COMMAND
3857  0312 85            	popw	x
3858                     ; 252 	delay_us( 10 );
3860  0313 ae000a        	ldw	x,#10
3861  0316 cd0000        	call	_delay_us
3863                     ; 253 	LCD_WRITE_COMMAND( 0x007, 0x0113 );
3865  0319 ae0113        	ldw	x,#275
3866  031c 89            	pushw	x
3867  031d ae0007        	ldw	x,#7
3868  0320 cd009c        	call	_LCD_WRITE_COMMAND
3870  0323 85            	popw	x
3871                     ; 256 	delay_us(20);
3873  0324 ae0014        	ldw	x,#20
3874  0327 cd0000        	call	_delay_us
3876                     ; 258 	lcd_clear_screen(RED);
3878  032a aef800        	ldw	x,#63488
3879  032d ad01          	call	_lcd_clear_screen
3881                     ; 259 }
3884  032f 81            	ret
3941                     ; 270 void lcd_clear_screen(unsigned int color_background)
3941                     ; 271 {
3942                     	switch	.text
3943  0330               _lcd_clear_screen:
3945  0330 89            	pushw	x
3946  0331 5204          	subw	sp,#4
3947       00000004      OFST:	set	4
3950                     ; 274 	LCD_WRITE_COMMAND(0x210,0x00);
3952  0333 5f            	clrw	x
3953  0334 89            	pushw	x
3954  0335 ae0210        	ldw	x,#528
3955  0338 cd009c        	call	_LCD_WRITE_COMMAND
3957  033b 85            	popw	x
3958                     ; 275 	LCD_WRITE_COMMAND(0x212,0x0000);
3960  033c 5f            	clrw	x
3961  033d 89            	pushw	x
3962  033e ae0212        	ldw	x,#530
3963  0341 cd009c        	call	_LCD_WRITE_COMMAND
3965  0344 85            	popw	x
3966                     ; 276 	LCD_WRITE_COMMAND(0x211,0xEF);
3968  0345 ae00ef        	ldw	x,#239
3969  0348 89            	pushw	x
3970  0349 ae0211        	ldw	x,#529
3971  034c cd009c        	call	_LCD_WRITE_COMMAND
3973  034f 85            	popw	x
3974                     ; 277 	LCD_WRITE_COMMAND(0x213,0x013F);
3976  0350 ae013f        	ldw	x,#319
3977  0353 89            	pushw	x
3978  0354 ae0213        	ldw	x,#531
3979  0357 cd009c        	call	_LCD_WRITE_COMMAND
3981  035a 85            	popw	x
3982                     ; 280 	LCD_WRITE_COMMAND(0x200,0x0000);
3984  035b 5f            	clrw	x
3985  035c 89            	pushw	x
3986  035d ae0200        	ldw	x,#512
3987  0360 cd009c        	call	_LCD_WRITE_COMMAND
3989  0363 85            	popw	x
3990                     ; 281 	LCD_WRITE_COMMAND(0x201,0x0000);
3992  0364 5f            	clrw	x
3993  0365 89            	pushw	x
3994  0366 ae0201        	ldw	x,#513
3995  0369 cd009c        	call	_LCD_WRITE_COMMAND
3997  036c 85            	popw	x
3998                     ; 283 	LCD_RS_L();
4000  036d 72195014      	bres	_PE_ODR,#4
4001                     ; 284 	LCD_WRITE_REG(0x202);	//RAM Write index
4004  0371 ae0202        	ldw	x,#514
4005  0374 cd0047        	call	_LCD_WRITE_REG
4007                     ; 285 	LCD_CS_L();
4009  0377 72155023      	bres	_PH_ODR,#2
4010                     ; 287 	for(i=0;i<320;i++)
4013  037b 5f            	clrw	x
4014  037c 1f01          	ldw	(OFST-3,sp),x
4015  037e               L1222:
4016                     ; 289 		for(j=0;j<240;j++)
4018  037e 5f            	clrw	x
4019  037f 1f03          	ldw	(OFST-1,sp),x
4020  0381               L7222:
4021                     ; 291 		  LCD_WRITE_DATA( color_background );
4023  0381 1e05          	ldw	x,(OFST+1,sp)
4024  0383 cd00c8        	call	_LCD_WRITE_DATA
4026                     ; 289 		for(j=0;j<240;j++)
4028  0386 1e03          	ldw	x,(OFST-1,sp)
4029  0388 1c0001        	addw	x,#1
4030  038b 1f03          	ldw	(OFST-1,sp),x
4033  038d 1e03          	ldw	x,(OFST-1,sp)
4034  038f a300f0        	cpw	x,#240
4035  0392 25ed          	jrult	L7222
4036                     ; 287 	for(i=0;i<320;i++)
4038  0394 1e01          	ldw	x,(OFST-3,sp)
4039  0396 1c0001        	addw	x,#1
4040  0399 1f01          	ldw	(OFST-3,sp),x
4043  039b 1e01          	ldw	x,(OFST-3,sp)
4044  039d a30140        	cpw	x,#320
4045  03a0 25dc          	jrult	L1222
4046                     ; 294 	LCD_RS_L();
4048  03a2 72195014      	bres	_PE_ODR,#4
4049                     ; 295 	LCD_CS_H();
4052  03a6 72145023      	bset	_PH_ODR,#2
4053                     ; 296 }
4057  03aa 5b06          	addw	sp,#6
4058  03ac 81            	ret
4151                     ; 309 void lcd_clear_area(unsigned int color_front, 
4151                     ; 310                     unsigned char x, 
4151                     ; 311                     unsigned int y, 
4151                     ; 312                     unsigned int width, 
4151                     ; 313                     unsigned height)
4151                     ; 314 {
4152                     	switch	.text
4153  03ad               _lcd_clear_area:
4155  03ad 89            	pushw	x
4156  03ae 5204          	subw	sp,#4
4157       00000004      OFST:	set	4
4160                     ; 317 	LCD_WRITE_COMMAND( 0x210, x ); 	//x start point
4162  03b0 7b09          	ld	a,(OFST+5,sp)
4163  03b2 5f            	clrw	x
4164  03b3 97            	ld	xl,a
4165  03b4 89            	pushw	x
4166  03b5 ae0210        	ldw	x,#528
4167  03b8 cd009c        	call	_LCD_WRITE_COMMAND
4169  03bb 85            	popw	x
4170                     ; 318 	LCD_WRITE_COMMAND( 0x212, y ); 	//y start point
4172  03bc 1e0a          	ldw	x,(OFST+6,sp)
4173  03be 89            	pushw	x
4174  03bf ae0212        	ldw	x,#530
4175  03c2 cd009c        	call	_LCD_WRITE_COMMAND
4177  03c5 85            	popw	x
4178                     ; 319 	LCD_WRITE_COMMAND( 0x211, x + width - 1 );	//x end point
4180  03c6 7b09          	ld	a,(OFST+5,sp)
4181  03c8 5f            	clrw	x
4182  03c9 97            	ld	xl,a
4183  03ca 72fb0c        	addw	x,(OFST+8,sp)
4184  03cd 5a            	decw	x
4185  03ce 89            	pushw	x
4186  03cf ae0211        	ldw	x,#529
4187  03d2 cd009c        	call	_LCD_WRITE_COMMAND
4189  03d5 85            	popw	x
4190                     ; 320 	LCD_WRITE_COMMAND( 0x213, y + height - 1 );	//y end point
4192  03d6 1e0a          	ldw	x,(OFST+6,sp)
4193  03d8 72fb0e        	addw	x,(OFST+10,sp)
4194  03db 5a            	decw	x
4195  03dc 89            	pushw	x
4196  03dd ae0213        	ldw	x,#531
4197  03e0 cd009c        	call	_LCD_WRITE_COMMAND
4199  03e3 85            	popw	x
4200                     ; 322 	LCD_WRITE_COMMAND( 0x200, x );
4202  03e4 7b09          	ld	a,(OFST+5,sp)
4203  03e6 5f            	clrw	x
4204  03e7 97            	ld	xl,a
4205  03e8 89            	pushw	x
4206  03e9 ae0200        	ldw	x,#512
4207  03ec cd009c        	call	_LCD_WRITE_COMMAND
4209  03ef 85            	popw	x
4210                     ; 323 	LCD_WRITE_COMMAND( 0x201, y );
4212  03f0 1e0a          	ldw	x,(OFST+6,sp)
4213  03f2 89            	pushw	x
4214  03f3 ae0201        	ldw	x,#513
4215  03f6 cd009c        	call	_LCD_WRITE_COMMAND
4217  03f9 85            	popw	x
4218                     ; 325 	LCD_RS_L();
4220  03fa 72195014      	bres	_PE_ODR,#4
4221                     ; 326 	LCD_WRITE_REG(0x202);	//RAM Write index
4224  03fe ae0202        	ldw	x,#514
4225  0401 cd0047        	call	_LCD_WRITE_REG
4227                     ; 327 	LCD_CS_L();
4229  0404 72155023      	bres	_PH_ODR,#2
4230                     ; 329 	for( i = 0; i < height; i++ )
4233  0408 5f            	clrw	x
4234  0409 1f01          	ldw	(OFST-3,sp),x
4236  040b 201e          	jra	L7032
4237  040d               L3032:
4238                     ; 331 		for( j = 0; j < width; j++ )
4240  040d 5f            	clrw	x
4241  040e 1f03          	ldw	(OFST-1,sp),x
4243  0410 200c          	jra	L7132
4244  0412               L3132:
4245                     ; 333 			LCD_WRITE_DATA( color_front );
4247  0412 1e05          	ldw	x,(OFST+1,sp)
4248  0414 cd00c8        	call	_LCD_WRITE_DATA
4250                     ; 331 		for( j = 0; j < width; j++ )
4252  0417 1e03          	ldw	x,(OFST-1,sp)
4253  0419 1c0001        	addw	x,#1
4254  041c 1f03          	ldw	(OFST-1,sp),x
4255  041e               L7132:
4258  041e 1e03          	ldw	x,(OFST-1,sp)
4259  0420 130c          	cpw	x,(OFST+8,sp)
4260  0422 25ee          	jrult	L3132
4261                     ; 329 	for( i = 0; i < height; i++ )
4263  0424 1e01          	ldw	x,(OFST-3,sp)
4264  0426 1c0001        	addw	x,#1
4265  0429 1f01          	ldw	(OFST-3,sp),x
4266  042b               L7032:
4269  042b 1e01          	ldw	x,(OFST-3,sp)
4270  042d 130e          	cpw	x,(OFST+10,sp)
4271  042f 25dc          	jrult	L3032
4272                     ; 337 	LCD_CS_H();
4274  0431 72145023      	bset	_PH_ODR,#2
4275                     ; 338 }
4279  0435 5b06          	addw	sp,#6
4280  0437 81            	ret
4324                     ; 347 void lcd_set_cursor(unsigned char x, unsigned int y)
4324                     ; 348 {
4325                     	switch	.text
4326  0438               _lcd_set_cursor:
4328  0438 88            	push	a
4329       00000000      OFST:	set	0
4332                     ; 349   	if( (x > 320) || (y > 240) )
4334  0439 1e04          	ldw	x,(OFST+4,sp)
4335  043b a300f1        	cpw	x,#241
4336  043e 2502          	jrult	L5432
4337                     ; 351 		return;
4340  0440 84            	pop	a
4341  0441 81            	ret
4342  0442               L5432:
4343                     ; 353 	LCD_WRITE_COMMAND( 0x200, x );
4345  0442 7b01          	ld	a,(OFST+1,sp)
4346  0444 5f            	clrw	x
4347  0445 97            	ld	xl,a
4348  0446 89            	pushw	x
4349  0447 ae0200        	ldw	x,#512
4350  044a cd009c        	call	_LCD_WRITE_COMMAND
4352  044d 85            	popw	x
4353                     ; 354 	LCD_WRITE_COMMAND( 0x201, y );
4355  044e 1e04          	ldw	x,(OFST+4,sp)
4356  0450 89            	pushw	x
4357  0451 ae0201        	ldw	x,#513
4358  0454 cd009c        	call	_LCD_WRITE_COMMAND
4360  0457 85            	popw	x
4361                     ; 355 }
4364  0458 84            	pop	a
4365  0459 81            	ret
4478                     ; 365 void lcd_display_char(  unsigned char ch_asc, 
4478                     ; 366                         unsigned int color_front,
4478                     ; 367                         unsigned int color_background, 
4478                     ; 368                         unsigned char postion_x, 
4478                     ; 369                         unsigned char postion_y)
4478                     ; 370 {
4479                     	switch	.text
4480  045a               _lcd_display_char:
4482  045a 88            	push	a
4483  045b 5205          	subw	sp,#5
4484       00000005      OFST:	set	5
4487                     ; 372 	const unsigned char *p = 0;
4489  045d 1e01          	ldw	x,(OFST-4,sp)
4490                     ; 374 	LCD_WRITE_COMMAND(0x210,postion_x*8); 	//x start point
4492  045f 7b0d          	ld	a,(OFST+8,sp)
4493  0461 97            	ld	xl,a
4494  0462 a608          	ld	a,#8
4495  0464 42            	mul	x,a
4496  0465 89            	pushw	x
4497  0466 ae0210        	ldw	x,#528
4498  0469 cd009c        	call	_LCD_WRITE_COMMAND
4500  046c 85            	popw	x
4501                     ; 375 	LCD_WRITE_COMMAND(0x212,postion_y*16); 	//y start point
4503  046d 7b0e          	ld	a,(OFST+9,sp)
4504  046f 97            	ld	xl,a
4505  0470 a610          	ld	a,#16
4506  0472 42            	mul	x,a
4507  0473 89            	pushw	x
4508  0474 ae0212        	ldw	x,#530
4509  0477 cd009c        	call	_LCD_WRITE_COMMAND
4511  047a 85            	popw	x
4512                     ; 376 	LCD_WRITE_COMMAND(0x211,postion_x*8+7);	//x end point
4514  047b 7b0d          	ld	a,(OFST+8,sp)
4515  047d 97            	ld	xl,a
4516  047e a608          	ld	a,#8
4517  0480 42            	mul	x,a
4518  0481 1c0007        	addw	x,#7
4519  0484 89            	pushw	x
4520  0485 ae0211        	ldw	x,#529
4521  0488 cd009c        	call	_LCD_WRITE_COMMAND
4523  048b 85            	popw	x
4524                     ; 377 	LCD_WRITE_COMMAND(0x213,postion_y*16+15);	//y end point
4526  048c 7b0e          	ld	a,(OFST+9,sp)
4527  048e 97            	ld	xl,a
4528  048f a610          	ld	a,#16
4529  0491 42            	mul	x,a
4530  0492 1c000f        	addw	x,#15
4531  0495 89            	pushw	x
4532  0496 ae0213        	ldw	x,#531
4533  0499 cd009c        	call	_LCD_WRITE_COMMAND
4535  049c 85            	popw	x
4536                     ; 379 	LCD_WRITE_COMMAND(0x200,postion_x*8);	//RAM X address(0 ~ FF, actually 0 ~ EF)	
4538  049d 7b0d          	ld	a,(OFST+8,sp)
4539  049f 97            	ld	xl,a
4540  04a0 a608          	ld	a,#8
4541  04a2 42            	mul	x,a
4542  04a3 89            	pushw	x
4543  04a4 ae0200        	ldw	x,#512
4544  04a7 cd009c        	call	_LCD_WRITE_COMMAND
4546  04aa 85            	popw	x
4547                     ; 380 	LCD_WRITE_COMMAND(0x201,postion_y*16);	//RAM Y address(0 ~ 1FF, actually 0 ~ 13F)
4549  04ab 7b0e          	ld	a,(OFST+9,sp)
4550  04ad 97            	ld	xl,a
4551  04ae a610          	ld	a,#16
4552  04b0 42            	mul	x,a
4553  04b1 89            	pushw	x
4554  04b2 ae0201        	ldw	x,#513
4555  04b5 cd009c        	call	_LCD_WRITE_COMMAND
4557  04b8 85            	popw	x
4558                     ; 382 	LCD_RS_L();
4560  04b9 72195014      	bres	_PE_ODR,#4
4561                     ; 383 	LCD_WRITE_REG(0x202);	//RAM Write index
4564  04bd ae0202        	ldw	x,#514
4565  04c0 cd0047        	call	_LCD_WRITE_REG
4567                     ; 384 	LCD_CS_L();
4569  04c3 72155023      	bres	_PH_ODR,#2
4570                     ; 386 	p = ascii;
4573  04c7 ae0000        	ldw	x,#_ascii
4574  04ca 1f01          	ldw	(OFST-4,sp),x
4575                     ; 387 	p += ch_asc*16;
4577  04cc 7b06          	ld	a,(OFST+1,sp)
4578  04ce 97            	ld	xl,a
4579  04cf a610          	ld	a,#16
4580  04d1 42            	mul	x,a
4581  04d2 72fb01        	addw	x,(OFST-4,sp)
4582  04d5 1f01          	ldw	(OFST-4,sp),x
4583                     ; 388 	for(j=0;j<16;j++)
4585  04d7 0f03          	clr	(OFST-2,sp)
4586  04d9               L5242:
4587                     ; 390 		b=*(p+j);
4589  04d9 7b01          	ld	a,(OFST-4,sp)
4590  04db 97            	ld	xl,a
4591  04dc 7b02          	ld	a,(OFST-3,sp)
4592  04de 1b03          	add	a,(OFST-2,sp)
4593  04e0 2401          	jrnc	L43
4594  04e2 5c            	incw	x
4595  04e3               L43:
4596  04e3 02            	rlwa	x,a
4597  04e4 f6            	ld	a,(x)
4598  04e5 6b05          	ld	(OFST+0,sp),a
4599                     ; 391 		for(i=0;i<8;i++)
4601  04e7 0f04          	clr	(OFST-1,sp)
4602  04e9               L3342:
4603                     ; 393 			if( b & 0x80 )
4605  04e9 7b05          	ld	a,(OFST+0,sp)
4606  04eb a580          	bcp	a,#128
4607  04ed 2707          	jreq	L1442
4608                     ; 395 				LCD_WRITE_DATA(color_front);
4610  04ef 1e09          	ldw	x,(OFST+4,sp)
4611  04f1 cd00c8        	call	_LCD_WRITE_DATA
4614  04f4 2005          	jra	L3442
4615  04f6               L1442:
4616                     ; 399 				LCD_WRITE_DATA(color_background);
4618  04f6 1e0b          	ldw	x,(OFST+6,sp)
4619  04f8 cd00c8        	call	_LCD_WRITE_DATA
4621  04fb               L3442:
4622                     ; 401 			b=b<<1;			
4624  04fb 0805          	sll	(OFST+0,sp)
4625                     ; 391 		for(i=0;i<8;i++)
4627  04fd 0c04          	inc	(OFST-1,sp)
4630  04ff 7b04          	ld	a,(OFST-1,sp)
4631  0501 a108          	cp	a,#8
4632  0503 25e4          	jrult	L3342
4633                     ; 388 	for(j=0;j<16;j++)
4635  0505 0c03          	inc	(OFST-2,sp)
4638  0507 7b03          	ld	a,(OFST-2,sp)
4639  0509 a110          	cp	a,#16
4640  050b 25cc          	jrult	L5242
4641                     ; 405 	LCD_CS_H();
4643  050d 72145023      	bset	_PH_ODR,#2
4644                     ; 406 }
4648  0511 5b06          	addw	sp,#6
4649  0513 81            	ret
4721                     ; 418 void lcd_display_string(unsigned char *str, 
4721                     ; 419 						unsigned int color_front, 
4721                     ; 420 						unsigned int color_background, 
4721                     ; 421 						unsigned char x, 
4721                     ; 422 						unsigned char y )
4721                     ; 423 {
4722                     	switch	.text
4723  0514               _lcd_display_string:
4725  0514 89            	pushw	x
4726       00000000      OFST:	set	0
4729  0515 202f          	jra	L5052
4730  0517               L3052:
4731                     ; 426 		lcd_display_char( *str, color_front, color_background, x, y);
4733  0517 7b0a          	ld	a,(OFST+10,sp)
4734  0519 88            	push	a
4735  051a 7b0a          	ld	a,(OFST+10,sp)
4736  051c 88            	push	a
4737  051d 1e09          	ldw	x,(OFST+9,sp)
4738  051f 89            	pushw	x
4739  0520 1e09          	ldw	x,(OFST+9,sp)
4740  0522 89            	pushw	x
4741  0523 1e07          	ldw	x,(OFST+7,sp)
4742  0525 f6            	ld	a,(x)
4743  0526 cd045a        	call	_lcd_display_char
4745  0529 5b06          	addw	sp,#6
4746                     ; 427 		if(++x>=30)
4748  052b 0c09          	inc	(OFST+9,sp)
4749  052d 7b09          	ld	a,(OFST+9,sp)
4750  052f a11e          	cp	a,#30
4751  0531 250c          	jrult	L1152
4752                     ; 429 			x=0;
4754  0533 0f09          	clr	(OFST+9,sp)
4755                     ; 430 			if(++y>=20)
4757  0535 0c0a          	inc	(OFST+10,sp)
4758  0537 7b0a          	ld	a,(OFST+10,sp)
4759  0539 a114          	cp	a,#20
4760  053b 2502          	jrult	L1152
4761                     ; 432 				y=0;
4763  053d 0f0a          	clr	(OFST+10,sp)
4764  053f               L1152:
4765                     ; 435 		str ++;
4767  053f 1e01          	ldw	x,(OFST+1,sp)
4768  0541 1c0001        	addw	x,#1
4769  0544 1f01          	ldw	(OFST+1,sp),x
4770  0546               L5052:
4771                     ; 424 	while (*str) 
4773  0546 1e01          	ldw	x,(OFST+1,sp)
4774  0548 7d            	tnz	(x)
4775  0549 26cc          	jrne	L3052
4776                     ; 437 }
4779  054b 85            	popw	x
4780  054c 81            	ret
4893                     ; 453 void lcd_display_GB2312( unsigned char gb, 
4893                     ; 454 						unsigned int color_front, 
4893                     ; 455 						unsigned int color_background, 
4893                     ; 456 						unsigned char postion_x, 
4893                     ; 457 						unsigned char postion_y )
4893                     ; 458 {
4894                     	switch	.text
4895  054d               _lcd_display_GB2312:
4897  054d 88            	push	a
4898  054e 5205          	subw	sp,#5
4899       00000005      OFST:	set	5
4902                     ; 462 	LCD_WRITE_COMMAND(0x210,postion_x*8); 	//x start point
4904  0550 7b0d          	ld	a,(OFST+8,sp)
4905  0552 97            	ld	xl,a
4906  0553 a608          	ld	a,#8
4907  0555 42            	mul	x,a
4908  0556 89            	pushw	x
4909  0557 ae0210        	ldw	x,#528
4910  055a cd009c        	call	_LCD_WRITE_COMMAND
4912  055d 85            	popw	x
4913                     ; 463 	LCD_WRITE_COMMAND(0x212,postion_y*16); 	//y start point
4915  055e 7b0e          	ld	a,(OFST+9,sp)
4916  0560 97            	ld	xl,a
4917  0561 a610          	ld	a,#16
4918  0563 42            	mul	x,a
4919  0564 89            	pushw	x
4920  0565 ae0212        	ldw	x,#530
4921  0568 cd009c        	call	_LCD_WRITE_COMMAND
4923  056b 85            	popw	x
4924                     ; 464 	LCD_WRITE_COMMAND(0x211,postion_x*8+7);	//x end point
4926  056c 7b0d          	ld	a,(OFST+8,sp)
4927  056e 97            	ld	xl,a
4928  056f a608          	ld	a,#8
4929  0571 42            	mul	x,a
4930  0572 1c0007        	addw	x,#7
4931  0575 89            	pushw	x
4932  0576 ae0211        	ldw	x,#529
4933  0579 cd009c        	call	_LCD_WRITE_COMMAND
4935  057c 85            	popw	x
4936                     ; 465 	LCD_WRITE_COMMAND(0x213,postion_y*16+15);	//y end point
4938  057d 7b0e          	ld	a,(OFST+9,sp)
4939  057f 97            	ld	xl,a
4940  0580 a610          	ld	a,#16
4941  0582 42            	mul	x,a
4942  0583 1c000f        	addw	x,#15
4943  0586 89            	pushw	x
4944  0587 ae0213        	ldw	x,#531
4945  058a cd009c        	call	_LCD_WRITE_COMMAND
4947  058d 85            	popw	x
4948                     ; 467 	LCD_WRITE_COMMAND(0x200,postion_x*8);	
4950  058e 7b0d          	ld	a,(OFST+8,sp)
4951  0590 97            	ld	xl,a
4952  0591 a608          	ld	a,#8
4953  0593 42            	mul	x,a
4954  0594 89            	pushw	x
4955  0595 ae0200        	ldw	x,#512
4956  0598 cd009c        	call	_LCD_WRITE_COMMAND
4958  059b 85            	popw	x
4959                     ; 468 	LCD_WRITE_COMMAND(0x201,postion_y*16);
4961  059c 7b0e          	ld	a,(OFST+9,sp)
4962  059e 97            	ld	xl,a
4963  059f a610          	ld	a,#16
4964  05a1 42            	mul	x,a
4965  05a2 89            	pushw	x
4966  05a3 ae0201        	ldw	x,#513
4967  05a6 cd009c        	call	_LCD_WRITE_COMMAND
4969  05a9 85            	popw	x
4970                     ; 470 	LCD_RS_L();
4972  05aa 72195014      	bres	_PE_ODR,#4
4973                     ; 471 	LCD_WRITE_REG(0x202);	//RAM Write index
4976  05ae ae0202        	ldw	x,#514
4977  05b1 cd0047        	call	_LCD_WRITE_REG
4979                     ; 472 	LCD_CS_L();
4981  05b4 72155023      	bres	_PH_ODR,#2
4982                     ; 474 	p = (unsigned char *)GB2312;
4985  05b8 ae0000        	ldw	x,#_GB2312
4986  05bb 1f01          	ldw	(OFST-4,sp),x
4987                     ; 475 	p += gb*32;
4989  05bd 7b06          	ld	a,(OFST+1,sp)
4990  05bf 97            	ld	xl,a
4991  05c0 a620          	ld	a,#32
4992  05c2 42            	mul	x,a
4993  05c3 72fb01        	addw	x,(OFST-4,sp)
4994  05c6 1f01          	ldw	(OFST-4,sp),x
4995                     ; 476 	for(j=0;j<32;j++)
4997  05c8 0f03          	clr	(OFST-2,sp)
4998  05ca               L3752:
4999                     ; 478 		b=*(p+j);
5001  05ca 7b01          	ld	a,(OFST-4,sp)
5002  05cc 97            	ld	xl,a
5003  05cd 7b02          	ld	a,(OFST-3,sp)
5004  05cf 1b03          	add	a,(OFST-2,sp)
5005  05d1 2401          	jrnc	L24
5006  05d3 5c            	incw	x
5007  05d4               L24:
5008  05d4 02            	rlwa	x,a
5009  05d5 f6            	ld	a,(x)
5010  05d6 6b05          	ld	(OFST+0,sp),a
5011                     ; 479 		for(i=0;i<8;i++)
5013  05d8 0f04          	clr	(OFST-1,sp)
5014  05da               L1062:
5015                     ; 481 			if(b&0x80)
5017  05da 7b05          	ld	a,(OFST+0,sp)
5018  05dc a580          	bcp	a,#128
5019  05de 2707          	jreq	L7062
5020                     ; 483 				LCD_WRITE_DATA(color_front);
5022  05e0 1e09          	ldw	x,(OFST+4,sp)
5023  05e2 cd00c8        	call	_LCD_WRITE_DATA
5026  05e5 2005          	jra	L1162
5027  05e7               L7062:
5028                     ; 487 				LCD_WRITE_DATA(color_background);
5030  05e7 1e0b          	ldw	x,(OFST+6,sp)
5031  05e9 cd00c8        	call	_LCD_WRITE_DATA
5033  05ec               L1162:
5034                     ; 489 			b=b<<1;
5036  05ec 0805          	sll	(OFST+0,sp)
5037                     ; 479 		for(i=0;i<8;i++)
5039  05ee 0c04          	inc	(OFST-1,sp)
5042  05f0 7b04          	ld	a,(OFST-1,sp)
5043  05f2 a108          	cp	a,#8
5044  05f4 25e4          	jrult	L1062
5045                     ; 476 	for(j=0;j<32;j++)
5047  05f6 0c03          	inc	(OFST-2,sp)
5050  05f8 7b03          	ld	a,(OFST-2,sp)
5051  05fa a120          	cp	a,#32
5052  05fc 25cc          	jrult	L3752
5053                     ; 493 	LCD_CS_H();
5055  05fe 72145023      	bset	_PH_ODR,#2
5056                     ; 494 }
5060  0602 5b06          	addw	sp,#6
5061  0604 81            	ret
5164                     ; 503 void lcd_display_image( const unsigned char *img, 
5164                     ; 504 					unsigned char x, 
5164                     ; 505 					unsigned int y, 
5164                     ; 506 					unsigned int width, 
5164                     ; 507 					unsigned height )
5164                     ; 508 {
5165                     	switch	.text
5166  0605               _lcd_display_image:
5168  0605 89            	pushw	x
5169  0606 5206          	subw	sp,#6
5170       00000006      OFST:	set	6
5173                     ; 513 	LCD_WRITE_COMMAND( 0x210, x ); 	//x start point
5175  0608 7b0b          	ld	a,(OFST+5,sp)
5176  060a 5f            	clrw	x
5177  060b 97            	ld	xl,a
5178  060c 89            	pushw	x
5179  060d ae0210        	ldw	x,#528
5180  0610 cd009c        	call	_LCD_WRITE_COMMAND
5182  0613 85            	popw	x
5183                     ; 514 	LCD_WRITE_COMMAND( 0x212, y ); 	//y start point
5185  0614 1e0c          	ldw	x,(OFST+6,sp)
5186  0616 89            	pushw	x
5187  0617 ae0212        	ldw	x,#530
5188  061a cd009c        	call	_LCD_WRITE_COMMAND
5190  061d 85            	popw	x
5191                     ; 515 	LCD_WRITE_COMMAND( 0x211, x + width - 1 );	//x end point
5193  061e 7b0b          	ld	a,(OFST+5,sp)
5194  0620 5f            	clrw	x
5195  0621 97            	ld	xl,a
5196  0622 72fb0e        	addw	x,(OFST+8,sp)
5197  0625 5a            	decw	x
5198  0626 89            	pushw	x
5199  0627 ae0211        	ldw	x,#529
5200  062a cd009c        	call	_LCD_WRITE_COMMAND
5202  062d 85            	popw	x
5203                     ; 516 	LCD_WRITE_COMMAND( 0x213, y + height - 1 );	//y end point
5205  062e 1e0c          	ldw	x,(OFST+6,sp)
5206  0630 72fb10        	addw	x,(OFST+10,sp)
5207  0633 5a            	decw	x
5208  0634 89            	pushw	x
5209  0635 ae0213        	ldw	x,#531
5210  0638 cd009c        	call	_LCD_WRITE_COMMAND
5212  063b 85            	popw	x
5213                     ; 518 	LCD_WRITE_COMMAND( 0x200, x );
5215  063c 7b0b          	ld	a,(OFST+5,sp)
5216  063e 5f            	clrw	x
5217  063f 97            	ld	xl,a
5218  0640 89            	pushw	x
5219  0641 ae0200        	ldw	x,#512
5220  0644 cd009c        	call	_LCD_WRITE_COMMAND
5222  0647 85            	popw	x
5223                     ; 519 	LCD_WRITE_COMMAND( 0x201, y );
5225  0648 1e0c          	ldw	x,(OFST+6,sp)
5226  064a 89            	pushw	x
5227  064b ae0201        	ldw	x,#513
5228  064e cd009c        	call	_LCD_WRITE_COMMAND
5230  0651 85            	popw	x
5231                     ; 521 	LCD_RS_L();
5233  0652 72195014      	bres	_PE_ODR,#4
5234                     ; 522 	LCD_WRITE_REG(0x202);	//RAM Write index
5237  0656 ae0202        	ldw	x,#514
5238  0659 cd0047        	call	_LCD_WRITE_REG
5240                     ; 523 	LCD_CS_L();
5242  065c 72155023      	bres	_PH_ODR,#2
5243                     ; 526 	for( i = 0; i < height; i++ )
5246  0660 5f            	clrw	x
5247  0661 1f01          	ldw	(OFST-5,sp),x
5249  0663 2036          	jra	L1762
5250  0665               L5662:
5251                     ; 528 		for( j = 0; j < width; j++ )
5253  0665 5f            	clrw	x
5254  0666 1f05          	ldw	(OFST-1,sp),x
5256  0668 2024          	jra	L1072
5257  066a               L5762:
5258                     ; 532 			data16 = ( *(img + 1) << 8 ) | (*img);
5260  066a 1e07          	ldw	x,(OFST+1,sp)
5261  066c e601          	ld	a,(1,x)
5262  066e 5f            	clrw	x
5263  066f 97            	ld	xl,a
5264  0670 4f            	clr	a
5265  0671 02            	rlwa	x,a
5266  0672 01            	rrwa	x,a
5267  0673 1607          	ldw	y,(OFST+1,sp)
5268  0675 90fa          	or	a,(y)
5269  0677 02            	rlwa	x,a
5270  0678 1f03          	ldw	(OFST-3,sp),x
5271  067a 01            	rrwa	x,a
5272                     ; 533 			LCD_WRITE_DATA( data16 );
5274  067b 1e03          	ldw	x,(OFST-3,sp)
5275  067d cd00c8        	call	_LCD_WRITE_DATA
5277                     ; 534 			img += 2;
5279  0680 1e07          	ldw	x,(OFST+1,sp)
5280  0682 1c0002        	addw	x,#2
5281  0685 1f07          	ldw	(OFST+1,sp),x
5282                     ; 528 		for( j = 0; j < width; j++ )
5284  0687 1e05          	ldw	x,(OFST-1,sp)
5285  0689 1c0001        	addw	x,#1
5286  068c 1f05          	ldw	(OFST-1,sp),x
5287  068e               L1072:
5290  068e 1e05          	ldw	x,(OFST-1,sp)
5291  0690 130e          	cpw	x,(OFST+8,sp)
5292  0692 25d6          	jrult	L5762
5293                     ; 526 	for( i = 0; i < height; i++ )
5295  0694 1e01          	ldw	x,(OFST-5,sp)
5296  0696 1c0001        	addw	x,#1
5297  0699 1f01          	ldw	(OFST-5,sp),x
5298  069b               L1762:
5301  069b 1e01          	ldw	x,(OFST-5,sp)
5302  069d 1310          	cpw	x,(OFST+10,sp)
5303  069f 25c4          	jrult	L5662
5304                     ; 537 	LCD_CS_H();
5306  06a1 72145023      	bset	_PH_ODR,#2
5307                     ; 538 }
5311  06a5 5b08          	addw	sp,#8
5312  06a7 81            	ret
5315                     .const:	section	.text
5316  0000               _color:
5317  0000 f800          	dc.w	-2048
5318  0002 07e0          	dc.w	2016
5319  0004 001f          	dc.w	31
5320  0006 ffe0          	dc.w	-32
5321  0008 0000          	dc.w	0
5322  000a ffff          	dc.w	-1
5323  000c 07ff          	dc.w	2047
5324  000e f81f          	dc.w	-2017
5391                     ; 564 void lcd_display_test(void)
5391                     ; 565 {
5392                     	switch	.text
5393  06a8               _lcd_display_test:
5395  06a8 5207          	subw	sp,#7
5396       00000007      OFST:	set	7
5399                     ; 570 	lcd_clear_screen(RED);
5401  06aa aef800        	ldw	x,#63488
5402  06ad cd0330        	call	_lcd_clear_screen
5404                     ; 571     delay_us(60);
5406  06b0 ae003c        	ldw	x,#60
5407  06b3 cd0000        	call	_delay_us
5409                     ; 573 	LCD_WRITE_COMMAND(0x210,0x00);
5411  06b6 5f            	clrw	x
5412  06b7 89            	pushw	x
5413  06b8 ae0210        	ldw	x,#528
5414  06bb cd009c        	call	_LCD_WRITE_COMMAND
5416  06be 85            	popw	x
5417                     ; 574 	LCD_WRITE_COMMAND(0x212,0x0000);
5419  06bf 5f            	clrw	x
5420  06c0 89            	pushw	x
5421  06c1 ae0212        	ldw	x,#530
5422  06c4 cd009c        	call	_LCD_WRITE_COMMAND
5424  06c7 85            	popw	x
5425                     ; 575 	LCD_WRITE_COMMAND(0x211,0xEF);
5427  06c8 ae00ef        	ldw	x,#239
5428  06cb 89            	pushw	x
5429  06cc ae0211        	ldw	x,#529
5430  06cf cd009c        	call	_LCD_WRITE_COMMAND
5432  06d2 85            	popw	x
5433                     ; 576 	LCD_WRITE_COMMAND(0x213,0x013F);
5435  06d3 ae013f        	ldw	x,#319
5436  06d6 89            	pushw	x
5437  06d7 ae0213        	ldw	x,#531
5438  06da cd009c        	call	_LCD_WRITE_COMMAND
5440  06dd 85            	popw	x
5441                     ; 578 	LCD_WRITE_COMMAND(0x200,0x0000);
5443  06de 5f            	clrw	x
5444  06df 89            	pushw	x
5445  06e0 ae0200        	ldw	x,#512
5446  06e3 cd009c        	call	_LCD_WRITE_COMMAND
5448  06e6 85            	popw	x
5449                     ; 579 	LCD_WRITE_COMMAND(0x201,0x0000);
5451  06e7 5f            	clrw	x
5452  06e8 89            	pushw	x
5453  06e9 ae0201        	ldw	x,#513
5454  06ec cd009c        	call	_LCD_WRITE_COMMAND
5456  06ef 85            	popw	x
5457                     ; 581 	LCD_RS_L();
5459  06f0 72195014      	bres	_PE_ODR,#4
5460                     ; 582 	LCD_WRITE_REG(0x202);	//RAM Write index
5463  06f4 ae0202        	ldw	x,#514
5464  06f7 cd0047        	call	_LCD_WRITE_REG
5466                     ; 583 	LCD_CS_L();
5468  06fa 72155023      	bres	_PH_ODR,#2
5469                     ; 585 	for(n=0;n<8;n++)
5472  06fe 0f05          	clr	(OFST-2,sp)
5473  0700               L7372:
5474                     ; 587 		LCD_CS_L();
5476  0700 72155023      	bres	_PH_ODR,#2
5477                     ; 588 		LCD_RS_H();
5480  0704 72185014      	bset	_PE_ODR,#4
5481                     ; 589 		temp=color[n];
5484  0708 7b05          	ld	a,(OFST-2,sp)
5485  070a 5f            	clrw	x
5486  070b 97            	ld	xl,a
5487  070c 58            	sllw	x
5488  070d de0000        	ldw	x,(_color,x)
5489  0710 1f03          	ldw	(OFST-4,sp),x
5490                     ; 590 		for(num=40*240;num>0;num--)
5492  0712 ae2580        	ldw	x,#9600
5493  0715 1f06          	ldw	(OFST-1,sp),x
5494  0717               L5472:
5495                     ; 592 			LCD_WRITE_DATA(temp);
5497  0717 1e03          	ldw	x,(OFST-4,sp)
5498  0719 cd00c8        	call	_LCD_WRITE_DATA
5500                     ; 590 		for(num=40*240;num>0;num--)
5502  071c 1e06          	ldw	x,(OFST-1,sp)
5503  071e 1d0001        	subw	x,#1
5504  0721 1f06          	ldw	(OFST-1,sp),x
5507  0723 1e06          	ldw	x,(OFST-1,sp)
5508  0725 26f0          	jrne	L5472
5509                     ; 585 	for(n=0;n<8;n++)
5511  0727 0c05          	inc	(OFST-2,sp)
5514  0729 7b05          	ld	a,(OFST-2,sp)
5515  072b a108          	cp	a,#8
5516  072d 25d1          	jrult	L7372
5517                     ; 599 	for(n=0;n<8;n++)
5519  072f 0f05          	clr	(OFST-2,sp)
5520  0731               L3572:
5521                     ; 603 	    temp=color[n];
5523  0731 7b05          	ld	a,(OFST-2,sp)
5524  0733 5f            	clrw	x
5525  0734 97            	ld	xl,a
5526  0735 58            	sllw	x
5527  0736 de0000        	ldw	x,(_color,x)
5528  0739 1f03          	ldw	(OFST-4,sp),x
5529                     ; 604 		for(i=0;i<240;i++)
5531  073b 5f            	clrw	x
5532  073c 1f01          	ldw	(OFST-6,sp),x
5533  073e               L1672:
5534                     ; 606 			for(num=0;num<320;num++)
5536  073e 5f            	clrw	x
5537  073f 1f06          	ldw	(OFST-1,sp),x
5538  0741               L7672:
5539                     ; 608 		  		LCD_WRITE_DATA(temp);
5541  0741 1e03          	ldw	x,(OFST-4,sp)
5542  0743 cd00c8        	call	_LCD_WRITE_DATA
5544                     ; 606 			for(num=0;num<320;num++)
5546  0746 1e06          	ldw	x,(OFST-1,sp)
5547  0748 1c0001        	addw	x,#1
5548  074b 1f06          	ldw	(OFST-1,sp),x
5551  074d 1e06          	ldw	x,(OFST-1,sp)
5552  074f a30140        	cpw	x,#320
5553  0752 25ed          	jrult	L7672
5554                     ; 604 		for(i=0;i<240;i++)
5556  0754 1e01          	ldw	x,(OFST-6,sp)
5557  0756 1c0001        	addw	x,#1
5558  0759 1f01          	ldw	(OFST-6,sp),x
5561  075b 1e01          	ldw	x,(OFST-6,sp)
5562  075d a300f0        	cpw	x,#240
5563  0760 25dc          	jrult	L1672
5564                     ; 611 	delay_us(60);
5566  0762 ae003c        	ldw	x,#60
5567  0765 cd0000        	call	_delay_us
5569                     ; 599 	for(n=0;n<8;n++)
5571  0768 0c05          	inc	(OFST-2,sp)
5574  076a 7b05          	ld	a,(OFST-2,sp)
5575  076c a108          	cp	a,#8
5576  076e 25c1          	jrult	L3572
5577                     ; 613 	lcd_clear_screen(GREEN);
5579  0770 ae07ee        	ldw	x,#2030
5580  0773 cd0330        	call	_lcd_clear_screen
5582                     ; 614 	LCD_CS_H();	
5584  0776 72145023      	bset	_PH_ODR,#2
5585                     ; 615 	LCD_RS_H();
5588  077a 72185014      	bset	_PE_ODR,#4
5589                     ; 617 }
5593  077e 5b07          	addw	sp,#7
5594  0780 81            	ret
5648                     ; 619 void Swap(unsigned int *a , unsigned int *b)	//for BresenhamLine
5648                     ; 620 {
5649                     	switch	.text
5650  0781               _Swap:
5652  0781 89            	pushw	x
5653  0782 89            	pushw	x
5654       00000002      OFST:	set	2
5657                     ; 622 	tmp = *a ;
5659  0783 fe            	ldw	x,(x)
5660  0784 1f01          	ldw	(OFST-1,sp),x
5661                     ; 623 	*a = *b ;
5663  0786 1e07          	ldw	x,(OFST+5,sp)
5664  0788 1603          	ldw	y,(OFST+1,sp)
5665  078a 89            	pushw	x
5666  078b fe            	ldw	x,(x)
5667  078c 90ff          	ldw	(y),x
5668  078e 85            	popw	x
5669                     ; 624 	*b = tmp ;
5671  078f 1e07          	ldw	x,(OFST+5,sp)
5672  0791 1601          	ldw	y,(OFST-1,sp)
5673  0793 ff            	ldw	(x),y
5674                     ; 625 } 
5677  0794 5b04          	addw	sp,#4
5678  0796 81            	ret
5735                     ; 634 void lcd_draw_dot(unsigned int color_front,
5735                     ; 635                   unsigned char x,
5735                     ; 636                   unsigned int y)
5735                     ; 637 {
5736                     	switch	.text
5737  0797               _lcd_draw_dot:
5739  0797 89            	pushw	x
5740       00000000      OFST:	set	0
5743                     ; 639 	LCD_SEND_COMMAND(0x210,x);
5745  0798 7b05          	ld	a,(OFST+5,sp)
5746  079a 5f            	clrw	x
5747  079b 97            	ld	xl,a
5748  079c 89            	pushw	x
5749  079d ae0210        	ldw	x,#528
5750  07a0 cd0072        	call	_LCD_SEND_COMMAND
5752  07a3 85            	popw	x
5753                     ; 640 	LCD_SEND_COMMAND(0x212,y);
5755  07a4 1e06          	ldw	x,(OFST+6,sp)
5756  07a6 89            	pushw	x
5757  07a7 ae0212        	ldw	x,#530
5758  07aa cd0072        	call	_LCD_SEND_COMMAND
5760  07ad 85            	popw	x
5761                     ; 641 	LCD_SEND_COMMAND(0x211,x+1);
5763  07ae 7b05          	ld	a,(OFST+5,sp)
5764  07b0 5f            	clrw	x
5765  07b1 97            	ld	xl,a
5766  07b2 5c            	incw	x
5767  07b3 89            	pushw	x
5768  07b4 ae0211        	ldw	x,#529
5769  07b7 cd0072        	call	_LCD_SEND_COMMAND
5771  07ba 85            	popw	x
5772                     ; 642 	LCD_SEND_COMMAND(0x213,y+1);
5774  07bb 1e06          	ldw	x,(OFST+6,sp)
5775  07bd 5c            	incw	x
5776  07be 89            	pushw	x
5777  07bf ae0213        	ldw	x,#531
5778  07c2 cd0072        	call	_LCD_SEND_COMMAND
5780  07c5 85            	popw	x
5781                     ; 645 	LCD_RS_L();
5783  07c6 72195014      	bres	_PE_ODR,#4
5784                     ; 646 	LCD_WRITE_REG(0x202);	//RAM Write index
5787  07ca ae0202        	ldw	x,#514
5788  07cd cd0047        	call	_LCD_WRITE_REG
5790                     ; 647 	LCD_CS_L();
5792  07d0 72155023      	bres	_PH_ODR,#2
5793                     ; 648 	LCD_WRITE_DATA(color_front);
5796  07d4 1e01          	ldw	x,(OFST+1,sp)
5797  07d6 cd00c8        	call	_LCD_WRITE_DATA
5799                     ; 651 }
5802  07d9 85            	popw	x
5803  07da 81            	ret
5856                     ; 661 void lcd_draw_bigdot(unsigned int   color_front,
5856                     ; 662                      unsigned int    x,
5856                     ; 663                      unsigned int    y )
5856                     ; 664 {
5857                     	switch	.text
5858  07db               _lcd_draw_bigdot:
5860  07db 89            	pushw	x
5861       00000000      OFST:	set	0
5864                     ; 665     lcd_draw_dot(color_front,x,y);
5866  07dc 1e07          	ldw	x,(OFST+7,sp)
5867  07de 89            	pushw	x
5868  07df 7b08          	ld	a,(OFST+8,sp)
5869  07e1 88            	push	a
5870  07e2 1e04          	ldw	x,(OFST+4,sp)
5871  07e4 adb1          	call	_lcd_draw_dot
5873  07e6 5b03          	addw	sp,#3
5874                     ; 666     lcd_draw_dot(color_front,x,y+1);
5876  07e8 1e07          	ldw	x,(OFST+7,sp)
5877  07ea 5c            	incw	x
5878  07eb 89            	pushw	x
5879  07ec 7b08          	ld	a,(OFST+8,sp)
5880  07ee 88            	push	a
5881  07ef 1e04          	ldw	x,(OFST+4,sp)
5882  07f1 ada4          	call	_lcd_draw_dot
5884  07f3 5b03          	addw	sp,#3
5885                     ; 667     lcd_draw_dot(color_front,x,y-1);
5887  07f5 1e07          	ldw	x,(OFST+7,sp)
5888  07f7 5a            	decw	x
5889  07f8 89            	pushw	x
5890  07f9 7b08          	ld	a,(OFST+8,sp)
5891  07fb 88            	push	a
5892  07fc 1e04          	ldw	x,(OFST+4,sp)
5893  07fe ad97          	call	_lcd_draw_dot
5895  0800 5b03          	addw	sp,#3
5896                     ; 669     lcd_draw_dot(color_front,x+1,y);
5898  0802 1e07          	ldw	x,(OFST+7,sp)
5899  0804 89            	pushw	x
5900  0805 7b08          	ld	a,(OFST+8,sp)
5901  0807 4c            	inc	a
5902  0808 88            	push	a
5903  0809 1e04          	ldw	x,(OFST+4,sp)
5904  080b ad8a          	call	_lcd_draw_dot
5906  080d 5b03          	addw	sp,#3
5907                     ; 670     lcd_draw_dot(color_front,x+1,y+1);
5909  080f 1e07          	ldw	x,(OFST+7,sp)
5910  0811 5c            	incw	x
5911  0812 89            	pushw	x
5912  0813 7b08          	ld	a,(OFST+8,sp)
5913  0815 4c            	inc	a
5914  0816 88            	push	a
5915  0817 1e04          	ldw	x,(OFST+4,sp)
5916  0819 cd0797        	call	_lcd_draw_dot
5918  081c 5b03          	addw	sp,#3
5919                     ; 671     lcd_draw_dot(color_front,x+1,y-1);
5921  081e 1e07          	ldw	x,(OFST+7,sp)
5922  0820 5a            	decw	x
5923  0821 89            	pushw	x
5924  0822 7b08          	ld	a,(OFST+8,sp)
5925  0824 4c            	inc	a
5926  0825 88            	push	a
5927  0826 1e04          	ldw	x,(OFST+4,sp)
5928  0828 cd0797        	call	_lcd_draw_dot
5930  082b 5b03          	addw	sp,#3
5931                     ; 673     lcd_draw_dot(color_front,x-1,y);    
5933  082d 1e07          	ldw	x,(OFST+7,sp)
5934  082f 89            	pushw	x
5935  0830 7b08          	ld	a,(OFST+8,sp)
5936  0832 4a            	dec	a
5937  0833 88            	push	a
5938  0834 1e04          	ldw	x,(OFST+4,sp)
5939  0836 cd0797        	call	_lcd_draw_dot
5941  0839 5b03          	addw	sp,#3
5942                     ; 674     lcd_draw_dot(color_front,x-1,y+1);
5944  083b 1e07          	ldw	x,(OFST+7,sp)
5945  083d 5c            	incw	x
5946  083e 89            	pushw	x
5947  083f 7b08          	ld	a,(OFST+8,sp)
5948  0841 4a            	dec	a
5949  0842 88            	push	a
5950  0843 1e04          	ldw	x,(OFST+4,sp)
5951  0845 cd0797        	call	_lcd_draw_dot
5953  0848 5b03          	addw	sp,#3
5954                     ; 675     lcd_draw_dot(color_front,x-1,y-1);
5956  084a 1e07          	ldw	x,(OFST+7,sp)
5957  084c 5a            	decw	x
5958  084d 89            	pushw	x
5959  084e 7b08          	ld	a,(OFST+8,sp)
5960  0850 4a            	dec	a
5961  0851 88            	push	a
5962  0852 1e04          	ldw	x,(OFST+4,sp)
5963  0854 cd0797        	call	_lcd_draw_dot
5965  0857 5b03          	addw	sp,#3
5966                     ; 677 }
5969  0859 85            	popw	x
5970  085a 81            	ret
6132                     ; 686 unsigned char lcd_draw_line(  
6132                     ; 687 						unsigned int line_color,
6132                     ; 688                         unsigned int x1,
6132                     ; 689                         unsigned int y1,
6132                     ; 690                         unsigned int x2,
6132                     ; 691                         unsigned int y2 )
6132                     ; 692 {
6133                     	switch	.text
6134  085b               _lcd_draw_line:
6136  085b 89            	pushw	x
6137  085c 5214          	subw	sp,#20
6138       00000014      OFST:	set	20
6141                     ; 698 	lcd_draw_dot( line_color , x1 , y1 );
6143  085e 1e1b          	ldw	x,(OFST+7,sp)
6144  0860 89            	pushw	x
6145  0861 7b1c          	ld	a,(OFST+8,sp)
6146  0863 88            	push	a
6147  0864 1e18          	ldw	x,(OFST+4,sp)
6148  0866 cd0797        	call	_lcd_draw_dot
6150  0869 5b03          	addw	sp,#3
6151                     ; 699 	if( x1 == x2 && y1 == y2 )	/*如果两点重合，结束后面的动作*/
6153  086b 1e19          	ldw	x,(OFST+5,sp)
6154  086d 131d          	cpw	x,(OFST+9,sp)
6155  086f 260c          	jrne	L5023
6157  0871 1e1b          	ldw	x,(OFST+7,sp)
6158  0873 131f          	cpw	x,(OFST+11,sp)
6159  0875 2606          	jrne	L5023
6160                     ; 701 		return 1;
6162  0877 a601          	ld	a,#1
6164  0879 ac3c093c      	jpf	L07
6165  087d               L5023:
6166                     ; 703 	iTag = 0;
6168  087d 5f            	clrw	x
6169  087e 1f0d          	ldw	(OFST-7,sp),x
6170                     ; 704 	dx = ( x2 - x1 );
6172  0880 1e1d          	ldw	x,(OFST+9,sp)
6173  0882 72f019        	subw	x,(OFST+5,sp)
6174  0885 1f07          	ldw	(OFST-13,sp),x
6175                     ; 705 	dy = ( y2 - y1 );
6177  0887 1e1f          	ldw	x,(OFST+11,sp)
6178  0889 72f01b        	subw	x,(OFST+7,sp)
6179  088c 1f09          	ldw	(OFST-11,sp),x
6180                     ; 706 	if( dx < dy )	/*如果dy为计长方向，则交换纵横坐标*/
6182  088e 1e07          	ldw	x,(OFST-13,sp)
6183  0890 1309          	cpw	x,(OFST-11,sp)
6184  0892 242c          	jruge	L7023
6185                     ; 708 		iTag = 1 ;
6187  0894 ae0001        	ldw	x,#1
6188  0897 1f0d          	ldw	(OFST-7,sp),x
6189                     ; 709 		Swap ( &x1, &y1 );
6191  0899 96            	ldw	x,sp
6192  089a 1c001b        	addw	x,#OFST+7
6193  089d 89            	pushw	x
6194  089e 96            	ldw	x,sp
6195  089f 1c001b        	addw	x,#OFST+7
6196  08a2 cd0781        	call	_Swap
6198  08a5 85            	popw	x
6199                     ; 710 		Swap ( &x2, &y2 );
6201  08a6 96            	ldw	x,sp
6202  08a7 1c001f        	addw	x,#OFST+11
6203  08aa 89            	pushw	x
6204  08ab 96            	ldw	x,sp
6205  08ac 1c001f        	addw	x,#OFST+11
6206  08af cd0781        	call	_Swap
6208  08b2 85            	popw	x
6209                     ; 711 		Swap ( &dx, &dy );
6211  08b3 96            	ldw	x,sp
6212  08b4 1c0009        	addw	x,#OFST-11
6213  08b7 89            	pushw	x
6214  08b8 96            	ldw	x,sp
6215  08b9 1c0009        	addw	x,#OFST-11
6216  08bc cd0781        	call	_Swap
6218  08bf 85            	popw	x
6219  08c0               L7023:
6220                     ; 713 	tx = ( x2 - x1 ) > 0 ? 1 : -1;	   /*确定是增1还是减1*/
6222  08c0 1e1d          	ldw	x,(OFST+9,sp)
6223  08c2 72f019        	subw	x,(OFST+5,sp)
6224  08c5 2705          	jreq	L06
6225  08c7 ae0001        	ldw	x,#1
6226  08ca 2003          	jra	L26
6227  08cc               L06:
6228  08cc aeffff        	ldw	x,#65535
6229  08cf               L26:
6230  08cf 1f01          	ldw	(OFST-19,sp),x
6231                     ; 714 	ty = ( y2 - y1 ) > 0 ? 1 : -1;
6233  08d1 1e1f          	ldw	x,(OFST+11,sp)
6234  08d3 72f01b        	subw	x,(OFST+7,sp)
6235  08d6 2705          	jreq	L46
6236  08d8 ae0001        	ldw	x,#1
6237  08db 2003          	jra	L66
6238  08dd               L46:
6239  08dd aeffff        	ldw	x,#65535
6240  08e0               L66:
6241  08e0 1f03          	ldw	(OFST-17,sp),x
6242                     ; 715 	x = x1;
6244  08e2 1e19          	ldw	x,(OFST+5,sp)
6245  08e4 1f13          	ldw	(OFST-1,sp),x
6246                     ; 716 	y = y1;
6248  08e6 1e1b          	ldw	x,(OFST+7,sp)
6249  08e8 1f11          	ldw	(OFST-3,sp),x
6250                     ; 717 	inc1 = 2 * dy;
6252  08ea 1e09          	ldw	x,(OFST-11,sp)
6253  08ec 58            	sllw	x
6254  08ed 1f0b          	ldw	(OFST-9,sp),x
6255                     ; 718 	inc2 = 2 * ( dy - dx );
6257  08ef 1e09          	ldw	x,(OFST-11,sp)
6258  08f1 72f007        	subw	x,(OFST-13,sp)
6259  08f4 58            	sllw	x
6260  08f5 1f05          	ldw	(OFST-15,sp),x
6261                     ; 719 	d = inc1 - dx ;
6263  08f7 1e0b          	ldw	x,(OFST-9,sp)
6264  08f9 72f007        	subw	x,(OFST-13,sp)
6265  08fc 1f0f          	ldw	(OFST-5,sp),x
6267  08fe 2035          	jra	L5123
6268  0900               L1123:
6269                     ; 728 			y += ty ;
6271  0900 1e11          	ldw	x,(OFST-3,sp)
6272  0902 72fb03        	addw	x,(OFST-17,sp)
6273  0905 1f11          	ldw	(OFST-3,sp),x
6274                     ; 729 			d += inc2 ;
6276  0907 1e0f          	ldw	x,(OFST-5,sp)
6277  0909 72fb05        	addw	x,(OFST-15,sp)
6278  090c 1f0f          	ldw	(OFST-5,sp),x
6279                     ; 731 		if( iTag )
6281  090e 1e0d          	ldw	x,(OFST-7,sp)
6282  0910 270f          	jreq	L1223
6283                     ; 733 			lcd_draw_dot ( line_color, y, x ) ;
6285  0912 1e13          	ldw	x,(OFST-1,sp)
6286  0914 89            	pushw	x
6287  0915 7b14          	ld	a,(OFST+0,sp)
6288  0917 88            	push	a
6289  0918 1e18          	ldw	x,(OFST+4,sp)
6290  091a cd0797        	call	_lcd_draw_dot
6292  091d 5b03          	addw	sp,#3
6294  091f 200d          	jra	L3223
6295  0921               L1223:
6296                     ; 737 			lcd_draw_dot ( line_color, x, y ) ;
6298  0921 1e11          	ldw	x,(OFST-3,sp)
6299  0923 89            	pushw	x
6300  0924 7b16          	ld	a,(OFST+2,sp)
6301  0926 88            	push	a
6302  0927 1e18          	ldw	x,(OFST+4,sp)
6303  0929 cd0797        	call	_lcd_draw_dot
6305  092c 5b03          	addw	sp,#3
6306  092e               L3223:
6307                     ; 739 		x += tx ;
6309  092e 1e13          	ldw	x,(OFST-1,sp)
6310  0930 72fb01        	addw	x,(OFST-19,sp)
6311  0933 1f13          	ldw	(OFST-1,sp),x
6312  0935               L5123:
6313                     ; 720 	while( x != x2 )	 /*循环画点*/
6315  0935 1e13          	ldw	x,(OFST-1,sp)
6316  0937 131d          	cpw	x,(OFST+9,sp)
6317  0939 26c5          	jrne	L1123
6318                     ; 741 	return 0;
6320  093b 4f            	clr	a
6322  093c               L07:
6324  093c 5b16          	addw	sp,#22
6325  093e 81            	ret
6377                     ; 747 unsigned long mypow(unsigned char m,unsigned char n)
6377                     ; 748 {
6378                     	switch	.text
6379  093f               _mypow:
6381  093f 89            	pushw	x
6382  0940 5204          	subw	sp,#4
6383       00000004      OFST:	set	4
6386                     ; 749 	unsigned long result=1;	 
6388  0942 ae0001        	ldw	x,#1
6389  0945 1f03          	ldw	(OFST-1,sp),x
6390  0947 ae0000        	ldw	x,#0
6391  094a 1f01          	ldw	(OFST-3,sp),x
6393  094c 2011          	jra	L7523
6394  094e               L3523:
6395                     ; 750 	while(n--)result*=m;    
6397  094e 7b05          	ld	a,(OFST+1,sp)
6398  0950 b703          	ld	c_lreg+3,a
6399  0952 3f02          	clr	c_lreg+2
6400  0954 3f01          	clr	c_lreg+1
6401  0956 3f00          	clr	c_lreg
6402  0958 96            	ldw	x,sp
6403  0959 1c0001        	addw	x,#OFST-3
6404  095c cd0000        	call	c_lgmul
6406  095f               L7523:
6409  095f 7b06          	ld	a,(OFST+2,sp)
6410  0961 0a06          	dec	(OFST+2,sp)
6411  0963 4d            	tnz	a
6412  0964 26e8          	jrne	L3523
6413                     ; 751 	return result;
6415  0966 96            	ldw	x,sp
6416  0967 1c0001        	addw	x,#OFST-3
6417  096a cd0000        	call	c_ltor
6421  096d 5b06          	addw	sp,#6
6422  096f 81            	ret
6512                     	switch	.const
6513  0010               L67:
6514  0010 0000000a      	dc.l	10
6515                     ; 759 void lcd_display_number(unsigned int x,
6515                     ; 760                         unsigned int y,
6515                     ; 761                         unsigned long num,
6515                     ; 762                         unsigned char num_len )
6515                     ; 763 {         	
6516                     	switch	.text
6517  0970               _lcd_display_number:
6519  0970 89            	pushw	x
6520  0971 5207          	subw	sp,#7
6521       00000007      OFST:	set	7
6524                     ; 765 	unsigned char enshow=0;		 // 此变量用来去掉最高位的0	
6526  0973 0f05          	clr	(OFST-2,sp)
6527                     ; 767 	for(t=0;t<num_len;t++)
6529  0975 0f07          	clr	(OFST+0,sp)
6531  0977 2079          	jra	L5333
6532  0979               L1333:
6533                     ; 769 		temp=(num/mypow(10,num_len-t-1))%10;
6535  0979 7b12          	ld	a,(OFST+11,sp)
6536  097b 1007          	sub	a,(OFST+0,sp)
6537  097d 4a            	dec	a
6538  097e 97            	ld	xl,a
6539  097f a60a          	ld	a,#10
6540  0981 95            	ld	xh,a
6541  0982 adbb          	call	_mypow
6543  0984 96            	ldw	x,sp
6544  0985 1c0001        	addw	x,#OFST-6
6545  0988 cd0000        	call	c_rtol
6547  098b 96            	ldw	x,sp
6548  098c 1c000e        	addw	x,#OFST+7
6549  098f cd0000        	call	c_ltor
6551  0992 96            	ldw	x,sp
6552  0993 1c0001        	addw	x,#OFST-6
6553  0996 cd0000        	call	c_ludv
6555  0999 ae0010        	ldw	x,#L67
6556  099c cd0000        	call	c_lumd
6558  099f b603          	ld	a,c_lreg+3
6559  09a1 6b06          	ld	(OFST-1,sp),a
6560                     ; 770 		if(enshow==0&&t<(num_len-1))
6562  09a3 0d05          	tnz	(OFST-2,sp)
6563  09a5 2632          	jrne	L1433
6565  09a7 9c            	rvf
6566  09a8 7b12          	ld	a,(OFST+11,sp)
6567  09aa 5f            	clrw	x
6568  09ab 97            	ld	xl,a
6569  09ac 5a            	decw	x
6570  09ad 7b07          	ld	a,(OFST+0,sp)
6571  09af 905f          	clrw	y
6572  09b1 9097          	ld	yl,a
6573  09b3 90bf01        	ldw	c_y+1,y
6574  09b6 b301          	cpw	x,c_y+1
6575  09b8 2d1f          	jrsle	L1433
6576                     ; 772 			if(temp==0)
6578  09ba 0d06          	tnz	(OFST-1,sp)
6579  09bc 2617          	jrne	L3433
6580                     ; 775                 lcd_display_char(' ',BLACK,WHITE,x+t,y);
6582  09be 7b0d          	ld	a,(OFST+6,sp)
6583  09c0 88            	push	a
6584  09c1 7b0a          	ld	a,(OFST+3,sp)
6585  09c3 1b08          	add	a,(OFST+1,sp)
6586  09c5 88            	push	a
6587  09c6 aefffe        	ldw	x,#65534
6588  09c9 89            	pushw	x
6589  09ca 5f            	clrw	x
6590  09cb 89            	pushw	x
6591  09cc a620          	ld	a,#32
6592  09ce cd045a        	call	_lcd_display_char
6594  09d1 5b06          	addw	sp,#6
6595                     ; 776 				continue;
6597  09d3 201b          	jra	L3333
6598  09d5               L3433:
6599                     ; 777 			}else enshow=1; 
6601  09d5 a601          	ld	a,#1
6602  09d7 6b05          	ld	(OFST-2,sp),a
6603  09d9               L1433:
6604                     ; 781         lcd_display_char(temp+'0',BLACK,WHITE,x+t,y); 
6606  09d9 7b0d          	ld	a,(OFST+6,sp)
6607  09db 88            	push	a
6608  09dc 7b0a          	ld	a,(OFST+3,sp)
6609  09de 1b08          	add	a,(OFST+1,sp)
6610  09e0 88            	push	a
6611  09e1 aefffe        	ldw	x,#65534
6612  09e4 89            	pushw	x
6613  09e5 5f            	clrw	x
6614  09e6 89            	pushw	x
6615  09e7 7b0c          	ld	a,(OFST+5,sp)
6616  09e9 ab30          	add	a,#48
6617  09eb cd045a        	call	_lcd_display_char
6619  09ee 5b06          	addw	sp,#6
6620  09f0               L3333:
6621                     ; 767 	for(t=0;t<num_len;t++)
6623  09f0 0c07          	inc	(OFST+0,sp)
6624  09f2               L5333:
6627  09f2 7b07          	ld	a,(OFST+0,sp)
6628  09f4 1112          	cp	a,(OFST+11,sp)
6629  09f6 2581          	jrult	L1333
6630                     ; 783 } 
6633  09f8 5b09          	addw	sp,#9
6634  09fa 81            	ret
6659                     	xdef	_mypow
6660                     	xdef	_Swap
6661                     	xdef	_LCD_SEND_COMMAND
6662                     	xdef	_lcd_ctrl_port_init
6663                     	xref	_GB2312
6664                     	xref	_ascii
6665                     	xdef	_color
6666                     	xdef	_lcd_display_test
6667                     	xdef	_lcd_display_number
6668                     	xdef	_lcd_draw_line
6669                     	xdef	_lcd_draw_bigdot
6670                     	xdef	_lcd_draw_dot
6671                     	xdef	_lcd_display_image
6672                     	xdef	_lcd_display_GB2312
6673                     	xdef	_lcd_display_string
6674                     	xdef	_lcd_display_char
6675                     	xdef	_lcd_set_cursor
6676                     	xdef	_lcd_clear_area
6677                     	xdef	_lcd_clear_screen
6678                     	xdef	_lcd_init
6679                     	xdef	_LCD_WRITE_DATA
6680                     	xdef	_LCD_WRITE_COMMAND
6681                     	xdef	_LCD_WRITE_REG
6682                     	xdef	_SPI0_communication
6683                     	xdef	_SPI0_Init
6684                     	xref	_delay_us
6685                     	xref.b	c_lreg
6686                     	xref.b	c_y
6705                     	xref	c_lumd
6706                     	xref	c_ludv
6707                     	xref	c_rtol
6708                     	xref	c_ltor
6709                     	xref	c_lgmul
6710                     	end
