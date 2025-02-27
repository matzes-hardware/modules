#ifndef _NRF24L01_
#define _NRF24L01_

#include <stm8s208mb.h>







//u8 SPI_Write_Reg(u8 reg,u8 value);
/****向寄存器reg写一个字节，同时返回状态字节**************/

u8 SPI_RW_Reg(u8 reg,u8 value);

u8 SPI_Read_Reg(u8 reg);
u8 SPI_Read_Buf(u8 reg,u8 *pBuf,u8 bytes);
u8 SPI_Write_Buf(u8 reg,u8 *pBuf,u8 bytes);
u8 nRF24L01_RxPacket(unsigned char *rx_buf);
void nRF24L01_TxPacket(unsigned char *tx_buf);
void RX_Mode(void);
void TX_Mode(u8 * tx_buf);
void nRF24L01_Initial(void);
void nRF24L01_Config(void);
void NRF24L01_Send(void);
void NRF24L01_Receive(void);


#endif /*_NRF24L01_*/
