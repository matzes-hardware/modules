/******************************************************************************
* File Name          : LTM022A69B.h
* Author             : WaveShare.
* Last Modified      : 12:19 2011-11-13
* Description        : This file provides the 
					   LTM022A69B LCD related functions' declaration.
******************************************************************************/

/* Define to prevent recursive inclusion ------------------------------------*/
#ifndef __LTM022A69B_H__
#define __LTM022A69B_H__


/* Includes -----------------------------------------------------------------*/


/* Exported types -----------------------------------------------------------*/

/* Exported variables -------------------------------------------------------*/

/* Exported constants -------------------------------------------------------*/
extern const u8 ascii[];
extern const u8 GB2312[][32];
 //extern const u16 color[];
/* Exported macro -----------------------------------------------------------*/
																		 
/*
    color define.
    we defined 20 colors.
*/
#define     CYAN        0x07FF    //青色
#define     RED         0XF800	  //红色
#define     GREEN       0X07E0	  //绿色
#define     BLUE        0X001F	  //蓝色
#define     LIGHT_BLUE  0x07ff    //浅蓝色
#define     WHITE       0XFFFF	  //白色
#define     BLACK       0X0000	  //黑色
#define     YELLOW      0XFFE0	  //黄色
#define     ORANGE      0XFC08	  //橙色
#define     GRAY        0X8430   //灰色
#define     LGRAY       0XC618	  //浅灰色
#define     DARKGRAY    0X8410	  //深灰色
#define     PORPO       0X801F	  //紫色
#define     PURPLE      0XF81F	  //粉红色
#define     GRAYBLUE    0X5458   //灰蓝色
#define     LGRAYBLUE   0XA651   //浅灰蓝色
#define     DARKBLUE    0X01CF	  //深灰蓝色
#define 	LIGHTBLUE   0X7D7C	  //浅蓝色 
#define     DEFAULTF    BLACK     //默认前景色
#define     DEFAULTB    WHITE     //默认背景色

/* Port configuration for LPC1114
16-bit serial interface (No reading in serial interface mode)
    CPU:STM8S280        LCD module
    (SPI   ====>   LCD's data SPI interface)
    PC5(SCK0)    ---->   LCD_SCL PIN
    PC6(MOSI0)   ---->   LCD_SCI PIN
    PH2(SSEL0)   ---->   LCD_nCS PIN
    (other 5 pins)
    PE3 ---->   LCD_RST PIN
    PE4 ---->   LCD_RS PIN
    PD0 ---->   LCD_BLPWM PIN(backlight controll)
    ensure initialization this port fininshed.
**************************************************************/


#define LCD_RST_H()		PE_ODR|= (1<<3);
#define LCD_RST_L()		PE_ODR&= ~(1<<3);

#define LCD_RS_H()		PE_ODR|= (1<<4);
#define LCD_RS_L()		PE_ODR&= ~(1<<4);

#define LCD_CS_H()		PH_ODR|= (1<<2);
#define LCD_CS_L()		PH_ODR&= ~(1<<2);

/* Exported functions ------------------------------------------------------ */
//=============================================================================
//							LCD Basic Functions
//=============================================================================

void LCD_WRITE_REG(u16 index);
void LCD_SEND_COMMAND(u16 index, u16 data);
void LCD_SEND_DATA(u16 data);
void lcd_init(void);
//=============================================================================
//							LCD Application Functions
//=============================================================================
void lcd_clear_screen(u16 color_background);
void lcd_clear_area(u16 color_front, 
                    u16 x, 
                    u16 y, 
                    u16 width, 
                    u16 height);

void lcd_set_cursor(u16 x, u16 y);
void lcd_display_char(u8 ch_asc, 
                      u16 color_front, 
                      u16 color_background, 
                      u16 postion_x, 
                      u16 postion_y);

void lcd_display_string(u8 *str, 
                        u16 color_front, 
                        u16 color_background, 
                        u16 x, 
                        u16 y);

void lcd_display_GB2312(u8 gb, 
                        u16 color_front, 
                        u16 color_background, 
                        u16 postion_x, 
                        u16 postion_y);

void lcd_display_image(const u8 *img, 
                       u16 x, 
                       u16 y, 
                       u16 width, 
                       u16 height);

void lcd_draw_dot(u16 color_front, 
                  u16 x, 
                  u16 y);

void lcd_draw_bigdot(u16   color_front,
                     u16    x,
                     u16    y );

void lcd_draw_line(u16 color,
				   u16 x0,
				   u16 y0, 
				   u16 x1, 
				   u16 y1);
//显示数字
void lcd_display_number(u16 x,
                        u16 y,
                        u32 num,
                        u8 num_len);

void lcd_display_test(void);


#endif
