/**
  ******************************************************************************
  * @file stm8s_spi.h
  * @brief This file contains all functions prototype and macros for the SPI peripheral.
  * @author STMicroelectronics - MCD Application Team
  * @version V1.0.1
  * @date 09/22/2008
  ******************************************************************************
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2008 STMicroelectronics</center></h2>
  * @image html logo.bmp
  ******************************************************************************
  */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __STM8S_SPI_H
#define __STM8S_SPI_H

/* Includes ------------------------------------------------------------------*/
#include "stm8s_map.h"

/* Exported types ------------------------------------------------------------*/

/** @addtogroup SPI_Exported_Types
  * @{
  */

/**
  * @brief SPI data direction mode
  * Warning: element values correspond to BDM, BDOE, RXONLY bits position
  */
typedef enum {
  SPI_DATADIRECTION_2LINES_FULLDUPLEX = (u8)0x00, /*!< 2-line uni-directional data mode enable */
  SPI_DATADIRECTION_2LINES_RXONLY     = (u8)0x04, /*!< Receiver only in 2 line uni-directional data mode */
  SPI_DATADIRECTION_1LINE_RX          = (u8)0x80, /*!< Receiver only in 1 line bi-directional data mode */
  SPI_DATADIRECTION_1LINE_TX          = (u8)0xC0  /*!< Transmit only in 1 line bi-directional data mode */
} SPI_DataDirection_TypeDef;

/**
  * @brief SPI Slave Select management
  * Warning: element values correspond to LSBFIRST bit position
  */
typedef enum
{
  SPI_NSS_SOFT  = (u8)0x02, /*!< Software slave management disabled */
  SPI_NSS_HARD  = (u8)0x00  /*!< Software slave management enabled */
} SPI_NSS_TypeDef;


/**
  * @brief SPI direction transmit/receive
  */

typedef enum {
  SPI_DIRECTION_RX = (u8)0x00, /*!< Selects Rx receive direction in bi-directional mode */
  SPI_DIRECTION_TX = (u8)0x01  /*!< Selects Tx transmission direction in bi-directional mode */
} SPI_Direction_TypeDef;

/**
  * @brief SPI master/slave mode
  * Warning: element values correspond to MSTR bit position
  */
typedef enum {
  SPI_MODE_MASTER = (u8)0x04, /*!< SPI Master configuration */
  SPI_MODE_SLAVE  = (u8)0x00  /*!< SPI Slave configuration */
} SPI_Mode_TypeDef;

/**
  * @brief SPI BaudRate Prescaler
  * Warning: element values correspond to BR bits position
  */
typedef enum {
  SPI_BAUDRATEPRESCALER_2   = (u8)0x00, /*!< SPI frequency = frequency(CPU)/2 */
  SPI_BAUDRATEPRESCALER_4   = (u8)0x08, /*!< SPI frequency = frequency(CPU)/4 */
  SPI_BAUDRATEPRESCALER_8   = (u8)0x10, /*!< SPI frequency = frequency(CPU)/8 */
  SPI_BAUDRATEPRESCALER_16  = (u8)0x18, /*!< SPI frequency = frequency(CPU)/16 */
  SPI_BAUDRATEPRESCALER_32  = (u8)0x20, /*!< SPI frequency = frequency(CPU)/32 */
  SPI_BAUDRATEPRESCALER_64  = (u8)0x28, /*!< SPI frequency = frequency(CPU)/64 */
  SPI_BAUDRATEPRESCALER_128 = (u8)0x30, /*!< SPI frequency = frequency(CPU)/128 */
  SPI_BAUDRATEPRESCALER_256 = (u8)0x38  /*!< SPI frequency = frequency(CPU)/256 */
} SPI_BaudRatePrescaler_TypeDef;

/**
  * @brief SPI Clock Polarity
  * Warning: element values correspond to CPOL bit position
  */
typedef enum {
  SPI_CLOCKPOLARITY_LOW  = (u8)0x00, /*!< Clock to 0 when idle */
  SPI_CLOCKPOLARITY_HIGH = (u8)0x02  /*!< Clock to 1 when idle */
} SPI_ClockPolarity_TypeDef;

/**
  * @brief SPI Clock Phase
  * Warning: element values correspond to CPHA bit position
  */
typedef enum {
  SPI_CLOCKPHASE_1EDGE = (u8)0x00, /*!< The first clock transition is the first data capture edge */
  SPI_CLOCKPHASE_2EDGE = (u8)0x01  /*!< The second clock transition is the first data capture edge */
} SPI_ClockPhase_TypeDef;

/**
  * @brief SPI Frame Format: MSB or LSB transmitted first
  * Warning: element values correspond to LSBFIRST bit position
  */
