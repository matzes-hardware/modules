/**
  ******************************************************************************
  * @file STM8_TSL_RC_API.c
  * @brief RC Touch Sensing Library for STM8 CPU family.
  * Application Programming Interface. Defines the memory buffers, variables
  * and functions used to communicate between Touch Sensing Library and
  * customer code.
  * @author STMicroelectronics - MCD Application Team
  * @version V1.2.0
  * @date 24-MAR-2009
  ******************************************************************************
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2009 STMicroelectronics</center></h2>
  * @image html logo.bmp
  ******************************************************************************
  */

#include "STM8_TSL_RC_API.h"
#include "STM8_TSL_RC_SingleChannelKey.h"
#include "STM8_TSL_RC_MultiChannelKey.h"
#include "STM8_TSL_RC_Services.h"

//--------    SECTION DEFINITION FOR THIS FILE   --------------
#if defined(__CSMC__) && defined(USE_PRAGMA_SECTION)
#pragma section [TSL_RAM]
#pragma section @tiny [TSL_RAM0]
#pragma section (TSL_CODE)
#pragma section const {TSL_CONST}
#endif

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//-----             MEMORY BUFFER API                                    -----
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

TSLState_T @tiny TSLState;
u8 @tiny KeyIndex;

KeyFlag_T @tiny TSL_GlobalSetting;
KeyState_T @tiny TSL_GlobalState;

Single_Channel_Complete_Info_T * @tiny pKeyStruct;
Single_Channel_Complete_Info_T sSCKeyInfo[NUMBER_OF_SINGLE_CHANNEL_KEYS];

u8 DetectionTimeout;
u8 DetectionIntegrator;
u8 EndDetectionIntegrator;
u8 RecalibrationIntegrator;
u8 ECSTimeStep;
u8 ECSTemporization;
u8 ECS_K_Fast;
u8 ECS_K_Slow;

#ifdef IT_SYNC
volatile IT_Sync_Flags_T IT_Sync_Flags;
#endif

#if NUMBER_OF_MULTI_CHANNEL_KEYS > 0

#if defined(__CSMC__) && defined(USE_PRAGMA_SECTION)
#pragma section [TSLMCK_RAM]
#pragma section @tiny [TSLMCK_RAM0]
#endif

u8 @tiny ChannelIndex;

#if CHANNEL_PER_MCKEY == 5
Penta_Channel_Complete_Info_T * @tiny pMCKeyStruct;
Penta_Channel_Complete_Info_T sMCKeyInfo[NUMBER_OF_MULTI_CHANNEL_KEYS];
#endif
#if CHANNEL_PER_MCKEY == 8
Octo_Channel_Complete_Info_T * @tiny pMCKeyStruct;
Octo_Channel_Complete_Info_T sMCKeyInfo[NUMBER_OF_MULTI_CHANNEL_KEYS];
#endif

#endif

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//-----             LIBRARY PRIVATE GLOBALS                              -----
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#if defined(__CSMC__) && defined(USE_PRAGMA_SECTION)
#pragma section [TSL_RAM]
#pragma section @tiny [TSL_RAM0]
#endif

s16 @tiny Delta;
u8 @tiny Local_TickECS10ms;
TimerFlag_T @tiny Local_TickFlag;
u8 @tiny ECSTimeStepCounter;
u8 ECSTempoCounter;
u8 ECSTempoPrescaler;
KeyFlag_T @tiny TSL_TempGlobalSetting;
KeyState_T @tiny TSL_TempGlobalState;

//============================================================================
//-----         CONDITIONAL COMPILING FOR MCKEYS !!!               -----------
#if NUMBER_OF_MULTI_CHANNEL_KEYS > 0
//============================================================================
#if defined(__CSMC__) && defined(USE_PRAGMA_SECTION)
#pragma section [TSLMCK_RAM]
#pragma section @tiny [TSLMCK_RAM0]
#endif

s16 @tiny Delta1;
s16 @tiny Delta2;
s16 @tiny Delta3;

//============================================================================
//-----         CONDITIONAL COMPILING FOR MCKEYS !!!               -----------
#endif
//============================================================================
#if defined(__CSMC__) && defined(USE_PRAGMA_SECTION)
#pragma section [TSL_RAM]
#pragma section @tiny [TSL_RAM0]
#endif


/**
  ******************************************************************************
  * @brief Initialize memory API and structures.
  * @par Parameters:
  * None
  * @retval void None
  * @par Required preconditions:
  * Must be run once in the main function during initialization phase.
  ******************************************************************************
  */
void TSL_Init(void)
{

  disableInterrupts();

  DetectionIntegrator = DETECTION_INTEGRATOR_DEFAULT;
  EndDetectionIntegrator = END_DETECTION_INTEGRATOR_DEFAULT;
  ECSTimeStep = ECS_TIME_STEP_DEFAULT;
  ECSTemporization = ECS_TEMPO_DEFAULT;
  RecalibrationIntegrator = RECALIBRATION_INTEGRATOR_DEFAULT;
  DetectionTimeout = DTO_DEFAULT;

  ECS_K_Fast = ECS_IIR_KFAST_DEFAULT;
  ECS_K_Slow = ECS_IIR_KSLOW_DEFAULT;
  ECSTimeStepCounter = ECSTimeStep;
  ECSTempoCounter = 0;
  ECSTempoPrescaler = 0;

  TSL_IO_Init();

  TSL_Timer_Init();
  
  TSL_SCKey_Init();
  
#if NUMBER_OF_MULTI_CHANNEL_KEYS > 0
  TSL_MCKey_Init();
#endif

  enableInterrupts();

  TSLState = TSL_IDLE_STATE;

}


