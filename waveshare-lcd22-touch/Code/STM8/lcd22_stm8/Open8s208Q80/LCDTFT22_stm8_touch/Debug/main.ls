   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2852                     ; 25 void display_touch_debug()
2852                     ; 26 {        //ADC results show
2854                     	switch	.text
2855  0000               _display_touch_debug:
2859                     ; 27         lcd_display_string("READ SUCCESS:",BLACK,GREEN,1,3);
2861  0000 4b03          	push	#3
2862  0002 4b01          	push	#1
2863  0004 ae07ee        	ldw	x,#2030
2864  0007 89            	pushw	x
2865  0008 5f            	clrw	x
2866  0009 89            	pushw	x
2867  000a ae006e        	ldw	x,#L1202
2868  000d cd0000        	call	_lcd_display_string
2870  0010 5b06          	addw	sp,#6
2871                     ; 28         lcd_display_number(14,3,read_res,6);
2873  0012 4b06          	push	#6
2874  0014 b600          	ld	a,_read_res
2875  0016 b703          	ld	c_lreg+3,a
2876  0018 3f02          	clr	c_lreg+2
2877  001a 3f01          	clr	c_lreg+1
2878  001c 3f00          	clr	c_lreg
2879  001e be02          	ldw	x,c_lreg+2
2880  0020 89            	pushw	x
2881  0021 be00          	ldw	x,c_lreg
2882  0023 89            	pushw	x
2883  0024 ae0003        	ldw	x,#3
2884  0027 89            	pushw	x
2885  0028 ae000e        	ldw	x,#14
2886  002b cd0000        	call	_lcd_display_number
2888  002e 5b07          	addw	sp,#7
2889                     ; 30         lcd_display_string("X AD Val:",BLACK,GREEN,1,4);
2891  0030 4b04          	push	#4
2892  0032 4b01          	push	#1
2893  0034 ae07ee        	ldw	x,#2030
2894  0037 89            	pushw	x
2895  0038 5f            	clrw	x
2896  0039 89            	pushw	x
2897  003a ae0064        	ldw	x,#L3202
2898  003d cd0000        	call	_lcd_display_string
2900  0040 5b06          	addw	sp,#6
2901                     ; 31         lcd_display_number(10,4,touch_dot.x_ad_val,6);
2903  0042 4b06          	push	#6
2904  0044 be06          	ldw	x,_touch_dot+6
2905  0046 89            	pushw	x
2906  0047 be04          	ldw	x,_touch_dot+4
2907  0049 89            	pushw	x
2908  004a ae0004        	ldw	x,#4
2909  004d 89            	pushw	x
2910  004e ae000a        	ldw	x,#10
2911  0051 cd0000        	call	_lcd_display_number
2913  0054 5b07          	addw	sp,#7
2914                     ; 33         lcd_display_string("Y AD Val:",BLACK,GREEN,1,5);
2916  0056 4b05          	push	#5
2917  0058 4b01          	push	#1
2918  005a ae07ee        	ldw	x,#2030
2919  005d 89            	pushw	x
2920  005e 5f            	clrw	x
2921  005f 89            	pushw	x
2922  0060 ae005a        	ldw	x,#L5202
2923  0063 cd0000        	call	_lcd_display_string
2925  0066 5b06          	addw	sp,#6
2926                     ; 34         lcd_display_number(10,5,touch_dot.y_ad_val,6);
2928  0068 4b06          	push	#6
2929  006a be0a          	ldw	x,_touch_dot+10
2930  006c 89            	pushw	x
2931  006d be08          	ldw	x,_touch_dot+8
2932  006f 89            	pushw	x
2933  0070 ae0005        	ldw	x,#5
2934  0073 89            	pushw	x
2935  0074 ae000a        	ldw	x,#10
2936  0077 cd0000        	call	_lcd_display_number
2938  007a 5b07          	addw	sp,#7
2939                     ; 37         lcd_display_string("X:",BLACK,GREEN,1,6);
2941  007c 4b06          	push	#6
2942  007e 4b01          	push	#1
2943  0080 ae07ee        	ldw	x,#2030
2944  0083 89            	pushw	x
2945  0084 5f            	clrw	x
2946  0085 89            	pushw	x
2947  0086 ae0057        	ldw	x,#L7202
2948  0089 cd0000        	call	_lcd_display_string
2950  008c 5b06          	addw	sp,#6
2951                     ; 38         lcd_display_number(10,6,touch_dot.x,5);
2953  008e 4b05          	push	#5
2954  0090 be00          	ldw	x,_touch_dot
2955  0092 cd0000        	call	c_uitolx
2957  0095 be02          	ldw	x,c_lreg+2
2958  0097 89            	pushw	x
2959  0098 be00          	ldw	x,c_lreg
2960  009a 89            	pushw	x
2961  009b ae0006        	ldw	x,#6
2962  009e 89            	pushw	x
2963  009f ae000a        	ldw	x,#10
2964  00a2 cd0000        	call	_lcd_display_number
2966  00a5 5b07          	addw	sp,#7
2967                     ; 39         lcd_display_string("Y:",BLACK,GREEN,1,7);
2969  00a7 4b07          	push	#7
2970  00a9 4b01          	push	#1
2971  00ab ae07ee        	ldw	x,#2030
2972  00ae 89            	pushw	x
2973  00af 5f            	clrw	x
2974  00b0 89            	pushw	x
2975  00b1 ae0054        	ldw	x,#L1302
2976  00b4 cd0000        	call	_lcd_display_string
2978  00b7 5b06          	addw	sp,#6
2979                     ; 40         lcd_display_number(10,7,touch_dot.y,5);
2981  00b9 4b05          	push	#5
2982  00bb be02          	ldw	x,_touch_dot+2
2983  00bd cd0000        	call	c_uitolx
2985  00c0 be02          	ldw	x,c_lreg+2
2986  00c2 89            	pushw	x
2987  00c3 be00          	ldw	x,c_lreg
2988  00c5 89            	pushw	x
2989  00c6 ae0007        	ldw	x,#7
2990  00c9 89            	pushw	x
2991  00ca ae000a        	ldw	x,#10
2992  00cd cd0000        	call	_lcd_display_number
2994  00d0 5b07          	addw	sp,#7
2995                     ; 42 }
2998  00d2 81            	ret
3029                     ; 44 int main(void)
3029                     ; 45 
3029                     ; 46 {
3030                     	switch	.text
3031  00d3               _main:
3035                     ; 50 		CLK_CKDIVR=0x08;
3037  00d3 350850c6      	mov	_CLK_CKDIVR,#8
3038                     ; 51 		lcd_init();
3040  00d7 cd0000        	call	_lcd_init
3042                     ; 52 				CLK_CKDIVR=0x18;
3044  00da 351850c6      	mov	_CLK_CKDIVR,#24
3045                     ; 53 		TOUCH_init();
3047  00de cd0000        	call	_TOUCH_init
3049                     ; 54 				CLK_CKDIVR=0x00;
3051  00e1 725f50c6      	clr	_CLK_CKDIVR
3052                     ; 59     lcd_display_string( "experiment:Touch screen    ", BLACK, GREEN, 0, 0 );
3054  00e5 4b00          	push	#0
3055  00e7 4b00          	push	#0
3056  00e9 ae07ee        	ldw	x,#2030
3057  00ec 89            	pushw	x
3058  00ed 5f            	clrw	x
3059  00ee 89            	pushw	x
3060  00ef ae0038        	ldw	x,#L3402
3061  00f2 cd0000        	call	_lcd_display_string
3063  00f5 5b06          	addw	sp,#6
3064                     ; 60 		lcd_display_string( "CPU:ATMAGE128A-AU          ", BLACK, GREEN, 0, 1 );
3066  00f7 4b01          	push	#1
3067  00f9 4b00          	push	#0
3068  00fb ae07ee        	ldw	x,#2030
3069  00fe 89            	pushw	x
3070  00ff 5f            	clrw	x
3071  0100 89            	pushw	x
3072  0101 ae001c        	ldw	x,#L5402
3073  0104 cd0000        	call	_lcd_display_string
3075  0107 5b06          	addw	sp,#6
3076                     ; 61     lcd_display_string( "www.WaveShare.net          ", BLACK, GREEN, 0, 2 );
3078  0109 4b02          	push	#2
3079  010b 4b00          	push	#0
3080  010d ae07ee        	ldw	x,#2030
3081  0110 89            	pushw	x
3082  0111 5f            	clrw	x
3083  0112 89            	pushw	x
3084  0113 ae0000        	ldw	x,#L7402
3085  0116 cd0000        	call	_lcd_display_string
3087  0119 5b06          	addw	sp,#6
3088  011b               L1502:
3089                     ; 66       read_res=Read_Continue();
3091  011b cd0000        	call	_Read_Continue
3093  011e b700          	ld	_read_res,a
3094                     ; 68 			lcd_draw_bigdot(YELLOW,touch_dot.x,touch_dot.y);
3096  0120 be02          	ldw	x,_touch_dot+2
3097  0122 89            	pushw	x
3098  0123 be00          	ldw	x,_touch_dot
3099  0125 89            	pushw	x
3100  0126 aeffe0        	ldw	x,#65504
3101  0129 cd0000        	call	_lcd_draw_bigdot
3103  012c 5b04          	addw	sp,#4
3105  012e 20eb          	jra	L1502
3129                     	xdef	_main
3130                     	xdef	_display_touch_debug
3131                     	xref.b	_touch_dot
3132                     	switch	.ubsct
3133  0000               _read_res:
3134  0000 00            	ds.b	1
3135                     	xdef	_read_res
3136                     	xref	_Read_Continue
3137                     	xref	_TOUCH_init
3138                     	xref	_lcd_display_number
3139                     	xref	_lcd_draw_bigdot
3140                     	xref	_lcd_display_string
3141                     	xref	_lcd_init
3142                     .const:	section	.text
3143  0000               L7402:
3144  0000 7777772e5761  	dc.b	"www.WaveShare.net "
3145  0012 202020202020  	dc.b	"         ",0
3146  001c               L5402:
3147  001c 4350553a4154  	dc.b	"CPU:ATMAGE128A-AU "
3148  002e 202020202020  	dc.b	"         ",0
3149  0038               L3402:
3150  0038 657870657269  	dc.b	"experiment:Touch s"
3151  004a 637265656e20  	dc.b	"creen    ",0
3152  0054               L1302:
3153  0054 593a00        	dc.b	"Y:",0
3154  0057               L7202:
3155  0057 583a00        	dc.b	"X:",0
3156  005a               L5202:
3157  005a 592041442056  	dc.b	"Y AD Val:",0
3158  0064               L3202:
3159  0064 582041442056  	dc.b	"X AD Val:",0
3160  006e               L1202:
3161  006e 524541442053  	dc.b	"READ SUCCESS:",0
3162                     	xref.b	c_lreg
3182                     	xref	c_uitolx
3183                     	end
