/**
  ******************************************************************************
  * @file stm8s_spi.c
  * @brief This file contains all the functions for the SPI peripheral.
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

/* Includes ------------------------------------------------------------------*/
#include "stm8s_spi.h"

/* LINKER SECTIONS DEFINITION FOR THIS FILE ONLY */
#ifdef USE_COSMIC_SECTIONS
#pragma section (SPI_CODE)
#pragma section const {SPI_CONST}
#pragma section @near [SPI_URAM]
#pragma section @near {SPI_IRAM}
#pragma section @tiny [SPI_UZRAM]
#pragma section @tiny {SPI_IZRAM}
#endif

/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/

/** @addtogroup SPI_Public_Functions
  * @{
  */

/**
* @brief Deinitializes the SPI peripheral registers to their default reset values.
* @par Parameters:
* None
* @retval void None
* @par Required preconditions:
* None
* @par Called functions:
* SPI_Cmd
* @par Example:
* This example shows how to call the function:
* @code
* SPI_DeInit();
* @endcode
*/
void SPI_DeInit(void)
{
  SPI->CR1    = SPI_CR1_RESET_VALUE;
  SPI->CR2    = SPI_CR2_RESET_VALUE;
  SPI->ICR    = SPI_ICR_RESET_VALUE;
  SPI->SR     = SPI_SR_RESET_VALUE;
  SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
}

/**
  * @brief Initializes the SPI according to the specified parameters.
  * @param[in] FirstBit : This parameter can be any of the @ref SPI_FirstBit_TypeDef enumeration.
  * @param[in] BaudRatePrescaler : This parameter can be any of the @ref SPI_BaudRatePrescaler_TypeDef enumeration.
  * @param[in] Mode : This parameter can be any of the  @ref SPI_Mode_TypeDef enumeration.
  * @param[in] ClockPolarity : This parameter can be any of the @ref SPI_ClockPolarity_TypeDef enumeration.
  * @param[in] ClockPhase : This parameter can be any of the @ref SPI_ClockPhase_TypeDef enumeration.
  * @param[in] Data_Direction : This parameter can be any of the @ref SPI_DataDirection_TypeDef enumeration.
  * @param[in] Slave_Management : This parameter can be any of the @ref SPI_NSS_TypeDef enumeration.
  * @param[in] CRCPolynomial : Configures the CRC polynomial.
  * @retval void None
  * @par Required preconditions:
  * None.
  * @par Called functions:
  * None.
  * @par Example:
  * @code
  * SPI_Init(SPI_FIRSTBIT_LSB, SPI_BAUDRATEPRESCALER_2, SPI_MODE_MASTER, SPI_CLOCKPOLARITY_HIGH, SPI_CLOCKPHASE_1EDGE, SPI_DATADIRECTION_2LINES_FULLDUPLEX, SPI_NSS_SOFT, 0x07);
  * @endcode
  */
void SPI_Init_1(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, u8 CRCPolynomial)
{
  /* Check structure elements */
  assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
  assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
  assert_param(IS_SPI_MODE_OK(Mode));
  assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
  assert_param(IS_SPI_PHASE_OK(ClockPhase));
  assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
  assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
  assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));

  /* Frame Format, BaudRate, Clock Polarity and Phase configuration */
  SPI->CR1 = (u8)((u8)(FirstBit) |
                  (u8)(BaudRatePrescaler) |
                  (u8)(ClockPolarity) |
                  (u8)(ClockPhase));

  /* Data direction configuration: BDM, BDOE and RXONLY bits */
  SPI->CR2 = (u8)((u8)(Data_Direction) | (u8)(Slave_Management));

  if (Mode == SPI_MODE_MASTER)
  {
    SPI->CR2 |= (u8)SPI_CR2_SSI;
  }
  else
  {
    SPI->CR2 &= (u8)~(SPI_CR2_SSI);
  }

  /* Master/Slave mode configuration */
  SPI->CR1 |= (u8)(Mode);

  /* CRC configuration */
  SPI->CRCPR = (u8)CRCPolynomial;
}

