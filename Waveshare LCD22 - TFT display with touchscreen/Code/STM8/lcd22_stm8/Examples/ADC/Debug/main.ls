   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2548                     ; 52 void delay_ms(u16 ms)
2548                     ; 53 {
2550                     	switch	.text
2551  0000               _delay_ms:
2553  0000 89            	pushw	x
2554  0001 88            	push	a
2555       00000001      OFST:	set	1
2558  0002 201b          	jra	L1561
2559  0004               L7461:
2560                     ; 57 				for(i=0;i<250;i++)
2562  0004 0f01          	clr	(OFST+0,sp)
2563  0006               L5561:
2566  0006 0c01          	inc	(OFST+0,sp)
2569  0008 7b01          	ld	a,(OFST+0,sp)
2570  000a a1fa          	cp	a,#250
2571  000c 25f8          	jrult	L5561
2572                     ; 59 				for(i=0;i<75;i++)
2574  000e 0f01          	clr	(OFST+0,sp)
2575  0010               L3661:
2578  0010 0c01          	inc	(OFST+0,sp)
2581  0012 7b01          	ld	a,(OFST+0,sp)
2582  0014 a14b          	cp	a,#75
2583  0016 25f8          	jrult	L3661
2584                     ; 61 				ms--;
2586  0018 1e02          	ldw	x,(OFST+1,sp)
2587  001a 1d0001        	subw	x,#1
2588  001d 1f02          	ldw	(OFST+1,sp),x
2589  001f               L1561:
2590                     ; 55 			while(ms!=0)
2592  001f 1e02          	ldw	x,(OFST+1,sp)
2593  0021 26e1          	jrne	L7461
2594                     ; 63 }
2597  0023 5b03          	addw	sp,#3
2598  0025 81            	ret
2641                     ; 65 void delay_us(u16 us)
2641                     ; 66 {
2642                     	switch	.text
2643  0026               _delay_us:
2645  0026 89            	pushw	x
2646  0027 88            	push	a
2647       00000001      OFST:	set	1
2650  0028 201b          	jra	L5171
2651  002a               L3171:
2652                     ; 70 				for(i=0;i<25;i++)
2654  002a 0f01          	clr	(OFST+0,sp)
2655  002c               L1271:
2658  002c 0c01          	inc	(OFST+0,sp)
2661  002e 7b01          	ld	a,(OFST+0,sp)
2662  0030 a119          	cp	a,#25
2663  0032 25f8          	jrult	L1271
2664                     ; 72 				for(i=0;i<7;i++)
2666  0034 0f01          	clr	(OFST+0,sp)
2667  0036               L7271:
2670  0036 0c01          	inc	(OFST+0,sp)
2673  0038 7b01          	ld	a,(OFST+0,sp)
2674  003a a107          	cp	a,#7
2675  003c 25f8          	jrult	L7271
2676                     ; 74 				us--;
2678  003e 1e02          	ldw	x,(OFST+1,sp)
2679  0040 1d0001        	subw	x,#1
2680  0043 1f02          	ldw	(OFST+1,sp),x
2681  0045               L5171:
2682                     ; 68 			while(us!=0)
2684  0045 1e02          	ldw	x,(OFST+1,sp)
2685  0047 26e1          	jrne	L3171
2686                     ; 76 }
2689  0049 5b03          	addw	sp,#3
2690  004b 81            	ret
2732                     ; 17 void Init_AD(void)
2732                     ; 18 {
2733                     	switch	.text
2734  004c               _Init_AD:
2738                     ; 19 		ADC_CSR=0x0A;      //选择通道AIN8
2740  004c 350a5400      	mov	_ADC_CSR,#10
2741                     ; 20 		ADC_CR2|=0x08;     //	数据排列,右对齐
2743  0050 72165402      	bset	_ADC_CR2,#3
2744                     ; 22 }
2747  0054 81            	ret
2792                     ; 24 void main(void)
2792                     ; 25 {
2793                     	switch	.text
2794  0055               _main:
2796  0055 88            	push	a
2797       00000001      OFST:	set	1
2800                     ; 27 		PB_DDR = 0xff;     
2802  0056 35ff5007      	mov	_PB_DDR,#255
2803                     ; 28 		PB_CR1 = 0xff;
2805  005a 35ff5008      	mov	_PB_CR1,#255
2806                     ; 30 		PD_DDR = 0xff;
2808  005e 35ff5011      	mov	_PD_DDR,#255
2809                     ; 31 		PD_CR1 = 0xff;
2811  0062 35ff5012      	mov	_PD_CR1,#255
2812                     ; 33 		Init_AD();
2814  0066 ade4          	call	_Init_AD
2816  0068               L1771:
2817                     ; 36 				ADC_CR1|=0x01;         //将CR1寄存器的最低位置1,开启AD转换
2819  0068 72105401      	bset	_ADC_CR1,#0
2820                     ; 37 				for(i=0;i<100;i++);    //延时一段时间，至少7uS，保证ADC模块的上电完成
2822  006c 0f01          	clr	(OFST+0,sp)
2823  006e               L5771:
2827  006e 0c01          	inc	(OFST+0,sp)
2830  0070 7b01          	ld	a,(OFST+0,sp)
2831  0072 a164          	cp	a,#100
2832  0074 25f8          	jrult	L5771
2833                     ; 38 				ADC_CR1|=0x01;         //再次将CR1寄存器的最低位置1,开启AD转换
2835  0076 72105401      	bset	_ADC_CR1,#0
2837  007a               L5002:
2838                     ; 40 				while((ADC_CSR & 0x80)!=0x80);  // 等待转换结束
2840  007a c65400        	ld	a,_ADC_CSR
2841  007d a480          	and	a,#128
2842  007f a180          	cp	a,#128
2843  0081 26f7          	jrne	L5002
2844                     ; 41 				PB_ODR=ADC_DRL;        //把高位用PB显示出来
2846  0083 5554055005    	mov	_PB_ODR,_ADC_DRL
2847                     ; 42 				PD_ODR=ADC_DRH;        //把低位用PD显示出来
2849  0088 555404500f    	mov	_PD_ODR,_ADC_DRH
2850                     ; 43 				ADC_CSR&=(~0x80);      //软件清零 转换结束 标志位
2852  008d 721f5400      	bres	_ADC_CSR,#7
2854  0091 20d5          	jra	L1771
2867                     	xdef	_main
2868                     	xdef	_Init_AD
2869                     	xdef	_delay_us
2870                     	xdef	_delay_ms
2889                     	end
