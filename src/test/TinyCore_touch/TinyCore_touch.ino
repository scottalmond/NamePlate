#include "TinyTouch.h"

#define TOUCH_TRIGGER_VALUE 800


TinyTouch touch;

//pin remapping https://raw.githubusercontent.com/xukangmin/TinyCore/master/avr/docs/images/TinyCore32_Pinout_V1.png
//PIN_PB0 --> A10 touch
//PIN_PA7 --> 16 LED
uint8_t touchPins[1] = {16}; //initialize touch pins

void setup() {
    touch.begin(touchPins, sizeof(touchPins));

    pinMode(16, OUTPUT);
}

void loop() {
    touch.touchHandle();

    if (touch.getValue(0) > TOUCH_TRIGGER_VALUE or touch.getValue(1) > TOUCH_TRIGGER_VALUE) {
        digitalWrite(16, HIGH);
    } else {
        digitalWrite(16, LOW);
    }
}
