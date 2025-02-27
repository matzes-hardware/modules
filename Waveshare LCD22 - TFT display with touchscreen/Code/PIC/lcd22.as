opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 9453"

opt pagewidth 120

	opt pm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 13 "C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 13 "C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\main.c"
	dw 0x1832 ;#
	FNCALL	_main,_init_mcu
	FNCALL	_main,_init_lcd
	FNCALL	_main,_LCD_test
	FNCALL	_main,_delay_ms
	FNCALL	_main,_DisplayString
	FNCALL	_DisplayString,_swap
	FNCALL	_DisplayString,_DisplayChar_Reverse
	FNCALL	_DisplayString,_DisplayChar
	FNCALL	_DisplayChar_Reverse,_post_cmd
	FNCALL	_DisplayChar_Reverse,_post_data
	FNCALL	_DisplayChar,_post_cmd
	FNCALL	_DisplayChar,_post_data
	FNCALL	_LCD_test,_post_cmd
	FNCALL	_LCD_test,_post_data
	FNCALL	_LCD_test,_delay_ms
	FNCALL	_init_lcd,_init_lcd_spi
	FNCALL	_init_lcd,_lcd_rst
	FNCALL	_init_lcd,_post_cmd
	FNCALL	_init_lcd,_post_data
	FNCALL	_post_cmd,_post_data
	FNCALL	_lcd_rst,_delay_us
	FNROOT	_main
	global	_colorfol
psect	stringtext,class=STRCODE,delta=2,reloc=256
global __pstringtext
__pstringtext:
;	global	stringtab,__stringbase
stringtab:
;	String table - string pointers are 2 bytes each
	btfsc	(btemp+1),7
	ljmp	stringcode
	bcf	status,7
	btfsc	(btemp+1),0
	bsf	status,7
	movf	indf,w
	incf fsr
skipnz
incf btemp+1
	return
stringcode:
	movf btemp+1,w
andlw 7Fh
movwf	pclath
	movf	fsr,w
incf fsr
skipnz
incf btemp+1
	movwf pc
__stringbase:
	file	"C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\lcd_22.c"
	line	3
_colorfol:
	retlw	0
	retlw	0F8h

	retlw	0E0h
	retlw	07h

	retlw	01Fh
	retlw	0

	retlw	0E0h
	retlw	0FFh

	retlw	0
	retlw	0

	retlw	0FFh
	retlw	0FFh

	retlw	0FFh
	retlw	07h

	retlw	01Fh
	retlw	0F8h

	global	_ascii
psect	stringtext
	file	"C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\asciihex8X16.h"
	line	1
_ascii:
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0Fh
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0F8h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	0
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	0Fh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	0F8h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0FFh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	018h
	retlw	03Ch
	retlw	07Eh
	retlw	07Eh
	retlw	07Eh
	retlw	03Ch
	retlw	018h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0FFh
	retlw	0FFh
	retlw	0FFh
	retlw	0E7h
	retlw	0C3h
	retlw	081h
	retlw	081h
	retlw	081h
	retlw	0C3h
	retlw	0E7h
	retlw	0FFh
	retlw	0FFh
	retlw	0FFh
	retlw	0FFh
	retlw	0FFh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	01Fh
	retlw	05h
	retlw	05h
	retlw	09h
	retlw	09h
	retlw	010h
	retlw	010h
	retlw	038h
	retlw	044h
	retlw	044h
	retlw	044h
	retlw	038h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	01Ch
	retlw	022h
	retlw	022h
	retlw	022h
	retlw	01Ch
	retlw	08h
	retlw	08h
	retlw	07Fh
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	03h
	retlw	01Dh
	retlw	011h
	retlw	013h
	retlw	01Dh
	retlw	011h
	retlw	011h
	retlw	011h
	retlw	013h
	retlw	017h
	retlw	036h
	retlw	070h
	retlw	060h
	retlw	0
	retlw	0
	retlw	0
	retlw	08h
	retlw	08h
	retlw	05Dh
	retlw	022h
	retlw	022h
	retlw	022h
	retlw	063h
	retlw	022h
	retlw	022h
	retlw	022h
	retlw	05Dh
	retlw	08h
	retlw	08h
	retlw	0
	retlw	0
	retlw	0
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	0FFh
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	0
	retlw	0
	retlw	01h
	retlw	03h
	retlw	07h
	retlw	0Fh
	retlw	01Fh
	retlw	03Fh
	retlw	07Fh
	retlw	03Fh
	retlw	01Fh
	retlw	0Fh
	retlw	07h
	retlw	03h
	retlw	01h
	retlw	0
	retlw	0
	retlw	08h
	retlw	01Ch
	retlw	02Ah
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	02Ah
	retlw	01Ch
	retlw	08h
	retlw	0
	retlw	0
	retlw	0
	retlw	024h
	retlw	024h
	retlw	024h
	retlw	024h
	retlw	024h
	retlw	024h
	retlw	024h
	retlw	024h
	retlw	024h
	retlw	0
	retlw	0
	retlw	024h
	retlw	024h
	retlw	0
	retlw	0
	retlw	0
	retlw	01Fh
	retlw	025h
	retlw	045h
	retlw	045h
	retlw	045h
	retlw	025h
	retlw	01Dh
	retlw	05h
	retlw	05h
	retlw	05h
	retlw	05h
	retlw	05h
	retlw	0
	retlw	0
	retlw	0
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	0FFh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0FFh
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	0
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	0F8h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	0
	retlw	08h
	retlw	01Ch
	retlw	02Ah
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	0
	retlw	0
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	0Fh
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	04h
	retlw	02h
	retlw	07Fh
	retlw	02h
	retlw	04h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	010h
	retlw	020h
	retlw	07Fh
	retlw	020h
	retlw	010h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	0
	retlw	0
	retlw	018h
	retlw	018h
	retlw	0
	retlw	0
	retlw	0
	retlw	012h
	retlw	036h
	retlw	024h
	retlw	048h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	024h
	retlw	024h
	retlw	024h
	retlw	0FEh
	retlw	048h
	retlw	048h
	retlw	048h
	retlw	0FEh
	retlw	048h
	retlw	048h
	retlw	048h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	010h
	retlw	038h
	retlw	054h
	retlw	054h
	retlw	050h
	retlw	030h
	retlw	018h
	retlw	014h
	retlw	014h
	retlw	054h
	retlw	054h
	retlw	038h
	retlw	010h
	retlw	010h
	retlw	0
	retlw	0
	retlw	0
	retlw	044h
	retlw	0A4h
	retlw	0A8h
	retlw	0A8h
	retlw	0A8h
	retlw	054h
	retlw	01Ah
	retlw	02Ah
	retlw	02Ah
	retlw	02Ah
	retlw	044h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	030h
	retlw	048h
	retlw	048h
	retlw	048h
	retlw	050h
	retlw	06Eh
	retlw	0A4h
	retlw	094h
	retlw	088h
	retlw	089h
	retlw	076h
	retlw	0
	retlw	0
	retlw	0
	retlw	060h
	retlw	060h
	retlw	020h
	retlw	0C0h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	02h
	retlw	04h
	retlw	08h
	retlw	08h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	08h
	retlw	08h
	retlw	04h
	retlw	02h
	retlw	0
	retlw	0
	retlw	040h
	retlw	020h
	retlw	010h
	retlw	010h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	010h
	retlw	010h
	retlw	020h
	retlw	040h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	010h
	retlw	010h
	retlw	0D6h
	retlw	038h
	retlw	038h
	retlw	0D6h
	retlw	010h
	retlw	010h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	0FEh
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	060h
	retlw	060h
	retlw	020h
	retlw	0C0h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	07Fh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	060h
	retlw	060h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	01h
	retlw	02h
	retlw	02h
	retlw	04h
	retlw	04h
	retlw	08h
	retlw	08h
	retlw	010h
	retlw	010h
	retlw	020h
	retlw	020h
	retlw	040h
	retlw	040h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	018h
	retlw	024h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	024h
	retlw	018h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	010h
	retlw	070h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	07Ch
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	03Ch
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	04h
	retlw	04h
	retlw	08h
	retlw	010h
	retlw	020h
	retlw	042h
	retlw	07Eh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	03Ch
	retlw	042h
	retlw	042h
	retlw	04h
	retlw	018h
	retlw	04h
	retlw	02h
	retlw	02h
	retlw	042h
	retlw	044h
	retlw	038h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	04h
	retlw	0Ch
	retlw	014h
	retlw	024h
	retlw	024h
	retlw	044h
	retlw	044h
	retlw	07Eh
	retlw	04h
	retlw	04h
	retlw	01Eh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	07Eh
	retlw	040h
	retlw	040h
	retlw	040h
	retlw	058h
	retlw	064h
	retlw	02h
	retlw	02h
	retlw	042h
	retlw	044h
	retlw	038h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	01Ch
	retlw	024h
	retlw	040h
	retlw	040h
	retlw	058h
	retlw	064h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	024h
	retlw	018h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	07Eh
	retlw	044h
	retlw	044h
	retlw	08h
	retlw	08h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	03Ch
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	024h
	retlw	018h
	retlw	024h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	03Ch
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	018h
	retlw	024h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	026h
	retlw	01Ah
	retlw	02h
	retlw	02h
	retlw	024h
	retlw	038h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	018h
	retlw	018h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	018h
	retlw	018h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	010h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	010h
	retlw	010h
	retlw	020h
	retlw	0
	retlw	0
	retlw	0
	retlw	02h
	retlw	04h
	retlw	08h
	retlw	010h
	retlw	020h
	retlw	040h
	retlw	020h
	retlw	010h
	retlw	08h
	retlw	04h
	retlw	02h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0FEh
	retlw	0
	retlw	0
	retlw	0
	retlw	0FEh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	040h
	retlw	020h
	retlw	010h
	retlw	08h
	retlw	04h
	retlw	02h
	retlw	04h
	retlw	08h
	retlw	010h
	retlw	020h
	retlw	040h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	03Ch
	retlw	042h
	retlw	042h
	retlw	062h
	retlw	02h
	retlw	04h
	retlw	08h
	retlw	08h
	retlw	0
	retlw	018h
	retlw	018h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	038h
	retlw	044h
	retlw	05Ah
	retlw	0AAh
	retlw	0AAh
	retlw	0AAh
	retlw	0AAh
	retlw	0B4h
	retlw	042h
	retlw	044h
	retlw	038h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	010h
	retlw	010h
	retlw	018h
	retlw	028h
	retlw	028h
	retlw	024h
	retlw	03Ch
	retlw	044h
	retlw	042h
	retlw	042h
	retlw	0E7h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0F8h
	retlw	044h
	retlw	044h
	retlw	044h
	retlw	078h
	retlw	044h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	044h
	retlw	0F8h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	03Eh
	retlw	042h
	retlw	042h
	retlw	080h
	retlw	080h
	retlw	080h
	retlw	080h
	retlw	080h
	retlw	042h
	retlw	044h
	retlw	038h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0F8h
	retlw	044h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	044h
	retlw	0F8h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0FCh
	retlw	042h
	retlw	048h
	retlw	048h
	retlw	078h
	retlw	048h
	retlw	048h
	retlw	040h
	retlw	042h
	retlw	042h
	retlw	0FCh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0FCh
	retlw	042h
	retlw	048h
	retlw	048h
	retlw	078h
	retlw	048h
	retlw	048h
	retlw	040h
	retlw	040h
	retlw	040h
	retlw	0E0h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	03Ch
	retlw	044h
	retlw	044h
	retlw	080h
	retlw	080h
	retlw	080h
	retlw	08Eh
	retlw	084h
	retlw	044h
	retlw	044h
	retlw	038h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0E7h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	07Eh
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	0E7h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	07Ch
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	07Ch
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	03Eh
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	088h
	retlw	0F0h
	retlw	0
	retlw	0
	retlw	0
	retlw	0EEh
	retlw	044h
	retlw	048h
	retlw	050h
	retlw	070h
	retlw	050h
	retlw	048h
	retlw	048h
	retlw	044h
	retlw	044h
	retlw	0EEh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0E0h
	retlw	040h
	retlw	040h
	retlw	040h
	retlw	040h
	retlw	040h
	retlw	040h
	retlw	040h
	retlw	040h
	retlw	042h
	retlw	0FEh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0EEh
	retlw	06Ch
	retlw	06Ch
	retlw	06Ch
	retlw	06Ch
	retlw	054h
	retlw	054h
	retlw	054h
	retlw	054h
	retlw	054h
	retlw	0D6h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0C7h
	retlw	062h
	retlw	062h
	retlw	052h
	retlw	052h
	retlw	04Ah
	retlw	04Ah
	retlw	04Ah
	retlw	046h
	retlw	046h
	retlw	0E2h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	038h
	retlw	044h
	retlw	082h
	retlw	082h
	retlw	082h
	retlw	082h
	retlw	082h
	retlw	082h
	retlw	082h
	retlw	044h
	retlw	038h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0FCh
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	07Ch
	retlw	040h
	retlw	040h
	retlw	040h
	retlw	040h
	retlw	0E0h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	038h
	retlw	044h
	retlw	082h
	retlw	082h
	retlw	082h
	retlw	082h
	retlw	082h
	retlw	0B2h
	retlw	0CAh
	retlw	04Ch
	retlw	038h
	retlw	06h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0FCh
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	07Ch
	retlw	048h
	retlw	048h
	retlw	044h
	retlw	044h
	retlw	042h
	retlw	0E3h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	03Eh
	retlw	042h
	retlw	042h
	retlw	040h
	retlw	020h
	retlw	018h
	retlw	04h
	retlw	02h
	retlw	042h
	retlw	042h
	retlw	07Ch
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0FEh
	retlw	092h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	038h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0E7h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	03Ch
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0E7h
	retlw	042h
	retlw	042h
	retlw	044h
	retlw	024h
	retlw	024h
	retlw	028h
	retlw	028h
	retlw	018h
	retlw	010h
	retlw	010h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0D6h
	retlw	092h
	retlw	092h
	retlw	092h
	retlw	092h
	retlw	0AAh
	retlw	0AAh
	retlw	06Ch
	retlw	044h
	retlw	044h
	retlw	044h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0E7h
	retlw	042h
	retlw	024h
	retlw	024h
	retlw	018h
	retlw	018h
	retlw	018h
	retlw	024h
	retlw	024h
	retlw	042h
	retlw	0E7h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0EEh
	retlw	044h
	retlw	044h
	retlw	028h
	retlw	028h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	038h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	07Eh
	retlw	084h
	retlw	04h
	retlw	08h
	retlw	08h
	retlw	010h
	retlw	020h
	retlw	020h
	retlw	042h
	retlw	042h
	retlw	0FCh
	retlw	0
	retlw	0
	retlw	0
	retlw	01Eh
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	01Eh
	retlw	0
	retlw	0
	retlw	0
	retlw	040h
	retlw	040h
	retlw	020h
	retlw	020h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	08h
	retlw	08h
	retlw	04h
	retlw	04h
	retlw	04h
	retlw	02h
	retlw	02h
	retlw	0
	retlw	078h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	078h
	retlw	0
	retlw	0
	retlw	01Ch
	retlw	022h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0FFh
	retlw	0
	retlw	060h
	retlw	010h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	03Ch
	retlw	042h
	retlw	01Eh
	retlw	022h
	retlw	042h
	retlw	042h
	retlw	03Fh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0C0h
	retlw	040h
	retlw	040h
	retlw	040h
	retlw	058h
	retlw	064h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	064h
	retlw	058h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	01Ch
	retlw	022h
	retlw	040h
	retlw	040h
	retlw	040h
	retlw	022h
	retlw	01Ch
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	06h
	retlw	02h
	retlw	02h
	retlw	02h
	retlw	01Eh
	retlw	022h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	026h
	retlw	01Bh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	03Ch
	retlw	042h
	retlw	07Eh
	retlw	040h
	retlw	040h
	retlw	042h
	retlw	03Ch
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0Fh
	retlw	011h
	retlw	010h
	retlw	010h
	retlw	07Eh
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	07Ch
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	03Eh
	retlw	044h
	retlw	044h
	retlw	038h
	retlw	040h
	retlw	03Ch
	retlw	042h
	retlw	042h
	retlw	03Ch
	retlw	0
	retlw	0
	retlw	0
	retlw	0C0h
	retlw	040h
	retlw	040h
	retlw	040h
	retlw	05Ch
	retlw	062h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	0E7h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	030h
	retlw	030h
	retlw	0
	retlw	0
	retlw	070h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	07Ch
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0Ch
	retlw	0Ch
	retlw	0
	retlw	0
	retlw	01Ch
	retlw	04h
	retlw	04h
	retlw	04h
	retlw	04h
	retlw	04h
	retlw	04h
	retlw	044h
	retlw	078h
	retlw	0
	retlw	0
	retlw	0
	retlw	0C0h
	retlw	040h
	retlw	040h
	retlw	040h
	retlw	04Eh
	retlw	048h
	retlw	050h
	retlw	068h
	retlw	048h
	retlw	044h
	retlw	0EEh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	070h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	07Ch
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0FEh
	retlw	049h
	retlw	049h
	retlw	049h
	retlw	049h
	retlw	049h
	retlw	0EDh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0DCh
	retlw	062h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	0E7h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	03Ch
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	03Ch
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0D8h
	retlw	064h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	044h
	retlw	078h
	retlw	040h
	retlw	0E0h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	01Eh
	retlw	022h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	022h
	retlw	01Eh
	retlw	02h
	retlw	07h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0EEh
	retlw	032h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	0F8h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	03Eh
	retlw	042h
	retlw	040h
	retlw	03Ch
	retlw	02h
	retlw	042h
	retlw	07Ch
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	010h
	retlw	010h
	retlw	07Ch
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	0Ch
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0C6h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	042h
	retlw	046h
	retlw	03Bh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0E7h
	retlw	042h
	retlw	024h
	retlw	024h
	retlw	028h
	retlw	010h
	retlw	010h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0D7h
	retlw	092h
	retlw	092h
	retlw	0AAh
	retlw	0AAh
	retlw	044h
	retlw	044h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	06Eh
	retlw	024h
	retlw	018h
	retlw	018h
	retlw	018h
	retlw	024h
	retlw	076h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0E7h
	retlw	042h
	retlw	024h
	retlw	024h
	retlw	028h
	retlw	018h
	retlw	010h
	retlw	010h
	retlw	0E0h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	07Eh
	retlw	044h
	retlw	08h
	retlw	010h
	retlw	010h
	retlw	022h
	retlw	07Eh
	retlw	0
	retlw	0
	retlw	0
	retlw	03h
	retlw	04h
	retlw	04h
	retlw	04h
	retlw	04h
	retlw	04h
	retlw	08h
	retlw	04h
	retlw	04h
	retlw	04h
	retlw	04h
	retlw	04h
	retlw	04h
	retlw	03h
	retlw	0
	retlw	0
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	08h
	retlw	0
	retlw	060h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	08h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	060h
	retlw	0
	retlw	0
	retlw	04Ch
	retlw	043h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	global	_colorfol
	global	_ascii
	global	swap@b
	global	_INTCON