typedef enum {
  SPI_FIRSTBIT_MSB = (u8)0x00, /*!< MSB bit will be transmitted first */
  SPI_FIRSTBIT_LSB = (u8)0x80  /*!< LSB bit will be transmitted first */
} SPI_FirstBit_TypeDef;

/**
  * @brief SPI CRC Transmit/Receive
  */
typedef enum {
  SPI_CRC_RX = (u8)0x00, /*!< Select Tx CRC register */
  SPI_CRC_TX = (u8)0x01  /*!< Select Rx CRC register */
} SPI_CRC_TypeDef;

/**
  * @brief SPI flags definition - Warning : FLAG value = mapping position register
  */
typedef enum {
  SPI_FLAG_BSY    = (u8)0x80, /*!< Busy flag */
  SPI_FLAG_OVR    = (u8)0x40, /*!< Overrun flag */
  SPI_FLAG_MODF   = (u8)0x20, /*!< Mode fault */
  SPI_FLAG_CRCERR = (u8)0x10, /*!< CRC error flag */
  SPI_FLAG_WKUP   = (u8)0x08, /*!< Wake-up flag */
  SPI_FLAG_TXE    = (u8)0x02, /*!< Transmit buffer empty */
  SPI_FLAG_RXNE   = (u8)0x01  /*!< Receive buffer empty */
} SPI_Flag_TypeDef;

/**
  * @brief SPI_IT possible values
  * Elements values convention: 0xYX
  *   X: Position of the corresponding Interrupt
  *   Y: ITPENDINGBIT position
  */
typedef enum
{
  SPI_IT_WKUP   = (u8)0x34,  /*!< Wake-up interrupt*/
  SPI_IT_OVR   = (u8)0x65,  /*!< Overrun interrupt*/
  SPI_IT_MODF   = (u8)0x55,  /*!< Mode fault interrupt*/
  SPI_IT_CRCERR = (u8)0x45,  /*!< CRC error interrupt*/
  SPI_IT_TXE    = (u8)0x17,  /*!< Transmit buffer empty interrupt*/
  SPI_IT_RXNE   = (u8)0x06,   /*!< Receive buffer not empty interrupt*/
  SPI_IT_ERR    = (u8)0x05   /*!< Error interrupt*/
} SPI_IT_TypeDef;

/**
  * @}
  */

/* Private define ------------------------------------------------------------*/

/* Private macros ------------------------------------------------------------*/

/** @addtogroup SPI_Private_Macros
  * @brief Macros used by the assert_param function to check the different functions parameters.
  * @{
  */

/**
  * @brief Macro used by the assert_param function in order to check the data direction mode values
  */
#define IS_SPI_DATA_DIRECTION_OK(MODE) (((MODE) == SPI_DATADIRECTION_2LINES_FULLDUPLEX) || \
                                        ((MODE) == SPI_DATADIRECTION_2LINES_RXONLY) || \
                                        ((MODE) == SPI_DATADIRECTION_1LINE_RX) || \
                                        ((MODE) == SPI_DATADIRECTION_1LINE_TX))

/**
  * @brief Macro used by the assert_param function in order to check the mode half duplex data direction values
  */
#define IS_SPI_DIRECTION_OK(DIRECTION) (((DIRECTION) == SPI_DIRECTION_RX) || \
                                        ((DIRECTION) == SPI_DIRECTION_TX))

/**
  * @brief Macro used by the assert_param function in order to check the NSS management values
  */
#define IS_SPI_SLAVEMANAGEMENT_OK(NSS) (((NSS) == SPI_NSS_SOFT) || \
                                        ((NSS) == SPI_NSS_HARD))


/**
  * @brief Macro used by the assert_param function in order to check the different sensitivity values for the CRC polynomial
  */
#define IS_SPI_CRC_POLYNOMIAL_OK(POLYNOMIAL) ((POLYNOMIAL) > (u8)0x00)

/**
  * @brief Macro used by the assert_param function in order to check the SPI Mode values
  */
#define IS_SPI_MODE_OK(MODE) (((MODE) == SPI_MODE_MASTER) || \
                              ((MODE) == SPI_MODE_SLAVE))

/**
  * @brief Macro used by the assert_param function in order to check the baudrate values
  */
#define IS_SPI_BAUDRATE_PRESCALER_OK(PRESCALER) (((PRESCALER) == SPI_BAUDRATEPRESCALER_2) || \
    ((PRESCALER) == SPI_BAUDRATEPRESCALER_4) || \
    ((PRESCALER) == SPI_BAUDRATEPRESCALER_8) || \
    ((PRESCALER) == SPI_BAUDRATEPRESCALER_16) || \
    ((PRESCALER) == SPI_BAUDRATEPRESCALER_32) || \
    ((PRESCALER) == SPI_BAUDRATEPRESCALER_64) || \
    ((PRESCALER) == SPI_BAUDRATEPRESCALER_128) || \
    ((PRESCALER) == SPI_BAUDRATEPRESCALER_256))

