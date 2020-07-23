/*
  Blink

  Turns an LED on for one second, then off for one second, repeatedly.

  Most Arduinos have an on-board LED you can control. On the UNO, MEGA and ZERO
  it is attached to digital pin 13, on MKR1000 on pin 6. LED_BUILTIN is set to
  the correct LED pin independent of which board is used.
  If you want to know what pin the on-board LED is connected to on your Arduino
  model, check the Technical Specs of your board at:
  https://www.arduino.cc/en/Main/Products

  modified 8 May 2014
  by Scott Fitzgerald
  modified 2 Sep 2016
  by Arturo Guadalupi
  modified 8 Sep 2016
  by Colby Newman

  This example code is in the public domain.

  http://www.arduino.cc/en/Tutorial/Blink
*/

#include <Adafruit_NeoPixel.h>
#ifdef __AVR__
 #include <avr/power.h> // Required for 16 MHz Adafruit Trinket
#endif

const byte PIN_LED=PIN_PA7;
const byte LED_COUNT=1;
neoPixelType STRIP_TYPE=NEO_GRB/*NEO_GRBW*/ + NEO_KHZ800;
Adafruit_NeoPixel strip = Adafruit_NeoPixel(LED_COUNT, PIN_LED, STRIP_TYPE);

// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(PIN_LED, OUTPUT);
}

// the loop function runs over and over again forever
void loop() {
  /*digitalWrite(PIN_LED, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(2000);                       // wait for a second
  digitalWrite(PIN_LED, LOW);    // turn the LED off by making the voltage LOW
  delay(2000);                       // wait for a second */
  uint16_t hue=millis()*8;//set higher multiplication to cycle LEDs faster.  *16 is cycling full rainbow every ~8 seconds
  uint8_t  sat = 255;
  uint8_t  val = 255 ;
  strip.fill(strip.gamma32(strip.ColorHSV(hue, sat, val)),0,LED_COUNT);
  strip.show();
}