_INTCON	set	11
	global	_PIR1
_PIR1	set	12
	global	_PORTA
_PORTA	set	5
	global	_PORTB
_PORTB	set	6
	global	_SSPBUF
_SSPBUF	set	19
	global	_SSPCON
_SSPCON	set	20
	global	_RA0
_RA0	set	40
	global	_RA1
_RA1	set	41
	global	_RA2
_RA2	set	42
	global	_SSPIF
_SSPIF	set	99
	global	_SSPSTAT
_SSPSTAT	set	148
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	
STR_1:	
	retlw	87	;'W'
	retlw	97	;'a'
	retlw	118	;'v'
	retlw	101	;'e'
	retlw	83	;'S'
	retlw	104	;'h'
	retlw	97	;'a'
	retlw	114	;'r'
	retlw	101	;'e'
	retlw	0
psect	stringtext
STR_2	equ	STR_1+0
	file	"lcd22.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
swap@b:
       ds      10

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
	clrf	((__pbssBANK0)+6)&07Fh
	clrf	((__pbssBANK0)+7)&07Fh
	clrf	((__pbssBANK0)+8)&07Fh
	clrf	((__pbssBANK0)+9)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_init_lcd
?_init_lcd:	; 0 bytes @ 0x0
	global	?_LCD_test
?_LCD_test:	; 0 bytes @ 0x0
	global	?_delay_ms
?_delay_ms:	; 0 bytes @ 0x0
	global	?_init_mcu
?_init_mcu:	; 0 bytes @ 0x0
	global	??_init_mcu
??_init_mcu:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_delay_us
?_delay_us:	; 0 bytes @ 0x0
	global	?_init_lcd_spi
?_init_lcd_spi:	; 0 bytes @ 0x0
	global	??_init_lcd_spi
??_init_lcd_spi:	; 0 bytes @ 0x0
	global	?_post_data
?_post_data:	; 0 bytes @ 0x0
	global	?_lcd_rst
?_lcd_rst:	; 0 bytes @ 0x0
	global	?_swap
?_swap:	; 1 bytes @ 0x0
	global	swap@sz
swap@sz:	; 1 bytes @ 0x0
	global	delay_ms@ms
delay_ms@ms:	; 2 bytes @ 0x0
	global	delay_us@us
delay_us@us:	; 2 bytes @ 0x0
	global	post_data@data
post_data@data:	; 2 bytes @ 0x0
	ds	1
	global	??_swap
??_swap:	; 0 bytes @ 0x1
	ds	1
	global	??_delay_ms
??_delay_ms:	; 0 bytes @ 0x2
	global	??_delay_us
??_delay_us:	; 0 bytes @ 0x2
	global	??_post_data
??_post_data:	; 0 bytes @ 0x2
	global	?_post_cmd
?_post_cmd:	; 0 bytes @ 0x2
	global	delay_ms@i
delay_ms@i:	; 1 bytes @ 0x2
	global	delay_us@i
delay_us@i:	; 1 bytes @ 0x2
	global	post_cmd@index
post_cmd@index:	; 2 bytes @ 0x2
	ds	1
	global	??_lcd_rst
??_lcd_rst:	; 0 bytes @ 0x3
	global	swap@s
swap@s:	; 1 bytes @ 0x3
	ds	1
	global	swap@i
swap@i:	; 1 bytes @ 0x4
	global	post_cmd@cmd
post_cmd@cmd:	; 2 bytes @ 0x4
	ds	2
	global	??_init_lcd
??_init_lcd:	; 0 bytes @ 0x6
	global	??_LCD_test
??_LCD_test:	; 0 bytes @ 0x6
	global	??_post_cmd
??_post_cmd:	; 0 bytes @ 0x6
	global	?_DisplayChar
?_DisplayChar:	; 0 bytes @ 0x6
	global	?_DisplayChar_Reverse
?_DisplayChar_Reverse:	; 0 bytes @ 0x6
	global	DisplayChar@postion_x
DisplayChar@postion_x:	; 1 bytes @ 0x6
	global	DisplayChar_Reverse@postion_x
DisplayChar_Reverse@postion_x:	; 1 bytes @ 0x6
	global	init_lcd@x
init_lcd@x:	; 2 bytes @ 0x6
	global	LCD_test@temp
LCD_test@temp:	; 2 bytes @ 0x6
	ds	1
	global	DisplayChar@postion_y
DisplayChar@postion_y:	; 1 bytes @ 0x7
	global	DisplayChar_Reverse@postion_y
DisplayChar_Reverse@postion_y:	; 1 bytes @ 0x7
	ds	1
	global	??_DisplayChar
??_DisplayChar:	; 0 bytes @ 0x8
	global	??_DisplayChar_Reverse
??_DisplayChar_Reverse:	; 0 bytes @ 0x8
	global	LCD_test@i
LCD_test@i:	; 1 bytes @ 0x8
	global	init_lcd@y
init_lcd@y:	; 2 bytes @ 0x8
	ds	1
	global	LCD_test@num
