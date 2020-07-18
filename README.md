# Name Plate Overview

Many cubicles are adorned with a standard aluminum name plate holding a piece of paper denoting the occupant's name.  This project presents an upgraded name tag that is backlit with LEDs.

This project was started as something simple to get active again after the COVID-19 lockdown.  Intent was to produce a visually engaging product with a price point at or below $25 in small production runs (10 units) to be in compliance with corporate gifting guidelines.

This unit employs nominally 100 WS2812B "NeoPixel" RGBW LEDs.  An ATtiny3216 was selected as a well supported processor (Arduino IDE) with a sizable flash memory (32kB).  To keep the design margin large, the SOIC package was selected.

The user can adjust the brightness of the unit through a potentiometer.  A Periphreal Touch Controller button allows quick user input while a hall effect sensor allows administrative functions.  A DIP switch allows for operation mode selection

# Assembled Unit



# Constituent Components

## Bill of Materials



## PCB

![CCA Front](https://github.com/scottalmond/NamePlate/blob/master/pcb/v1-0/cca_front.png)
![CCA Back](https://github.com/scottalmond/NamePlate/blob/master/pcb/v1-0/cca_back.png)

## Case

## Display Mask

## Face Plate

# User Input

## DC Power

Note that this unit can sink substancial current.  It is recommended to power the unit with a 5V USB adapter capable of sourcing 2 Amps or more.

## Touch Button

Touching and releasing the very upper-left corner of the device for nominally 0.5 seconds will register a tap.  The unit will transition  between display patterns.

## Hall effect sensor

Place a fridge or hard drive magnet just above the USB port.  This will activate <TBD function - implemented as fallback if PTC was problematic>

## Potentiometer

Uncover the circuit board by removing the two thumb screws on either side of the faceplate.  Rotate the Philips potentiometer at the bottom left of the unit CW (?) to increase brightness.

## DIP Switch Settings

Position 1:
Set to "OFF" to allow the displayed pattern to automaically update daily.  Set to "ON" to hold the currrently displayed pattern indefinitely.

Position 2:
Set to "ON" to configure the unit for collaboration mode.  In this mode the unit will communicate with other circuit boards to coordinate the displayed pattern.  For single PCB operation, the normal operation mode is "OFF".

Position 3:
Set to "ON" to enable diagnostic mode to allow verification and troublshooting of the user interfaces and outputs.  "OFF" is normal device operation.

Position 4:
Set to "ON" to connect the ID pin of the microUSB port to to the UPDI pin on the micro controller.  This is used for programming of the device without removing the circuit board from the casing.  "OFF" is normal operation.

# Collaboration Mode

Multiple PCBs can be linked together to produce a larger display.  
<TBR>

# TODO

Add area for writing in owner name on PCB, for tracking units through development (if code differs)
Add CC BY 4.0 license to schematic