/**
* @brief Enables or disables the SPI peripheral.
* @param[in] NewState New state of the SPI peripheral.
* This parameter can be:
* - ENABLE
* - DISABLE
* @retval void None
* @par Required preconditions:
* None
* @par Called functions:
* None
* @par Example:
* @code
* SPI_Cmd(ENABLE);
* @endcode
*/
void SPI_Cmd(FunctionalState NewState)
{
  /* Check function parameters */
  assert_param(IS_FUNCTIONALSTATE_OK(NewState));

  if (NewState != DISABLE)
  {
    SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
  }
  else
  {
    SPI->CR1 &= (u8)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
  }
}
/**
* @brief Enables or disables the specified interrupts.
* @param[in] SPI_IT Specifies the SPI interrupts sources to be enabled or disabled.
* @param[in] NewState: The new state of the specified SPI interrupts.
* This parameter can be:
* - ENABLE
* - DISABLE.
* @retval void None
* @par Required preconditions:
* None
* @par Called functions:
* None
* @par Example:
* @code
* SPI_ITConfig(SPI_IT_TXE, ENABLE);
* @endcode
*/
void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
{
  u8 itpos = 0;
  /* Check function parameters */
  assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
  assert_param(IS_FUNCTIONALSTATE_OK(NewState));

  /* Get the SPI IT index */
  itpos = (u8)((u8)1 << (u8)((u8)SPI_IT & (u8)0x0F));

  if (NewState != DISABLE)
  {
    SPI->ICR |= itpos; /* Enable interrupt*/
  }
  else
  {
    SPI->ICR &= (u8)(~itpos); /* Disable interrupt*/
  }
}
/**
* @brief Transmits a Data through the SPI peripheral.
* @param[in] Data Byte to be transmitted.
* @retval void None
* @par Required preconditions:
* None
* @par Called functions:
* None
* @par Example:
* @code
* SPI_SendData(0xFF);
* @endcode
*/
void SPI_SendData(u8 Data)
{
  SPI->DR = Data; /* Write in the DR register the data to be sent*/
}

/**
* @brief Returns the most recent received data by the SPI peripheral.
* @par Parameters:
* None
* @retval u8 The value of the received data.
* @par Required preconditions:
* None
* @par Called functions:
* None
* @par Example:
* @code
* Return_Value = SPI_ReceiveData();
* @endcode
*/
u8 SPI_ReceiveData(void)
{
  return ((u8)SPI->DR); /* Return the data in the DR register*/
}

/**
* @brief Configures internally by software the NSS pin.
* @param[in] NewState Indicates the new state of the SPI Software slave management.
* This parameter can be:
* - ENABLE
* - DISABLE
* @retval void None
* @par Required preconditions:
* None
* @par Called functions:
* None
* @par Example:
* @code
* SPI_NSSInternalSoftwareCmd(ENABLE);
* @endcode
*/
void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
{
  /* Check function parameters */
  assert_param(IS_FUNCTIONALSTATE_OK(NewState));

  if (NewState != DISABLE)
  {
    SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
  }
  else
  {
    SPI->CR2 &= (u8)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
  }
}

/**
* @brief Enables the transmit of the CRC value.
* @par Parameters:
* None
* @retval void None
* @par Required preconditions:
* None
* @par Called functions:
* None
* @par Example:
* @code
* SPI_TransmitCRC();
* @endcode
*/
void SPI_TransmitCRC(void)
{
  SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
}

/**
* @brief Enables or disables the CRC value calculation of the transfered bytes.
* @param[in] NewState Indicates the new state of the SPI CRC value calculation.
* This parameter can be:
* - ENABLE
* - DISABLE
* @retval void None
* @par Required preconditions:
* None
* @par Called functions: SPI_Cmd(DISABLE);
* @par Example:
* @code
* SPI_CalculateCRCCmd(ENABLE);
* @endcode
*/
void SPI_CalculateCRCCmd(FunctionalState NewState)
{
  /* Check function parameters */
  assert_param(IS_FUNCTIONALSTATE_OK(NewState));

  /* SPI must be disable forcorrect operation od Hardware CRC calculation */
  SPI_Cmd(DISABLE);

  if (NewState != DISABLE)
  {
    SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
  }
  else
  {
    SPI->CR2 &= (u8)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
  }
}

