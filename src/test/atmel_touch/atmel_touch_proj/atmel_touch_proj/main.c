#include <atmel_start.h>
/*#include <include/libraries/Adafruit_NeoPixel/Adafruit_NeoPixel.h>

const uint8_t PIN_LED=0;//PIN_PA7;
const uint8_t LED_COUNT=96;
neoPixelType STRIP_TYPE=NEO_GRBW + NEO_KHZ800;
Adafruit_NeoPixel strip = Adafruit_NeoPixel(LED_COUNT, PIN_LED, STRIP_TYPE);
const uint8_t DEFAULT_BRIGHTNESS=255;*/

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
