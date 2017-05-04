   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  52                     ; 2 void delay_ms(u16 ms)
  52                     ; 3 {
  54                     	switch	.text
  55  0000               _delay_ms:
  57  0000 89            	pushw	x
  58  0001 88            	push	a
  59       00000001      OFST:	set	1
  62  0002 201b          	jra	L53
  63  0004               L33:
  64                     ; 7 				for(i=0;i<250;i++)
  66  0004 0f01          	clr	(OFST+0,sp)
  67  0006               L14:
  70  0006 0c01          	inc	(OFST+0,sp)
  73  0008 7b01          	ld	a,(OFST+0,sp)
  74  000a a1fa          	cp	a,#250
  75  000c 25f8          	jrult	L14
  76                     ; 9 				for(i=0;i<75;i++)
  78  000e 0f01          	clr	(OFST+0,sp)
  79  0010               L74:
  82  0010 0c01          	inc	(OFST+0,sp)
  85  0012 7b01          	ld	a,(OFST+0,sp)
  86  0014 a14b          	cp	a,#75
  87  0016 25f8          	jrult	L74
  88                     ; 11 				ms--;
  90  0018 1e02          	ldw	x,(OFST+1,sp)
  91  001a 1d0001        	subw	x,#1
  92  001d 1f02          	ldw	(OFST+1,sp),x
  93  001f               L53:
  94                     ; 5 			while(ms!=0)
  96  001f 1e02          	ldw	x,(OFST+1,sp)
  97  0021 26e1          	jrne	L33
  98                     ; 13 }
 101  0023 5b03          	addw	sp,#3
 102  0025 81            	ret
 145                     ; 15 void delay_us(u16 us)
 145                     ; 16 {
 146                     	switch	.text
 147  0026               _delay_us:
 149  0026 89            	pushw	x
 150  0027 88            	push	a
 151       00000001      OFST:	set	1
 154  0028 201b          	jra	L101
 155  002a               L77:
 156                     ; 20 				for(i=0;i<25;i++)
 158  002a 0f01          	clr	(OFST+0,sp)
 159  002c               L501:
 162  002c 0c01          	inc	(OFST+0,sp)
 165  002e 7b01          	ld	a,(OFST+0,sp)
 166  0030 a119          	cp	a,#25
 167  0032 25f8          	jrult	L501
 168                     ; 22 				for(i=0;i<7;i++)
 170  0034 0f01          	clr	(OFST+0,sp)
 171  0036               L311:
 174  0036 0c01          	inc	(OFST+0,sp)
 177  0038 7b01          	ld	a,(OFST+0,sp)
 178  003a a107          	cp	a,#7
 179  003c 25f8          	jrult	L311
 180                     ; 24 				us--;
 182  003e 1e02          	ldw	x,(OFST+1,sp)
 183  0040 1d0001        	subw	x,#1
 184  0043 1f02          	ldw	(OFST+1,sp),x
 185  0045               L101:
 186                     ; 18 			while(us!=0)
 188  0045 1e02          	ldw	x,(OFST+1,sp)
 189  0047 26e1          	jrne	L77
 190                     ; 26 }
 193  0049 5b03          	addw	sp,#3
 194  004b 81            	ret
 207                     	xdef	_delay_us
 208                     	xdef	_delay_ms
 227                     	end
