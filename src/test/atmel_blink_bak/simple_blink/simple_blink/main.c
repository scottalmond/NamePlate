#include <atmel_start.h>
//#include <avr/sleep.h>
#include"util/delay.h"

int main(void)
{
	/* Initializes MCU, drivers and middleware */
	atmel_start_init();

	/* Replace with your application code */
	while (1) {
		PIN_PA7_set_level(1);
		_delay_ms(1000);
		PIN_PA7_set_level(0);
		_delay_ms(1000);
	}
}
