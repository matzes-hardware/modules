opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 11162"

opt pagewidth 120

	opt pm

	processor	18F4520
porta	equ	0F80h
portb	equ	0F81h
portc	equ	0F82h
portd	equ	0F83h
porte	equ	0F84h
lata	equ	0F89h
latb	equ	0F8Ah
latc	equ	0F8Bh
latd	equ	0F8Ch
late	equ	0F8Dh
trisa	equ	0F92h
trisb	equ	0F93h
trisc	equ	0F94h
trisd	equ	0F95h
trise	equ	0F96h
pie1	equ	0F9Dh
pir1	equ	0F9Eh
ipr1	equ	0F9Fh
pie2	equ	0FA0h
pir2	equ	0FA1h
ipr2	equ	0FA2h
t3con	equ	0FB1h
tmr3l	equ	0FB2h
tmr3h	equ	0FB3h
ccp1con	equ	0FBDh
ccpr1l	equ	0FBEh
ccpr1h	equ	0FBFh
adcon1	equ	0FC1h
adcon0	equ	0FC2h
adresl	equ	0FC3h
adresh	equ	0FC4h
sspcon2	equ	0FC5h
sspcon1	equ	0FC6h
sspstat	equ	0FC7h
sspadd	equ	0FC8h
sspbuf	equ	0FC9h
t2con	equ	0FCAh
pr2	equ	0FCBh
tmr2	equ	0FCCh
t1con	equ	0FCDh
tmr1l	equ	0FCEh
tmr1h	equ	0FCFh
rcon	equ	0FD0h
wdtcon	equ	0FD1h
lvdcon	equ	0FD2h
osccon	equ	0FD3h
t0con	equ	0FD5h
tmr0l	equ	0FD6h
tmr0h	equ	0FD7h
status	equ	0FD8h
fsr2	equ	0FD9h
fsr2l	equ	0FD9h
fsr2h	equ	0FDAh
plusw2	equ	0FDBh
preinc2	equ	0FDCh
postdec2	equ	0FDDh
postinc2	equ	0FDEh
indf2	equ	0FDFh
bsr	equ	0FE0h
fsr1	equ	0FE1h
fsr1l	equ	0FE1h
fsr1h	equ	0FE2h
plusw1	equ	0FE3h
preinc1	equ	0FE4h
postdec1	equ	0FE5h
postinc1	equ	0FE6h
indf1	equ	0FE7h
wreg	equ	0FE8h
fsr0	equ	0FE9h
fsr0l	equ	0FE9h
fsr0h	equ	0FEAh
plusw0	equ	0FEBh
preinc0	equ	0FECh
postdec0	equ	0FEDh
postinc0	equ	0FEEh
indf0	equ	0FEFh
intcon3	equ	0FF0h
intcon2	equ	0FF1h
intcon	equ	0FF2h
prod	equ	0FF3h
prodl	equ	0FF3h
prodh	equ	0FF4h
tablat	equ	0FF5h
tblptr	equ	0FF6h
tblptrl	equ	0FF6h
tblptrh	equ	0FF7h
tblptru	equ	0FF8h
pcl	equ	0FF9h
pclat	equ	0FFAh
pclath	equ	0FFAh
pclatu	equ	0FFBh
stkptr	equ	0FFCh
tosl	equ	0FFDh
tosh	equ	0FFEh
tosu	equ	0FFFh
skipnz macro
	btfsc	status,2
	endm
	global	__ramtop
	global	__accesstop
# 19 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PORTA equ 0F80h ;# 
# 90 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PORTB equ 0F81h ;# 
# 139 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PORTC equ 0F82h ;# 
# 194 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PORTD equ 0F83h ;# 
# 236 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PORTE equ 0F84h ;# 
# 365 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
LATA equ 0F89h ;# 
# 418 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
LATB equ 0F8Ah ;# 
# 471 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
LATC equ 0F8Bh ;# 
# 524 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
LATD equ 0F8Ch ;# 
# 577 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
LATE equ 0F8Dh ;# 
# 625 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TRISA equ 0F92h ;# 
# 630 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
DDRA equ 0F92h ;# 
# 688 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TRISB equ 0F93h ;# 
# 693 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
DDRB equ 0F93h ;# 
# 751 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TRISC equ 0F94h ;# 
# 756 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
DDRC equ 0F94h ;# 
# 814 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TRISD equ 0F95h ;# 
# 819 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
DDRD equ 0F95h ;# 
# 877 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TRISE equ 0F96h ;# 
# 882 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
DDRE equ 0F96h ;# 
# 932 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
OSCTUNE equ 0F9Bh ;# 
# 954 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PIE1 equ 0F9Dh ;# 
# 981 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PIR1 equ 0F9Eh ;# 
# 1017 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
IPR1 equ 0F9Fh ;# 
# 1044 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PIE2 equ 0FA0h ;# 
# 1067 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PIR2 equ 0FA1h ;# 
# 1090 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
IPR2 equ 0FA2h ;# 
# 1113 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
EECON1 equ 0FA6h ;# 
# 1136 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
EECON2 equ 0FA7h ;# 
# 1148 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
EEDATA equ 0FA8h ;# 
# 1160 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
EEADR equ 0FA9h ;# 
# 1172 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
RCSTA equ 0FABh ;# 
# 1177 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
RCSTA1 equ 0FABh ;# 
# 1225 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TXSTA equ 0FACh ;# 
# 1230 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TXSTA1 equ 0FACh ;# 
# 1324 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TXREG equ 0FADh ;# 
# 1329 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TXREG1 equ 0FADh ;# 
# 1347 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
RCREG equ 0FAEh ;# 
# 1352 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
RCREG1 equ 0FAEh ;# 
# 1370 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
SPBRG equ 0FAFh ;# 
# 1375 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
SPBRG1 equ 0FAFh ;# 
# 1393 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
SPBRGH equ 0FB0h ;# 
# 1405 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
T3CON equ 0FB1h ;# 
# 1446 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TMR3 equ 0FB2h ;# 
# 1458 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TMR3L equ 0FB2h ;# 
# 1470 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TMR3H equ 0FB3h ;# 
# 1482 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
CMCON equ 0FB4h ;# 
# 1515 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
CVRCON equ 0FB5h ;# 
# 1541 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
ECCP1AS equ 0FB6h ;# 
# 1546 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
ECCPAS equ 0FB6h ;# 
# 1588 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PWM1CON equ 0FB7h ;# 
# 1593 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
ECCP1DEL equ 0FB7h ;# 
# 1631 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
BAUDCON equ 0FB8h ;# 
# 1636 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
BAUDCTL equ 0FB8h ;# 
# 1696 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
CCP2CON equ 0FBAh ;# 
# 1722 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
CCPR2 equ 0FBBh ;# 
# 1734 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
CCPR2L equ 0FBBh ;# 
# 1746 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
CCPR2H equ 0FBCh ;# 
# 1758 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
CCP1CON equ 0FBDh ;# 
# 1787 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
CCPR1 equ 0FBEh ;# 
# 1799 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
CCPR1L equ 0FBEh ;# 
# 1811 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
CCPR1H equ 0FBFh ;# 
# 1823 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
ADCON2 equ 0FC0h ;# 
# 1846 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
ADCON1 equ 0FC1h ;# 
# 1879 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
ADCON0 equ 0FC2h ;# 
# 1934 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
ADRES equ 0FC3h ;# 
# 1946 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
ADRESL equ 0FC3h ;# 
# 1958 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
ADRESH equ 0FC4h ;# 
# 1970 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
SSPCON2 equ 0FC5h ;# 
# 1997 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
SSPCON1 equ 0FC6h ;# 
# 2019 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
SSPSTAT equ 0FC7h ;# 
# 2126 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
SSPADD equ 0FC8h ;# 
# 2138 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
SSPBUF equ 0FC9h ;# 
# 2150 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
T2CON equ 0FCAh ;# 
# 2180 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PR2 equ 0FCBh ;# 
# 2185 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
MEMCON equ 0FCBh ;# 
# 2203 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TMR2 equ 0FCCh ;# 
# 2215 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
T1CON equ 0FCDh ;# 
# 2252 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TMR1 equ 0FCEh ;# 
# 2264 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TMR1L equ 0FCEh ;# 
# 2276 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TMR1H equ 0FCFh ;# 
# 2288 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
RCON equ 0FD0h ;# 
# 2333 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
WDTCON equ 0FD1h ;# 
# 2348 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
HLVDCON equ 0FD2h ;# 
# 2353 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
LVDCON equ 0FD2h ;# 
# 2423 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
OSCCON equ 0FD3h ;# 
# 2448 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
T0CON equ 0FD5h ;# 
# 2473 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TMR0 equ 0FD6h ;# 
# 2485 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TMR0L equ 0FD6h ;# 
# 2497 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TMR0H equ 0FD7h ;# 
# 2509 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
STATUS equ 0FD8h ;# 
# 2540 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
FSR2 equ 0FD9h ;# 
# 2552 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
FSR2L equ 0FD9h ;# 
# 2564 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
FSR2H equ 0FDAh ;# 
# 2576 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PLUSW2 equ 0FDBh ;# 
# 2588 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PREINC2 equ 0FDCh ;# 
# 2600 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
POSTDEC2 equ 0FDDh ;# 
# 2612 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
POSTINC2 equ 0FDEh ;# 
# 2624 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
INDF2 equ 0FDFh ;# 
# 2636 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
BSR equ 0FE0h ;# 
# 2648 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
FSR1 equ 0FE1h ;# 
# 2660 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
FSR1L equ 0FE1h ;# 
# 2672 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
FSR1H equ 0FE2h ;# 
# 2684 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PLUSW1 equ 0FE3h ;# 
# 2696 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PREINC1 equ 0FE4h ;# 
# 2708 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
POSTDEC1 equ 0FE5h ;# 
# 2720 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
POSTINC1 equ 0FE6h ;# 
# 2732 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
INDF1 equ 0FE7h ;# 
# 2744 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
WREG equ 0FE8h ;# 
# 2767 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
FSR0 equ 0FE9h ;# 
# 2779 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
FSR0L equ 0FE9h ;# 
# 2791 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
FSR0H equ 0FEAh ;# 
# 2803 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PLUSW0 equ 0FEBh ;# 
# 2815 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PREINC0 equ 0FECh ;# 
# 2827 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
POSTDEC0 equ 0FEDh ;# 
# 2839 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
POSTINC0 equ 0FEEh ;# 
# 2851 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
INDF0 equ 0FEFh ;# 
# 2863 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
INTCON3 equ 0FF0h ;# 
# 2892 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
INTCON2 equ 0FF1h ;# 
# 2919 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
INTCON equ 0FF2h ;# 
# 2983 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PROD equ 0FF3h ;# 
# 2995 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PRODL equ 0FF3h ;# 
# 3007 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PRODH equ 0FF4h ;# 
# 3019 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TABLAT equ 0FF5h ;# 
# 3031 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TBLPTR equ 0FF6h ;# 
# 3044 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TBLPTRL equ 0FF6h ;# 
# 3056 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TBLPTRH equ 0FF7h ;# 
# 3068 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TBLPTRU equ 0FF8h ;# 
# 3081 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PCLAT equ 0FF9h ;# 
# 3086 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PC equ 0FF9h ;# 
# 3104 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PCL equ 0FF9h ;# 
# 3116 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PCLATH equ 0FFAh ;# 
# 3128 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PCLATU equ 0FFBh ;# 
# 3140 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
STKPTR equ 0FFCh ;# 
# 3164 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TOS equ 0FFDh ;# 
# 3176 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TOSL equ 0FFDh ;# 
# 3188 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TOSH equ 0FFEh ;# 
# 3200 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TOSU equ 0FFFh ;# 
# 19 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PORTA equ 0F80h ;# 
# 90 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PORTB equ 0F81h ;# 
# 139 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PORTC equ 0F82h ;# 
# 194 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PORTD equ 0F83h ;# 
# 236 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PORTE equ 0F84h ;# 
# 365 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
LATA equ 0F89h ;# 
# 418 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
LATB equ 0F8Ah ;# 
# 471 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
LATC equ 0F8Bh ;# 
# 524 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
LATD equ 0F8Ch ;# 
# 577 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
LATE equ 0F8Dh ;# 
# 625 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TRISA equ 0F92h ;# 
# 630 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
DDRA equ 0F92h ;# 
# 688 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TRISB equ 0F93h ;# 
# 693 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
DDRB equ 0F93h ;# 
# 751 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TRISC equ 0F94h ;# 
# 756 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
DDRC equ 0F94h ;# 
# 814 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TRISD equ 0F95h ;# 
# 819 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
DDRD equ 0F95h ;# 
# 877 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TRISE equ 0F96h ;# 
# 882 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
DDRE equ 0F96h ;# 
# 932 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
OSCTUNE equ 0F9Bh ;# 
# 954 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PIE1 equ 0F9Dh ;# 
# 981 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PIR1 equ 0F9Eh ;# 
# 1017 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
IPR1 equ 0F9Fh ;# 
# 1044 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PIE2 equ 0FA0h ;# 
# 1067 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PIR2 equ 0FA1h ;# 
# 1090 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
IPR2 equ 0FA2h ;# 
# 1113 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
EECON1 equ 0FA6h ;# 
# 1136 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
EECON2 equ 0FA7h ;# 
# 1148 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
EEDATA equ 0FA8h ;# 
# 1160 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
EEADR equ 0FA9h ;# 
# 1172 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
RCSTA equ 0FABh ;# 
# 1177 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
RCSTA1 equ 0FABh ;# 
# 1225 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TXSTA equ 0FACh ;# 
# 1230 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TXSTA1 equ 0FACh ;# 
# 1324 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TXREG equ 0FADh ;# 
# 1329 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TXREG1 equ 0FADh ;# 
# 1347 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
RCREG equ 0FAEh ;# 
# 1352 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
RCREG1 equ 0FAEh ;# 
# 1370 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
SPBRG equ 0FAFh ;# 
# 1375 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
SPBRG1 equ 0FAFh ;# 
# 1393 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
SPBRGH equ 0FB0h ;# 
# 1405 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
T3CON equ 0FB1h ;# 
# 1446 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TMR3 equ 0FB2h ;# 
# 1458 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TMR3L equ 0FB2h ;# 
# 1470 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TMR3H equ 0FB3h ;# 
# 1482 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
CMCON equ 0FB4h ;# 
# 1515 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
CVRCON equ 0FB5h ;# 
# 1541 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
ECCP1AS equ 0FB6h ;# 
# 1546 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
ECCPAS equ 0FB6h ;# 
# 1588 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PWM1CON equ 0FB7h ;# 
# 1593 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
ECCP1DEL equ 0FB7h ;# 
# 1631 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
BAUDCON equ 0FB8h ;# 
# 1636 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
BAUDCTL equ 0FB8h ;# 
# 1696 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
CCP2CON equ 0FBAh ;# 
# 1722 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
CCPR2 equ 0FBBh ;# 
# 1734 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
CCPR2L equ 0FBBh ;# 
# 1746 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
CCPR2H equ 0FBCh ;# 
# 1758 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
CCP1CON equ 0FBDh ;# 
# 1787 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
CCPR1 equ 0FBEh ;# 
# 1799 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
CCPR1L equ 0FBEh ;# 
# 1811 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
CCPR1H equ 0FBFh ;# 
# 1823 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
ADCON2 equ 0FC0h ;# 
# 1846 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
ADCON1 equ 0FC1h ;# 
# 1879 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
ADCON0 equ 0FC2h ;# 
# 1934 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
ADRES equ 0FC3h ;# 
# 1946 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
ADRESL equ 0FC3h ;# 
# 1958 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
ADRESH equ 0FC4h ;# 
# 1970 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
SSPCON2 equ 0FC5h ;# 
# 1997 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
SSPCON1 equ 0FC6h ;# 
# 2019 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
SSPSTAT equ 0FC7h ;# 
# 2126 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
SSPADD equ 0FC8h ;# 
# 2138 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
SSPBUF equ 0FC9h ;# 
# 2150 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
T2CON equ 0FCAh ;# 
# 2180 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PR2 equ 0FCBh ;# 
# 2185 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
MEMCON equ 0FCBh ;# 
# 2203 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TMR2 equ 0FCCh ;# 
# 2215 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
T1CON equ 0FCDh ;# 
# 2252 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TMR1 equ 0FCEh ;# 
# 2264 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TMR1L equ 0FCEh ;# 
# 2276 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TMR1H equ 0FCFh ;# 
# 2288 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
RCON equ 0FD0h ;# 
# 2333 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
WDTCON equ 0FD1h ;# 
# 2348 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
HLVDCON equ 0FD2h ;# 
# 2353 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
LVDCON equ 0FD2h ;# 
# 2423 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
OSCCON equ 0FD3h ;# 
# 2448 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
T0CON equ 0FD5h ;# 
# 2473 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TMR0 equ 0FD6h ;# 
# 2485 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TMR0L equ 0FD6h ;# 
# 2497 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TMR0H equ 0FD7h ;# 
# 2509 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
STATUS equ 0FD8h ;# 
# 2540 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
FSR2 equ 0FD9h ;# 
# 2552 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
FSR2L equ 0FD9h ;# 
# 2564 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
FSR2H equ 0FDAh ;# 
# 2576 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PLUSW2 equ 0FDBh ;# 
# 2588 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PREINC2 equ 0FDCh ;# 
# 2600 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
POSTDEC2 equ 0FDDh ;# 
# 2612 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
POSTINC2 equ 0FDEh ;# 
# 2624 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
INDF2 equ 0FDFh ;# 
# 2636 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
BSR equ 0FE0h ;# 
# 2648 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
FSR1 equ 0FE1h ;# 
# 2660 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
FSR1L equ 0FE1h ;# 
# 2672 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
FSR1H equ 0FE2h ;# 
# 2684 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PLUSW1 equ 0FE3h ;# 
# 2696 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PREINC1 equ 0FE4h ;# 
# 2708 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
POSTDEC1 equ 0FE5h ;# 
# 2720 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
POSTINC1 equ 0FE6h ;# 
# 2732 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
INDF1 equ 0FE7h ;# 
# 2744 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
WREG equ 0FE8h ;# 
# 2767 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
FSR0 equ 0FE9h ;# 
# 2779 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
FSR0L equ 0FE9h ;# 
# 2791 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
FSR0H equ 0FEAh ;# 
# 2803 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PLUSW0 equ 0FEBh ;# 
# 2815 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PREINC0 equ 0FECh ;# 
# 2827 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
POSTDEC0 equ 0FEDh ;# 
# 2839 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
POSTINC0 equ 0FEEh ;# 
# 2851 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
INDF0 equ 0FEFh ;# 
# 2863 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
INTCON3 equ 0FF0h ;# 
# 2892 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
INTCON2 equ 0FF1h ;# 
# 2919 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
INTCON equ 0FF2h ;# 
# 2983 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PROD equ 0FF3h ;# 
# 2995 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PRODL equ 0FF3h ;# 
# 3007 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PRODH equ 0FF4h ;# 
# 3019 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TABLAT equ 0FF5h ;# 
# 3031 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TBLPTR equ 0FF6h ;# 
# 3044 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TBLPTRL equ 0FF6h ;# 
# 3056 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TBLPTRH equ 0FF7h ;# 
# 3068 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TBLPTRU equ 0FF8h ;# 
# 3081 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PCLAT equ 0FF9h ;# 
# 3086 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PC equ 0FF9h ;# 
# 3104 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PCL equ 0FF9h ;# 
# 3116 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PCLATH equ 0FFAh ;# 
# 3128 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
PCLATU equ 0FFBh ;# 
# 3140 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
STKPTR equ 0FFCh ;# 
# 3164 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TOS equ 0FFDh ;# 
# 3176 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TOSL equ 0FFDh ;# 
# 3188 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TOSH equ 0FFEh ;# 
# 3200 "C:\Program Files\HI-TECH Software\PICC-18\9.80\include\pic18f4520.h"
TOSU equ 0FFFh ;# 
	FNCALL	_main,_init_mcu
	FNCALL	_main,_init_lcd
	FNCALL	_main,_LCD_test
	FNCALL	_main,_delay_ms
	FNCALL	_main,_get_point_xy
	FNCALL	_main,_draw_lcd
	FNCALL	_init_lcd,_init_lcd_spi
	FNCALL	_init_lcd,_lcd_rst
	FNCALL	_init_lcd,_post_cmd
	FNCALL	_init_lcd,_delay_ms
	FNCALL	_lcd_rst,_delay_us
	FNCALL	_LCD_test,_post_cmd
	FNCALL	_LCD_test,_post_data
	FNCALL	_LCD_test,_delay_ms
	FNCALL	_get_point_xy,_init_touch_spi
	FNCALL	_get_point_xy,_get_touch_xy
	FNCALL	_get_point_xy,___lmul
	FNCALL	_get_touch_xy,_get_touch_data
	FNCALL	_draw_lcd,_init_lcd_spi
	FNCALL	_draw_lcd,_post_cmd
	FNCALL	_draw_lcd,_post_data
	FNCALL	_post_cmd,_post_data
	FNROOT	_main
	global	_colorfol