LCD_test@num:	; 2 bytes @ 0x9
	ds	1
	global	??_DisplayString
??_DisplayString:	; 0 bytes @ 0xA
	ds	1
	global	LCD_test@n
LCD_test@n:	; 1 bytes @ 0xB
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0xC
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	DisplayChar@casc
DisplayChar@casc:	; 1 bytes @ 0x0
	global	DisplayChar_Reverse@casc
DisplayChar_Reverse@casc:	; 1 bytes @ 0x0
	ds	1
	global	DisplayChar@p
DisplayChar@p:	; 2 bytes @ 0x1
	global	DisplayChar_Reverse@p
DisplayChar_Reverse@p:	; 2 bytes @ 0x1
	ds	2
	global	DisplayChar@b
DisplayChar@b:	; 1 bytes @ 0x3
	global	DisplayChar_Reverse@b
DisplayChar_Reverse@b:	; 1 bytes @ 0x3
	ds	1
	global	DisplayChar@i
DisplayChar@i:	; 1 bytes @ 0x4
	global	DisplayChar_Reverse@i
DisplayChar_Reverse@i:	; 1 bytes @ 0x4
	ds	1
	global	DisplayChar@j
DisplayChar@j:	; 1 bytes @ 0x5
	global	DisplayChar_Reverse@j
DisplayChar_Reverse@j:	; 1 bytes @ 0x5
	ds	1
	global	?_DisplayString
?_DisplayString:	; 0 bytes @ 0x6
	global	DisplayString@s
DisplayString@s:	; 2 bytes @ 0x6
	ds	2
	global	DisplayString@x
DisplayString@x:	; 1 bytes @ 0x8
	ds	1
	global	DisplayString@y
DisplayString@y:	; 1 bytes @ 0x9
	ds	1
	global	DisplayString@Reverse
DisplayString@Reverse:	; 1 bytes @ 0xA
	ds	1
	global	DisplayString@a
DisplayString@a:	; 10 bytes @ 0xB
	ds	10
	global	DisplayString@i
DisplayString@i:	; 1 bytes @ 0x15
	ds	1
