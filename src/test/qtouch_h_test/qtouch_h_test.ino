
/*#include <Adafruit_NeoPixel.h>
#ifdef __AVR__
 #include <avr/power.h> // Required for 16 MHz Adafruit Trinket
#endif*/

//#include "TinyTouch.h"

const byte PIN_LED=PIN_PA7;
/*const byte LED_COUNT=96;
//note: with large LED counts, the show() method, which disables interrupts, will miss milliseconds
//interrupts.  The millis() method will no longer update properly
//100 LEDs loses about ~2 ms interrupts every call:to show() https://forums.adafruit.com/viewtopic.php?f=47&t=42720
//micros() has the same issue https://roboticsbackend.com/arduino-millis-vs-micros/
//future: consider combination of LED_COUNT, millis() and micros() to compensate for the microseconds needed
neoPixelType STRIP_TYPE=NEO_GRBW + NEO_KHZ800;
Adafruit_NeoPixel strip = Adafruit_NeoPixel(LED_COUNT, PIN_LED, STRIP_TYPE);
const byte DEFAULT_BRIGHTNESS=255;*/

const byte PIN_TOUCH=PIN_PB0;//periphreal touch controller button


void setup() {
  pinMode(PIN_LED, OUTPUT);
  /*strip.begin();
  strip.setBrightness(DEFAULT_BRIGHTNESS);
  strip.clear();
  strip.show();*/

}

void loop() {
  digitalWrite(PIN_LED,millis()%2048<1024);
}

//http://atmel-studio-doc.s3-website-us-east-1.amazonaws.com/webhelp/GUID-4E095027-601A-4343-844F-2034603B4C9C-en-US-3/index.html?GUID-9FB47E29-DDA2-4B59-BD3C-1FD706DED1FA