/**
  * @brief Macro used by the assert_param function in order to check the polarity values
  */
#define IS_SPI_POLARITY_OK(CLKPOL) (((CLKPOL) == SPI_CLOCKPOLARITY_LOW) || \
                                    ((CLKPOL) == SPI_CLOCKPOLARITY_HIGH))

/**
  * @brief Macro used by the assert_param function in order to check the phase values
  */
#define IS_SPI_PHASE_OK(CLKPHA) (((CLKPHA) == SPI_CLOCKPHASE_1EDGE) || \
                                 ((CLKPHA) == SPI_CLOCKPHASE_2EDGE))

/**
  * @brief Macro used by the assert_param function in order to check the first bit to be transmited values
  */
#define IS_SPI_FIRSTBIT_OK(BIT) (((BIT) == SPI_FIRSTBIT_MSB) || \
                                 ((BIT) == SPI_FIRSTBIT_LSB))

/**
  * @brief Macro used by the assert_param function in order to check the CRC Transmit/Receive
  */
#define IS_SPI_CRC_OK(CRC) (((CRC) == SPI_CRC_TX) || \
                            ((CRC) == SPI_CRC_RX))

/**
  * @brief Macro used by the assert_param function in order to check the different flags values
  */
#define IS_SPI_FLAGS_OK(FLAG) (((FLAG) == SPI_FLAG_OVR) || \
                               ((FLAG) == SPI_FLAG_MODF) || \
                               ((FLAG) == SPI_FLAG_CRCERR) || \
                               ((FLAG) == SPI_FLAG_WKUP) || \
                               ((FLAG) == SPI_FLAG_TXE) || \
                               ((FLAG) == SPI_FLAG_RXNE) || \
                               ((FLAG) == SPI_FLAG_BSY))

/**
  * @brief Macro used by the assert_param function in order to check the different sensitivity values for the flag that can be cleared by writing 0
  */
#define IS_SPI_CLEAR_FLAGS_OK(FLAG) (((FLAG) == SPI_FLAG_CRCERR) || \
                                     ((FLAG) == SPI_FLAG_WKUP))



/**
  * @brief Macro used by the assert_param function in order to check the different sensitivity values for the Interrupts
  */
#define IS_SPI_CONFIG_IT_OK(Interrupt) (((Interrupt) == SPI_IT_TXE)  || \
                                        ((Interrupt) == SPI_IT_RXNE)  || \
                                        ((Interrupt) == SPI_IT_ERR) || \
                                        ((Interrupt) == SPI_IT_WKUP))



/**
  * @brief Macro used by the assert_param function in order to check the different sensitivity values for the pending bit
  */
#define IS_SPI_GET_IT_OK(ITPendingBit) (((ITPendingBit) == SPI_IT_OVR)  || \
                                        ((ITPendingBit) == SPI_IT_MODF) || \
                                        ((ITPendingBit) == SPI_IT_CRCERR) || \
                                        ((ITPendingBit) == SPI_IT_WKUP) || \
                                        ((ITPendingBit) == SPI_IT_TXE)  || \
                                        ((ITPendingBit) == SPI_IT_RXNE))



/**
  * @brief Macro used by the assert_param function in order to check the different sensitivity values for the pending bit that can be cleared by writing 0
  */
#define IS_SPI_CLEAR_IT_OK(ITPendingBit) (((ITPendingBit) == SPI_IT_CRCERR) || \
    ((ITPendingBit) == SPI_IT_WKUP))

/**
  * @}
  */

/* Exported functions ------------------------------------------------------- */

/** @addtogroup SPI_Exported_Functions
  * @{
  */
void SPI_DeInit(void);
void SPI_Init_1(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, u8 CRCPolynomial);
void SPI_Cmd(FunctionalState NewState);
void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState);
void SPI_SendData(u8 Data);
u8 SPI_ReceiveData(void);
void SPI_NSSInternalSoftwareCmd(FunctionalState NSS_NewState);
void SPI_TransmitCRC(void);
void SPI_CalculateCRCCmd(FunctionalState NewState);
u8 SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC);
void SPI_ResetCRC(void);
u8 SPI_GetCRCPolynomial(void);
void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction);

FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG);
void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG);
ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT);
void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT);

/**
  * @}
  */

#endif /* __STM8S_SPI_H */

/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/
