#include <atmel_start.h>
//#include <avr/sleep.h>
#include"util/delay.h"

int main(void)
{
	/* Initializes MCU, drivers and middleware */
	atmel_start_init();

	/* Replace with your application code */
	while (1) {
		//http://www.microdigitaled.com/AVR/Articles/makingDelaysInAvrStudio.pdf
		//http://atmel-studio-doc.s3-website-us-east-1.amazonaws.com/webhelp/GUID-4E095027-601A-4343-844F-2034603B4C9C-en-US-3/index.html?GUID-9FB47E29-DDA2-4B59-BD3C-1FD706DED1FA
		//https://microchipdeveloper.com/touch:generate-qtouch-configurator-touch-project
		PIN_PA7_set_level(1);
		_delay_ms(1000);
		PIN_PA7_set_level(0);
		_delay_ms(1000);
	}
}