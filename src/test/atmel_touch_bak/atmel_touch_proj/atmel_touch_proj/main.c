#include <atmel_start.h>

int main(void)
{
	/* Initializes MCU, drivers and middleware */
	atmel_start_init();

	/* Replace with your application code */
	while (1) {
		touch_example();
		//touching cap sensor turns ON LED pin to 5V
		
	}
}
