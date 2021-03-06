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

## Programmer

Direct referenced from: http://www.technoblogy.com/show?2OCH

- Install ElTangas's jtag2updi on Arduino Uno, Duemilanova or equivalent ATmega328p.  -- Details for making UPDI programmer: https://github.com/SpenceKonde/megaTinyCore/blob/master/MakeUPDIProgrammer.md
-- Use pin PD6 for UPDI I/O
- Install Spence Konde's megaTinyCore in the Arduino IDE
-- Instructions: https://github.com/SpenceKonde/megaTinyCore/blob/master/Installation.md
-- add to additional board URLs: http://drazzy.com/package_drazzy.com_index.json
-- boards manager add: "megaTinyCore" v2.0.5
- Upload settings:
-- Processor: ATtiny3216
-- 4.2 V BOD
-- 16 MHz
-- Programmer: jtag2updi

J8:
Pin 1: UPDI
Pin 2: +5V
Pin 6: GND

## Processor

doc: http://ww1.microchip.com/downloads/en/DeviceDoc/ATtiny3216-17-DataSheet-DS40002205A.pdf

# Periphreals

## DC Power

Note that this unit can sink substancial current.  It is recommended to power the unit with a 5V USB adapter capable of sourcing 2 Amps or more.

## LEDs [PA7]



## Touch Button [PB0]

Touching and releasing the very upper-left corner of the device for nominally 0.5 seconds will register a tap.  The unit will transition  between display patterns.

## Hall effect sensor [PA3]

Place a fridge or hard drive magnet just above the USB port.  This will activate <TBD function - implemented as fallback if PTC was problematic>

## Brightness Potentiometer [PA2]

Uncover the circuit board by removing the two thumb screws on either side of the faceplate.  Rotate the Philips potentiometer at the bottom left of the unit CW (?) to increase brightness.

## DIP Switch Settings [PA6, PA5, PA4]

Position 1:
Set to "OFF" to allow the displayed pattern to automaically update daily.  Set to "ON" to hold the currrently displayed pattern indefinitely.

Position 2:
Set to "ON" to configure the unit for collaboration mode.  In this mode the unit will communicate with other circuit boards to coordinate the displayed pattern.  For single PCB operation, the normal operation mode is "OFF".

Position 3:
Set to "ON" to enable diagnostic mode to allow verification and troublshooting of the user interfaces and outputs.  "OFF" is normal device operation.

Position 4:
Set to "ON" to connect the ID pin of the microUSB port to to the UPDI pin on the micro controller.  This is used for programming of the device without removing the circuit board from the casing.  "OFF" is normal operation.

# Collaboration Mode [PxD: PB2, RxD: PB3]

Multiple PCBs can be linked together to produce a larger display.  
<TBR>

# TODO

Add area for writing in owner name on PCB, for tracking units through development (if code differs)
Add CC BY 4.0 license to schematic
add year produced to PCB
>>> allow for batteyr power and power switch
>>> consider accel and swinging unit to create persistence of vision text display
add schematic links to readme.md
get solder paste with thinner tip
*** move micro USB header - difficult to reach for rework with config switches behind it (layout design issue)
note: LED is N/C in layout - why not flagged in DRc...?
b/c omitted connection in schematic due to copy-paste omission...
***fix D60 connection to 5V in next rev (schematic DRC issue)
-- run DRC in schematic too...
note: screw reads ~4V on delivery
magnet stuck at 0.87V despite exposure to hard drive magnet...
tried with pullup, still rigid at 0.87V
part is hot to the touch
note, the schematic part is AH1806 (hall switch) which has different pinout
- used this footprint because no footprint was supplied by vendor
*** next rev to swap pins 2 and 3 (schematic footprint issue)
consider testability point for EVERY IO
in user guide, include diagrams of expected UI screen output, ref 11.7V battery charger manual
include build number in start up script
compare findings on this CCA vs pendant which had button rotate 90 degrees (schematic footprint issue) and traces too close to holes (layout issue)
consider swapping hall effect sensor and brightness - allow greater accessibility to magnetic input
note:0.37" from LED-surface to top of programming header [note: 0.38" per data sheet, erxcluding solder]
contiguous undervolt - dim screen brighntess (LiPo response to dropping voltage)
min stackup (NO 1/16" acry): pcb 1.6 mm/0.063", 100 mil UPDI: 0.37", 0.125" acrylic face, 0.05" margin: 0.608"
max stackup (NO 1/16" acry): [5 turns 4-40 is 0.1250"] [50 mil backing], 200 mil standoff, 0.608" from above: 0.808"
min w/ 1/16 acry: 0.63+ above = 0.671"
max w/ 1/16 acry: 0.63+ above = 0.871"
note: thumb screw head 11/64" thick BEYOND base length above
0.75" is max length fully threaded.  next step up is 1"
note: head diameter on thumb screw is 5/16"
.75-1/8"+.05 back = 
box height at 0.8".  Add 1/16" when fabricating with acrylic
>>> enlarge PCB holes to be close fit.  Currently too small
allow for flipping vertically - flip flag, matrix rtain, etc
>>> consider moving silk screen contact info to behind a hole in the back of the unit
v1-0 --> v1-1 case:
50 mil WAS --> 100 mil IS margin inside pcb-to-case
50 mil WAS --> 150 mil IS wall thickness
WAS circle vent holes --> IS diamond vent holes --> will turn off supports
WAS 4x PCB holders, IS 2x PCB holders in the center
WAS NO chamfer inside unit --> IS chamfer around inner edge to provide wall support
WAS 4x faceplate holders --> IS NO facaeplate holders
WAS NO USB port --> IS USB PORT --> need dimensions of usb plug, and concern with unsupported 3d print
micro usb header metal = 0.07", 0.2" from opposing side of usb to verrtical case edge, 0.31" total
0.27" wide, 0.35" from opposing edge to case, 0.43" total
kicad center hole at 3.8" Y, 4.083" for microUSB port center
microUSB center 1.2 mm above surface of PCB
consider first boot (all 1's in EEPROM) to debug chaper.  First user input to change EEPROM exits hidden chapter
*** consider screw slots due to 3d print contraction
current draw?
leakage through usb port?
*** add lip to top edge to hide cut paper
consider standoffs (3d print?)
wasn't thinking about plastic contraction between ~10" separated holes
didn't think about light leakage through walls of solid plastic
note: the link from this pcb to others on the top/bottom has led pads very clodse to the power/ground rails
note: grips to hold pcb in place are non-effective (pcb too thin?)
consider pcb design features that allow for 2x rows of LEDs, NOT 4
didn't realize how short the final letts would be
debug screen: voltage, build #
1.8A at full brightness in full-screen mode (green colors)