/**
* @brief Returns the transmit or the receive CRC register value.
* @param[in] SPI_CRC Specifies the CRC register to be read.
* @retval u8 The selected CRC register value.
* @par Required preconditions:
* None
* @par Called functions:
* None
* @par Example:
* @code
* SPI_GetCRC(SPI_CRC_TX);
* @endcode
*/
u8 SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
{
  u8 crcreg = 0;

  /* Check function parameters */
  assert_param(IS_SPI_CRC_OK(SPI_CRC));

  if (SPI_CRC != SPI_CRC_RX)
  {
    crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
  }
  else
  {
    crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
  }

  /* Return the selected CRC register status*/
  return crcreg;
}

/**
* @brief Reset the Rx CRCR and Tx CRCR registers.
* @par Parameters:
* None
* @retval void None
* @par Required preconditions:
* None
* @par Called functions: SPI_CalculateCRCCmd and SPI_Cmd.
* @par Example:
* @code
* SPI_ResetCRC();
* @endcode
*/
void SPI_ResetCRC(void)
{
  /* Rx CRCR & Tx CRCR registers are reset when CRCEN (hardware calculation)
     bit in SPI_CR2 is written to 1 (enable) */
  SPI_CalculateCRCCmd(ENABLE);

  /* Previous function disable the SPI */
  SPI_Cmd(ENABLE);
}

/**
* @brief Returns the CRC Polynomial register value.
* @par Parameters:
* None
* @retval u8 The CRC Polynomial register value.
* @par Required preconditions:
* None
* @par Called functions:
* None
* @par Example:
* @code
* u8 polynomial;
* polynomial = SPI_GetCRCPolynomial();
* @endcode
*/
u8 SPI_GetCRCPolynomial(void)
{
  return SPI->CRCPR; /* Return the CRC polynomial register */
}

/**
* @brief Selects the data transfer direction in bi-directional mode.
* @param[in] SPI_Direction Specifies the data transfer direction in bi-directional mode.
* @retval void None
* @par Required preconditions:
* None
* @par Called functions:
* None
* @par Example:
* @code
* SPI_BiDirectionalLineConfig(SPI_DIRECTION_TX);
* @endcode
*/
void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
{
  /* Check function parameters */
  assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));

  if (SPI_Direction != SPI_DIRECTION_RX)
  {
    SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
  }
  else
  {
    SPI->CR2 &= (u8)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
  }
}

/**
  * @brief Checks whether the specified SPI flag is set or not.
  * @param[in] SPI_FLAG : Specifies the flag to check.
  * This parameter can be any of the @ref SPI_Flag_TypeDef enumeration.
  * @retval FlagStatus : Indicates the state of SPI_FLAG.
  * This parameter can be any of the @ref FlagStatus enumeration.
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
 * This example shows how to call the function:
  * @code
  * FlagStatus SPI_Flag;
  * SPI_Flag = SPI_GetFlagStatus(SPI_FLAG_TXE);
  * @endcode
  */

FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
{
  FlagStatus status = RESET;
  /* Check parameters */
  assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));

  /* Check the status of the specified SPI flag */
  if ((SPI->SR & (u8)SPI_FLAG) != (u8)RESET)
  {
    status = SET; /* SPI_FLAG is set */
  }
  else
  {
    status = RESET; /* SPI_FLAG is reset*/
  }

  /* Return the SPI_FLAG status */
  return status;
}