psect	mediumconst,class=MEDIUMCONST,space=0,reloc=2
global __pmediumconst
__pmediumconst:
	file	"E:\Program\PRGPIC\PIC18F4520\lcd22_rili\lcd_22.c"
	line	18
_colorfol:
	dw	(0F800h)&0ffffh
	dw	(07E0h)&0ffffh
	dw	(01Fh)&0ffffh
	dw	(0FFE0h)&0ffffh
	dw	(0)&0ffffh
	dw	(0FFFFh)&0ffffh
	dw	(07FFh)&0ffffh
	dw	(0F81Fh)&0ffffh
	global	_ascii
psect	mediumconst
	file	"E:\Program\PRGPIC\PIC18F4520\lcd22_rili\asciihex8X16.h"
	line	16
_ascii:
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0Fh)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0F8h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(0)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(0Fh)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(0F8h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0FFh)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(018h)
	db	low(03Ch)
	db	low(07Eh)
	db	low(07Eh)
	db	low(07Eh)
	db	low(03Ch)
	db	low(018h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0FFh)
	db	low(0FFh)
	db	low(0FFh)
	db	low(0E7h)
	db	low(0C3h)
	db	low(081h)
	db	low(081h)
	db	low(081h)
	db	low(0C3h)
	db	low(0E7h)
	db	low(0FFh)
	db	low(0FFh)
	db	low(0FFh)
	db	low(0FFh)
	db	low(0FFh)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(01Fh)
	db	low(05h)
	db	low(05h)
	db	low(09h)
	db	low(09h)
	db	low(010h)
	db	low(010h)
	db	low(038h)
	db	low(044h)
	db	low(044h)
	db	low(044h)
	db	low(038h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(01Ch)
	db	low(022h)
	db	low(022h)
	db	low(022h)
	db	low(01Ch)
	db	low(08h)
	db	low(08h)
	db	low(07Fh)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(03h)
	db	low(01Dh)
	db	low(011h)
	db	low(013h)
	db	low(01Dh)
	db	low(011h)
	db	low(011h)
	db	low(011h)
	db	low(013h)
	db	low(017h)
	db	low(036h)
	db	low(070h)
	db	low(060h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(08h)
	db	low(08h)
	db	low(05Dh)
	db	low(022h)
	db	low(022h)
	db	low(022h)
	db	low(063h)
	db	low(022h)
	db	low(022h)
	db	low(022h)
	db	low(05Dh)
	db	low(08h)
	db	low(08h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(0FFh)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(0)
	db	low(0)
	db	low(01h)
	db	low(03h)
	db	low(07h)
	db	low(0Fh)
	db	low(01Fh)
	db	low(03Fh)
	db	low(07Fh)
	db	low(03Fh)
	db	low(01Fh)
	db	low(0Fh)
	db	low(07h)
	db	low(03h)
	db	low(01h)
	db	low(0)
	db	low(0)
	db	low(08h)
	db	low(01Ch)
	db	low(02Ah)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(02Ah)
	db	low(01Ch)
	db	low(08h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(024h)
	db	low(024h)
	db	low(024h)
	db	low(024h)
	db	low(024h)
	db	low(024h)
	db	low(024h)
	db	low(024h)
	db	low(024h)
	db	low(0)
	db	low(0)
	db	low(024h)
	db	low(024h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(01Fh)
	db	low(025h)
	db	low(045h)
	db	low(045h)
	db	low(045h)
	db	low(025h)
	db	low(01Dh)
	db	low(05h)
	db	low(05h)
	db	low(05h)
	db	low(05h)
	db	low(05h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(0FFh)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0FFh)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(0)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(0F8h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(0)
	db	low(08h)
	db	low(01Ch)
	db	low(02Ah)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(0)
	db	low(0)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(0Fh)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(04h)
	db	low(02h)
	db	low(07Fh)
	db	low(02h)
	db	low(04h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(010h)
	db	low(020h)
	db	low(07Fh)
	db	low(020h)
	db	low(010h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(0)
	db	low(0)
	db	low(018h)
	db	low(018h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(012h)
	db	low(036h)
	db	low(024h)
	db	low(048h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(024h)
	db	low(024h)
	db	low(024h)
	db	low(0FEh)
	db	low(048h)
	db	low(048h)
	db	low(048h)
	db	low(0FEh)
	db	low(048h)
	db	low(048h)
	db	low(048h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(010h)
	db	low(038h)
	db	low(054h)
	db	low(054h)
	db	low(050h)
	db	low(030h)
	db	low(018h)
	db	low(014h)
	db	low(014h)
	db	low(054h)
	db	low(054h)
	db	low(038h)
	db	low(010h)
	db	low(010h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(044h)
	db	low(0A4h)
	db	low(0A8h)
	db	low(0A8h)
	db	low(0A8h)
	db	low(054h)
	db	low(01Ah)
	db	low(02Ah)
	db	low(02Ah)
	db	low(02Ah)
	db	low(044h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(030h)
	db	low(048h)
	db	low(048h)
	db	low(048h)
	db	low(050h)
	db	low(06Eh)
	db	low(0A4h)
	db	low(094h)
	db	low(088h)
	db	low(089h)
	db	low(076h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(060h)
	db	low(060h)
	db	low(020h)
	db	low(0C0h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(02h)
	db	low(04h)
	db	low(08h)
	db	low(08h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(08h)
	db	low(08h)
	db	low(04h)
	db	low(02h)
	db	low(0)
	db	low(0)
	db	low(040h)
	db	low(020h)
	db	low(010h)
	db	low(010h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(010h)
	db	low(010h)
	db	low(020h)
	db	low(040h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(010h)
	db	low(010h)
	db	low(0D6h)
	db	low(038h)
	db	low(038h)
	db	low(0D6h)
	db	low(010h)
	db	low(010h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(0FEh)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(060h)
	db	low(060h)
	db	low(020h)
	db	low(0C0h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(07Fh)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(060h)
	db	low(060h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(01h)
	db	low(02h)
	db	low(02h)
	db	low(04h)
	db	low(04h)
	db	low(08h)
	db	low(08h)
	db	low(010h)
	db	low(010h)
	db	low(020h)
	db	low(020h)
	db	low(040h)
	db	low(040h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(018h)
	db	low(024h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(024h)
	db	low(018h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(010h)
	db	low(070h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(07Ch)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(03Ch)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(04h)
	db	low(04h)
	db	low(08h)
	db	low(010h)
	db	low(020h)
	db	low(042h)
	db	low(07Eh)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(03Ch)
	db	low(042h)
	db	low(042h)
	db	low(04h)
	db	low(018h)
	db	low(04h)
	db	low(02h)
	db	low(02h)
	db	low(042h)
	db	low(044h)
	db	low(038h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(04h)
	db	low(0Ch)
	db	low(014h)
	db	low(024h)
	db	low(024h)
	db	low(044h)
	db	low(044h)
	db	low(07Eh)
	db	low(04h)
	db	low(04h)
	db	low(01Eh)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(07Eh)
	db	low(040h)
	db	low(040h)
	db	low(040h)
	db	low(058h)
	db	low(064h)
	db	low(02h)
	db	low(02h)
	db	low(042h)
	db	low(044h)
	db	low(038h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(01Ch)
	db	low(024h)
	db	low(040h)
	db	low(040h)
	db	low(058h)
	db	low(064h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(024h)
	db	low(018h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(07Eh)
	db	low(044h)
	db	low(044h)
	db	low(08h)
	db	low(08h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(03Ch)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(024h)
	db	low(018h)
	db	low(024h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(03Ch)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(018h)
	db	low(024h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(026h)
	db	low(01Ah)
	db	low(02h)
	db	low(02h)
	db	low(024h)
	db	low(038h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(018h)
	db	low(018h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(018h)
	db	low(018h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(010h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(010h)
	db	low(010h)
	db	low(020h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(02h)
	db	low(04h)
	db	low(08h)
	db	low(010h)
	db	low(020h)
	db	low(040h)
	db	low(020h)
	db	low(010h)
	db	low(08h)
	db	low(04h)
	db	low(02h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0FEh)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0FEh)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(040h)
	db	low(020h)
	db	low(010h)
	db	low(08h)
	db	low(04h)
	db	low(02h)
	db	low(04h)
	db	low(08h)
	db	low(010h)
	db	low(020h)
	db	low(040h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(03Ch)
	db	low(042h)
	db	low(042h)
	db	low(062h)
	db	low(02h)
	db	low(04h)
	db	low(08h)
	db	low(08h)
	db	low(0)
	db	low(018h)
	db	low(018h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(038h)
	db	low(044h)
	db	low(05Ah)
	db	low(0AAh)
	db	low(0AAh)
	db	low(0AAh)
	db	low(0AAh)
	db	low(0B4h)
	db	low(042h)
	db	low(044h)
	db	low(038h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(010h)
	db	low(010h)
	db	low(018h)
	db	low(028h)
	db	low(028h)
	db	low(024h)
	db	low(03Ch)
	db	low(044h)
	db	low(042h)
	db	low(042h)
	db	low(0E7h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0F8h)
	db	low(044h)
	db	low(044h)
	db	low(044h)
	db	low(078h)
	db	low(044h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(044h)
	db	low(0F8h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(03Eh)
	db	low(042h)
	db	low(042h)
	db	low(080h)
	db	low(080h)
	db	low(080h)
	db	low(080h)
	db	low(080h)
	db	low(042h)
	db	low(044h)
	db	low(038h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0F8h)
	db	low(044h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(044h)
	db	low(0F8h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0FCh)
	db	low(042h)
	db	low(048h)
	db	low(048h)
	db	low(078h)
	db	low(048h)
	db	low(048h)
	db	low(040h)
	db	low(042h)
	db	low(042h)
	db	low(0FCh)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0FCh)
	db	low(042h)
	db	low(048h)
	db	low(048h)
	db	low(078h)
	db	low(048h)
	db	low(048h)
	db	low(040h)
	db	low(040h)
	db	low(040h)
	db	low(0E0h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(03Ch)
	db	low(044h)
	db	low(044h)
	db	low(080h)
	db	low(080h)
	db	low(080h)
	db	low(08Eh)
	db	low(084h)
	db	low(044h)
	db	low(044h)
	db	low(038h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0E7h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(07Eh)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(0E7h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(07Ch)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(07Ch)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(03Eh)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(088h)
	db	low(0F0h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0EEh)
	db	low(044h)
	db	low(048h)
	db	low(050h)
	db	low(070h)
	db	low(050h)
	db	low(048h)
	db	low(048h)
	db	low(044h)
	db	low(044h)
	db	low(0EEh)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0E0h)
	db	low(040h)
	db	low(040h)
	db	low(040h)
	db	low(040h)
	db	low(040h)
	db	low(040h)
	db	low(040h)
	db	low(040h)
	db	low(042h)
	db	low(0FEh)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0EEh)
	db	low(06Ch)
	db	low(06Ch)
	db	low(06Ch)
	db	low(06Ch)
	db	low(054h)
	db	low(054h)
	db	low(054h)
	db	low(054h)
	db	low(054h)
	db	low(0D6h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0C7h)
	db	low(062h)
	db	low(062h)
	db	low(052h)
	db	low(052h)
	db	low(04Ah)
	db	low(04Ah)
	db	low(04Ah)
	db	low(046h)
	db	low(046h)
	db	low(0E2h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(038h)
	db	low(044h)
	db	low(082h)
	db	low(082h)
	db	low(082h)
	db	low(082h)
	db	low(082h)
	db	low(082h)
	db	low(082h)
	db	low(044h)
	db	low(038h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0FCh)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(07Ch)
	db	low(040h)
	db	low(040h)
	db	low(040h)
	db	low(040h)
	db	low(0E0h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(038h)
	db	low(044h)
	db	low(082h)
	db	low(082h)
	db	low(082h)
	db	low(082h)
	db	low(082h)
	db	low(0B2h)
	db	low(0CAh)
	db	low(04Ch)
	db	low(038h)
	db	low(06h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0FCh)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(07Ch)
	db	low(048h)
	db	low(048h)
	db	low(044h)
	db	low(044h)
	db	low(042h)
	db	low(0E3h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(03Eh)
	db	low(042h)
	db	low(042h)
	db	low(040h)
	db	low(020h)
	db	low(018h)
	db	low(04h)
	db	low(02h)
	db	low(042h)
	db	low(042h)
	db	low(07Ch)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0FEh)
	db	low(092h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(038h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0E7h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(03Ch)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0E7h)
	db	low(042h)
	db	low(042h)
	db	low(044h)
	db	low(024h)
	db	low(024h)
	db	low(028h)
	db	low(028h)
	db	low(018h)
	db	low(010h)
	db	low(010h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0D6h)
	db	low(092h)
	db	low(092h)
	db	low(092h)
	db	low(092h)
	db	low(0AAh)
	db	low(0AAh)
	db	low(06Ch)
	db	low(044h)
	db	low(044h)
	db	low(044h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0E7h)
	db	low(042h)
	db	low(024h)
	db	low(024h)
	db	low(018h)
	db	low(018h)
	db	low(018h)
	db	low(024h)
	db	low(024h)
	db	low(042h)
	db	low(0E7h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0EEh)
	db	low(044h)
	db	low(044h)
	db	low(028h)
	db	low(028h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(038h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(07Eh)
	db	low(084h)
	db	low(04h)
	db	low(08h)
	db	low(08h)
	db	low(010h)
	db	low(020h)
	db	low(020h)
	db	low(042h)
	db	low(042h)
	db	low(0FCh)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(01Eh)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(01Eh)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(040h)
	db	low(040h)
	db	low(020h)
	db	low(020h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(08h)
	db	low(08h)
	db	low(04h)
	db	low(04h)
	db	low(04h)
	db	low(02h)
	db	low(02h)
	db	low(0)
	db	low(078h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(078h)
	db	low(0)
	db	low(0)
	db	low(01Ch)
	db	low(022h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0FFh)
	db	low(0)
	db	low(060h)
	db	low(010h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(03Ch)
	db	low(042h)
	db	low(01Eh)
	db	low(022h)
	db	low(042h)
	db	low(042h)
	db	low(03Fh)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0C0h)
	db	low(040h)
	db	low(040h)
	db	low(040h)
	db	low(058h)
	db	low(064h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(064h)
	db	low(058h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(01Ch)
	db	low(022h)
	db	low(040h)
	db	low(040h)
	db	low(040h)
	db	low(022h)
	db	low(01Ch)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(06h)
	db	low(02h)
	db	low(02h)
	db	low(02h)
	db	low(01Eh)
	db	low(022h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(026h)
	db	low(01Bh)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(03Ch)
	db	low(042h)
	db	low(07Eh)
	db	low(040h)
	db	low(040h)
	db	low(042h)
	db	low(03Ch)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0Fh)
	db	low(011h)
	db	low(010h)
	db	low(010h)
	db	low(07Eh)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(07Ch)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(03Eh)
	db	low(044h)
	db	low(044h)
	db	low(038h)
	db	low(040h)
	db	low(03Ch)
	db	low(042h)
	db	low(042h)
	db	low(03Ch)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0C0h)
	db	low(040h)
	db	low(040h)
	db	low(040h)
	db	low(05Ch)
	db	low(062h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(0E7h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(030h)
	db	low(030h)
	db	low(0)
	db	low(0)
	db	low(070h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(07Ch)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0Ch)
	db	low(0Ch)
	db	low(0)
	db	low(0)
	db	low(01Ch)
	db	low(04h)
	db	low(04h)
	db	low(04h)
	db	low(04h)
	db	low(04h)
	db	low(04h)
	db	low(044h)
	db	low(078h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0C0h)
	db	low(040h)
	db	low(040h)
	db	low(040h)
	db	low(04Eh)
	db	low(048h)
	db	low(050h)
	db	low(068h)
	db	low(048h)
	db	low(044h)
	db	low(0EEh)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(070h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(07Ch)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0FEh)
	db	low(049h)
	db	low(049h)
	db	low(049h)
	db	low(049h)
	db	low(049h)
	db	low(0EDh)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0DCh)
	db	low(062h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(0E7h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(03Ch)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(03Ch)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0D8h)
	db	low(064h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(044h)
	db	low(078h)
	db	low(040h)
	db	low(0E0h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(01Eh)
	db	low(022h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(022h)
	db	low(01Eh)
	db	low(02h)
	db	low(07h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0EEh)
	db	low(032h)
	db	low(020h)
	db	low(020h)
	db	low(020h)
	db	low(020h)
	db	low(0F8h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(03Eh)
	db	low(042h)
	db	low(040h)
	db	low(03Ch)
	db	low(02h)
	db	low(042h)
	db	low(07Ch)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(010h)
	db	low(010h)
	db	low(07Ch)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(0Ch)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0C6h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(042h)
	db	low(046h)
	db	low(03Bh)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0E7h)
	db	low(042h)
	db	low(024h)
	db	low(024h)
	db	low(028h)
	db	low(010h)
	db	low(010h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0D7h)
	db	low(092h)
	db	low(092h)
	db	low(0AAh)
	db	low(0AAh)
	db	low(044h)
	db	low(044h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(06Eh)
	db	low(024h)
	db	low(018h)
	db	low(018h)
	db	low(018h)
	db	low(024h)
	db	low(076h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0E7h)
	db	low(042h)
	db	low(024h)
	db	low(024h)
	db	low(028h)
	db	low(018h)
	db	low(010h)
	db	low(010h)
	db	low(0E0h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(07Eh)
	db	low(044h)
	db	low(08h)
	db	low(010h)
	db	low(010h)
	db	low(022h)
	db	low(07Eh)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(03h)
	db	low(04h)
	db	low(04h)
	db	low(04h)
	db	low(04h)
	db	low(04h)
	db	low(08h)
	db	low(04h)
	db	low(04h)
	db	low(04h)
	db	low(04h)
	db	low(04h)
	db	low(04h)
	db	low(03h)
	db	low(0)
	db	low(0)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(08h)
	db	low(0)
	db	low(060h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(08h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(060h)
	db	low(0)
	db	low(0)
	db	low(04Ch)
	db	low(043h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(0)
	global	_colorfol
	global	_ascii
	global	_touch_xy_buffer
	global	_touch_counter
	global	_touch_rd_index
	global	_touch_wr_index
	global	swap@b
	global	_ADCON1
_ADCON1	set	0xFC1
	global	_INTCON
_INTCON	set	0xFF2
	global	_PIR1
_PIR1	set	0xF9E
	global	_PORTB
_PORTB	set	0xF81
	global	_SSPBUF
_SSPBUF	set	0xFC9
	global	_SSPCON1
_SSPCON1	set	0xFC6
	global	_SSPSTAT
_SSPSTAT	set	0xFC7
	global	_TRISA
_TRISA	set	0xF92
	global	_TRISB
_TRISB	set	0xF93
	global	_TRISC
_TRISC	set	0xF94
	global	_TRISD
_TRISD	set	0xF95
	global	_RA0
_RA0	set	0x7C00
	global	_RA1
_RA1	set	0x7C01
	global	_RA2
_RA2	set	0x7C02
	global	_RA4
_RA4	set	0x7C04
	global	_RD0
_RD0	set	0x7C18
	global	_SSPIF
_SSPIF	set	0x7CF3
	global	_TRISC0
_TRISC0	set	0x7CA0
	global	_TRISC1
_TRISC1	set	0x7CA1
	global	_TRISC2
_TRISC2	set	0x7CA2
; #config settings
	file	"TOUCH.as"
	line	#
psect	cinit,class=CODE,delta=1,reloc=2
global __pcinit
__pcinit:
global start_initialization
start_initialization:

psect	bssCOMRAM,class=COMRAM,space=1
global __pbssCOMRAM
__pbssCOMRAM:
	global	_touch_xy_buffer
_touch_xy_buffer:
       ds      32
	global	_touch_counter
_touch_counter:
       ds      1
	global	_touch_rd_index
_touch_rd_index:
       ds      1
	global	_touch_wr_index
_touch_wr_index:
       ds      1
swap@b:
       ds      10
psect	cinit
; Clear objects allocated to COMRAM (45 bytes)
	global __pbssCOMRAM
lfsr	0,__pbssCOMRAM
movlw	45
clear_0:
clrf	postinc0,c
decf	wreg
bnz	clear_0
psect cinit,class=CODE,delta=1
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
	GLOBAL	__Lmediumconst
	movlw	low highword(__Lmediumconst)
	movwf	tblptru
movlb 0
goto _main	;jump to C main() function
psect	cstackCOMRAM,class=COMRAM,space=1
global __pcstackCOMRAM
__pcstackCOMRAM:
	global	?_delay_us
?_delay_us:	; 0 bytes @ 0x0
	global	?_delay_ms
?_delay_ms:	; 0 bytes @ 0x0
	global	?_init_lcd_spi
?_init_lcd_spi:	; 0 bytes @ 0x0
	global	??_init_lcd_spi
??_init_lcd_spi:	; 0 bytes @ 0x0
	global	?_init_touch_spi
?_init_touch_spi:	; 0 bytes @ 0x0
	global	??_init_touch_spi
??_init_touch_spi:	; 0 bytes @ 0x0
	global	?_post_data
?_post_data:	; 0 bytes @ 0x0
	global	?_lcd_rst
?_lcd_rst:	; 0 bytes @ 0x0
	global	?_init_lcd
?_init_lcd:	; 0 bytes @ 0x0
	global	?_LCD_test
?_LCD_test:	; 0 bytes @ 0x0
	global	?_init_mcu
?_init_mcu:	; 0 bytes @ 0x0
	global	??_init_mcu
??_init_mcu:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_get_point_xy
?_get_point_xy:	; 1 bytes @ 0x0
	global	?_draw_lcd
?_draw_lcd:	; 1 bytes @ 0x0
	global	?_get_touch_data
?_get_touch_data:	; 2 bytes @ 0x0
	global	?___lmul
?___lmul:	; 4 bytes @ 0x0
	global	post_data@data
post_data@data:	; 2 bytes @ 0x0
	global	get_touch_data@cmd
get_touch_data@cmd:	; 2 bytes @ 0x0
	global	delay_ms@ms
delay_ms@ms:	; 2 bytes @ 0x0
	global	delay_us@us
delay_us@us:	; 2 bytes @ 0x0
	global	___lmul@multiplier
___lmul@multiplier:	; 4 bytes @ 0x0
	ds   2
	global	??_delay_us
??_delay_us:	; 0 bytes @ 0x2
	global	??_delay_ms
??_delay_ms:	; 0 bytes @ 0x2
	global	??_post_data
??_post_data:	; 0 bytes @ 0x2
	global	?_post_cmd
?_post_cmd:	; 0 bytes @ 0x2
	global	??_get_touch_data
??_get_touch_data:	; 0 bytes @ 0x2
	global	delay_ms@i
delay_ms@i:	; 1 bytes @ 0x2
	global	delay_us@i
delay_us@i:	; 1 bytes @ 0x2
	global	post_cmd@index
post_cmd@index:	; 2 bytes @ 0x2
	ds   1
	global	??_lcd_rst
??_lcd_rst:	; 0 bytes @ 0x3
	ds   1
	global	get_touch_data@tmp
get_touch_data@tmp:	; 1 bytes @ 0x4
	global	post_cmd@cmd
post_cmd@cmd:	; 2 bytes @ 0x4
	global	___lmul@multiplicand
___lmul@multiplicand:	; 4 bytes @ 0x4
	ds   1
	global	?_get_touch_xy
?_get_touch_xy:	; 4 bytes @ 0x5
	ds   1
	global	??_post_cmd
??_post_cmd:	; 0 bytes @ 0x6
	global	??_init_lcd
??_init_lcd:	; 0 bytes @ 0x6
	global	??_LCD_test
??_LCD_test:	; 0 bytes @ 0x6
	global	??_draw_lcd
??_draw_lcd:	; 0 bytes @ 0x6
	global	LCD_test@temp
LCD_test@temp:	; 2 bytes @ 0x6
	ds   2
	global	??___lmul
??___lmul:	; 0 bytes @ 0x8
	global	draw_lcd@n
draw_lcd@n:	; 1 bytes @ 0x8
	global	LCD_test@num
LCD_test@num:	; 2 bytes @ 0x8
	global	___lmul@product
___lmul@product:	; 4 bytes @ 0x8
	ds   1
	global	??_get_touch_xy
??_get_touch_xy:	; 0 bytes @ 0x9
	global	get_touch_xy@tmp_xy
get_touch_xy@tmp_xy:	; 4 bytes @ 0x9
	ds   1
	global	LCD_test@n
LCD_test@n:	; 1 bytes @ 0xA
	ds   3
	global	??_get_point_xy
??_get_point_xy:	; 0 bytes @ 0xD
	ds   14
	global	get_point_xy@tmp_xy
get_point_xy@tmp_xy:	; 4 bytes @ 0x1B
	ds   4
	global	get_point_xy@tmp_x
get_point_xy@tmp_x:	; 4 bytes @ 0x1F
	ds   4
	global	get_point_xy@tmp_y
get_point_xy@tmp_y:	; 4 bytes @ 0x23
	ds   4
	global	get_point_xy@tmp_xy_buf
get_point_xy@tmp_xy_buf:	; 20 bytes @ 0x27
	ds   20
	global	get_point_xy@tmp
get_point_xy@tmp:	; 1 bytes @ 0x3B
	ds   1
	global	get_point_xy@m
get_point_xy@m:	; 1 bytes @ 0x3C
	ds   1
	global	get_point_xy@n
get_point_xy@n:	; 1 bytes @ 0x3D
	ds   1
	global	??_main
??_main:	; 0 bytes @ 0x3E
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    2064
;!    Data        0
;!    BSS         45
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM          127     62     107
;!    BANK0           128      0       0
;!    BANK1           256      0       0
;!    BANK2           256      0       0
;!    BANK3           256      0       0
;!    BANK4           256      0       0
;!    BANK5           256      0       0

;!
;!Pointer List with Targets:
;!
;!    ?___lmul	unsigned long  size(1) Largest target is 0
;!
;!    ?_get_touch_xy	struct xy size(1) Largest target is 0
;!
;!    ?_get_touch_data	unsigned short  size(1) Largest target is 0
;!
;!    sp__swap	PTR unsigned char  size(1) Largest target is 10
;!		 -> DisplayString@a(COMRAM[10]), swap@b(COMRAM[10]), 
;!


;!
;!Critical Paths under _main in COMRAM
;!
;!    _main->_get_point_xy
;!    _init_lcd->_post_cmd
;!    _lcd_rst->_delay_us
;!    _LCD_test->_post_cmd
;!    _get_point_xy->_get_touch_xy
;!    _get_touch_xy->_get_touch_data
;!    _draw_lcd->_post_cmd
;!    _post_cmd->_post_data
;!
;!Critical Paths under _main in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _main in BANK2
;!
;!    None.
;!
;!Critical Paths under _main in BANK3
;!
;!    None.
;!
;!Critical Paths under _main in BANK4
;!
;!    None.
;!
;!Critical Paths under _main in BANK5
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 0     0      0    1365
;!                           _init_mcu
;!                           _init_lcd
;!                           _LCD_test
;!                           _delay_ms
;!                       _get_point_xy
;!                           _draw_lcd
;! ---------------------------------------------------------------------------------
;! (1) _init_lcd                                             4     4      0     210
;!                       _init_lcd_spi
;!                            _lcd_rst
;!                           _post_cmd
;!                           _delay_ms
;! ---------------------------------------------------------------------------------
;! (2) _lcd_rst                                              0     0      0      75
;!                           _delay_us
;! ---------------------------------------------------------------------------------
;! (3) _delay_us                                             3     1      2      75
;!                                              0 COMRAM     3     1      2
;! ---------------------------------------------------------------------------------
;! (1) _LCD_test                                             6     6      0     255
;!                                              6 COMRAM     5     5      0
;!                           _post_cmd
;!                          _post_data
;!                           _delay_ms
;! ---------------------------------------------------------------------------------
;! (1) _delay_ms                                             3     1      2      75
;!                                              0 COMRAM     3     1      2
;! ---------------------------------------------------------------------------------
;! (1) _get_point_xy                                        49    49      0     705
;!                                             13 COMRAM    49    49      0
;!                     _init_touch_spi
;!                       _get_touch_xy
;!                             ___lmul
;! ---------------------------------------------------------------------------------
;! (2) _init_touch_spi                                       0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _get_touch_xy                                         8     4      4      75
;!                                              5 COMRAM     8     4      4
;!                     _get_touch_data
;! ---------------------------------------------------------------------------------
;! (3) _get_touch_data                                       5     3      2      30
;!                                              0 COMRAM     5     3      2
;! ---------------------------------------------------------------------------------
;! (1) _draw_lcd                                             3     3      0     120
;!                                              6 COMRAM     3     3      0
;!                       _init_lcd_spi
;!                           _post_cmd
;!                          _post_data
;! ---------------------------------------------------------------------------------
;! (2) _init_lcd_spi                                         0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _post_cmd                                             4     0      4      60
;!                                              2 COMRAM     4     0      4
;!                          _post_data
;! ---------------------------------------------------------------------------------
;! (2) _post_data                                            2     0      2      30
;!                                              0 COMRAM     2     0      2
;! ---------------------------------------------------------------------------------
;! (1) _init_mcu                                             0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) ___lmul                                              12     4      8      60
;!                                              0 COMRAM    12     4      8
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 3
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _init_mcu
;!   _init_lcd
;!     _init_lcd_spi
;!     _lcd_rst
;!       _delay_us
;!     _post_cmd
;!       _post_data
;!     _delay_ms
;!   _LCD_test
;!     _post_cmd
;!       _post_data
;!     _post_data
;!     _delay_ms
;!   _delay_ms
;!   _get_point_xy
;!     _init_touch_spi
;!     _get_touch_xy
;!       _get_touch_data
;!     ___lmul
;!   _draw_lcd
;!     _init_lcd_spi
;!     _post_cmd
;!       _post_data
;!     _post_data
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BIGRAM             5FF      0       0      17        0.0%
;!EEDATA             100      0       0       0        0.0%
;!BITBANK5           100      0       0      16        0.0%
;!BANK5              100      0       0      14        0.0%
;!BITBANK4           100      0       0      12        0.0%
;!BANK4              100      0       0      13        0.0%
;!BITBANK3           100      0       0      10        0.0%
;!BANK3              100      0       0      11        0.0%
;!BITBANK2           100      0       0       8        0.0%
;!BANK2              100      0       0       9        0.0%
;!BITBANK1           100      0       0       6        0.0%
;!BANK1              100      0       0       7        0.0%
;!BITBANK0            80      0       0       4        0.0%
;!BANK0               80      0       0       5        0.0%
;!BITCOMRAM           7F      0       0       0        0.0%
;!COMRAM              7F     3E      6B       1       84.3%
;!BITSFR               0      0       0      40        0.0%
;!SFR                  0      0       0      40        0.0%
;!STACK                0      0       3       2        0.0%
;!NULL                 0      0       0       0        0.0%
;!ABS                  0      0      6B      15        0.0%
;!DATA                 0      0      6E       3        0.0%
;!CODE                 0      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 34 in file "E:\Program\PRGPIC\PIC18F4520\lcd22_rili\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFFFFFF/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_init_mcu
;;		_init_lcd
;;		_LCD_test
;;		_delay_ms
;;		_get_point_xy
;;		_draw_lcd
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	text0,class=CODE,space=0,reloc=2
global __ptext0
__ptext0:
psect	text0
	file	"E:\Program\PRGPIC\PIC18F4520\lcd22_rili\main.c"
	line	34
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:
	opt	stack 28
	line	36
	
l1204:
;main.c: 36: init_mcu();
	call	_init_mcu	;wreg free
	line	37
	
l1206:
;main.c: 37: init_lcd();
	call	_init_lcd	;wreg free
	line	39
	
l1208:
;main.c: 39: LCD_test();
	call	_LCD_test	;wreg free
	line	40
	
l1210:
;main.c: 40: TRISB=0;PORTB=0XF0;delay_ms(100);
	clrf	((c:3987)),c	;volatile
	
l1212:
	movlw	low(0F0h)
	movwf	((c:3969)),c	;volatile
	
l1214:
	movlw	high(064h)
	movwf	((c:?_delay_ms+1)),c
	movlw	low(064h)
	movwf	((c:?_delay_ms)),c
	call	_delay_ms	;wreg free
	line	43
	
l1216:
;main.c: 43: TRISB=0;PORTB=0X0f;delay_ms(100);
	clrf	((c:3987)),c	;volatile
	
l1218:
	movlw	low(0Fh)
	movwf	((c:3969)),c	;volatile
	
l1220:
	movlw	high(064h)
	movwf	((c:?_delay_ms+1)),c
	movlw	low(064h)
	movwf	((c:?_delay_ms)),c
	call	_delay_ms	;wreg free
	line	46
	
l1222:
;main.c: 46: delay_ms(5);
	movlw	high(05h)
	movwf	((c:?_delay_ms+1)),c
	movlw	low(05h)
	movwf	((c:?_delay_ms)),c
	call	_delay_ms	;wreg free
	line	49
	
l1224:
;main.c: 49: if(!RA0){
	btfsc	c:(31744/8),(31744)&7	;volatile
	goto	u331
	goto	u330
u331:
	goto	l1222
u330:
	line	50
	
l1226:
;main.c: 50: if(get_point_xy()){
	call	_get_point_xy	;wreg free
	iorlw	0
	btfsc	status,2
	goto	u341
	goto	u340
u341:
	goto	l1222
u340:
	line	51
	
l1228:
;main.c: 51: draw_lcd();
	call	_draw_lcd	;wreg free
	goto	l1222
	global	start
	goto	start
	opt stack 0
psect	text1,class=CODE,space=0,reloc=2
global __ptext1
__ptext1:
	line	55
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,88
	global	_init_lcd

;; *************** function _init_lcd *****************
;; Defined at:
;;		line 76 in file "E:\Program\PRGPIC\PIC18F4520\lcd22_rili\lcd_22.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  y               2    0        unsigned short 
;;  x               2    0        unsigned short 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFFFFFF/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_init_lcd_spi
;;		_lcd_rst
;;		_post_cmd
;;		_delay_ms
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1
	file	"E:\Program\PRGPIC\PIC18F4520\lcd22_rili\lcd_22.c"
	line	76
	global	__size_of_init_lcd
	__size_of_init_lcd	equ	__end_of_init_lcd-_init_lcd
	
_init_lcd:
	opt	stack 28
	line	82
	
l940:
;lcd_22.c: 77: u16 x, y;
;lcd_22.c: 82: init_lcd_spi();
	call	_init_lcd_spi	;wreg free
	line	83
	
l942:
;lcd_22.c: 83: {RA1=0;};
	bcf	c:(31745/8),(31745)&7	;volatile
	line	84
	
l944:
;lcd_22.c: 84: lcd_rst();
	call	_lcd_rst	;wreg free
	line	86
	
l946:
;lcd_22.c: 86: post_cmd( 0x000, 0x0001 );
	movlw	high(0)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0)
	movwf	((c:?_post_cmd)),c
	movlw	high(01h)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(01h)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	87
;lcd_22.c: 87: delay_ms( 10 );
	movlw	high(0Ah)
	movwf	((c:?_delay_ms+1)),c
	movlw	low(0Ah)
	movwf	((c:?_delay_ms)),c
	call	_delay_ms	;wreg free
	line	89
	
l948:
;lcd_22.c: 89: post_cmd( 0x100, 0x0000 );
	movlw	high(0100h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0100h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	90
	
l950:
;lcd_22.c: 90: post_cmd( 0x101, 0x0000 );
	movlw	high(0101h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0101h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	91
	
l952:
;lcd_22.c: 91: post_cmd( 0x102, 0x3110 );
	movlw	high(0102h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0102h)
	movwf	((c:?_post_cmd)),c
	movlw	high(03110h)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(03110h)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	92
	
l954:
;lcd_22.c: 92: post_cmd( 0x103, 0xe200 );
	movlw	high(0103h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0103h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0E200h)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0E200h)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	93
	
l956:
;lcd_22.c: 93: post_cmd( 0x110, 0x009d );
	movlw	high(0110h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0110h)
	movwf	((c:?_post_cmd)),c
	movlw	high(09Dh)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(09Dh)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	94
	
l958:
;lcd_22.c: 94: post_cmd( 0x111, 0x0022 );
	movlw	high(0111h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0111h)
	movwf	((c:?_post_cmd)),c
	movlw	high(022h)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(022h)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	95
	
l960:
;lcd_22.c: 95: post_cmd( 0x100, 0x0120 );
	movlw	high(0100h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0100h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0120h)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0120h)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	96
	
l962:
;lcd_22.c: 96: delay_ms( 20 );
	movlw	high(014h)
	movwf	((c:?_delay_ms+1)),c
	movlw	low(014h)
	movwf	((c:?_delay_ms)),c
	call	_delay_ms	;wreg free
	line	98
;lcd_22.c: 98: post_cmd( 0x100, 0x3120 );
	movlw	high(0100h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0100h)
	movwf	((c:?_post_cmd)),c
	movlw	high(03120h)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(03120h)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	99
	
l964:
;lcd_22.c: 99: delay_ms( 80 );
	movlw	high(050h)
	movwf	((c:?_delay_ms+1)),c
	movlw	low(050h)
	movwf	((c:?_delay_ms)),c
	call	_delay_ms	;wreg free
	line	101
	
l966:
;lcd_22.c: 101: post_cmd( 0x001, 0x0100 );
	movlw	high(01h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(01h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0100h)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0100h)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	102
	
l968:
;lcd_22.c: 102: post_cmd( 0x002, 0x0000 );
	movlw	high(02h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(02h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	103
	
l970:
;lcd_22.c: 103: post_cmd( 0x003, 0x1230 );
	movlw	high(03h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(03h)
	movwf	((c:?_post_cmd)),c
	movlw	high(01230h)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(01230h)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	104
	
l972:
;lcd_22.c: 104: post_cmd( 0x006, 0x0000 );
	movlw	high(06h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(06h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	105
	
l974:
;lcd_22.c: 105: post_cmd( 0x007, 0x0101 );
	movlw	high(07h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(07h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0101h)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0101h)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	106
	
l976:
;lcd_22.c: 106: post_cmd( 0x008, 0x0808 );
	movlw	high(08h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(08h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0808h)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0808h)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	107
	
l978:
;lcd_22.c: 107: post_cmd( 0x009, 0x0000 );
	movlw	high(09h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(09h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	108
	
l980:
;lcd_22.c: 108: post_cmd( 0x00b, 0x0000 );
	movlw	high(0Bh)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0Bh)
	movwf	((c:?_post_cmd)),c
	movlw	high(0)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	109
	
l982:
;lcd_22.c: 109: post_cmd( 0x00c, 0x0000 );
	movlw	high(0Ch)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0Ch)
	movwf	((c:?_post_cmd)),c
	movlw	high(0)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	110
	
l984:
;lcd_22.c: 110: post_cmd( 0x00d, 0x0018 );
	movlw	high(0Dh)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0Dh)
	movwf	((c:?_post_cmd)),c
	movlw	high(018h)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(018h)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	112
	
l986:
;lcd_22.c: 112: post_cmd( 0x012, 0x0000 );
	movlw	high(012h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(012h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	113
	
l988:
;lcd_22.c: 113: post_cmd( 0x013, 0x0000 );
	movlw	high(013h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(013h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	114
	
l990:
;lcd_22.c: 114: post_cmd( 0x018, 0x0000 );
	movlw	high(018h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(018h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	115
	
l992:
;lcd_22.c: 115: post_cmd( 0x019, 0x0000 );
	movlw	high(019h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(019h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	117
	
l994:
;lcd_22.c: 117: post_cmd( 0x203, 0x0000 );
	movlw	high(0203h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0203h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	118
	
l996:
;lcd_22.c: 118: post_cmd( 0x204, 0x0000 );
	movlw	high(0204h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0204h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	120
	
l998:
;lcd_22.c: 120: post_cmd( 0x210, 0x0000 );
	movlw	high(0210h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0210h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	121
	
l1000:
;lcd_22.c: 121: post_cmd( 0x211, 0x00ef );
	movlw	high(0211h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0211h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0EFh)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0EFh)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	122
	
l1002:
;lcd_22.c: 122: post_cmd( 0x212, 0x0000 );
	movlw	high(0212h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0212h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	123
	
l1004:
;lcd_22.c: 123: post_cmd( 0x213, 0x013f );
	movlw	high(0213h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0213h)
	movwf	((c:?_post_cmd)),c
	movlw	high(013Fh)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(013Fh)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	124
	
l1006:
;lcd_22.c: 124: post_cmd( 0x214, 0x0000 );
	movlw	high(0214h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0214h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	125
	
l1008:
;lcd_22.c: 125: post_cmd( 0x215, 0x0000 );
	movlw	high(0215h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0215h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	126
	
l1010:
;lcd_22.c: 126: post_cmd( 0x216, 0x0000 );
	movlw	high(0216h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0216h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	127
	
l1012:
;lcd_22.c: 127: post_cmd( 0x217, 0x0000 );
	movlw	high(0217h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0217h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	130
	
l1014:
;lcd_22.c: 130: post_cmd( 0x300, 0x5343);
	movlw	high(0300h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0300h)
	movwf	((c:?_post_cmd)),c
	movlw	high(05343h)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(05343h)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	131
	
l1016:
;lcd_22.c: 131: post_cmd( 0x301, 0x1021);
	movlw	high(0301h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0301h)
	movwf	((c:?_post_cmd)),c
	movlw	high(01021h)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(01021h)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	132
	
l1018:
;lcd_22.c: 132: post_cmd( 0x302, 0x0003);
	movlw	high(0302h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0302h)
	movwf	((c:?_post_cmd)),c
	movlw	high(03h)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(03h)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	133
	
l1020:
;lcd_22.c: 133: post_cmd( 0x303, 0x0011);
	movlw	high(0303h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0303h)
	movwf	((c:?_post_cmd)),c
	movlw	high(011h)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(011h)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	134
	
l1022:
;lcd_22.c: 134: post_cmd( 0x304, 0x050a);
	movlw	high(0304h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0304h)
	movwf	((c:?_post_cmd)),c
	movlw	high(050Ah)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(050Ah)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	135
	
l1024:
;lcd_22.c: 135: post_cmd( 0x305, 0x4342);
	movlw	high(0305h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0305h)
	movwf	((c:?_post_cmd)),c
	movlw	high(04342h)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(04342h)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	136
	
l1026:
;lcd_22.c: 136: post_cmd( 0x306, 0x1100);
	movlw	high(0306h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0306h)
	movwf	((c:?_post_cmd)),c
	movlw	high(01100h)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(01100h)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	137
	
l1028:
;lcd_22.c: 137: post_cmd( 0x307, 0x0003);
	movlw	high(0307h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0307h)
	movwf	((c:?_post_cmd)),c
	movlw	high(03h)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(03h)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	138
	
l1030:
;lcd_22.c: 138: post_cmd( 0x308, 0x1201);
	movlw	high(0308h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0308h)
	movwf	((c:?_post_cmd)),c
	movlw	high(01201h)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(01201h)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	139
	
l1032:
;lcd_22.c: 139: post_cmd( 0x309, 0x050a);
	movlw	high(0309h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0309h)
	movwf	((c:?_post_cmd)),c
	movlw	high(050Ah)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(050Ah)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	142
	
l1034:
;lcd_22.c: 142: post_cmd( 0x400, 0x4027 );
	movlw	high(0400h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0400h)
	movwf	((c:?_post_cmd)),c
	movlw	high(04027h)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(04027h)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	143
	
l1036:
;lcd_22.c: 143: post_cmd( 0x401, 0x0000 );
	movlw	high(0401h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0401h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	144
	
l1038:
;lcd_22.c: 144: post_cmd( 0x402, 0x0000 );
	movlw	high(0402h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0402h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	145
	
l1040:
;lcd_22.c: 145: post_cmd( 0x403, 0x013f );
	movlw	high(0403h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0403h)
	movwf	((c:?_post_cmd)),c
	movlw	high(013Fh)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(013Fh)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	146
	
l1042:
;lcd_22.c: 146: post_cmd( 0x404, 0x0000 );
	movlw	high(0404h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0404h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	148
	
l1044:
;lcd_22.c: 148: post_cmd( 0x200, 0x0000 );
	movlw	high(0200h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0200h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	149
	
l1046:
;lcd_22.c: 149: post_cmd( 0x201, 0x0000 );
	movlw	high(0201h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0201h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	151
	
l1048:
;lcd_22.c: 151: post_cmd( 0x100, 0x7120 );
	movlw	high(0100h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0100h)
	movwf	((c:?_post_cmd)),c
	movlw	high(07120h)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(07120h)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	152
	
l1050:
;lcd_22.c: 152: post_cmd( 0x007, 0x0103 );
	movlw	high(07h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(07h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0103h)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0103h)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	153
;lcd_22.c: 153: delay_ms( 10 );
	movlw	high(0Ah)
	movwf	((c:?_delay_ms+1)),c
	movlw	low(0Ah)
	movwf	((c:?_delay_ms)),c
	call	_delay_ms	;wreg free
	line	154
	
l1052:
;lcd_22.c: 154: post_cmd( 0x007, 0x0113 );
	movlw	high(07h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(07h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0113h)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0113h)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	156
	
l1054:
;lcd_22.c: 156: {RA1=1;};
	bsf	c:(31745/8),(31745)&7	;volatile
	line	157
	
l64:
	return
	opt stack 0
GLOBAL	__end_of_init_lcd
	__end_of_init_lcd:
	signat	_init_lcd,88
	global	_lcd_rst

;; *************** function _lcd_rst *****************
;; Defined at:
;;		line 60 in file "E:\Program\PRGPIC\PIC18F4520\lcd22_rili\lcd_22.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFFFFFF/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay_us
;; This function is called by:
;;		_init_lcd
;; This function uses a non-reentrant model
;;
psect	text2,class=CODE,space=0,reloc=2
global __ptext2
__ptext2:
psect	text2
	file	"E:\Program\PRGPIC\PIC18F4520\lcd22_rili\lcd_22.c"
	line	60
	global	__size_of_lcd_rst
	__size_of_lcd_rst	equ	__end_of_lcd_rst-_lcd_rst
	
_lcd_rst:
	opt	stack 28
	line	61
	
l924:
;lcd_22.c: 61: {RD0=0;};
	bcf	c:(31768/8),(31768)&7	;volatile
	line	62
	
l926:
;lcd_22.c: 62: delay_us(3);
	movlw	high(03h)
	movwf	((c:?_delay_us+1)),c
	movlw	low(03h)
	movwf	((c:?_delay_us)),c
	call	_delay_us	;wreg free
	line	63
	
l928:
;lcd_22.c: 63: {RD0=1;};
	bsf	c:(31768/8),(31768)&7	;volatile
	line	64
;lcd_22.c: 64: delay_us(3);
	movlw	high(03h)
	movwf	((c:?_delay_us+1)),c
	movlw	low(03h)
	movwf	((c:?_delay_us)),c
	call	_delay_us	;wreg free
	line	65
	
l58:
	return
	opt stack 0
GLOBAL	__end_of_lcd_rst
	__end_of_lcd_rst:
	signat	_lcd_rst,88
	global	_delay_us

;; *************** function _delay_us *****************
;; Defined at:
;;		line 31 in file "E:\Program\PRGPIC\PIC18F4520\lcd22_rili\system.c"
;; Parameters:    Size  Location     Type
;;  us              2    0[COMRAM] unsigned short 
;; Auto vars:     Size  Location     Type
;;  i               1    2[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFFFFFF/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         2       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_rst
;; This function uses a non-reentrant model
;;
psect	text3,class=CODE,space=0,reloc=2
global __ptext3
__ptext3:
psect	text3
	file	"E:\Program\PRGPIC\PIC18F4520\lcd22_rili\system.c"
	line	31
	global	__size_of_delay_us
	__size_of_delay_us	equ	__end_of_delay_us-_delay_us
	
_delay_us:
	opt	stack 28
	line	33
	
l856:
;system.c: 32: u8 i;
;system.c: 33: while(us!=0)
	goto	l876
	
l217:
	line	35
;system.c: 34: {
;system.c: 35: for(i=0;i<25;i++)
	clrf	((c:delay_us@i)),c
	
l862:
;system.c: 36: {}
	incf	((c:delay_us@i)),c
	
l864:
	movlw	(019h-1)
	cpfsgt	((c:delay_us@i)),c
	goto	u31
	goto	u30
u31:
	goto	l862
u30:
	
l219:
	line	37
;system.c: 37: for(i=0;i<7;i++)
	clrf	((c:delay_us@i)),c
	
l870:
;system.c: 38: {}
	incf	((c:delay_us@i)),c
	
l872:
	movlw	(07h-1)
	cpfsgt	((c:delay_us@i)),c
	goto	u41
	goto	u40
u41:
	goto	l870
u40:
	line	39
	
l874:
;system.c: 39: us--;
	decf	((c:delay_us@us)),c
	btfss	status,0
	decf	((c:delay_us@us+1)),c
	line	33
	
l876:
	movf	((c:delay_us@us+1)),c,w
	iorwf ((c:delay_us@us)),c,w

	btfss	status,2
	goto	u51
	goto	u50
u51:
	goto	l217
u50:
	line	41
	
l223:
	return
	opt stack 0
GLOBAL	__end_of_delay_us
	__end_of_delay_us:
	signat	_delay_us,4216
	global	_LCD_test

;; *************** function _LCD_test *****************
;; Defined at:
;;		line 159 in file "E:\Program\PRGPIC\PIC18F4520\lcd22_rili\lcd_22.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  num             2    8[COMRAM] unsigned short 
;;  temp            2    6[COMRAM] unsigned short 
;;  n               1   10[COMRAM] unsigned char 
;;  i               1    0        unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFFFFFF/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         0       0       0       0       0       0       0
;;      Locals:         5       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0
;;      Totals:         5       0       0       0       0       0       0
;;Total ram usage:        5 bytes
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
psect	text4,class=CODE,space=0,reloc=2
global __ptext4
__ptext4:
psect	text4
	file	"E:\Program\PRGPIC\PIC18F4520\lcd22_rili\lcd_22.c"
	line	159
	global	__size_of_LCD_test
	__size_of_LCD_test	equ	__end_of_LCD_test-_LCD_test
	
_LCD_test:
	opt	stack 28
	line	163
	
l1056:
;lcd_22.c: 160: u16 temp,num;
;lcd_22.c: 161: u8 n,i;
;lcd_22.c: 163: {RA1=0;};
	bcf	c:(31745/8),(31745)&7	;volatile
	line	165
	
l1058:
;lcd_22.c: 165: post_cmd(0x210,0x00);
	movlw	high(0210h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0210h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	166
;lcd_22.c: 166: post_cmd(0x212,0x0000);
	movlw	high(0212h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0212h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	167
;lcd_22.c: 167: post_cmd(0x211,0xEF);
	movlw	high(0211h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0211h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0EFh)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0EFh)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	168
;lcd_22.c: 168: post_cmd(0x213,0x013F);
	movlw	high(0213h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0213h)
	movwf	((c:?_post_cmd)),c
	movlw	high(013Fh)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(013Fh)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	170
;lcd_22.c: 170: post_cmd(0x200,0x0000);
	movlw	high(0200h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0200h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	171
;lcd_22.c: 171: post_cmd(0x201,0x0000);
	movlw	high(0201h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0201h)
	movwf	((c:?_post_cmd)),c
	movlw	high(0)
	movwf	(1+((c:?_post_cmd)+02h)),c
	movlw	low(0)
	movwf	(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	173
	
l1060:
;lcd_22.c: 173: {RA2=0;};
	bcf	c:(31746/8),(31746)&7	;volatile
	line	174
;lcd_22.c: 174: post_data(0x202);
	movlw	high(0202h)
	movwf	((c:?_post_data+1)),c
	movlw	low(0202h)
	movwf	((c:?_post_data)),c
	call	_post_data	;wreg free
	line	175
	
l1062:
;lcd_22.c: 175: {RA2=1;};
	bsf	c:(31746/8),(31746)&7	;volatile
	line	176
	
l1064:
;lcd_22.c: 176: for(n=0;n<8;n++)
	clrf	((c:LCD_test@n)),c
	line	178
	
l1070:
;lcd_22.c: 177: {
;lcd_22.c: 178: temp=colorfol[n];
	movf	((c:LCD_test@n)),c,w
	mullw	02h
	movlw	low((_colorfol))
	addwf	(prodl),c,w
	movwf	tblptrl
	clrf	tblptrh
	movlw	high((_colorfol))
	addwfc	tblptrh
	tblrd*+
	
	movff	tablat,(c:LCD_test@temp)
	tblrd*-
	
	movff	tablat,(c:LCD_test@temp+1)

	line	179
	
l1072:
;lcd_22.c: 179: for(num=40*240;num>0;num--)
	movlw	high(02580h)
	movwf	((c:LCD_test@num+1)),c
	movlw	low(02580h)
	movwf	((c:LCD_test@num)),c
	line	181
	
l1078:
;lcd_22.c: 180: {
;lcd_22.c: 181: post_data(temp);
	movff	(c:LCD_test@temp),(c:?_post_data)
	movff	(c:LCD_test@temp+1),(c:?_post_data+1)
	call	_post_data	;wreg free
	line	179
	
l1080:
	decf	((c:LCD_test@num)),c
	btfss	status,0
	decf	((c:LCD_test@num+1)),c
	
l1082:
	movf	((c:LCD_test@num+1)),c,w
	iorwf ((c:LCD_test@num)),c,w

	btfss	status,2
	goto	u161
	goto	u160
u161:
	goto	l1078
u160:
	line	176
	
l1084:
	incf	((c:LCD_test@n)),c
	
l1086:
	movlw	(08h-1)
	cpfsgt	((c:LCD_test@n)),c
	goto	u171
	goto	u170
u171:
	goto	l1070
u170:
	line	184
	
l1088:
;lcd_22.c: 182: }
;lcd_22.c: 183: }
;lcd_22.c: 184: delay_ms(500);
	movlw	high(01F4h)
	movwf	((c:?_delay_ms+1)),c
	movlw	low(01F4h)
	movwf	((c:?_delay_ms)),c
	call	_delay_ms	;wreg free
	line	208
	
l1090:
;lcd_22.c: 208: {RA1=1;};
	bsf	c:(31745/8),(31745)&7	;volatile
	line	209
	
l71:
	return
	opt stack 0
GLOBAL	__end_of_LCD_test
	__end_of_LCD_test:
	signat	_LCD_test,88
	global	_delay_ms

;; *************** function _delay_ms *****************
;; Defined at:
;;		line 18 in file "E:\Program\PRGPIC\PIC18F4520\lcd22_rili\system.c"
;; Parameters:    Size  Location     Type
;;  ms              2    0[COMRAM] unsigned short 
;; Auto vars:     Size  Location     Type
;;  i               1    2[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFFFFFF/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         2       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_init_lcd
;;		_LCD_test
;;		_main
;; This function uses a non-reentrant model
;;
psect	text5,class=CODE,space=0,reloc=2
global __ptext5
__ptext5:
psect	text5
	file	"E:\Program\PRGPIC\PIC18F4520\lcd22_rili\system.c"
	line	18
	global	__size_of_delay_ms
	__size_of_delay_ms	equ	__end_of_delay_ms-_delay_ms
	
_delay_ms:
	opt	stack 30
	line	20
	
l878:
;system.c: 19: u8 i;
;system.c: 20: while(ms!=0)
	goto	l898
	
l207:
	line	22
;system.c: 21: {
;system.c: 22: for(i=0;i<250;i++)
	clrf	((c:delay_ms@i)),c
	
l884:
;system.c: 23: {}
	incf	((c:delay_ms@i)),c
	
l886:
	movlw	(0FAh-1)
	cpfsgt	((c:delay_ms@i)),c
	goto	u61
	goto	u60
u61:
	goto	l884
u60:
	
l209:
	line	24
;system.c: 24: for(i=0;i<75;i++)
	clrf	((c:delay_ms@i)),c
	
l892:
;system.c: 25: {}
	incf	((c:delay_ms@i)),c
	
l894:
	movlw	(04Bh-1)
	cpfsgt	((c:delay_ms@i)),c
	goto	u71
	goto	u70
u71:
	goto	l892
u70:
	line	26
	
l896:
;system.c: 26: ms--;
	decf	((c:delay_ms@ms)),c
	btfss	status,0
	decf	((c:delay_ms@ms+1)),c
	line	20
	
l898:
	movf	((c:delay_ms@ms+1)),c,w
	iorwf ((c:delay_ms@ms)),c,w

	btfss	status,2
	goto	u81
	goto	u80
u81:
	goto	l207
u80:
	line	28
	
l213:
	return
	opt stack 0
GLOBAL	__end_of_delay_ms
	__end_of_delay_ms:
	signat	_delay_ms,4216
	global	_get_point_xy

;; *************** function _get_point_xy *****************
;; Defined at:
;;		line 369 in file "E:\Program\PRGPIC\PIC18F4520\lcd22_rili\lcd_22.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  tmp_xy_buf     20   39[COMRAM] struct xy[5]
;;  tmp_y           4   35[COMRAM] unsigned long 
;;  tmp_x           4   31[COMRAM] unsigned long 
;;  tmp_xy          4   27[COMRAM] struct xy
;;  n               1   61[COMRAM] unsigned char 
;;  m               1   60[COMRAM] unsigned char 
;;  tmp             1   59[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFFFFFF/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         0       0       0       0       0       0       0
;;      Locals:        35       0       0       0       0       0       0
;;      Temps:         14       0       0       0       0       0       0
;;      Totals:        49       0       0       0       0       0       0
;;Total ram usage:       49 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_init_touch_spi
;;		_get_touch_xy
;;		___lmul
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text6,class=CODE,space=0,reloc=2
global __ptext6
__ptext6:
psect	text6
	file	"E:\Program\PRGPIC\PIC18F4520\lcd22_rili\lcd_22.c"
	line	369
	global	__size_of_get_point_xy
	__size_of_get_point_xy	equ	__end_of_get_point_xy-_get_point_xy
	
_get_point_xy:
	opt	stack 28
	line	372
	
l1092:
;lcd_22.c: 370: u8 n,m,tmp;
;lcd_22.c: 371: xy_t tmp_xy_buf[5], tmp_xy;
;lcd_22.c: 372: u32 tmp_x = ((u32)tmp_xy_buf[5/2].x + (u32)tmp_xy_buf[5/2-1].x)/2;
	movf	(0+((c:get_point_xy@tmp_xy_buf)+08h)),c,w
	addwf	(0+((c:get_point_xy@tmp_xy_buf)+04h)),c,w
	movwf	(??_get_point_xy+0+0)&0ffh,c
	movf	(1+((c:get_point_xy@tmp_xy_buf)+08h)),c,w
	addwfc	(1+((c:get_point_xy@tmp_xy_buf)+04h)),c,w
	movwf	1+(??_get_point_xy+0+0)&0ffh,c
	
	clrf	2+(??_get_point_xy+0+0)&0ffh,c
	btfsc	status,0
	incf	2+(??_get_point_xy+0+0)&0ffh,c
	
	clrf	3+(??_get_point_xy+0+0)&0ffh,c
	bcf	status,0
	rrcf	(??_get_point_xy+0+3),c
	rrcf	(??_get_point_xy+0+2),c
	rrcf	(??_get_point_xy+0+1),c
	rrcf	(??_get_point_xy+0+0),c
	movff	??_get_point_xy+0+0,(c:get_point_xy@tmp_x)
	movff	??_get_point_xy+0+1,(c:get_point_xy@tmp_x+1)
	movff	??_get_point_xy+0+2,(c:get_point_xy@tmp_x+2)
	movff	??_get_point_xy+0+3,(c:get_point_xy@tmp_x+3)
	line	373
;lcd_22.c: 373: u32 tmp_y = ((u32)tmp_xy_buf[5/2].y + (u32)tmp_xy_buf[5/2-1].y)/2;
	movf	(0+((c:get_point_xy@tmp_xy_buf)+0Ah)),c,w
	addwf	(0+((c:get_point_xy@tmp_xy_buf)+06h)),c,w
	movwf	(??_get_point_xy+0+0)&0ffh,c
	movf	(1+((c:get_point_xy@tmp_xy_buf)+0Ah)),c,w
	addwfc	(1+((c:get_point_xy@tmp_xy_buf)+06h)),c,w
	movwf	1+(??_get_point_xy+0+0)&0ffh,c
	
	clrf	2+(??_get_point_xy+0+0)&0ffh,c
	btfsc	status,0
	incf	2+(??_get_point_xy+0+0)&0ffh,c
	
	clrf	3+(??_get_point_xy+0+0)&0ffh,c
	bcf	status,0
	rrcf	(??_get_point_xy+0+3),c
	rrcf	(??_get_point_xy+0+2),c
	rrcf	(??_get_point_xy+0+1),c
	rrcf	(??_get_point_xy+0+0),c
	movff	??_get_point_xy+0+0,(c:get_point_xy@tmp_y)
	movff	??_get_point_xy+0+1,(c:get_point_xy@tmp_y+1)
	movff	??_get_point_xy+0+2,(c:get_point_xy@tmp_y+2)
	movff	??_get_point_xy+0+3,(c:get_point_xy@tmp_y+3)
	line	375
	
l1094:
;lcd_22.c: 375: if(touch_counter>=(8-1)){
	movlw	(07h-1)
	cpfsgt	((c:_touch_counter)),c	;volatile
	goto	u181
	goto	u180
u181:
	goto	l1100
u180:
	line	376
	
l1096:
;lcd_22.c: 376: return 0;
	movlw	(0)&0ffh
	goto	l132
	line	378
	
l1100:
;lcd_22.c: 377: }
;lcd_22.c: 378: init_touch_spi();
	call	_init_touch_spi	;wreg free
	line	379
	
l1102:
;lcd_22.c: 379: {RA4=0;};
	bcf	c:(31748/8),(31748)&7	;volatile
	line	381
	
l1104:
;lcd_22.c: 380: xy_t tmp_xy_buf[5], tmp_xy;
;lcd_22.c: 381: for(n=0; n<5; n++){
	clrf	((c:get_point_xy@n)),c
	line	382
	
l1110:
;lcd_22.c: 382: tmp_xy_buf[n] = get_touch_xy();
	call	_get_touch_xy	;wreg free
	movf	((c:get_point_xy@n)),c,w
	mullw	04h
	movf	(prodl),c,w
	addlw	low((c:get_point_xy@tmp_xy_buf))
	movwf	fsr2l
	clrf	fsr2h
	movff	0+?_get_touch_xy,postinc2
	movff	1+?_get_touch_xy,postinc2
	movff	2+?_get_touch_xy,postinc2
	movff	3+?_get_touch_xy,postdec2
	decf	fsr2
	decf	fsr2
	line	381
	
l1112:
	incf	((c:get_point_xy@n)),c
	
l1114:
	movlw	(05h-1)
	cpfsgt	((c:get_point_xy@n)),c
	goto	u191
	goto	u190
u191:
	goto	l1110
u190:
	
l134:
	line	384
;lcd_22.c: 383: }
;lcd_22.c: 384: {RA4=1;};
	bsf	c:(31748/8),(31748)&7	;volatile
	line	385
;lcd_22.c: 385: for(n=0; n<(5-1); n++){
	clrf	((c:get_point_xy@n)),c
	
l135:
	line	386
;lcd_22.c: 386: for(m=0; m<(5-n-1); m++){
	clrf	((c:get_point_xy@m)),c
	goto	l1132
	line	387
	
l1120:
;lcd_22.c: 387: tmp = m+1;
	incf	((c:get_point_xy@m)),c,w
	movwf	((c:get_point_xy@tmp)),c
	line	388
	
l1122:
;lcd_22.c: 388: if((tmp_xy_buf[m].x + tmp_xy_buf[m].y) > (tmp_xy_buf[tmp].x + tmp_xy_buf[tmp].y)){
	movf	((c:get_point_xy@m)),c,w
	mullw	04h
	movff	prodl,??_get_point_xy+0+0
	movlw	02h
	addwf	(??_get_point_xy+0+0),c
	movf	(??_get_point_xy+0+0),c,w
	addlw	low((c:get_point_xy@tmp_xy_buf))
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,??_get_point_xy+1+0
	movff	postdec2,??_get_point_xy+1+0+1
	movf	((c:get_point_xy@m)),c,w
	mullw	04h
	movf	(prodl),c,w
	addlw	low((c:get_point_xy@tmp_xy_buf))
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,??_get_point_xy+3+0
	movff	postdec2,??_get_point_xy+3+0+1
	movf	(??_get_point_xy+1+0),c,w
	addwf	(??_get_point_xy+3+0),c,w
	movwf	(??_get_point_xy+5+0)&0ffh,c
	movf	(??_get_point_xy+1+1),c,w
	addwfc	(??_get_point_xy+3+1),c,w
	movwf	1+(??_get_point_xy+5+0)&0ffh,c
	movf	((c:get_point_xy@tmp)),c,w
	mullw	04h
	movff	prodl,??_get_point_xy+7+0
	movlw	02h
	addwf	(??_get_point_xy+7+0),c
	movf	(??_get_point_xy+7+0),c,w
	addlw	low((c:get_point_xy@tmp_xy_buf))
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,??_get_point_xy+8+0
	movff	postdec2,??_get_point_xy+8+0+1
	movf	((c:get_point_xy@tmp)),c,w
	mullw	04h
	movf	(prodl),c,w
	addlw	low((c:get_point_xy@tmp_xy_buf))
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,??_get_point_xy+10+0
	movff	postdec2,??_get_point_xy+10+0+1
	movf	(??_get_point_xy+8+0),c,w
	addwf	(??_get_point_xy+10+0),c,w
	movwf	(??_get_point_xy+12+0)&0ffh,c
	movf	(??_get_point_xy+8+1),c,w
	addwfc	(??_get_point_xy+10+1),c,w
	movwf	1+(??_get_point_xy+12+0)&0ffh,c
	movf	(??_get_point_xy+5+0),c,w
	subwf	(??_get_point_xy+12+0),c,w
	movf	(??_get_point_xy+5+1),c,w
	subwfb	(??_get_point_xy+12+1),c,w
	btfsc	status,0
	goto	u201
	goto	u200
u201:
	goto	l1130
u200:
	line	389
	
l1124:
;lcd_22.c: 389: tmp_xy = tmp_xy_buf[tmp];
	movf	((c:get_point_xy@tmp)),c,w
	mullw	04h
	movf	(prodl),c,w
	addlw	low((c:get_point_xy@tmp_xy_buf))
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,(c:get_point_xy@tmp_xy)
	movff	postinc2,(c:get_point_xy@tmp_xy+1)
	movff	postinc2,(c:get_point_xy@tmp_xy+2)
	movff	postinc2,(c:get_point_xy@tmp_xy+3)
	line	390
	
l1126:
;lcd_22.c: 390: tmp_xy_buf[tmp] = tmp_xy_buf[m];
	movf	((c:get_point_xy@m)),c,w
	mullw	04h
	movf	(prodl),c,w
	addlw	low((c:get_point_xy@tmp_xy_buf))
	movwf	fsr2l
	clrf	fsr2h
	movf	((c:get_point_xy@tmp)),c,w
	mullw	04h
	movf	(prodl),c,w
	addlw	low((c:get_point_xy@tmp_xy_buf))
	movwf	fsr1l
	clrf	fsr1h
	movff	postinc2,postinc1
	movff	postinc2,postinc1
	movff	postinc2,postinc1
	movff	postdec2,postdec1
	movf	postdec1
	movf	postdec1
	line	391
	
l1128:
;lcd_22.c: 391: tmp_xy_buf[m] = tmp_xy;
	movf	((c:get_point_xy@m)),c,w
	mullw	04h
	movf	(prodl),c,w
	addlw	low((c:get_point_xy@tmp_xy_buf))
	movwf	fsr2l
	clrf	fsr2h
	movff	(c:get_point_xy@tmp_xy),postinc2
	movff	(c:get_point_xy@tmp_xy+1),postinc2
	movff	(c:get_point_xy@tmp_xy+2),postinc2
	movff	(c:get_point_xy@tmp_xy+3),postinc2
	line	386
	
l1130:
	incf	((c:get_point_xy@m)),c
	
l1132:
	movlw	04h
	movwf	(??_get_point_xy+0+0)&0ffh,c
	clrf	(??_get_point_xy+0+0+1)&0ffh,c
	movf	((c:get_point_xy@n)),c,w
	subwf	(??_get_point_xy+0+0),c
	movlw	0
	subwfb	(??_get_point_xy+0+1),c
	movff	(c:get_point_xy@m),??_get_point_xy+2+0
	clrf	(??_get_point_xy+2+0+1)&0ffh,c
	movf	(??_get_point_xy+2+1),c,w
	xorlw	80h
	movwf	(??_get_point_xy+4+0)&0ffh,c
	movf	(??_get_point_xy+0+0),c,w
	subwf	(??_get_point_xy+2+0),c,w
	movf	(??_get_point_xy+0+1),c,w
	xorlw	80h
	subwfb	(??_get_point_xy+4+0)&0ffh,c,w
	btfss	status,0
	goto	u211
	goto	u210
u211:
	goto	l1120
u210:
	line	385
	
l1134:
	incf	((c:get_point_xy@n)),c
	
l1136:
	movlw	(04h-1)
	cpfsgt	((c:get_point_xy@n)),c
	goto	u221
	goto	u220
u221:
	goto	l135
u220:
	line	396
	
l1138:
;lcd_22.c: 392: }
;lcd_22.c: 393: }
;lcd_22.c: 394: }
;lcd_22.c: 395: if((tmp_xy_buf[5/2].x - tmp_xy_buf[5/2-1].x > 5)
;lcd_22.c: 396: || (tmp_xy_buf[5/2].y - tmp_xy_buf[5/2-1].y > 5)){
	lfsr	2,(c:get_point_xy@tmp_xy_buf)+08h
	movff	postinc2,??_get_point_xy+0+0
	movff	postdec2,??_get_point_xy+0+0+1
	movf	(0+((c:get_point_xy@tmp_xy_buf)+04h)),c,w
	subwf	(??_get_point_xy+0+0),c
	movf	(1+((c:get_point_xy@tmp_xy_buf)+04h)),c,w
	subwfb	(??_get_point_xy+0+1),c
	movlw	06h
	subwf	(??_get_point_xy+0+0),c,w
	movlw	0
	subwfb	(??_get_point_xy+0+1),c,w
	btfsc	status,0
	goto	u231
	goto	u230
u231:
	goto	l1096
u230:
	
l1140:
	lfsr	2,(c:get_point_xy@tmp_xy_buf)+0Ah
	movff	postinc2,??_get_point_xy+0+0
	movff	postdec2,??_get_point_xy+0+0+1
	movf	(0+((c:get_point_xy@tmp_xy_buf)+06h)),c,w
	subwf	(??_get_point_xy+0+0),c
	movf	(1+((c:get_point_xy@tmp_xy_buf)+06h)),c,w
	subwfb	(??_get_point_xy+0+1),c
	movlw	06h
	subwf	(??_get_point_xy+0+0),c,w
	movlw	0
	subwfb	(??_get_point_xy+0+1),c,w
	btfss	status,0
	goto	u241
	goto	u240
u241:
	goto	l1146
u240:
	goto	l1096
	line	400
	
l1146:
;lcd_22.c: 398: }
;lcd_22.c: 400: if(tmp_x >= 0xFFF || tmp_y >= 0xFFF){
	movlw	low(0FFFh)
	subwf	((c:get_point_xy@tmp_x)),c,w
	movlw	high(0FFFh)
	subwfb	((c:get_point_xy@tmp_x+1)),c,w
	movlw	low highword(0FFFh)
	subwfb	((c:get_point_xy@tmp_x+2)),c,w
	movlw	high highword(0FFFh)
	subwfb	((c:get_point_xy@tmp_x+3)),c,w
	btfsc	status,0
	goto	u251
	goto	u250
u251:
	goto	l1096
u250:
	
l1148:
	movlw	low(0FFFh)
	subwf	((c:get_point_xy@tmp_y)),c,w
	movlw	high(0FFFh)
	subwfb	((c:get_point_xy@tmp_y+1)),c,w
	movlw	low highword(0FFFh)
	subwfb	((c:get_point_xy@tmp_y+2)),c,w
	movlw	high highword(0FFFh)
	subwfb	((c:get_point_xy@tmp_y+3)),c,w
	btfss	status,0
	goto	u261
	goto	u260
u261:
	goto	l1154
u260:
	goto	l1096
	line	403
	
l1154:
;lcd_22.c: 402: }
;lcd_22.c: 403: touch_xy_buffer[touch_wr_index].x = ((tmp_x * 240)>>12);
	movff	(c:get_point_xy@tmp_x),(c:?___lmul)
	movff	(c:get_point_xy@tmp_x+1),(c:?___lmul+1)
	movff	(c:get_point_xy@tmp_x+2),(c:?___lmul+2)
	movff	(c:get_point_xy@tmp_x+3),(c:?___lmul+3)
	movlw	low(0F0h)
	movwf	(0+((c:?___lmul)+04h)),c
	movlw	high(0F0h)
	movwf	(1+((c:?___lmul)+04h)),c
	movlw	low highword(0F0h)
	movwf	(2+((c:?___lmul)+04h)),c
	movlw	high highword(0F0h)
	movwf	(3+((c:?___lmul)+04h)),c
	call	___lmul	;wreg free
	movlw	0Ch+1
	goto	u270
u275:
	bcf	status,0
	rrcf	(3+?___lmul),c
	rrcf	(2+?___lmul),c
	rrcf	(1+?___lmul),c
	rrcf	(0+?___lmul),c
u270:
	decfsz	wreg
	goto	u275
	movf	((c:_touch_wr_index)),c,w
	mullw	04h
	movf	(prodl),c,w
	addlw	low((c:_touch_xy_buffer))	;volatile
	movwf	fsr2l
	clrf	fsr2h
	movff	0+?___lmul,postinc2
	movff	1+?___lmul,postdec2

	line	404
;lcd_22.c: 404: touch_xy_buffer[touch_wr_index].y = ((tmp_y * 320)>>12);
	movff	(c:get_point_xy@tmp_y),(c:?___lmul)
	movff	(c:get_point_xy@tmp_y+1),(c:?___lmul+1)
	movff	(c:get_point_xy@tmp_y+2),(c:?___lmul+2)
	movff	(c:get_point_xy@tmp_y+3),(c:?___lmul+3)
	movlw	low(0140h)
	movwf	(0+((c:?___lmul)+04h)),c
	movlw	high(0140h)
	movwf	(1+((c:?___lmul)+04h)),c
	movlw	low highword(0140h)
	movwf	(2+((c:?___lmul)+04h)),c
	movlw	high highword(0140h)
	movwf	(3+((c:?___lmul)+04h)),c
	call	___lmul	;wreg free
	movlw	0Ch+1
	goto	u280
u285:
	bcf	status,0
	rrcf	(3+?___lmul),c
	rrcf	(2+?___lmul),c
	rrcf	(1+?___lmul),c
	rrcf	(0+?___lmul),c
u280:
	decfsz	wreg
	goto	u285
	movf	((c:_touch_wr_index)),c,w
	mullw	04h
	movf	(prodl),c,w
	addlw	low((c:_touch_xy_buffer)+02h)	;volatile
	movwf	fsr2l
	clrf	fsr2h
	movff	0+?___lmul,postinc2
	movff	1+?___lmul,postdec2

	line	405
	
l1156:
;lcd_22.c: 405: if(touch_wr_index < (8-1)){
	movlw	(07h)&0ffh
	cpfslt	((c:_touch_wr_index)),c	;volatile
	goto	u291
	goto	u290
u291:
	goto	l147
u290:
	line	406
	
l1158:
;lcd_22.c: 406: touch_wr_index++;
	incf	((c:_touch_wr_index)),c	;volatile
	line	407
;lcd_22.c: 407: }else{
	goto	l1160
	
l147:
	line	408
;lcd_22.c: 408: touch_wr_index = 0;
	clrf	((c:_touch_wr_index)),c	;volatile
	line	410
	
l1160:
;lcd_22.c: 409: }
;lcd_22.c: 410: touch_counter++;
	incf	((c:_touch_counter)),c	;volatile
	line	411
	
l1162:
;lcd_22.c: 411: return 1;
	movlw	(01h)&0ffh
	line	412
	
l132:
	return
	opt stack 0
GLOBAL	__end_of_get_point_xy
	__end_of_get_point_xy:
	signat	_get_point_xy,89
	global	_init_touch_spi

;; *************** function _init_touch_spi *****************
;; Defined at:
;;		line 31 in file "E:\Program\PRGPIC\PIC18F4520\lcd22_rili\lcd_22.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFFFFFF/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_get_point_xy
;; This function uses a non-reentrant model
;;
psect	text7,class=CODE,space=0,reloc=2
global __ptext7
__ptext7:
psect	text7
	file	"E:\Program\PRGPIC\PIC18F4520\lcd22_rili\lcd_22.c"
	line	31
	global	__size_of_init_touch_spi
	__size_of_init_touch_spi	equ	__end_of_init_touch_spi-_init_touch_spi
	
_init_touch_spi:
	opt	stack 29
	line	32
	
l848:
;lcd_22.c: 32: TRISC=0X10;
	movlw	low(010h)
	movwf	((c:3988)),c	;volatile
	line	33
;lcd_22.c: 33: SSPSTAT=0X80;
	movlw	low(080h)
	movwf	((c:4039)),c	;volatile
	line	34
;lcd_22.c: 34: SSPCON1=0X30;
	movlw	low(030h)
	movwf	((c:4038)),c	;volatile
	line	35
	
l850:
;lcd_22.c: 35: INTCON=0X00;
	clrf	((c:4082)),c	;volatile
	line	36
	
l852:
;lcd_22.c: 36: PIR1=0X00;
	clrf	((c:3998)),c	;volatile
	line	37
	
l46:
	return
	opt stack 0
GLOBAL	__end_of_init_touch_spi
	__end_of_init_touch_spi:
	signat	_init_touch_spi,88
	global	_get_touch_xy

;; *************** function _get_touch_xy *****************
;; Defined at:
;;		line 356 in file "E:\Program\PRGPIC\PIC18F4520\lcd22_rili\lcd_22.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  tmp_xy          4    9[COMRAM] struct xy
;; Return value:  Size  Location     Type
;;                  4    5[COMRAM] struct xy
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFFFFFF/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         4       0       0       0       0       0       0
;;      Locals:         4       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0
;;      Totals:         8       0       0       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_get_touch_data
;; This function is called by:
;;		_get_point_xy
;; This function uses a non-reentrant model
;;
psect	text8,class=CODE,space=0,reloc=2
global __ptext8
__ptext8:
psect	text8
	file	"E:\Program\PRGPIC\PIC18F4520\lcd22_rili\lcd_22.c"
	line	356
	global	__size_of_get_touch_xy
	__size_of_get_touch_xy	equ	__end_of_get_touch_xy-_get_touch_xy
	
_get_touch_xy:
	opt	stack 28
	line	358
	
l936:
;lcd_22.c: 357: xy_t tmp_xy;
;lcd_22.c: 358: if(!RA0){
	btfsc	c:(31744/8),(31744)&7	;volatile
	goto	u151
	goto	u150
u151:
	goto	l126
u150:
	line	359
	
l938:
;lcd_22.c: 359: tmp_xy.x = get_touch_data(0xD0);
	movlw	high(0D0h)
	movwf	((c:?_get_touch_data+1)),c
	movlw	low(0D0h)
	movwf	((c:?_get_touch_data)),c
	call	_get_touch_data	;wreg free
	movff	0+?_get_touch_data,(c:get_touch_xy@tmp_xy)
	movff	1+?_get_touch_data,(c:get_touch_xy@tmp_xy+1)
	line	360
;lcd_22.c: 360: tmp_xy.y = get_touch_data(0x90);
	movlw	high(090h)
	movwf	((c:?_get_touch_data+1)),c
	movlw	low(090h)
	movwf	((c:?_get_touch_data)),c
	call	_get_touch_data	;wreg free
	movff	0+?_get_touch_data,0+((c:get_touch_xy@tmp_xy)+02h)
	movff	1+?_get_touch_data,1+((c:get_touch_xy@tmp_xy)+02h)
	line	361
;lcd_22.c: 361: } else{
	goto	l127
	
l126:
	line	362
;lcd_22.c: 362: tmp_xy.x = 0xFFFF;
	setf	((c:get_touch_xy@tmp_xy)),c
	setf	((c:get_touch_xy@tmp_xy+1)),c
	line	363
;lcd_22.c: 363: tmp_xy.y = 0xFFFF;
	setf	(0+((c:get_touch_xy@tmp_xy)+02h)),c
	setf	(1+((c:get_touch_xy@tmp_xy)+02h)),c
	line	364
	
l127:
	line	365
;lcd_22.c: 364: }
;lcd_22.c: 365: return tmp_xy;
	movff	(c:get_touch_xy@tmp_xy),(c:?_get_touch_xy)
	movff	(c:get_touch_xy@tmp_xy+1),(c:?_get_touch_xy+1)
	movff	(c:get_touch_xy@tmp_xy+2),(c:?_get_touch_xy+2)
	movff	(c:get_touch_xy@tmp_xy+3),(c:?_get_touch_xy+3)
	line	366
	
l128:
	return
	opt stack 0
GLOBAL	__end_of_get_touch_xy
	__end_of_get_touch_xy:
	signat	_get_touch_xy,92
	global	_get_touch_data

;; *************** function _get_touch_data *****************
;; Defined at:
;;		line 336 in file "E:\Program\PRGPIC\PIC18F4520\lcd22_rili\lcd_22.c"
;; Parameters:    Size  Location     Type
;;  cmd             2    0[COMRAM] unsigned short 
;; Auto vars:     Size  Location     Type
;;  tmp             1    4[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMRAM] unsigned short 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFFFFFF/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         2       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0
;;      Totals:         5       0       0       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_get_touch_xy
;; This function uses a non-reentrant model
;;
psect	text9,class=CODE,space=0,reloc=2
global __ptext9
__ptext9:
psect	text9
	file	"E:\Program\PRGPIC\PIC18F4520\lcd22_rili\lcd_22.c"
	line	336
	global	__size_of_get_touch_data
	__size_of_get_touch_data	equ	__end_of_get_touch_data-_get_touch_data
	
_get_touch_data:
	opt	stack 28
	line	338
	
l900:
;lcd_22.c: 337: u8 tmp;
;lcd_22.c: 338: SSPBUF = cmd;
	movff	(c:get_touch_data@cmd),(c:4041)	;volatile
	line	339
;lcd_22.c: 339: while(!SSPIF);
	
l114:
	btfss	c:(31987/8),(31987)&7	;volatile
	goto	u91
	goto	u90
u91:
	goto	l114
u90:
	
l116:
	line	340
;lcd_22.c: 340: SSPIF=0;
	bcf	c:(31987/8),(31987)&7	;volatile
	line	342
;lcd_22.c: 342: SSPBUF = 0;
	clrf	((c:4041)),c	;volatile
	line	343
;lcd_22.c: 343: while(!SSPIF);
	
l117:
	btfss	c:(31987/8),(31987)&7	;volatile
	goto	u101
	goto	u100
u101:
	goto	l117
u100:
	
l119:
	line	344
;lcd_22.c: 344: SSPIF=0;
	bcf	c:(31987/8),(31987)&7	;volatile
	line	346
;lcd_22.c: 346: tmp =SSPBUF;
	movff	(c:4041),(c:get_touch_data@tmp)	;volatile
	line	348
;lcd_22.c: 348: SSPBUF = 0;
	clrf	((c:4041)),c	;volatile
	line	349
;lcd_22.c: 349: while(!SSPIF);
	
l120:
	btfss	c:(31987/8),(31987)&7	;volatile
	goto	u111
	goto	u110
u111:
	goto	l120
u110:
	
l122:
	line	350
;lcd_22.c: 350: SSPIF=0;
	bcf	c:(31987/8),(31987)&7	;volatile
	line	352
	
l902:
;lcd_22.c: 352: return ( ((u16)tmp)<<5 | ((u16)SSPBUF)>>3);
	movff	(c:get_touch_data@tmp),??_get_touch_data+0+0
	clrf	(??_get_touch_data+0+0+1)&0ffh,c
	movlw	05h
u125:
	bcf	status,0
	rlcf	(??_get_touch_data+0+0),c
	rlcf	(??_get_touch_data+0+1),c
	decfsz	wreg
	goto	u125
	swapf	((c:4041)),c,w	;volatile
	rlncf	wreg
	andlw	(0ffh shr 3) & 0ffh
	iorwf	(??_get_touch_data+0+0),c,w
	
	movwf	((c:?_get_touch_data)),c
	movf	(??_get_touch_data+0+1),c,w
	movwf	1+((c:?_get_touch_data)),c
	line	353
	
l123:
	return
	opt stack 0
GLOBAL	__end_of_get_touch_data
	__end_of_get_touch_data:
	signat	_get_touch_data,4218
	global	_draw_lcd

;; *************** function _draw_lcd *****************
;; Defined at:
;;		line 415 in file "E:\Program\PRGPIC\PIC18F4520\lcd22_rili\lcd_22.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  n               1    8[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFFFFFF/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_init_lcd_spi
;;		_post_cmd
;;		_post_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text10,class=CODE,space=0,reloc=2
global __ptext10
__ptext10:
psect	text10
	file	"E:\Program\PRGPIC\PIC18F4520\lcd22_rili\lcd_22.c"
	line	415
	global	__size_of_draw_lcd
	__size_of_draw_lcd	equ	__end_of_draw_lcd-_draw_lcd
	
_draw_lcd:
	opt	stack 28
	line	417
	
l1166:
;lcd_22.c: 416: u8 n;
;lcd_22.c: 417: init_lcd_spi();
	call	_init_lcd_spi	;wreg free
	line	418
	
l1168:
;lcd_22.c: 418: {RA1=0;};
	bcf	c:(31745/8),(31745)&7	;volatile
	line	419
	
l1170:
;lcd_22.c: 419: if(touch_counter==0){
	tstfsz	((c:_touch_counter)),c	;volatile
	goto	u301
	goto	u300
u301:
	goto	l1174
u300:
	goto	l152
	line	423
	
l1174:
;lcd_22.c: 421: }
;lcd_22.c: 423: touch_counter--;
	decf	((c:_touch_counter)),c	;volatile
	line	425
	
l1176:
;lcd_22.c: 425: post_cmd(0x210,touch_xy_buffer[touch_rd_index].x);
	movlw	high(0210h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0210h)
	movwf	((c:?_post_cmd)),c
	movf	((c:_touch_rd_index)),c,w
	mullw	04h
	movf	(prodl),c,w
	addlw	low((c:_touch_xy_buffer))	;volatile
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,0+((c:?_post_cmd)+02h)
	movff	postdec2,1+((c:?_post_cmd)+02h)
	call	_post_cmd	;wreg free
	line	426
	
l1178:
;lcd_22.c: 426: post_cmd(0x212,touch_xy_buffer[touch_rd_index].y);
	movlw	high(0212h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0212h)
	movwf	((c:?_post_cmd)),c
	movf	((c:_touch_rd_index)),c,w
	mullw	04h
	movf	(prodl),c,w
	addlw	low((c:_touch_xy_buffer)+02h)	;volatile
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,0+((c:?_post_cmd)+02h)
	movff	postdec2,1+((c:?_post_cmd)+02h)
	call	_post_cmd	;wreg free
	line	427
	
l1180:
;lcd_22.c: 427: post_cmd(0x211,touch_xy_buffer[touch_rd_index].x+(4-1));
	movlw	high(0211h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0211h)
	movwf	((c:?_post_cmd)),c
	movf	((c:_touch_rd_index)),c,w
	mullw	04h
	movf	(prodl),c,w
	addlw	low((c:_touch_xy_buffer))	;volatile
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,??_draw_lcd+0+0
	movff	postdec2,??_draw_lcd+0+0+1
	movlw	low(03h)
	addwf	(??_draw_lcd+0+0),c,w
	
	movwf	(0+((c:?_post_cmd)+02h)),c
	movlw	high(03h)
	addwfc	(??_draw_lcd+0+1),c,w
	movwf	1+(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	428
	
l1182:
;lcd_22.c: 428: post_cmd(0x213,touch_xy_buffer[touch_rd_index].y+(4-1));
	movlw	high(0213h)
	movwf	((c:?_post_cmd+1)),c
	movlw	low(0213h)
	movwf	((c:?_post_cmd)),c
	movf	((c:_touch_rd_index)),c,w
	mullw	04h
	movf	(prodl),c,w
	addlw	low((c:_touch_xy_buffer)+02h)	;volatile
	movwf	fsr2l
	clrf	fsr2h
	movff	postinc2,??_draw_lcd+0+0
	movff	postdec2,??_draw_lcd+0+0+1
	movlw	low(03h)
	addwf	(??_draw_lcd+0+0),c,w
	
	movwf	(0+((c:?_post_cmd)+02h)),c
	movlw	high(03h)
	addwfc	(??_draw_lcd+0+1),c,w
	movwf	1+(0+((c:?_post_cmd)+02h)),c
	call	_post_cmd	;wreg free
	line	429
	
l1184:
;lcd_22.c: 429: if(touch_rd_index < (8-1)){
	movlw	(07h)&0ffh
	cpfslt	((c:_touch_rd_index)),c	;volatile
	goto	u311
	goto	u310
u311:
	goto	l153
u310:
	line	430
	
l1186:
;lcd_22.c: 430: touch_rd_index++;
	incf	((c:_touch_rd_index)),c	;volatile
	line	431
;lcd_22.c: 431: }else{
	goto	l154
	
l153:
	line	432
;lcd_22.c: 432: touch_rd_index = 0;
	clrf	((c:_touch_rd_index)),c	;volatile
	line	433
	
l154:
	line	436
;lcd_22.c: 433: }
;lcd_22.c: 436: {RA2=0;};
	bcf	c:(31746/8),(31746)&7	;volatile
	line	437
	
l1188:
;lcd_22.c: 437: post_data(0x202);
	movlw	high(0202h)
	movwf	((c:?_post_data+1)),c
	movlw	low(0202h)
	movwf	((c:?_post_data)),c
	call	_post_data	;wreg free
	line	438
	
l1190:
;lcd_22.c: 438: {RA2=1;};
	bsf	c:(31746/8),(31746)&7	;volatile
	line	439
	
l1192:
;lcd_22.c: 439: for(n=0; n< (4*4); n++)
	clrf	((c:draw_lcd@n)),c
	line	441
	
l1198:
;lcd_22.c: 440: {
;lcd_22.c: 441: post_data(0x0000);
	movlw	high(0)
	movwf	((c:?_post_data+1)),c
	movlw	low(0)
	movwf	((c:?_post_data)),c
	call	_post_data	;wreg free
	line	439
	
l1200:
	incf	((c:draw_lcd@n)),c
	
l1202:
	movlw	(010h-1)
	cpfsgt	((c:draw_lcd@n)),c
	goto	u321
	goto	u320
u321:
	goto	l1198
u320:
	
l156:
	line	443
;lcd_22.c: 442: }
;lcd_22.c: 443: {RA1=1;};
	bsf	c:(31745/8),(31745)&7	;volatile
	line	445
;lcd_22.c: 444: return 1;
;	Return value of _draw_lcd is never used
	
l152:
	return
	opt stack 0
GLOBAL	__end_of_draw_lcd
	__end_of_draw_lcd:
	signat	_draw_lcd,89
	global	_init_lcd_spi

;; *************** function _init_lcd_spi *****************
;; Defined at:
;;		line 20 in file "E:\Program\PRGPIC\PIC18F4520\lcd22_rili\lcd_22.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFFFFFF/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_init_lcd
;;		_draw_lcd
;; This function uses a non-reentrant model
;;
psect	text11,class=CODE,space=0,reloc=2
global __ptext11
__ptext11:
psect	text11
	file	"E:\Program\PRGPIC\PIC18F4520\lcd22_rili\lcd_22.c"
	line	20
	global	__size_of_init_lcd_spi
	__size_of_init_lcd_spi	equ	__end_of_init_lcd_spi-_init_lcd_spi
	
_init_lcd_spi:
	opt	stack 29
	line	21
	
l842:
;lcd_22.c: 21: TRISC=0X10;
	movlw	low(010h)
	movwf	((c:3988)),c	;volatile
	line	23
;lcd_22.c: 23: SSPSTAT=0X80;
	movlw	low(080h)
	movwf	((c:4039)),c	;volatile
	line	24
;lcd_22.c: 24: SSPCON1=0X30;
	movlw	low(030h)
	movwf	((c:4038)),c	;volatile
	line	25
	
l844:
;lcd_22.c: 25: INTCON=0X00;
	clrf	((c:4082)),c	;volatile
	line	26
	
l846:
;lcd_22.c: 26: PIR1=0X00;
	clrf	((c:3998)),c	;volatile
	line	28
	
l43:
	return
	opt stack 0
GLOBAL	__end_of_init_lcd_spi
	__end_of_init_lcd_spi:
	signat	_init_lcd_spi,88
	global	_post_cmd

;; *************** function _post_cmd *****************
;; Defined at:
;;		line 68 in file "E:\Program\PRGPIC\PIC18F4520\lcd22_rili\lcd_22.c"
;; Parameters:    Size  Location     Type
;;  index           2    2[COMRAM] unsigned short 
;;  cmd             2    4[COMRAM] unsigned short 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFFFFFF/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         4       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0
;;      Totals:         4       0       0       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_post_data
;; This function is called by:
;;		_init_lcd
;;		_LCD_test
;;		_draw_lcd
;; This function uses a non-reentrant model
;;
psect	text12,class=CODE,space=0,reloc=2
global __ptext12
__ptext12:
psect	text12
	file	"E:\Program\PRGPIC\PIC18F4520\lcd22_rili\lcd_22.c"
	line	68
	global	__size_of_post_cmd
	__size_of_post_cmd	equ	__end_of_post_cmd-_post_cmd
	
_post_cmd:
	opt	stack 28
	line	69
	
l930:
;lcd_22.c: 69: {RA2=0;};
	bcf	c:(31746/8),(31746)&7	;volatile
	line	70
	
l932:
;lcd_22.c: 70: post_data(index);
	movff	(c:post_cmd@index),(c:?_post_data)
	movff	(c:post_cmd@index+1),(c:?_post_data+1)
	call	_post_data	;wreg free
	line	71
	
l934:
;lcd_22.c: 71: {RA2=1;};
	bsf	c:(31746/8),(31746)&7	;volatile
	line	72
;lcd_22.c: 72: post_data(cmd);
	movff	(c:post_cmd@cmd),(c:?_post_data)
	movff	(c:post_cmd@cmd+1),(c:?_post_data+1)
	call	_post_data	;wreg free
	line	73
	
l61:
	return
	opt stack 0
GLOBAL	__end_of_post_cmd
	__end_of_post_cmd:
	signat	_post_cmd,8312
	global	_post_data

;; *************** function _post_data *****************
;; Defined at:
;;		line 41 in file "E:\Program\PRGPIC\PIC18F4520\lcd22_rili\lcd_22.c"
;; Parameters:    Size  Location     Type
;;  data            2    0[COMRAM] unsigned short 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFFFFFF/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         2       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_post_cmd
;;		_LCD_test
;;		_draw_lcd
;; This function uses a non-reentrant model
;;
psect	text13,class=CODE,space=0,reloc=2
global __ptext13
__ptext13:
psect	text13
	file	"E:\Program\PRGPIC\PIC18F4520\lcd22_rili\lcd_22.c"
	line	41
	global	__size_of_post_data
	__size_of_post_data	equ	__end_of_post_data-_post_data
	
_post_data:
	opt	stack 29
	line	44
	
l854:
;lcd_22.c: 44: SSPBUF=(u8)(data>>8);
	movf	((c:post_data@data+1)),c,w
	movwf	((c:4041)),c	;volatile
	line	45
;lcd_22.c: 45: while(!SSPIF);
	
l49:
	btfss	c:(31987/8),(31987)&7	;volatile
	goto	u11
	goto	u10
u11:
	goto	l49
u10:
	
l51:
	line	46
;lcd_22.c: 46: SSPIF=0;
	bcf	c:(31987/8),(31987)&7	;volatile
	line	50
;lcd_22.c: 50: SSPBUF=(u8)(data);
	movff	(c:post_data@data),(c:4041)	;volatile
	line	51
;lcd_22.c: 51: while(!SSPIF);
	
l52:
	btfss	c:(31987/8),(31987)&7	;volatile
	goto	u21
	goto	u20
u21:
	goto	l52
u20:
	
l54:
	line	52
;lcd_22.c: 52: SSPIF=0;
	bcf	c:(31987/8),(31987)&7	;volatile
	line	54
	
l55:
	return
	opt stack 0
GLOBAL	__end_of_post_data
	__end_of_post_data:
	signat	_post_data,4216
	global	_init_mcu

;; *************** function _init_mcu *****************
;; Defined at:
;;		line 24 in file "E:\Program\PRGPIC\PIC18F4520\lcd22_rili\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFFFFFF/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text14,class=CODE,space=0,reloc=2
global __ptext14
__ptext14:
psect	text14
	file	"E:\Program\PRGPIC\PIC18F4520\lcd22_rili\main.c"
	line	24
	global	__size_of_init_mcu
	__size_of_init_mcu	equ	__end_of_init_mcu-_init_mcu
	
_init_mcu:
	opt	stack 30
	
l906:
	movlw	low(07h)
	movwf	((c:4033)),c	;volatile
	line	25
;main.c: 25: TRISA=0x01;
	movlw	low(01h)
	movwf	((c:3986)),c	;volatile
	line	26
	
l908:
;main.c: 26: TRISD=0x0;
	clrf	((c:3989)),c	;volatile
	line	27
	
l910:
;main.c: 27: TRISC0=0;
	bcf	c:(31904/8),(31904)&7	;volatile
	line	28
	
l912:
;main.c: 28: TRISC1=0;
	bcf	c:(31905/8),(31905)&7	;volatile
	line	29
	
l914:
;main.c: 29: TRISC2=0;
	bcf	c:(31906/8),(31906)&7	;volatile
	line	30
	
l195:
	return
	opt stack 0
GLOBAL	__end_of_init_mcu
	__end_of_init_mcu:
	signat	_init_mcu,88
	global	___lmul

;; *************** function ___lmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files\HI-TECH Software\PICC-18\9.80\sources\lmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      4    0[COMRAM] unsigned long 
;;  multiplicand    4    4[COMRAM] unsigned long 
;; Auto vars:     Size  Location     Type
;;  product         4    8[COMRAM] unsigned long 
;; Return value:  Size  Location     Type
;;                  4    0[COMRAM] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFFFFFF/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         8       0       0       0       0       0       0
;;      Locals:         4       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0
;;      Totals:        12       0       0       0       0       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_get_point_xy
;; This function uses a non-reentrant model
;;
psect	text15,class=CODE,space=0,reloc=2
global __ptext15
__ptext15:
psect	text15
	file	"C:\Program Files\HI-TECH Software\PICC-18\9.80\sources\lmul.c"
	line	3
	global	__size_of___lmul
	__size_of___lmul	equ	__end_of___lmul-___lmul
	
___lmul:
	opt	stack 29
	line	4
	
l916:
	clrf	((c:___lmul@product)),c
	clrf	((c:___lmul@product+1)),c
	clrf	((c:___lmul@product+2)),c
	clrf	((c:___lmul@product+3)),c

	line	6
	
l648:
	line	7
	
	btfss	((c:___lmul@multiplier)),c,(0)&7
	goto	u131
	goto	u130
u131:
	goto	l920
u130:
	line	8
	
l918:
	movf	((c:___lmul@multiplicand)),c,w
	addwf	((c:___lmul@product)),c
	movf	((c:___lmul@multiplicand+1)),c,w
	addwfc	((c:___lmul@product+1)),c
	movf	((c:___lmul@multiplicand+2)),c,w
	addwfc	((c:___lmul@product+2)),c
	movf	((c:___lmul@multiplicand+3)),c,w
	addwfc	((c:___lmul@product+3)),c
	line	9
	
l920:
	bcf	status,0
	rlcf	((c:___lmul@multiplicand)),c
	rlcf	((c:___lmul@multiplicand+1)),c
	rlcf	((c:___lmul@multiplicand+2)),c
	rlcf	((c:___lmul@multiplicand+3)),c
	line	10
	
l922:
	bcf	status,0
	rrcf	((c:___lmul@multiplier+3)),c
	rrcf	((c:___lmul@multiplier+2)),c
	rrcf	((c:___lmul@multiplier+1)),c
	rrcf	((c:___lmul@multiplier)),c
	line	11
	movf	((c:___lmul@multiplier+3)),c,w
	iorwf ((c:___lmul@multiplier)),c,w
	iorwf ((c:___lmul@multiplier+1)),c,w
	iorwf ((c:___lmul@multiplier+2)),c,w

	btfss	status,2
	goto	u141
	goto	u140
u141:
	goto	l648
u140:
	
l650:
	line	12
	movff	(c:___lmul@product),(c:?___lmul)
	movff	(c:___lmul@product+1),(c:?___lmul+1)
	movff	(c:___lmul@product+2),(c:?___lmul+2)
	movff	(c:___lmul@product+3),(c:?___lmul+3)
	line	13
	
l651:
	return
	opt stack 0
GLOBAL	__end_of___lmul
	__end_of___lmul:
	signat	___lmul,8316
psect	mediumconst
	db 0	; dummy byte at the end
	global	__mediumconst
	GLOBAL	__activetblptr
__activetblptr	EQU	2
	psect	intsave_regs,class=BIGRAM,space=1
	PSECT	rparam,class=COMRAM,space=1
	GLOBAL	__Lrparam
	FNCONF	rparam,??,?
GLOBAL	__Lparam, __Hparam
GLOBAL	__Lrparam, __Hrparam
__Lparam	EQU	__Lrparam
__Hparam	EQU	__Hrparam
	end