/**
  ******************************************************************************
  * @brief Main function of TSL.
  * @par Parameters:
  * None
  * @retval void None
  * @par Required preconditions:
  * Must be called from main loop to run the library state machine.
  ******************************************************************************  
  */
void TSL_Action(void)
{

  switch ( TSLState )
  {
    
    case TSL_IDLE_STATE:
      TSLState = TSL_SCKEY_P1_ACQ_STATE;
      break;

    case TSL_SCKEY_P1_ACQ_STATE:
      disableInterrupts();
      Local_TickFlag.b.DTO_1sec = TSL_Tick_Flags.b.DTO_1sec;
      TSL_Tick_Flags.b.DTO_1sec = 0;
      enableInterrupts();

      TSL_SCKEY_P1_Acquisition();
      TSLState = TSL_SCKEY_P1_PROC_STATE;
      break;

    case TSL_SCKEY_P1_PROC_STATE:
      for ( KeyIndex = 0; KeyIndex < SCKEY_P1_KEY_COUNT; KeyIndex++ )
      {
        TSL_SCKey_Process();
      }

#if NUMBER_OF_SINGLE_CHANNEL_PORTS > 1
      TSLState = TSL_SCKEY_P2_ACQ_STATE;
#else
#if NUMBER_OF_MULTI_CHANNEL_KEYS > 0
      TSLState = TSL_MCKEY1_ACQ_STATE;
#else
      TSLState = TSL_ECS_STATE;
#endif
#endif
      break;

#if NUMBER_OF_SINGLE_CHANNEL_PORTS > 1
    case TSL_SCKEY_P2_ACQ_STATE:
      TSL_SCKEY_P2_Acquisition();
      TSLState = TSL_SCKEY_P2_PROC_STATE;
      break;

    case TSL_SCKEY_P2_PROC_STATE:
      for ( KeyIndex = SCKEY_P1_KEY_COUNT; KeyIndex < (SCKEY_P2_KEY_COUNT + SCKEY_P1_KEY_COUNT); KeyIndex++ )
      {
        TSL_SCKey_Process();
      }

#if NUMBER_OF_SINGLE_CHANNEL_PORTS > 2
      TSLState = TSL_SCKEY_P3_ACQ_STATE;
#else
#if NUMBER_OF_MULTI_CHANNEL_KEYS > 0
      TSLState = TSL_MCKEY1_ACQ_STATE;
#else
      TSLState = TSL_ECS_STATE;
#endif
#endif
      break;
#endif

#if NUMBER_OF_SINGLE_CHANNEL_PORTS > 2
    case TSL_SCKEY_P3_ACQ_STATE:
      TSL_SCKEY_P3_Acquisition();
      TSLState = TSL_SCKEY_P3_PROC_STATE;
      break;

    case TSL_SCKEY_P3_PROC_STATE:
      for ( KeyIndex = (SCKEY_P1_KEY_COUNT + SCKEY_P2_KEY_COUNT); KeyIndex < (SCKEY_P3_KEY_COUNT + SCKEY_P1_KEY_COUNT + SCKEY_P2_KEY_COUNT); KeyIndex++ )
      {
        TSL_SCKey_Process();
      }
#if NUMBER_OF_MULTI_CHANNEL_KEYS > 0
      TSLState = TSL_MCKEY1_ACQ_STATE;
#else
      TSLState = TSL_ECS_STATE;
#endif
      break;
#endif

#if NUMBER_OF_MULTI_CHANNEL_KEYS > 0
    case TSL_MCKEY1_ACQ_STATE:
      TSL_MCKey1_Acquisition();
#if NUMBER_OF_MULTI_CHANNEL_KEYS > 1
      TSLState = TSL_MCKEY2_ACQ_STATE;
#else
      TSLState = TSL_MCKEY_PROC_STATE;
#endif
      break;

#if NUMBER_OF_MULTI_CHANNEL_KEYS > 1
    case TSL_MCKEY2_ACQ_STATE:
      TSL_MCKey2_Acquisition();
      TSLState = TSL_MCKEY_PROC_STATE;
      break;
#endif

    case TSL_MCKEY_PROC_STATE:
      for ( KeyIndex = 0; KeyIndex < NUMBER_OF_MULTI_CHANNEL_KEYS; KeyIndex++ )
      {
        TSL_MCKey_Process();
      }
      TSLState = TSL_ECS_STATE;
      break;
#endif

    case TSL_ECS_STATE:
      TSL_ECS();
      TSL_GlobalSetting.whole = TSL_TempGlobalSetting.whole;
      TSL_TempGlobalSetting.whole = 0;
      TSL_GlobalState.whole = TSL_TempGlobalState.whole;
      TSL_TempGlobalState.whole = 0;
      TSLState = TSL_IDLE_STATE;
      break;

    default:
      for (;;)
      {
        // Wait for Watchdog reset ...
      }
  }
}

/*********************** (c) 2009 STMicroelectronics **************************/