/**
  * @brief Clears the SPI flags.
  * @param[in] SPI_FLAG : Specifies the flag to clear.
  * This parameter can be one of the following values:
  * - SPI_FLAG_CRCERR
  * - SPI_FLAG_WKUP
  * @par Notes
  * - OVR (OverRun Error) interrupt pending bit is cleared by software sequence:
  *   a read operation to SPI_DR register (SPI_ReceiveData()) followed by
  *   a read operation to SPI_SR register (SPI_GetFlagStatus()).
  * - MODF (Mode Fault) interrupt pending bit is cleared by software sequence:
  *   a read/write operation to SPI_SR register (SPI_GetFlagStatus()) followed by
  *   a write operation to SPI_CR1 register (SPI_Cmd() to enable the SPI).
  * @retval void : None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * This example shows how to call the function:
  * @code
  * SPI_ClearFlag(SPI_FLAG_OVR);
  * @endcode
  */
void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
{
  assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
  /* Clear the flag bit */
  SPI->SR = (u8)(~SPI_FLAG);
}

/**
  * @brief Checks whether the specified interrupt has occurred or not.
  * @param[in] SPI_IT: Specifies the SPI interrupt pending bit to check.
  * This parameter can be one of the following values:
 * - SPI_IT_CRCERR
  * - SPI_IT_WKUP
 * - SPI_IT_OVR
  * - SPI_IT_MODF
 * - SPI_IT_RXNE
 * - SPI_IT_TXE
 * @retval ITStatus : Indicates the state of the SPI_IT.
  * This parameter can be any of the @ref ITStatus enumeration.
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
 * This example shows how to call the function:
  * @code
  * ITStatus SPI_Interrupt;
  * SPI_Interrupt = SPI_GetITStatus(SPI_IT_OVR);
  * @endcode
  */
ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
{
  ITStatus pendingbitstatus = RESET;
  u8 itpos = 0;
  u8 itmask1 = 0;
  u8 itmask2 = 0;
  u8 enablestatus = 0;
  assert_param(IS_SPI_GET_IT_OK(SPI_IT));
  /* Get the SPI IT index */
  itpos = (u8)((u8)1 << ((u8)SPI_IT & (u8)0x0F));

  /* Get the SPI IT mask */
  itmask1 = (u8)((u8)SPI_IT >> (u8)4);
  /* Set the IT mask */
  itmask2 = (u8)((u8)1 << itmask1);
  /* Get the SPI_ITPENDINGBIT enable bit status */
  enablestatus = (u8)((u8)SPI->ICR & itmask2);
  /* Check the status of the specified SPI interrupt */
  if (((SPI->SR & itpos) != RESET) && enablestatus)
  {
    /* SPI_ITPENDINGBIT is set */
    pendingbitstatus = SET;
  }
  else
  {
    /* SPI_ITPENDINGBIT is reset */
    pendingbitstatus = RESET;
  }
  /* Return the SPI_ITPENDINGBIT status */
  return  pendingbitstatus;
}
/**
  * @brief Clears the interrupt pending bits.
  * @param[in] SPI_IT: Specifies the interrupt pending bit to clear.
  * This parameter can be one of the following values:
  * - SPI_IT_CRCERR
  * - SPI_IT_WKUP
  * @par Notes
  *    - OVR (OverRun Error) interrupt pending bit is cleared by software sequence:
  *      a read operation to SPI_DR register (SPI_ReceiveData()) followed by
  *      a read operation to SPI_SR register (SPI_GetITStatus()).
  *    - MODF (Mode Fault) interrupt pending bit is cleared by software sequence:
  *      a read/write operation to SPI_SR register (SPI_GetITStatus()) followed by
  *      a write operation to SPI_CR1 register (SPI_Cmd() to enable the SPI).
  * @retval void : None
  * @par Required preconditions:
  * None
  * @par Called functions:
  * None
  * @par Example:
  * This example shows how to call the function:
  * @code
  * SPI_ClearITPendingBit(SPI_IT_WKUP);
  * @endcode
  */
void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
{
  u8 itpos = 0;
  assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));

  /* Clear  SPI_IT_CRCERR or SPI_IT_WKUP interrupt pending bits */

  /* Get the SPI pending bit index */
  itpos = (u8)((u8)1 << (((u8)SPI_IT & (u8)0xF0) >> 4));
  /* Clear the pending bit */
  SPI->SR = (u8)(~itpos);

}
/**
  * @}
  */

/******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/
