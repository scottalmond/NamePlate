/*
 * sys.cpp
 *
 * Created: 02-10-2018 13:07:52
 *  Author: JMR_2
 */

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/power.h>
#include "sys.h"
#include "dbg.h"
#include <stdio.h>
#include <string.h>


#include <stdio.h>
#include <string.h>



void SYS::init(void) {
  #ifdef DEBUG_ON
    DBG::initDebug();
  #endif

  #ifdef XAVR
    #ifdef __AVR_DA__
      #if (F_CPU == 24000000)
        /* No division on clock */
        _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, (CLKCTRL_OSCHFCTRLA & ~CLKCTRL_FREQSEL_gm ) | (0x09<< CLKCTRL_FREQSEL_gp ));

      #elif (F_CPU == 20000000)
        /* No division on clock */
        _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, (CLKCTRL_OSCHFCTRLA & ~CLKCTRL_FREQSEL_gm ) | (0x08<< CLKCTRL_FREQSEL_gp ));

      #elif (F_CPU == 16000000)
        /* No division on clock */
        _PROTECTED_WRITE(CLKCTRL_OSCHFCTRLA, (CLKCTRL_OSCHFCTRLA & ~CLKCTRL_FREQSEL_gm ) | (0x07<< CLKCTRL_FREQSEL_gp ));
      #else
        #error "F_CPU defined as an unsupported value"
      #endif
    #else //0-series or 1-series
      _PROTECTED_WRITE(CLKCTRL.MCLKCTRLB, 0);
    #endif
  #else
    #if defined(ARDUINO_AVR_LARDU_328E)
      clock_prescale_set ( (clock_div_t) __builtin_log2(32000000UL / F_CPU));
    #endif
	  PORT(UPDI_PORT) = 1<<UPDI_PIN;
  #endif


  DDR(LED_PORT) |= (1 << LED_PIN);
  #ifdef LED2_PORT
  DDR(LED2_PORT) |= (1 << LED2_PIN);
  #endif
  TIMER_HOST_MAX=HOST_TIMEOUT;
  TIMER_TARGET_MAX=TARGET_TIMEOUT;
  #if defined(DEBUG_ON)
  DBG::debug(0x18,0xC0,0xFF, 0xEE);
  #endif
}

void SYS::setLED(void){
	PORT(LED_PORT) |= 1 << LED_PIN;
}

void SYS::clearLED(void){
	PORT(LED_PORT) &= ~(1 << LED_PIN);
}

void SYS::setVerLED(void){
        #ifdef LED2_PORT
        PORT(LED2_PORT) |= 1 << LED2_PIN;
        #endif
}

void SYS::clearVerLED(void){
        #ifdef LED2_PORT
        PORT(LED2_PORT) &= ~(1 << LED2_PIN);
        #endif
}

/*
inline void SYS::startTimer()
inline void SYS::stopTimer()

Timeout mechanisms, 5/2020, Spence Konde
*/

uint8_t SYS::checkTimeouts() {
return TIMEOUT_REG;
}
void SYS::clearTimeouts() {
  TIMEOUT_REG=WAIT_FOR_HOST|WAIT_FOR_TARGET;
}