;;Data sizes: Strings 10, constant 2064, data 0, bss 10, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     12      12
;; BANK0           80     22      32
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?_swap	PTR unsigned char  size(1) Largest target is 10
;;		 -> DisplayString@a(BANK0[10]), swap@b(BANK0[10]), 
;;
;; DisplayString@s	PTR unsigned char  size(2) Largest target is 10
;;		 -> DisplayString@a(BANK0[10]), swap@b(BANK0[10]), STR_2(CODE[10]), STR_1(CODE[10]), 
;;
;; sp__swap	PTR unsigned char  size(1) Largest target is 10
;;		 -> DisplayString@a(BANK0[10]), swap@b(BANK0[10]), 
;;
;; swap@s	PTR unsigned char  size(1) Largest target is 10
;;		 -> DisplayString@a(BANK0[10]), swap@b(BANK0[10]), 
;;
;; DisplayChar_Reverse@p	PTR unsigned char  size(2) Largest target is 2048
;;		 -> ascii(CODE[2048]), 
;;
;; DisplayChar@p	PTR unsigned char  size(2) Largest target is 2048
;;		 -> ascii(CODE[2048]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_LCD_test
;;   _DisplayString->_DisplayChar_Reverse
;;   _DisplayString->_DisplayChar
;;   _DisplayChar_Reverse->_post_cmd
;;   _DisplayChar->_post_cmd
;;   _LCD_test->_post_cmd
;;   _init_lcd->_post_cmd
;;   _post_cmd->_post_data
;;   _lcd_rst->_delay_us
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_DisplayString
;;   _DisplayString->_DisplayChar_Reverse
;;   _DisplayString->_DisplayChar
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0    2302
;;                           _init_mcu
;;                           _init_lcd
;;                           _LCD_test
;;                           _delay_ms
;;                      _DisplayString
;; ---------------------------------------------------------------------------------
;; (1) _DisplayString                                       17    12      5    1401
;;                                             10 COMMON     1     1      0
;;                                              6 BANK0     16    11      5
;;                               _swap
;;                _DisplayChar_Reverse
;;                        _DisplayChar
;; ---------------------------------------------------------------------------------
;; (2) _DisplayChar_Reverse                                 10     8      2     448
;;                                              6 COMMON     4     2      2
;;                                              0 BANK0      6     6      0
;;                           _post_cmd
;;                          _post_data
;; ---------------------------------------------------------------------------------
;; (2) _DisplayChar                                         10     8      2     448
;;                                              6 COMMON     4     2      2
;;                                              0 BANK0      6     6      0
;;                           _post_cmd
;;                          _post_data
;; ---------------------------------------------------------------------------------
;; (1) _LCD_test                                             6     6      0     527
;;                                              6 COMMON     6     6      0
;;                           _post_cmd
;;                          _post_data
;;                           _delay_ms
;; ---------------------------------------------------------------------------------
;; (1) _init_lcd                                             4     4      0     299
;;                                              6 COMMON     4     4      0
;;                       _init_lcd_spi
;;                            _lcd_rst
;;                           _post_cmd
;;                          _post_data
;; ---------------------------------------------------------------------------------
;; (3) _post_cmd                                             4     0      4      88
;;                                              2 COMMON     4     0      4
;;                          _post_data
;; ---------------------------------------------------------------------------------
;; (2) _lcd_rst                                              0     0      0      75
;;                           _delay_us
;; ---------------------------------------------------------------------------------
;; (2) _swap                                                 5     4      1     138
;;                                              0 COMMON     5     4      1
;; ---------------------------------------------------------------------------------
;; (3) _post_data                                            2     0      2      44
;;                                              0 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; (2) _init_lcd_spi                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _delay_us                                             3     1      2      75
;;                                              0 COMMON     3     1      2
;; ---------------------------------------------------------------------------------
;; (1) _delay_ms                                             3     1      2      75
;;                                              0 COMMON     3     1      2
;; ---------------------------------------------------------------------------------
;; (1) _init_mcu                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _init_mcu
;;   _init_lcd
;;     _init_lcd_spi
;;     _lcd_rst
;;       _delay_us
;;     _post_cmd
;;       _post_data
;;     _post_data
;;   _LCD_test
;;     _post_cmd
;;       _post_data
;;     _post_data
;;     _delay_ms
;;   _delay_ms
;;   _DisplayString
;;     _swap
;;     _DisplayChar_Reverse
;;       _post_cmd
;;         _post_data
;;       _post_data
;;     _DisplayChar
;;       _post_cmd
;;         _post_data
;;       _post_data
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      C       C       1       85.7%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       4       2        0.0%
;;ABS                  0      0      2C       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50     16      20       5       40.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      30      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 22 in file "C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_init_mcu
;;		_init_lcd
;;		_LCD_test
;;		_delay_ms
;;		_DisplayString
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\main.c"
	line	22
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	24
	
l3434:	
;main.c: 24: init_mcu();
	fcall	_init_mcu
	line	25
;main.c: 25: init_lcd();
	fcall	_init_lcd
	line	27
	
l3436:	
;main.c: 27: LCD_test();
	fcall	_LCD_test
	line	28
	
l3438:	
;main.c: 28: TRISB=0;PORTB=0XF0;delay_ms(1000);
	bsf	status, 5	;RP0=1, select bank1
	clrf	(134)^080h	;volatile
	
l3440:	
	movlw	(0F0h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(6)	;volatile
	
l3442:	
	movlw	low(03E8h)
	movwf	(?_delay_ms)
	movlw	high(03E8h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	line	29
	
l3444:	
;main.c: 29: DisplayString("WaveShare",6,9,0);
	movlw	low(STR_1|8000h)
	movwf	(?_DisplayString)
	movlw	high(STR_1|8000h)
	movwf	((?_DisplayString))+1
	movlw	(06h)
	movwf	0+(?_DisplayString)+02h
	movlw	(09h)
	movwf	0+(?_DisplayString)+03h
	clrf	0+(?_DisplayString)+04h
	fcall	_DisplayString
	line	30
	
l3446:	
;main.c: 30: DisplayString("WaveShare",6,10,1);
	movlw	low(STR_2|8000h)
	movwf	(?_DisplayString)
	movlw	high(STR_2|8000h)
	movwf	((?_DisplayString))+1
	movlw	(06h)
	movwf	0+(?_DisplayString)+02h
	movlw	(0Ah)
	movwf	0+(?_DisplayString)+03h
	clrf	0+(?_DisplayString)+04h
	incf	0+(?_DisplayString)+04h,f
	fcall	_DisplayString
	line	31
	
l3448:	
;main.c: 31: TRISB=0;PORTB=0X0f;delay_ms(1000);
	bsf	status, 5	;RP0=1, select bank1
	clrf	(134)^080h	;volatile
	
l3450:	
	movlw	(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(6)	;volatile
	
l3452:	
	movlw	low(03E8h)
	movwf	(?_delay_ms)
	movlw	high(03E8h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	line	47
	
l697:	
	line	32
	goto	l697
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	48
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_DisplayString
psect	text300,local,class=CODE,delta=2
global __ptext300
__ptext300:

;; *************** function _DisplayString *****************
;; Defined at:
;;		line 309 in file "C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\lcd_22.c"
;; Parameters:    Size  Location     Type
;;  s               2    6[BANK0 ] PTR unsigned char 
;;		 -> DisplayString@a(10), swap@b(10), STR_2(10), STR_1(10), 
;;  x               1    8[BANK0 ] unsigned char 
;;  y               1    9[BANK0 ] unsigned char 
;;  Reverse         1   10[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  a              10   11[BANK0 ] unsigned char [10]
;;  i               1   21[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       5       0       0       0
;;      Locals:         0      11       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1      16       0       0       0
;;Total ram usage:       17 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_swap
;;		_DisplayChar_Reverse
;;		_DisplayChar
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text300
	file	"C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\lcd_22.c"
	line	309
	global	__size_of_DisplayString
	__size_of_DisplayString	equ	__end_of_DisplayString-_DisplayString
	
_DisplayString:	
	opt	stack 4
; Regs used in _DisplayString: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	311
	
l3402:	
;lcd_22.c: 310: u8 a[10],i;
;lcd_22.c: 311: if(Reverse)
	movf	(DisplayString@Reverse),w
	skipz
	goto	u450
	goto	l3432
u450:
	line	313
	
l3404:	
;lcd_22.c: 312: {
;lcd_22.c: 313: i=0;
	clrf	(DisplayString@i)
	line	314
;lcd_22.c: 314: while(*s){a[i]=*s;s++;i++;}
	goto	l3412
	
l3406:	
	movf	(DisplayString@s+1),w
	movwf	btemp+1
	movf	(DisplayString@s),w
	movwf	fsr0
	fcall	stringtab
	movwf	(??_DisplayString+0)+0
	movf	(DisplayString@i),w
	addlw	DisplayString@a&0ffh
	movwf	fsr0
	movf	(??_DisplayString+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l3408:	
	incf	(DisplayString@s),f
	skipnz
	incf	(DisplayString@s+1),f
	
l3410:	
	incf	(DisplayString@i),f
	
l3412:	
	movf	(DisplayString@s+1),w
	movwf	btemp+1
	movf	(DisplayString@s),w
	movwf	fsr0
	fcall	stringtab
	iorlw	0
	skipz
	goto	u461
	goto	u460
u461:
	goto	l3406
u460:
	line	315
	
l3414:	
;lcd_22.c: 315: s=swap(a,sizeof(a));
	movlw	(0Ah)
	movwf	(?_swap)
	movlw	(DisplayString@a)&0ffh
	fcall	_swap
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(DisplayString@s)
	movlw	(0x0/2)
	movwf	(DisplayString@s+1)
	goto	l3432
	line	319
	
l3416:	
;lcd_22.c: 318: {
;lcd_22.c: 319: if(Reverse)
	movf	(DisplayString@Reverse),w
	skipz
	goto	u470
	goto	l3420
u470:
	line	320
	
l3418:	
;lcd_22.c: 320: {DisplayChar_Reverse(*s,x,y);}
	movf	(DisplayString@x),w
	movwf	(?_DisplayChar_Reverse)
	movf	(DisplayString@y),w
	movwf	0+(?_DisplayChar_Reverse)+01h
	movf	(DisplayString@s+1),w
	movwf	btemp+1
	movf	(DisplayString@s),w
	movwf	fsr0
	fcall	stringtab
	fcall	_DisplayChar_Reverse
	goto	l3422
	line	322
	
l3420:	
;lcd_22.c: 321: else
;lcd_22.c: 322: {DisplayChar(*s,x,y);}
	movf	(DisplayString@x),w
	movwf	(?_DisplayChar)
	movf	(DisplayString@y),w
	movwf	0+(?_DisplayChar)+01h
	movf	(DisplayString@s+1),w
	movwf	btemp+1
	movf	(DisplayString@s),w
	movwf	fsr0
	fcall	stringtab
	fcall	_DisplayChar
	line	323
	
l3422:	
;lcd_22.c: 323: if(++x>=30)
	movlw	(01Eh)
	incf	(DisplayString@x),f
	subwf	((DisplayString@x)),w
	skipc
	goto	u481
	goto	u480
u481:
	goto	l3430
u480:
	line	325
	
l3424:	
;lcd_22.c: 324: {
;lcd_22.c: 325: x=0;
	clrf	(DisplayString@x)
	line	326
	
l3426:	
;lcd_22.c: 326: if(++y>=20)
	movlw	(014h)
	incf	(DisplayString@y),f
	subwf	((DisplayString@y)),w
	skipc
	goto	u491
	goto	u490
u491:
	goto	l3430
u490:
	line	328
	
l3428:	
;lcd_22.c: 327: {
;lcd_22.c: 328: y=0;
	clrf	(DisplayString@y)
	line	331
	
l3430:	
;lcd_22.c: 329: }
;lcd_22.c: 330: }
;lcd_22.c: 331: s++;
	incf	(DisplayString@s),f
	skipnz
	incf	(DisplayString@s+1),f
	line	317
	
l3432:	
	movf	(DisplayString@s+1),w
	movwf	btemp+1
	movf	(DisplayString@s),w
	movwf	fsr0
	fcall	stringtab
	iorlw	0
	skipz
	goto	u501
	goto	u500
u501:
	goto	l3416
u500:
	line	333
	
l1487:	
	return
	opt stack 0
GLOBAL	__end_of_DisplayString
	__end_of_DisplayString:
;; =============== function _DisplayString ends ============

	signat	_DisplayString,16504
	global	_DisplayChar_Reverse
psect	text301,local,class=CODE,delta=2
global __ptext301
__ptext301:

;; *************** function _DisplayChar_Reverse *****************
;; Defined at:
;;		line 256 in file "C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\lcd_22.c"
;; Parameters:    Size  Location     Type
;;  casc            1    wreg     unsigned char 
;;  postion_x       1    6[COMMON] unsigned char 
;;  postion_y       1    7[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  casc            1    0[BANK0 ] unsigned char 
;;  p               2    1[BANK0 ] PTR unsigned char 
;;		 -> ascii(2048), 
;;  j               1    5[BANK0 ] unsigned char 
;;  i               1    4[BANK0 ] unsigned char 
;;  b               1    3[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         4       6       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_post_cmd
;;		_post_data
;; This function is called by:
;;		_DisplayString
;; This function uses a non-reentrant model
;;
psect	text301
	file	"C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\lcd_22.c"
	line	256
	global	__size_of_DisplayChar_Reverse
	__size_of_DisplayChar_Reverse	equ	__end_of_DisplayChar_Reverse-_DisplayChar_Reverse
	
_DisplayChar_Reverse:	
	opt	stack 4
; Regs used in _DisplayChar_Reverse: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;DisplayChar_Reverse@casc stored from wreg
	line	260
	movwf	(DisplayChar_Reverse@casc)
	
l3344:	
;lcd_22.c: 257: u8 i,j,b;
;lcd_22.c: 258: u8 *p;
;lcd_22.c: 260: {TRISA=0;RA0=0;};
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	
l3346:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(40/8),(40)&7
	line	261
	
l3348:	
;lcd_22.c: 261: post_cmd(0x08,postion_x*8);
	movlw	08h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movf	(DisplayChar_Reverse@postion_x),w
	movwf	(??_DisplayChar_Reverse+0)+0
	clrf	(??_DisplayChar_Reverse+0)+0+1
	clrc
	rlf	(??_DisplayChar_Reverse+0)+0,f
	rlf	(??_DisplayChar_Reverse+0)+1,f
	clrc
	rlf	(??_DisplayChar_Reverse+0)+0,f
	rlf	(??_DisplayChar_Reverse+0)+1,f
	clrc
	rlf	(??_DisplayChar_Reverse+0)+0,f
	rlf	(??_DisplayChar_Reverse+0)+1,f
	movf	0+(??_DisplayChar_Reverse+0)+0,w
	movwf	0+(?_post_cmd)+02h
	movf	1+(??_DisplayChar_Reverse+0)+0,w
	movwf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	262
	
l3350:	
;lcd_22.c: 262: post_cmd(0x0a,postion_y*16);
	movlw	0Ah
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movf	(DisplayChar_Reverse@postion_y),w
	movwf	(??_DisplayChar_Reverse+0)+0
	clrf	(??_DisplayChar_Reverse+0)+0+1
	swapf	(??_DisplayChar_Reverse+0)+0,f
	swapf	(??_DisplayChar_Reverse+0)+1,f
	movlw	0f0h
	andwf	(??_DisplayChar_Reverse+0)+1,f
	movf	(??_DisplayChar_Reverse+0)+0,w
	andlw	0fh
	iorwf	(??_DisplayChar_Reverse+0)+1,f
	movlw	0f0h
	andwf	(??_DisplayChar_Reverse+0)+0,f
	movf	0+(??_DisplayChar_Reverse+0)+0,w
	movwf	0+(?_post_cmd)+02h
	movf	1+(??_DisplayChar_Reverse+0)+0,w
	movwf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	263
	
l3352:	
;lcd_22.c: 263: post_cmd(0x09,postion_x*8+7);
	movlw	09h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movf	(DisplayChar_Reverse@postion_x),w
	movwf	(??_DisplayChar_Reverse+0)+0
	clrf	(??_DisplayChar_Reverse+0)+0+1
	clrc
	rlf	(??_DisplayChar_Reverse+0)+0,f
	rlf	(??_DisplayChar_Reverse+0)+1,f
	clrc
	rlf	(??_DisplayChar_Reverse+0)+0,f
	rlf	(??_DisplayChar_Reverse+0)+1,f
	clrc
	rlf	(??_DisplayChar_Reverse+0)+0,f
	rlf	(??_DisplayChar_Reverse+0)+1,f
	movf	0+(??_DisplayChar_Reverse+0)+0,w
	addlw	low(07h)
	movwf	0+(?_post_cmd)+02h
	movf	1+(??_DisplayChar_Reverse+0)+0,w
	skipnc
	addlw	1
	addlw	high(07h)
	movwf	1+0+(?_post_cmd)+02h
	fcall	_post_cmd
	line	264
	
l3354:	
;lcd_22.c: 264: post_cmd(0x0b,postion_y*16+15);
	movlw	0Bh
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movf	(DisplayChar_Reverse@postion_y),w
	movwf	(??_DisplayChar_Reverse+0)+0
	clrf	(??_DisplayChar_Reverse+0)+0+1
	swapf	(??_DisplayChar_Reverse+0)+0,f
	swapf	(??_DisplayChar_Reverse+0)+1,f
	movlw	0f0h
	andwf	(??_DisplayChar_Reverse+0)+1,f
	movf	(??_DisplayChar_Reverse+0)+0,w
	andlw	0fh
	iorwf	(??_DisplayChar_Reverse+0)+1,f
	movlw	0f0h
	andwf	(??_DisplayChar_Reverse+0)+0,f
	movf	0+(??_DisplayChar_Reverse+0)+0,w
	addlw	low(0Fh)
	movwf	0+(?_post_cmd)+02h
	movf	1+(??_DisplayChar_Reverse+0)+0,w
	skipnc
	addlw	1
	addlw	high(0Fh)
	movwf	1+0+(?_post_cmd)+02h
	fcall	_post_cmd
	line	266
	
l3356:	
;lcd_22.c: 266: post_cmd(0x06,postion_x*8);
	movlw	06h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movf	(DisplayChar_Reverse@postion_x),w
	movwf	(??_DisplayChar_Reverse+0)+0
	clrf	(??_DisplayChar_Reverse+0)+0+1
	clrc
	rlf	(??_DisplayChar_Reverse+0)+0,f
	rlf	(??_DisplayChar_Reverse+0)+1,f
	clrc
	rlf	(??_DisplayChar_Reverse+0)+0,f
	rlf	(??_DisplayChar_Reverse+0)+1,f
	clrc
	rlf	(??_DisplayChar_Reverse+0)+0,f
	rlf	(??_DisplayChar_Reverse+0)+1,f
	movf	0+(??_DisplayChar_Reverse+0)+0,w
	movwf	0+(?_post_cmd)+02h
	movf	1+(??_DisplayChar_Reverse+0)+0,w
	movwf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	267
	
l3358:	
;lcd_22.c: 267: post_cmd(0x07,postion_y*16);
	movlw	07h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movf	(DisplayChar_Reverse@postion_y),w
	movwf	(??_DisplayChar_Reverse+0)+0
	clrf	(??_DisplayChar_Reverse+0)+0+1
	swapf	(??_DisplayChar_Reverse+0)+0,f
	swapf	(??_DisplayChar_Reverse+0)+1,f
	movlw	0f0h
	andwf	(??_DisplayChar_Reverse+0)+1,f
	movf	(??_DisplayChar_Reverse+0)+0,w
	andlw	0fh
	iorwf	(??_DisplayChar_Reverse+0)+1,f
	movlw	0f0h
	andwf	(??_DisplayChar_Reverse+0)+0,f
	movf	0+(??_DisplayChar_Reverse+0)+0,w
	movwf	0+(?_post_cmd)+02h
	movf	1+(??_DisplayChar_Reverse+0)+0,w
	movwf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	269
;lcd_22.c: 269: {TRISA=0;RA1=0;};
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	
l3360:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(41/8),(41)&7
	line	270
	
l3362:	
;lcd_22.c: 270: post_data(0x0E);
	movlw	0Eh
	movwf	(?_post_data)
	clrf	(?_post_data+1)
	fcall	_post_data
	line	271
	
l3364:	
;lcd_22.c: 271: {TRISA=0;RA1=1;};
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	
l3366:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(41/8),(41)&7
	line	272
	
l3368:	
;lcd_22.c: 272: p=ascii;
	movlw	low(_ascii|8000h)
	movwf	(DisplayChar_Reverse@p)
	movlw	high(_ascii|8000h)
	movwf	((DisplayChar_Reverse@p))+1
	line	273
	
l3370:	
;lcd_22.c: 273: p+=casc*16;
	movf	(DisplayChar_Reverse@casc),w
	movwf	(??_DisplayChar_Reverse+0)+0
	clrf	(??_DisplayChar_Reverse+0)+0+1
	swapf	(??_DisplayChar_Reverse+0)+0,f
	swapf	(??_DisplayChar_Reverse+0)+1,f
	movlw	0f0h
	andwf	(??_DisplayChar_Reverse+0)+1,f
	movf	(??_DisplayChar_Reverse+0)+0,w
	andlw	0fh
	iorwf	(??_DisplayChar_Reverse+0)+1,f
	movlw	0f0h
	andwf	(??_DisplayChar_Reverse+0)+0,f
	movf	0+(??_DisplayChar_Reverse+0)+0,w
	addwf	(DisplayChar_Reverse@p),f
	skipnc
	incf	(DisplayChar_Reverse@p+1),f
	movf	1+(??_DisplayChar_Reverse+0)+0,w
	addwf	(DisplayChar_Reverse@p+1),f
	line	274
	
l3372:	
;lcd_22.c: 274: for(j=16;j>0;j--)
	movlw	(010h)
	movwf	(DisplayChar_Reverse@j)
	line	276
	
l3378:	
;lcd_22.c: 275: {
;lcd_22.c: 276: b=*(p+j-1);
	movf	(DisplayChar_Reverse@j),w
	addwf	(DisplayChar_Reverse@p),w
	movwf	(??_DisplayChar_Reverse+0)+0
	movlw	0
	skipnc
	movlw	1
	addwf	(DisplayChar_Reverse@p+1),w
	movwf	1+(??_DisplayChar_Reverse+0)+0
	movlw	low(-1)
	addwf	0+(??_DisplayChar_Reverse+0)+0,w
	movwf	fsr0
	movlw	high(-1)
	skipnc
	movlw	high(-1)+1
	addwf	1+(??_DisplayChar_Reverse+0)+0,w
	movwf	btemp+1
	fcall	stringtab
	movwf	(DisplayChar_Reverse@b)
	line	277
	
l3380:	
;lcd_22.c: 277: for(i=0;i<8;i++)
	clrf	(DisplayChar_Reverse@i)
	line	278
	
l1461:	
	line	279
;lcd_22.c: 278: {
;lcd_22.c: 279: if(b&0x01)
	btfss	(DisplayChar_Reverse@b),(0)&7
	goto	u421
	goto	u420
u421:
	goto	l3388
u420:
	line	281
	
l3386:	
;lcd_22.c: 280: {
;lcd_22.c: 281: post_data(0x0000);
	clrf	(?_post_data)
	clrf	(?_post_data+1)
	fcall	_post_data
	line	282
;lcd_22.c: 282: }
	goto	l3390
	line	285
	
l3388:	
;lcd_22.c: 283: else
;lcd_22.c: 284: {
;lcd_22.c: 285: post_data(0xFFE0);
	movlw	low(0FFE0h)
	movwf	(?_post_data)
	movlw	high(0FFE0h)
	movwf	((?_post_data))+1
	fcall	_post_data
	line	287
	
l3390:	
;lcd_22.c: 286: }
;lcd_22.c: 287: b=b>>1;
	clrc
	rrf	(DisplayChar_Reverse@b),f
	line	277
	
l3392:	
	incf	(DisplayChar_Reverse@i),f
	
l3394:	
	movlw	(08h)
	subwf	(DisplayChar_Reverse@i),w
	skipc
	goto	u431
	goto	u430
u431:
	goto	l1461
u430:
	line	274
	
l3396:	
	decf	(DisplayChar_Reverse@j),f
	movf	(DisplayChar_Reverse@j),f
	skipz
	goto	u441
	goto	u440
u441:
	goto	l3378
u440:
	line	291
	
l3398:	
;lcd_22.c: 289: }
;lcd_22.c: 290: }
;lcd_22.c: 291: {TRISA=0;RA0=1;};
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	
l3400:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(40/8),(40)&7
	line	292
	
l1465:	
	return
	opt stack 0
GLOBAL	__end_of_DisplayChar_Reverse
	__end_of_DisplayChar_Reverse:
;; =============== function _DisplayChar_Reverse ends ============

	signat	_DisplayChar_Reverse,12408
	global	_DisplayChar
psect	text302,local,class=CODE,delta=2
global __ptext302
__ptext302:

;; *************** function _DisplayChar *****************
;; Defined at:
;;		line 218 in file "C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\lcd_22.c"
;; Parameters:    Size  Location     Type
;;  casc            1    wreg     unsigned char 
;;  postion_x       1    6[COMMON] unsigned char 
;;  postion_y       1    7[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  casc            1    0[BANK0 ] unsigned char 
;;  p               2    1[BANK0 ] PTR unsigned char 
;;		 -> ascii(2048), 
;;  j               1    5[BANK0 ] unsigned char 
;;  i               1    4[BANK0 ] unsigned char 
;;  b               1    3[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         4       6       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_post_cmd
;;		_post_data
;; This function is called by:
;;		_DisplayString
;; This function uses a non-reentrant model
;;
psect	text302
	file	"C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\lcd_22.c"
	line	218
	global	__size_of_DisplayChar
	__size_of_DisplayChar	equ	__end_of_DisplayChar-_DisplayChar
	
_DisplayChar:	
	opt	stack 4
; Regs used in _DisplayChar: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;DisplayChar@casc stored from wreg
	line	222
	movwf	(DisplayChar@casc)
	
l3284:	
;lcd_22.c: 219: u8 i,j,b;
;lcd_22.c: 220: u8 *p;
;lcd_22.c: 222: {TRISA=0;RA0=0;};
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	
l3286:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(40/8),(40)&7
	line	223
	
l3288:	
;lcd_22.c: 223: post_cmd(0x08,postion_x*8);
	movlw	08h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movf	(DisplayChar@postion_x),w
	movwf	(??_DisplayChar+0)+0
	clrf	(??_DisplayChar+0)+0+1
	clrc
	rlf	(??_DisplayChar+0)+0,f
	rlf	(??_DisplayChar+0)+1,f
	clrc
	rlf	(??_DisplayChar+0)+0,f
	rlf	(??_DisplayChar+0)+1,f
	clrc
	rlf	(??_DisplayChar+0)+0,f
	rlf	(??_DisplayChar+0)+1,f
	movf	0+(??_DisplayChar+0)+0,w
	movwf	0+(?_post_cmd)+02h
	movf	1+(??_DisplayChar+0)+0,w
	movwf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	224
	
l3290:	
;lcd_22.c: 224: post_cmd(0x0a,postion_y*16);
	movlw	0Ah
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movf	(DisplayChar@postion_y),w
	movwf	(??_DisplayChar+0)+0
	clrf	(??_DisplayChar+0)+0+1
	swapf	(??_DisplayChar+0)+0,f
	swapf	(??_DisplayChar+0)+1,f
	movlw	0f0h
	andwf	(??_DisplayChar+0)+1,f
	movf	(??_DisplayChar+0)+0,w
	andlw	0fh
	iorwf	(??_DisplayChar+0)+1,f
	movlw	0f0h
	andwf	(??_DisplayChar+0)+0,f
	movf	0+(??_DisplayChar+0)+0,w
	movwf	0+(?_post_cmd)+02h
	movf	1+(??_DisplayChar+0)+0,w
	movwf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	225
	
l3292:	
;lcd_22.c: 225: post_cmd(0x09,postion_x*8+7);
	movlw	09h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movf	(DisplayChar@postion_x),w
	movwf	(??_DisplayChar+0)+0
	clrf	(??_DisplayChar+0)+0+1
	clrc
	rlf	(??_DisplayChar+0)+0,f
	rlf	(??_DisplayChar+0)+1,f
	clrc
	rlf	(??_DisplayChar+0)+0,f
	rlf	(??_DisplayChar+0)+1,f
	clrc
	rlf	(??_DisplayChar+0)+0,f
	rlf	(??_DisplayChar+0)+1,f
	movf	0+(??_DisplayChar+0)+0,w
	addlw	low(07h)
	movwf	0+(?_post_cmd)+02h
	movf	1+(??_DisplayChar+0)+0,w
	skipnc
	addlw	1
	addlw	high(07h)
	movwf	1+0+(?_post_cmd)+02h
	fcall	_post_cmd
	line	226
	
l3294:	
;lcd_22.c: 226: post_cmd(0x0b,postion_y*16+15);
	movlw	0Bh
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movf	(DisplayChar@postion_y),w
	movwf	(??_DisplayChar+0)+0
	clrf	(??_DisplayChar+0)+0+1
	swapf	(??_DisplayChar+0)+0,f
	swapf	(??_DisplayChar+0)+1,f
	movlw	0f0h
	andwf	(??_DisplayChar+0)+1,f
	movf	(??_DisplayChar+0)+0,w
	andlw	0fh
	iorwf	(??_DisplayChar+0)+1,f
	movlw	0f0h
	andwf	(??_DisplayChar+0)+0,f
	movf	0+(??_DisplayChar+0)+0,w
	addlw	low(0Fh)
	movwf	0+(?_post_cmd)+02h
	movf	1+(??_DisplayChar+0)+0,w
	skipnc
	addlw	1
	addlw	high(0Fh)
	movwf	1+0+(?_post_cmd)+02h
	fcall	_post_cmd
	line	227
	
l3296:	
;lcd_22.c: 227: post_cmd(0x06,postion_x*8);
	movlw	06h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movf	(DisplayChar@postion_x),w
	movwf	(??_DisplayChar+0)+0
	clrf	(??_DisplayChar+0)+0+1
	clrc
	rlf	(??_DisplayChar+0)+0,f
	rlf	(??_DisplayChar+0)+1,f
	clrc
	rlf	(??_DisplayChar+0)+0,f
	rlf	(??_DisplayChar+0)+1,f
	clrc
	rlf	(??_DisplayChar+0)+0,f
	rlf	(??_DisplayChar+0)+1,f
	movf	0+(??_DisplayChar+0)+0,w
	movwf	0+(?_post_cmd)+02h
	movf	1+(??_DisplayChar+0)+0,w
	movwf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	228
	
l3298:	
;lcd_22.c: 228: post_cmd(0x07,postion_y*16);
	movlw	07h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movf	(DisplayChar@postion_y),w
	movwf	(??_DisplayChar+0)+0
	clrf	(??_DisplayChar+0)+0+1
	swapf	(??_DisplayChar+0)+0,f
	swapf	(??_DisplayChar+0)+1,f
	movlw	0f0h
	andwf	(??_DisplayChar+0)+1,f
	movf	(??_DisplayChar+0)+0,w
	andlw	0fh
	iorwf	(??_DisplayChar+0)+1,f
	movlw	0f0h
	andwf	(??_DisplayChar+0)+0,f
	movf	0+(??_DisplayChar+0)+0,w
	movwf	0+(?_post_cmd)+02h
	movf	1+(??_DisplayChar+0)+0,w
	movwf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	230
;lcd_22.c: 230: {TRISA=0;RA1=0;};
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	
l3300:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(41/8),(41)&7
	line	231
	
l3302:	
;lcd_22.c: 231: post_data(0x0E);
	movlw	0Eh
	movwf	(?_post_data)
	clrf	(?_post_data+1)
	fcall	_post_data
	line	232
	
l3304:	
;lcd_22.c: 232: {TRISA=0;RA1=1;};
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	
l3306:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(41/8),(41)&7
	line	233
	
l3308:	
;lcd_22.c: 233: p=ascii;
	movlw	low(_ascii|8000h)
	movwf	(DisplayChar@p)
	movlw	high(_ascii|8000h)
	movwf	((DisplayChar@p))+1
	line	234
	
l3310:	
;lcd_22.c: 234: p+=casc*16;
	movf	(DisplayChar@casc),w
	movwf	(??_DisplayChar+0)+0
	clrf	(??_DisplayChar+0)+0+1
	swapf	(??_DisplayChar+0)+0,f
	swapf	(??_DisplayChar+0)+1,f
	movlw	0f0h
	andwf	(??_DisplayChar+0)+1,f
	movf	(??_DisplayChar+0)+0,w
	andlw	0fh
	iorwf	(??_DisplayChar+0)+1,f
	movlw	0f0h
	andwf	(??_DisplayChar+0)+0,f
	movf	0+(??_DisplayChar+0)+0,w
	addwf	(DisplayChar@p),f
	skipnc
	incf	(DisplayChar@p+1),f
	movf	1+(??_DisplayChar+0)+0,w
	addwf	(DisplayChar@p+1),f
	line	235
	
l3312:	
;lcd_22.c: 235: for(j=0;j<16;j++)
	clrf	(DisplayChar@j)
	line	237
	
l3318:	
;lcd_22.c: 236: {
;lcd_22.c: 237: b=*(p+j);
	movf	(DisplayChar@j),w
	addwf	(DisplayChar@p),w
	movwf	fsr0
	movf	(DisplayChar@p+1),w
	skipnc
	incf	(DisplayChar@p+1),w
	movwf	btemp+1
	fcall	stringtab
	movwf	(DisplayChar@b)
	line	238
	
l3320:	
;lcd_22.c: 238: for(i=0;i<8;i++)
	clrf	(DisplayChar@i)
	line	239
	
l1452:	
	line	240
;lcd_22.c: 239: {
;lcd_22.c: 240: if(b&0x80)
	btfss	(DisplayChar@b),(7)&7
	goto	u391
	goto	u390
u391:
	goto	l3328
u390:
	line	242
	
l3326:	
;lcd_22.c: 241: {
;lcd_22.c: 242: post_data(0x0000);
	clrf	(?_post_data)
	clrf	(?_post_data+1)
	fcall	_post_data
	line	243
;lcd_22.c: 243: }
	goto	l3330
	line	246
	
l3328:	
;lcd_22.c: 244: else
;lcd_22.c: 245: {
;lcd_22.c: 246: post_data(0xFFE0);
	movlw	low(0FFE0h)
	movwf	(?_post_data)
	movlw	high(0FFE0h)
	movwf	((?_post_data))+1
	fcall	_post_data
	line	248
	
l3330:	
;lcd_22.c: 247: }
;lcd_22.c: 248: b=b<<1;
	clrc
	rlf	(DisplayChar@b),f
	line	238
	
l3332:	
	incf	(DisplayChar@i),f
	
l3334:	
	movlw	(08h)
	subwf	(DisplayChar@i),w
	skipc
	goto	u401
	goto	u400
u401:
	goto	l1452
u400:
	line	235
	
l3336:	
	incf	(DisplayChar@j),f
	
l3338:	
	movlw	(010h)
	subwf	(DisplayChar@j),w
	skipc
	goto	u411
	goto	u410
u411:
	goto	l3318
u410:
	line	252
	
l3340:	
;lcd_22.c: 250: }
;lcd_22.c: 251: }
;lcd_22.c: 252: {TRISA=0;RA0=1;};
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	
l3342:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(40/8),(40)&7
	line	253
	
l1456:	
	return
	opt stack 0
GLOBAL	__end_of_DisplayChar
	__end_of_DisplayChar:
;; =============== function _DisplayChar ends ============

	signat	_DisplayChar,12408
	global	_LCD_test
psect	text303,local,class=CODE,delta=2
global __ptext303
__ptext303:

;; *************** function _LCD_test *****************
;; Defined at:
;;		line 159 in file "C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\lcd_22.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  num             2    9[COMMON] unsigned short 
;;  temp            2    6[COMMON] unsigned short 
;;  n               1   11[COMMON] unsigned char 
;;  i               1    8[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 7F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         6       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_post_cmd
;;		_post_data
;;		_delay_ms
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text303
	file	"C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\lcd_22.c"
	line	159
	global	__size_of_LCD_test
	__size_of_LCD_test	equ	__end_of_LCD_test-_LCD_test
	
_LCD_test:	
	opt	stack 5
; Regs used in _LCD_test: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	163
	
l3184:	
;lcd_22.c: 160: u16 temp,num;
;lcd_22.c: 161: u8 n,i;
;lcd_22.c: 163: {TRISA=0;RA0=0;};
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	
l3186:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(40/8),(40)&7
	line	165
	
l3188:	
;lcd_22.c: 165: post_cmd(0x08,0x00);
	movlw	08h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	clrf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	166
	
l3190:	
;lcd_22.c: 166: post_cmd(0x0a,0x0000);
	movlw	0Ah
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	clrf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	167
	
l3192:	
;lcd_22.c: 167: post_cmd(0x09,0xEF);
	movlw	09h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movlw	0EFh
	movwf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	168
	
l3194:	
;lcd_22.c: 168: post_cmd(0x0b,0x013F);
	movlw	0Bh
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movlw	low(013Fh)
	movwf	0+(?_post_cmd)+02h
	movlw	high(013Fh)
	movwf	(0+(?_post_cmd)+02h)+1
	fcall	_post_cmd
	line	170
	
l3196:	
;lcd_22.c: 170: post_cmd(0x06,0x0000);
	movlw	06h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	clrf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	171
	
l3198:	
;lcd_22.c: 171: post_cmd(0x07,0x0000);
	movlw	07h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	clrf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	173
;lcd_22.c: 173: {TRISA=0;RA1=0;};
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	
l3200:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(41/8),(41)&7
	line	174
	
l3202:	
;lcd_22.c: 174: post_data(0x0E);
	movlw	0Eh
	movwf	(?_post_data)
	clrf	(?_post_data+1)
	fcall	_post_data
	line	175
	
l3204:	
;lcd_22.c: 175: {TRISA=0;RA1=1;};
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	
l3206:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(41/8),(41)&7
	line	176
	
l3208:	
;lcd_22.c: 176: for(n=0;n<8;n++)
	clrf	(LCD_test@n)
	line	178
	
l3214:	
;lcd_22.c: 177: {
;lcd_22.c: 178: temp=colorfol[n];
	clrc
	rlf	(LCD_test@n),w
	addlw	low(_colorfol|8000h)
	movwf	fsr0
	movlw	high(_colorfol|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	(LCD_test@temp)
	fcall	stringtab
	movwf	(LCD_test@temp+1)
	line	179
	
l3216:	
;lcd_22.c: 179: for(num=40*240;num>0;num--)
	movlw	low(02580h)
	movwf	(LCD_test@num)
	movlw	high(02580h)
	movwf	((LCD_test@num))+1
	line	181
	
l3222:	
;lcd_22.c: 180: {
;lcd_22.c: 181: post_data(temp);
	movf	(LCD_test@temp+1),w
	movwf	(?_post_data+1)
	movf	(LCD_test@temp),w
	movwf	(?_post_data)
	fcall	_post_data
	line	179
	
l3224:	
	movlw	low(01h)
	subwf	(LCD_test@num),f
	movlw	high(01h)
	skipc
	decf	(LCD_test@num+1),f
	subwf	(LCD_test@num+1),f
	
l3226:	
	movf	((LCD_test@num+1)),w
	iorwf	((LCD_test@num)),w
	skipz
	goto	u341
	goto	u340
u341:
	goto	l3222
u340:
	line	176
	
l3228:	
	incf	(LCD_test@n),f
	
l3230:	
	movlw	(08h)
	subwf	(LCD_test@n),w
	skipc
	goto	u351
	goto	u350
u351:
	goto	l3214
u350:
	line	184
	
l3232:	
;lcd_22.c: 182: }
;lcd_22.c: 183: }
;lcd_22.c: 184: delay_ms(500);
	movlw	low(01F4h)
	movwf	(?_delay_ms)
	movlw	high(01F4h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	line	185
	
l3234:	
;lcd_22.c: 185: for(n=0;n<3;n++)
	clrf	(LCD_test@n)
	line	187
	
l3240:	
;lcd_22.c: 186: {
;lcd_22.c: 187: post_cmd(0x08,0x00);
	movlw	08h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	clrf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	188
;lcd_22.c: 188: post_cmd(0x0a,0x0000);
	movlw	0Ah
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	clrf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	189
;lcd_22.c: 189: post_cmd(0x09,0xEF);
	movlw	09h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movlw	0EFh
	movwf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	190
;lcd_22.c: 190: post_cmd(0x0b,0x013F);
	movlw	0Bh
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movlw	low(013Fh)
	movwf	0+(?_post_cmd)+02h
	movlw	high(013Fh)
	movwf	(0+(?_post_cmd)+02h)+1
	fcall	_post_cmd
	line	192
;lcd_22.c: 192: post_cmd(0x06,0x0000);
	movlw	06h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	clrf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	193
;lcd_22.c: 193: post_cmd(0x07,0x0000);
	movlw	07h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	clrf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	195
	
l3242:	
;lcd_22.c: 195: {TRISA=0;RA1=0;};
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	
l3244:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(41/8),(41)&7
	line	196
	
l3246:	
;lcd_22.c: 196: post_data(0x0E);
	movlw	0Eh
	movwf	(?_post_data)
	clrf	(?_post_data+1)
	fcall	_post_data
	line	197
;lcd_22.c: 197: {TRISA=0;RA1=1;};
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	
l3248:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(41/8),(41)&7
	line	198
	
l3250:	
;lcd_22.c: 198: temp=colorfol[n];
	clrc
	rlf	(LCD_test@n),w
	addlw	low(_colorfol|8000h)
	movwf	fsr0
	movlw	high(_colorfol|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	(LCD_test@temp)
	fcall	stringtab
	movwf	(LCD_test@temp+1)
	line	199
	
l3252:	
;lcd_22.c: 199: for(i=0;i<240;i++)
	clrf	(LCD_test@i)
	line	201
	
l3258:	
;lcd_22.c: 200: {
;lcd_22.c: 201: for(num=0;num<320;num++)
	clrf	(LCD_test@num)
	clrf	(LCD_test@num+1)
	line	203
	
l3264:	
;lcd_22.c: 202: {
;lcd_22.c: 203: post_data(temp);
	movf	(LCD_test@temp+1),w
	movwf	(?_post_data+1)
	movf	(LCD_test@temp),w
	movwf	(?_post_data)
	fcall	_post_data
	line	201
	
l3266:	
	incf	(LCD_test@num),f
	skipnz
	incf	(LCD_test@num+1),f
	
l3268:	
	movlw	high(0140h)
	subwf	(LCD_test@num+1),w
	movlw	low(0140h)
	skipnz
	subwf	(LCD_test@num),w
	skipc
	goto	u361
	goto	u360
u361:
	goto	l3264
u360:
	line	199
	
l3270:	
	incf	(LCD_test@i),f
	
l3272:	
	movlw	(0F0h)
	subwf	(LCD_test@i),w
	skipc
	goto	u371
	goto	u370
u371:
	goto	l3258
u370:
	line	206
	
l3274:	
;lcd_22.c: 204: }
;lcd_22.c: 205: }
;lcd_22.c: 206: delay_ms(500);
	movlw	low(01F4h)
	movwf	(?_delay_ms)
	movlw	high(01F4h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	line	185
	
l3276:	
	incf	(LCD_test@n),f
	
l3278:	
	movlw	(03h)
	subwf	(LCD_test@n),w
	skipc
	goto	u381
	goto	u380
u381:
	goto	l3240
u380:
	line	208
	
l3280:	
;lcd_22.c: 207: }
;lcd_22.c: 208: {TRISA=0;RA0=1;};
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	
l3282:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(40/8),(40)&7
	line	209
	
l1447:	
	return
	opt stack 0
GLOBAL	__end_of_LCD_test
	__end_of_LCD_test:
;; =============== function _LCD_test ends ============

	signat	_LCD_test,88
	global	_init_lcd
psect	text304,local,class=CODE,delta=2
global __ptext304
__ptext304:

;; *************** function _init_lcd *****************
;; Defined at:
;;		line 66 in file "C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\lcd_22.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  y               2    8[COMMON] unsigned short 
;;  x               2    6[COMMON] unsigned short 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_init_lcd_spi
;;		_lcd_rst
;;		_post_cmd
;;		_post_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text304
	file	"C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\lcd_22.c"
	line	66
	global	__size_of_init_lcd
	__size_of_init_lcd	equ	__end_of_init_lcd-_init_lcd
	
_init_lcd:	
	opt	stack 5
; Regs used in _init_lcd: [wreg+status,2+status,0+pclath+cstack]
	line	72
	
l3062:	
;lcd_22.c: 67: u16 x, y;
;lcd_22.c: 72: init_lcd_spi();
	fcall	_init_lcd_spi
	line	73
	
l3064:	
;lcd_22.c: 73: {TRISA=0;RA0=0;};
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	
l3066:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(40/8),(40)&7
	line	74
	
l3068:	
;lcd_22.c: 74: lcd_rst();
	fcall	_lcd_rst
	line	76
	
l3070:	
;lcd_22.c: 76: post_cmd(0x0003,0x0001);
	movlw	03h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	clrf	0+(?_post_cmd)+02h
	incf	0+(?_post_cmd)+02h,f
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	79
	
l3072:	
;lcd_22.c: 79: post_cmd(0x003A,0x0001);
	movlw	03Ah
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	clrf	0+(?_post_cmd)+02h
	incf	0+(?_post_cmd)+02h,f
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	82
	
l3074:	
;lcd_22.c: 82: post_cmd(0x0024,0x007B);
	movlw	024h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movlw	07Bh
	movwf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	83
	
l3076:	
;lcd_22.c: 83: post_cmd(0x0025,0x003B);
	movlw	025h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movlw	03Bh
	movwf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	84
	
l3078:	
;lcd_22.c: 84: post_cmd(0x0026,0x0034);
	movlw	026h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movlw	034h
	movwf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	85
	
l3080:	
;lcd_22.c: 85: post_cmd(0x0027,0x0004);
	movlw	027h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movlw	04h
	movwf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	86
	
l3082:	
;lcd_22.c: 86: post_cmd(0x0052,0x0025);
	movlw	052h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movlw	025h
	movwf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	87
	
l3084:	
;lcd_22.c: 87: post_cmd(0x0053,0x0033);
	movlw	053h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movlw	033h
	movwf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	88
	
l3086:	
;lcd_22.c: 88: post_cmd(0x0061,0x001C);
	movlw	061h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movlw	01Ch
	movwf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	89
	
l3088:	
;lcd_22.c: 89: post_cmd(0x0062,0x002C);
	movlw	062h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movlw	02Ch
	movwf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	90
	
l3090:	
;lcd_22.c: 90: post_cmd(0x0063,0x0022);
	movlw	063h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movlw	022h
	movwf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	91
	
l3092:	
;lcd_22.c: 91: post_cmd(0x0064,0x0027);
	movlw	064h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movlw	027h
	movwf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	92
	
l3094:	
;lcd_22.c: 92: post_cmd(0x0065,0x0014);
	movlw	065h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movlw	014h
	movwf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	93
	
l3096:	
;lcd_22.c: 93: post_cmd(0x0066,0x0010);
	movlw	066h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movlw	010h
	movwf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	96
	
l3098:	
;lcd_22.c: 96: post_cmd(0x002E,0x002D);
	movlw	02Eh
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movlw	02Dh
	movwf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	99
	
l3100:	
;lcd_22.c: 99: post_cmd(0x0019,0x0000);
	movlw	019h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	clrf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	100
	
l3102:	
;lcd_22.c: 100: post_cmd(0x001A,0x1000);
	movlw	01Ah
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movlw	low(01000h)
	movwf	0+(?_post_cmd)+02h
	movlw	high(01000h)
	movwf	(0+(?_post_cmd)+02h)+1
	fcall	_post_cmd
	line	101
	
l3104:	
;lcd_22.c: 101: post_cmd(0x001B,0x0023);
	movlw	01Bh
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movlw	023h
	movwf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	102
	
l3106:	
;lcd_22.c: 102: post_cmd(0x001C,0x0C01);
	movlw	01Ch
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movlw	low(0C01h)
	movwf	0+(?_post_cmd)+02h
	movlw	high(0C01h)
	movwf	(0+(?_post_cmd)+02h)+1
	fcall	_post_cmd
	line	103
	
l3108:	
;lcd_22.c: 103: post_cmd(0x001D,0x0000);
	movlw	01Dh
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	clrf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	104
	
l3110:	
;lcd_22.c: 104: post_cmd(0x001E,0x0009);
	movlw	01Eh
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movlw	09h
	movwf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	105
	
l3112:	
;lcd_22.c: 105: post_cmd(0x001F,0x0035);
	movlw	01Fh
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movlw	035h
	movwf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	106
	
l3114:	
;lcd_22.c: 106: post_cmd(0x0020,0x0015);
	movlw	020h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movlw	015h
	movwf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	107
	
l3116:	
;lcd_22.c: 107: post_cmd(0x0018,0x1E7B);
	movlw	018h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movlw	low(01E7Bh)
	movwf	0+(?_post_cmd)+02h
	movlw	high(01E7Bh)
	movwf	(0+(?_post_cmd)+02h)+1
	fcall	_post_cmd
	line	110
	
l3118:	
;lcd_22.c: 110: post_cmd(0x0008,0x0000);
	movlw	08h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	clrf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	111
	
l3120:	
;lcd_22.c: 111: post_cmd(0x0009,0x00EF);
	movlw	09h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movlw	0EFh
	movwf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	112
	
l3122:	
;lcd_22.c: 112: post_cmd(0x000a,0x0000);
	movlw	0Ah
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	clrf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	113
	
l3124:	
;lcd_22.c: 113: post_cmd(0x000b,0x013F);
	movlw	0Bh
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movlw	low(013Fh)
	movwf	0+(?_post_cmd)+02h
	movlw	high(013Fh)
	movwf	(0+(?_post_cmd)+02h)+1
	fcall	_post_cmd
	line	116
	
l3126:	
;lcd_22.c: 116: post_cmd(0x0029,0x0000);
	movlw	029h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	clrf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	117
	
l3128:	
;lcd_22.c: 117: post_cmd(0x002A,0x0000);
	movlw	02Ah
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	clrf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	118
	
l3130:	
;lcd_22.c: 118: post_cmd(0x002B,0x00EF);
	movlw	02Bh
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movlw	0EFh
	movwf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	119
	
l3132:	
;lcd_22.c: 119: post_cmd(0x002C,0x013F);
	movlw	02Ch
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movlw	low(013Fh)
	movwf	0+(?_post_cmd)+02h
	movlw	high(013Fh)
	movwf	(0+(?_post_cmd)+02h)+1
	fcall	_post_cmd
	line	122
	
l3134:	
;lcd_22.c: 122: post_cmd(0x0032,0x0002);
	movlw	032h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movlw	02h
	movwf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	125
	
l3136:	
;lcd_22.c: 125: post_cmd(0x0033,0x0000);
	movlw	033h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	clrf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	128
	
l3138:	
;lcd_22.c: 128: post_cmd(0x0037,0x0000);
	movlw	037h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	clrf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	131
	
l3140:	
;lcd_22.c: 131: post_cmd(0x003B,0x0001);
	movlw	03Bh
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	clrf	0+(?_post_cmd)+02h
	incf	0+(?_post_cmd)+02h,f
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	134
	
l3142:	
;lcd_22.c: 134: post_cmd(0x0004,0x0000);
	movlw	04h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	clrf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	137
	
l3144:	
;lcd_22.c: 137: post_cmd(0x0005,0x0010);
	movlw	05h
	movwf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	movlw	010h
	movwf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	140
	
l3146:	
;lcd_22.c: 140: post_cmd(0x0001,0x0000);
	clrf	(?_post_cmd)
	incf	(?_post_cmd),f
	clrf	(?_post_cmd+1)
	clrf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	143
	
l3148:	
;lcd_22.c: 143: post_cmd(0x0000,0x0000);
	clrf	(?_post_cmd)
	clrf	(?_post_cmd+1)
	clrf	0+(?_post_cmd)+02h
	clrf	1+(?_post_cmd)+02h
	fcall	_post_cmd
	line	145
;lcd_22.c: 145: {TRISA=0;RA1=0;};
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	
l3150:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(41/8),(41)&7
	line	146
	
l3152:	
;lcd_22.c: 146: post_data(0x0E);
	movlw	0Eh
	movwf	(?_post_data)
	clrf	(?_post_data+1)
	fcall	_post_data
	line	147
	
l3154:	
;lcd_22.c: 147: {TRISA=0;RA1=1;};
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	
l3156:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(41/8),(41)&7
	line	148
	
l3158:	
;lcd_22.c: 148: for(x=0; x<240; x++)
	clrf	(init_lcd@x)
	clrf	(init_lcd@x+1)
	line	150
	
l3164:	
;lcd_22.c: 149: {
;lcd_22.c: 150: for(y=0; y<320; y++)
	clrf	(init_lcd@y)
	clrf	(init_lcd@y+1)
	line	152
	
l3170:	
;lcd_22.c: 151: {
;lcd_22.c: 152: post_data(0xFFE0);
	movlw	low(0FFE0h)
	movwf	(?_post_data)
	movlw	high(0FFE0h)
	movwf	((?_post_data))+1
	fcall	_post_data
	line	150
	
l3172:	
	incf	(init_lcd@y),f
	skipnz
	incf	(init_lcd@y+1),f
	
l3174:	
	movlw	high(0140h)
	subwf	(init_lcd@y+1),w
	movlw	low(0140h)
	skipnz
	subwf	(init_lcd@y),w
	skipc
	goto	u321
	goto	u320
u321:
	goto	l3170
u320:
	line	148
	
l3176:	
	incf	(init_lcd@x),f
	skipnz
	incf	(init_lcd@x+1),f
	
l3178:	
	movlw	high(0F0h)
	subwf	(init_lcd@x+1),w
	movlw	low(0F0h)
	skipnz
	subwf	(init_lcd@x),w
	skipc
	goto	u331
	goto	u330
u331:
	goto	l3164
u330:
	line	156
	
l3180:	
;lcd_22.c: 153: }
;lcd_22.c: 154: }
;lcd_22.c: 156: {TRISA=0;RA0=1;};
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	
l3182:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(40/8),(40)&7
	line	157
	
l1434:	
	return
	opt stack 0
GLOBAL	__end_of_init_lcd
	__end_of_init_lcd:
;; =============== function _init_lcd ends ============

	signat	_init_lcd,88
	global	_post_cmd
psect	text305,local,class=CODE,delta=2
global __ptext305
__ptext305:

;; *************** function _post_cmd *****************
;; Defined at:
;;		line 58 in file "C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\lcd_22.c"
;; Parameters:    Size  Location     Type
;;  index           2    2[COMMON] unsigned short 
;;  cmd             2    4[COMMON] unsigned short 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_post_data
;; This function is called by:
;;		_init_lcd
;;		_LCD_test
;;		_DisplayChar
;;		_DisplayChar_Reverse
;; This function uses a non-reentrant model
;;
psect	text305
	file	"C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\lcd_22.c"
	line	58
	global	__size_of_post_cmd
	__size_of_post_cmd	equ	__end_of_post_cmd-_post_cmd
	
_post_cmd:	
	opt	stack 4
; Regs used in _post_cmd: [wreg+status,2+status,0+pclath+cstack]
	line	59
	
l3052:	
;lcd_22.c: 59: {TRISA=0;RA1=0;};
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	
l3054:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(41/8),(41)&7
	line	60
	
l3056:	
;lcd_22.c: 60: post_data(index);
	movf	(post_cmd@index+1),w
	movwf	(?_post_data+1)
	movf	(post_cmd@index),w
	movwf	(?_post_data)
	fcall	_post_data
	line	61
	
l3058:	
;lcd_22.c: 61: {TRISA=0;RA1=1;};
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	
l3060:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(41/8),(41)&7
	line	62
;lcd_22.c: 62: post_data(cmd);
	movf	(post_cmd@cmd+1),w
	movwf	(?_post_data+1)
	movf	(post_cmd@cmd),w
	movwf	(?_post_data)
	fcall	_post_data
	line	63
	
l1427:	
	return
	opt stack 0
GLOBAL	__end_of_post_cmd
	__end_of_post_cmd:
;; =============== function _post_cmd ends ============

	signat	_post_cmd,8312
	global	_lcd_rst
psect	text306,local,class=CODE,delta=2
global __ptext306
__ptext306:

;; *************** function _lcd_rst *****************
;; Defined at:
;;		line 50 in file "C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\lcd_22.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay_us
;; This function is called by:
;;		_init_lcd
;; This function uses a non-reentrant model
;;
psect	text306
	file	"C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\lcd_22.c"
	line	50
	global	__size_of_lcd_rst
	__size_of_lcd_rst	equ	__end_of_lcd_rst-_lcd_rst
	
_lcd_rst:	
	opt	stack 5
; Regs used in _lcd_rst: [wreg+status,2+status,0+pclath+cstack]
	line	51
	
l2618:	
;lcd_22.c: 51: {TRISA=0;RA2=0;};
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	
l2620:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(42/8),(42)&7
	line	52
	
l2622:	
;lcd_22.c: 52: delay_us(3);
	movlw	03h
	movwf	(?_delay_us)
	clrf	(?_delay_us+1)
	fcall	_delay_us
	line	53
	
l2624:	
;lcd_22.c: 53: {TRISA=0;RA2=1;};
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	
l2626:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(42/8),(42)&7
	line	54
;lcd_22.c: 54: delay_us(3);
	movlw	03h
	movwf	(?_delay_us)
	clrf	(?_delay_us+1)
	fcall	_delay_us
	line	55
	
l1424:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_rst
	__end_of_lcd_rst:
;; =============== function _lcd_rst ends ============

	signat	_lcd_rst,88
	global	_swap
psect	text307,local,class=CODE,delta=2
global __ptext307
__ptext307:

;; *************** function _swap *****************
;; Defined at:
;;		line 295 in file "C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\lcd_22.c"
;; Parameters:    Size  Location     Type
;;  s               1    wreg     PTR unsigned char 
;;		 -> DisplayString@a(10), swap@b(10), 
;;  sz              1    0[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  s               1    3[COMMON] PTR unsigned char 
;;		 -> DisplayString@a(10), swap@b(10), 
;;  i               1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      PTR unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DisplayString
;; This function uses a non-reentrant model
;;
psect	text307
	file	"C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\lcd_22.c"
	line	295
	global	__size_of_swap
	__size_of_swap	equ	__end_of_swap-_swap
	
_swap:	
	opt	stack 6
; Regs used in _swap: [wreg-fsr0h+status,2+status,0]
;swap@s stored from wreg
	movwf	(swap@s)
	line	296
	
l3034:	
	line	298
	
l3036:	
;lcd_22.c: 297: static u8 b[10]={0};
;lcd_22.c: 298: s+=sz-2;
	movf	(swap@sz),w
	addlw	-2
	addwf	(swap@s),f
	line	299
	
l3038:	
;lcd_22.c: 299: for(i=0;i<sz-1;i++)
	clrf	(swap@i)
	goto	l3046
	line	301
	
l3040:	
;lcd_22.c: 300: {
;lcd_22.c: 301: b[i]=*s;
	movf	(swap@s),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_swap+0)+0
	movf	(swap@i),w
	addlw	swap@b&0ffh
	movwf	fsr0
	movf	(??_swap+0)+0,w
	movwf	indf
	line	302
	
l3042:	
;lcd_22.c: 302: s--;
	decf	(swap@s),f
	line	299
	
l3044:	
	incf	(swap@i),f
	
l3046:	
	movf	(swap@sz),w
	addlw	low(-1)
	movwf	(??_swap+0)+0
	movlw	high(-1)
	skipnc
	movlw	(high(-1)+1)&0ffh
	movwf	((??_swap+0)+0)+1
	movf	1+(??_swap+0)+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u315
	movf	0+(??_swap+0)+0,w
	subwf	(swap@i),w
u315:

	skipc
	goto	u311
	goto	u310
u311:
	goto	l3040
u310:
	line	304
	
l3048:	
;lcd_22.c: 303: }
;lcd_22.c: 304: s=b;
	movlw	(swap@b)&0ffh
	movwf	(swap@s)
	line	305
;lcd_22.c: 305: return s;
	movf	(swap@s),w
	line	306
	
l1473:	
	return
	opt stack 0
GLOBAL	__end_of_swap
	__end_of_swap:
;; =============== function _swap ends ============

	signat	_swap,8313
	global	_post_data
psect	text308,local,class=CODE,delta=2
global __ptext308
__ptext308:

;; *************** function _post_data *****************
;; Defined at:
;;		line 31 in file "C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\lcd_22.c"
;; Parameters:    Size  Location     Type
;;  data            2    0[COMMON] unsigned short 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_post_cmd
;;		_init_lcd
;;		_LCD_test
;;		_DisplayChar
;;		_DisplayChar_Reverse
;; This function uses a non-reentrant model
;;
psect	text308
	file	"C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\lcd_22.c"
	line	31
	global	__size_of_post_data
	__size_of_post_data	equ	__end_of_post_data-_post_data
	
_post_data:	
	opt	stack 5
; Regs used in _post_data: [wreg]
	line	34
	
l3030:	
;lcd_22.c: 34: SSPBUF=(u8)(data>>8);
	movf	(post_data@data+1),w
	movwf	(19)	;volatile
	line	35
;lcd_22.c: 35: while(!SSPIF);
	
l1415:	
	btfss	(99/8),(99)&7
	goto	u291
	goto	u290
u291:
	goto	l1415
u290:
	
l1417:	
	line	36
;lcd_22.c: 36: SSPIF=0;
	bcf	(99/8),(99)&7
	line	40
	
l3032:	
;lcd_22.c: 40: SSPBUF=(u8)(data);
	movf	(post_data@data),w
	movwf	(19)	;volatile
	line	41
;lcd_22.c: 41: while(!SSPIF);
	
l1418:	
	btfss	(99/8),(99)&7
	goto	u301
	goto	u300
u301:
	goto	l1418
u300:
	
l1420:	
	line	42
;lcd_22.c: 42: SSPIF=0;
	bcf	(99/8),(99)&7
	line	44
	
l1421:	
	return
	opt stack 0
GLOBAL	__end_of_post_data
	__end_of_post_data:
;; =============== function _post_data ends ============

	signat	_post_data,4216
	global	_init_lcd_spi
psect	text309,local,class=CODE,delta=2
global __ptext309
__ptext309:

;; *************** function _init_lcd_spi *****************
;; Defined at:
;;		line 5 in file "C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\lcd_22.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_init_lcd
;; This function uses a non-reentrant model
;;
psect	text309
	file	"C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\lcd_22.c"
	line	5
	global	__size_of_init_lcd_spi
	__size_of_init_lcd_spi	equ	__end_of_init_lcd_spi-_init_lcd_spi
	
_init_lcd_spi:	
	opt	stack 6
; Regs used in _init_lcd_spi: [wreg+status,2]
	line	6
	
l2590:	
;lcd_22.c: 6: TRISC=0X10;
	movlw	(010h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	8
;lcd_22.c: 8: SSPSTAT=0X80;
	movlw	(080h)
	movwf	(148)^080h	;volatile
	line	9
;lcd_22.c: 9: SSPCON=0X30;
	movlw	(030h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(20)	;volatile
	line	10
	
l2592:	
;lcd_22.c: 10: INTCON=0X00;
	clrf	(11)	;volatile
	line	11
	
l2594:	
;lcd_22.c: 11: PIR1=0X00;
	clrf	(12)	;volatile
	line	22
	
l1412:	
	return
	opt stack 0
GLOBAL	__end_of_init_lcd_spi
	__end_of_init_lcd_spi:
;; =============== function _init_lcd_spi ends ============

	signat	_init_lcd_spi,88
	global	_delay_us
psect	text310,local,class=CODE,delta=2
global __ptext310
__ptext310:

;; *************** function _delay_us *****************
;; Defined at:
;;		line 16 in file "C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\system.c"
;; Parameters:    Size  Location     Type
;;  us              2    0[COMMON] unsigned short 
;; Auto vars:     Size  Location     Type
;;  i               1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_rst
;; This function uses a non-reentrant model
;;
psect	text310
	file	"C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\system.c"
	line	16
	global	__size_of_delay_us
	__size_of_delay_us	equ	__end_of_delay_us-_delay_us
	
_delay_us:	
	opt	stack 5
; Regs used in _delay_us: [wreg+status,2+status,0]
	line	18
	
l2564:	
;system.c: 17: u8 i;
;system.c: 18: while(us!=0)
	goto	l2588
	line	20
	
l2566:	
;system.c: 19: {
;system.c: 20: for(i=0;i<25;i++)
	clrf	(delay_us@i)
	
l2572:	
;system.c: 21: {}
	incf	(delay_us@i),f
	
l2574:	
	movlw	(019h)
	subwf	(delay_us@i),w
	skipc
	goto	u41
	goto	u40
u41:
	goto	l2572
u40:
	line	22
	
l2576:	
;system.c: 22: for(i=0;i<7;i++)
	clrf	(delay_us@i)
	
l2582:	
;system.c: 23: {}
	incf	(delay_us@i),f
	
l2584:	
	movlw	(07h)
	subwf	(delay_us@i),w
	skipc
	goto	u51
	goto	u50
u51:
	goto	l2582
u50:
	line	24
	
l2586:	
;system.c: 24: us--;
	movlw	low(01h)
	subwf	(delay_us@us),f
	movlw	high(01h)
	skipc
	decf	(delay_us@us+1),f
	subwf	(delay_us@us+1),f
	line	18
	
l2588:	
	movf	((delay_us@us+1)),w
	iorwf	((delay_us@us)),w
	skipz
	goto	u61
	goto	u60
u61:
	goto	l2566
u60:
	line	26
	
l719:	
	return
	opt stack 0
GLOBAL	__end_of_delay_us
	__end_of_delay_us:
;; =============== function _delay_us ends ============

	signat	_delay_us,4216
	global	_delay_ms
psect	text311,local,class=CODE,delta=2
global __ptext311
__ptext311:

;; *************** function _delay_ms *****************
;; Defined at:
;;		line 3 in file "C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\system.c"
;; Parameters:    Size  Location     Type
;;  ms              2    0[COMMON] unsigned short 
;; Auto vars:     Size  Location     Type
;;  i               1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_LCD_test
;; This function uses a non-reentrant model
;;
psect	text311
	file	"C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\system.c"
	line	3
	global	__size_of_delay_ms
	__size_of_delay_ms	equ	__end_of_delay_ms-_delay_ms
	
_delay_ms:	
	opt	stack 7
; Regs used in _delay_ms: [wreg+status,2+status,0]
	line	5
	
l2538:	
;system.c: 4: u8 i;
;system.c: 5: while(ms!=0)
	goto	l2562
	line	7
	
l2540:	
;system.c: 6: {
;system.c: 7: for(i=0;i<250;i++)
	clrf	(delay_ms@i)
	
l2546:	
;system.c: 8: {}
	incf	(delay_ms@i),f
	
l2548:	
	movlw	(0FAh)
	subwf	(delay_ms@i),w
	skipc
	goto	u11
	goto	u10
u11:
	goto	l2546
u10:
	line	9
	
l2550:	
;system.c: 9: for(i=0;i<75;i++)
	clrf	(delay_ms@i)
	
l2556:	
;system.c: 10: {}
	incf	(delay_ms@i),f
	
l2558:	
	movlw	(04Bh)
	subwf	(delay_ms@i),w
	skipc
	goto	u21
	goto	u20
u21:
	goto	l2556
u20:
	line	11
	
l2560:	
;system.c: 11: ms--;
	movlw	low(01h)
	subwf	(delay_ms@ms),f
	movlw	high(01h)
	skipc
	decf	(delay_ms@ms+1),f
	subwf	(delay_ms@ms+1),f
	line	5
	
l2562:	
	movf	((delay_ms@ms+1)),w
	iorwf	((delay_ms@ms)),w
	skipz
	goto	u31
	goto	u30
u31:
	goto	l2540
u30:
	line	13
	
l709:	
	return
	opt stack 0
GLOBAL	__end_of_delay_ms
	__end_of_delay_ms:
;; =============== function _delay_ms ends ============

	signat	_delay_ms,4216
	global	_init_mcu
psect	text312,local,class=CODE,delta=2
global __ptext312
__ptext312:

;; *************** function _init_mcu *****************
;; Defined at:
;;		line 17 in file "C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text312
	file	"C:\Users\Work\Desktop\zjpack\program\PIC\test\lcd22\pic_lcd22_show\main.c"
	line	17
	global	__size_of_init_mcu
	__size_of_init_mcu	equ	__end_of_init_mcu-_init_mcu
	
_init_mcu:	
	opt	stack 7
; Regs used in _init_mcu: [wreg+status,2]
	line	18
	
l2534:	
;main.c: 18: TRISA=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	line	19
	
l2536:	
;main.c: 19: PORTA=0XFF;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(5)	;volatile
	line	20
	
l693:	
	return
	opt stack 0
GLOBAL	__end_of_init_mcu
	__end_of_init_mcu:
;; =============== function _init_mcu ends ============

	signat	_init_mcu,88
psect	text313,local,class=CODE,delta=2
global __ptext313
__ptext313:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
