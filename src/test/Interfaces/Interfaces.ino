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
const byte LED_COUNT=96;
//note: with large LED counts, the show() method, which disables interrupts, will miss milliseconds
//interrupts.  The millis() method will no longer update properly
//100 LEDs loses about ~2 ms interrupts every call:to show() https://forums.adafruit.com/viewtopic.php?f=47&t=42720
//micros() has the same issue https://roboticsbackend.com/arduino-millis-vs-micros/
//future: consider combination of LED_COUNT, millis() and micros() to compensate for the microseconds needed
neoPixelType STRIP_TYPE=NEO_GRBW + NEO_KHZ800;
Adafruit_NeoPixel strip = Adafruit_NeoPixel(LED_COUNT, PIN_LED, STRIP_TYPE);

const byte PIN_TOUCH=PIN_PB0;//periphreal touch controller button
const byte PIN_MAGNET=PIN_PA3;
const byte PIN_BRIGHTNESS=PIN_PA2;
const byte PIN_CONFIG_UPDATE_DAILY=PIN_PA6;//SW2 on DIP switch
const byte PIN_CONFIG_DIAGNOSTIC=PIN_PA5;//SW3 on DIP switch
const byte PIN_CONFIG_TESSELLATE=PIN_PA4;//SW4 on DIP switch
//note: SW1 is used for programming UPDI pin over the ID pin of the USB input

// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(PIN_LED, OUTPUT);
  pinMode(PIN_CONFIG_UPDATE_DAILY,INPUT_PULLUP);
  pinMode(PIN_CONFIG_DIAGNOSTIC,INPUT_PULLUP);
  pinMode(PIN_CONFIG_TESSELLATE,INPUT_PULLUP);
  strip.begin();
  strip.setBrightness(4);
  strip.clear();
}

// the loop function runs over and over again forever
void loop() {
  //testLED0(true);
  //testStripWhite();
  testStripCounter();
  //testMagnet();
  //testBrightness();
}

void testLED0(bool isShow)
{
  if((millis() >> 11) % 2)
  {
    uint16_t hue=millis()*8*4;//set higher multiplication to cycle LEDs faster.  *16 is cycling full rainbow every ~8 seconds
    uint8_t  sat = 255;
    uint8_t  val = 255 ;
    strip.setPixelColor(0, strip.gamma32(strip.ColorHSV(hue, sat, val)));
  }else{
    uint16_t val=millis()*32*4;
    if(val&0x8000) val=255-((val>>7)&0x00FF);
    else val=(val>>7)&0x00FF;
    strip.setPixelColor(0, strip.Color(0,0,0,val));
  }
  if(isShow) strip.show();
}

void testStripWhite()
{//one white pixels walks through all LEDs
  strip.clear();
  byte iter=(millis()/64)%LED_COUNT;
  strip.setPixelColor(iter, strip.Color(0,0,0,255));
  strip.show();
}

void testStripCounter()
{
  strip.clear();
  for(byte iter=0;iter<((millis()/64)%(LED_COUNT+1));iter++)
  {
    strip.setPixelColor(iter, strip.Color(0,0,0,255));
  }
  testLED0(false);
  strip.show();
}

void testMagnet()
{
  strip.clear();
  for(byte iter=0;iter<readMagnetism()/4;iter++)
  {
    strip.setPixelColor(iter, strip.Color(0,0,0,255));
  }
  strip.show();
}

void testBrightness()
{
  strip.clear();
  for(byte iter=0;iter<readBrightness()/8;iter++)
  {
    strip.setPixelColor(iter, strip.Color(0,0,0,255));
  }
  strip.show();
}

void testSwitches()
{
  
}

//read the 10-bit ADC to get analog measurements: brightness configuration and magnet
word readMagnetism(){  return analogRead(PIN_MAGNET);     }
word readBrightness(){ return analogRead(PIN_BRIGHTNESS); }//getBrightness is already defined in LED library
//read touch button...

//read config settings
bool isUpdateDaily(){    return digitalRead(PIN_CONFIG_UPDATE_DAILY); }
bool isDiagnosticMode(){ return digitalRead(PIN_CONFIG_DIAGNOSTIC);   }
bool isTessellateMOde(){ return digitalRead(PIN_CONFIG_TESSELLATE);   }
