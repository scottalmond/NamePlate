EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L microUSB:10118194-0001LF J1
U 1 1 5F085B4E
P 3000 7150
F 0 "J1" H 3330 7196 50  0000 L CNN
F 1 "10118194-0001LF" H 3330 7105 50  0000 L CNN
F 2 "microUSB:AMPHENOL_10118194-0001LF" H 3000 7150 50  0001 L BNN
F 3 "Unavailable" H 3000 7150 50  0001 L BNN
F 4 "None" H 3000 7150 50  0001 L BNN "Field4"
F 5 "10118194-0001LF" H 3000 7150 50  0001 L BNN "Field5"
F 6 "Micro Usb, 2.0 Type b, Rcpt, Smt" H 3000 7150 50  0001 L BNN "Field6"
F 7 "None" H 3000 7150 50  0001 L BNN "Field7"
F 8 "Amphenol ICC" H 3000 7150 50  0001 L BNN "Field8"
	1    3000 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5F0875DC
P 2300 7250
F 0 "#PWR06" H 2300 7000 50  0001 C CNN
F 1 "GND" H 2305 7077 50  0000 C CNN
F 2 "" H 2300 7250 50  0001 C CNN
F 3 "" H 2300 7250 50  0001 C CNN
	1    2300 7250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR05
U 1 1 5F088492
P 2300 6850
F 0 "#PWR05" H 2300 6700 50  0001 C CNN
F 1 "+5V" H 2315 7023 50  0000 C CNN
F 2 "" H 2300 6850 50  0001 C CNN
F 3 "" H 2300 6850 50  0001 C CNN
	1    2300 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 6850 2500 6850
Wire Wire Line
	2500 7250 2300 7250
$Comp
L power:+5V #PWR03
U 1 1 5F091A2E
P 9600 3700
F 0 "#PWR03" H 9600 3550 50  0001 C CNN
F 1 "+5V" H 9615 3873 50  0000 C CNN
F 2 "" H 9600 3700 50  0001 C CNN
F 3 "" H 9600 3700 50  0001 C CNN
	1    9600 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5F09279C
P 9600 5800
F 0 "#PWR04" H 9600 5550 50  0001 C CNN
F 1 "GND" H 9605 5627 50  0000 C CNN
F 2 "" H 9600 5800 50  0001 C CNN
F 3 "" H 9600 5800 50  0001 C CNN
	1    9600 5800
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J3
U 1 1 5F0952DC
P 5100 7200
F 0 "J3" H 5150 7517 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 5150 7426 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical_SMD" H 5100 7200 50  0001 C CNN
F 3 "~" H 5100 7200 50  0001 C CNN
	1    5100 7200
	1    0    0    -1  
$EndComp
Text GLabel 4900 7100 0    50   Input ~ 0
UPDI_DATA
$Comp
L power:+5V #PWR0101
U 1 1 5F09BB12
P 5650 7100
F 0 "#PWR0101" H 5650 6950 50  0001 C CNN
F 1 "+5V" H 5665 7273 50  0000 C CNN
F 2 "" H 5650 7100 50  0001 C CNN
F 3 "" H 5650 7100 50  0001 C CNN
	1    5650 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 7100 5400 7100
$Comp
L power:GND #PWR0102
U 1 1 5F09DA58
P 5400 7300
F 0 "#PWR0102" H 5400 7050 50  0001 C CNN
F 1 "GND" H 5405 7127 50  0000 C CNN
F 2 "" H 5400 7300 50  0001 C CNN
F 3 "" H 5400 7300 50  0001 C CNN
	1    5400 7300
	1    0    0    -1  
$EndComp
Text Notes 4550 6650 0    50   ~ 0
UPDI Programming Header
Text GLabel 10200 4200 2    50   Input ~ 0
UPDI_DATA
NoConn ~ 5400 7200
NoConn ~ 4900 7200
NoConn ~ 4900 7300
Text Notes 7000 6450 0    50   ~ 0
Note: 2018 Attiny3216/1616 data sheet lists 6 PTC in pinout table, but coversheet adverttises 12.\nUse latest Attiny3216/3217 ref:\nhttp://ww1.microchip.com/downloads/en/DeviceDoc/ATtiny3216-17-DataSheet-DS40002205A.pdf
Text GLabel 10200 5100 2    50   Input ~ 0
PTC
$Comp
L Mechanical:Fiducial FID1
U 1 1 5F0C6423
P 6200 7250
F 0 "FID1" H 6285 7296 50  0000 L CNN
F 1 "Fiducial" H 6285 7205 50  0000 L CNN
F 2 "Fiducial:Fiducial_1mm_Mask2mm" H 6200 7250 50  0001 C CNN
F 3 "~" H 6200 7250 50  0001 C CNN
	1    6200 7250
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Fiducial FID2
U 1 1 5F0C71F4
P 6200 7450
F 0 "FID2" H 6285 7496 50  0000 L CNN
F 1 "Fiducial" H 6285 7405 50  0000 L CNN
F 2 "Fiducial:Fiducial_1mm_Mask2mm" H 6200 7450 50  0001 C CNN
F 3 "~" H 6200 7450 50  0001 C CNN
	1    6200 7450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Fiducial FID3
U 1 1 5F0C74B9
P 6200 7650
F 0 "FID3" H 6285 7696 50  0000 L CNN
F 1 "Fiducial" H 6285 7605 50  0000 L CNN
F 2 "Fiducial:Fiducial_1mm_Mask2mm" H 6200 7650 50  0001 C CNN
F 3 "~" H 6200 7650 50  0001 C CNN
	1    6200 7650
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5F0CE39F
P 6200 7000
F 0 "H2" H 6300 7046 50  0000 L CNN
F 1 "MountingHole" H 6300 6955 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.5mm" H 6200 7000 50  0001 C CNN
F 3 "~" H 6200 7000 50  0001 C CNN
	1    6200 7000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 5F0CEF00
P 6200 6750
F 0 "H1" H 6300 6796 50  0000 L CNN
F 1 "MountingHole" H 6300 6705 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.5mm" H 6200 6750 50  0001 C CNN
F 3 "~" H 6200 6750 50  0001 C CNN
	1    6200 6750
	1    0    0    -1  
$EndComp
Text Notes -2050 2450 0    50   ~ 0
verify ws2182 footprint\nverify pinout of led\nwriteup parts list\nattiny: PTC, program, hall effect, USB power, Array led\n2x3 pin #s? conn_02x03\nallow for pogo programming\nensure LEDs are OFF during program upload\nadd UPDI pinout to silk screen\npick screw size, figure out PCB outline\nenter in space between traces into layout preferences\nbuy anodized aluminum\nbuy two color acrylic - info badge\nnameplate screws: threaded standoff caps\ndesign for enclosure - height from LEDs\ntwo-piece standoff panel-hanging brackets\ncaptive pins appear cheaper\nPlastic-Head Thumb Screws\n4-40, 0.33/screw: https://www.mcmaster.com/91185A233/\nusb port on reverse side? no - top side reflow only\nround corners of pcb\nput arrow on RxD and TxD showing data flow direciton\nSense Line thickness should be between 0.1mm to 0.5mm\n T: front panel thickness, 1.6 mm\n6" max line length on sense lines
$Comp
L Jumper:SolderJumper_2_Bridged JP1
U 1 1 5F0D0914
P 7900 2300
F 0 "JP1" V 7854 2368 50  0000 L CNN
F 1 "SolderJumper_2_Bridged" V 7945 2368 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 7900 2300 50  0001 C CNN
F 3 "~" H 7900 2300 50  0001 C CNN
	1    7900 2300
	0    1    1    0   
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP2
U 1 1 5F0D2A26
P 7950 3500
F 0 "JP2" V 7904 3568 50  0000 L CNN
F 1 "SolderJumper_2_Bridged" V 7995 3568 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 7950 3500 50  0001 C CNN
F 3 "~" H 7950 3500 50  0001 C CNN
	1    7950 3500
	0    1    1    0   
$EndComp
Text GLabel 10200 4500 2    50   Input ~ 0
MAG
Text GLabel 10200 5300 2    50   Input ~ 0
TxD
Text GLabel 10200 5400 2    50   Input ~ 0
RxD
$Comp
L Sensor_Magnetic:AH1806-W U2
U 1 1 5F0FD1E7
P 1250 6950
F 0 "U2" V 1000 7000 50  0000 R CNN
F 1 "SI7211-B-00-IV" V 900 7300 50  0000 R CNN
F 2 "Package_TO_SOT_SMD:SC-59" H 1800 6600 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/AH1806.pdf" H 1250 6950 50  0001 C CNN
	1    1250 6950
	0    -1   -1   0   
$EndComp
Text Notes 550  7750 0    50   ~ 0
Alt (2x more sensitive, costs more)\nDRV5053VAQDBZR\n5 mT is strength of typical refrigerator magnet\nhttps://en.wikipedia.org/wiki/Orders_of_magnitude_(magnetic_field)
$Comp
L power:GND #PWR0103
U 1 1 5F0FE911
P 1650 6950
F 0 "#PWR0103" H 1650 6700 50  0001 C CNN
F 1 "GND" H 1655 6777 50  0000 C CNN
F 2 "" H 1650 6950 50  0001 C CNN
F 3 "" H 1650 6950 50  0001 C CNN
	1    1650 6950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0104
U 1 1 5F0FEC1D
P 800 6950
F 0 "#PWR0104" H 800 6800 50  0001 C CNN
F 1 "+5V" H 815 7123 50  0000 C CNN
F 2 "" H 800 6950 50  0001 C CNN
F 3 "" H 800 6950 50  0001 C CNN
	1    800  6950
	1    0    0    -1  
$EndComp
Text GLabel 1300 6600 2    50   Input ~ 0
MAG
$Comp
L power:GND #PWR0113
U 1 1 5F10678D
P 4250 6150
F 0 "#PWR0113" H 4250 5900 50  0001 C CNN
F 1 "GND" V 4255 6022 50  0000 R CNN
F 2 "" H 4250 6150 50  0001 C CNN
F 3 "" H 4250 6150 50  0001 C CNN
	1    4250 6150
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0114
U 1 1 5F106F19
P 4250 6050
F 0 "#PWR0114" H 4250 5900 50  0001 C CNN
F 1 "+5V" V 4265 6178 50  0000 L CNN
F 2 "" H 4250 6050 50  0001 C CNN
F 3 "" H 4250 6050 50  0001 C CNN
	1    4250 6050
	0    1    1    0   
$EndComp
Text GLabel 3750 6150 0    50   Input ~ 0
TxD
Text GLabel 3750 6050 0    50   Input ~ 0
RxD
Text Notes 3500 5750 0    50   ~ 0
Power & Data Interlink\nLeft/Right
Text Notes 5100 5650 0    50   ~ 0
Power & Data Interlink: Up/Down
$Comp
L Connector_Generic:Conn_01x04 J5
U 1 1 5F10C30E
P 5050 5800
F 0 "J5" V 5014 5512 50  0000 R CNN
F 1 "Conn_01x04" V 4923 5512 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 5050 5800 50  0001 C CNN
F 3 "~" H 5050 5800 50  0001 C CNN
	1    5050 5800
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J6
U 1 1 5F10D152
P 6100 6300
F 0 "J6" V 5972 6012 50  0000 R CNN
F 1 "Conn_01x04" V 6063 6012 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 6100 6300 50  0001 C CNN
F 3 "~" H 6100 6300 50  0001 C CNN
	1    6100 6300
	0    -1   1    0   
$EndComp
Text GLabel 5150 6000 3    50   Input ~ 0
RxD
Text GLabel 5250 6000 3    50   Input ~ 0
TxD
Text GLabel 6200 6100 1    50   Input ~ 0
TxD
Text GLabel 6300 6100 1    50   Input ~ 0
RxD
$Comp
L power:+5V #PWR0116
U 1 1 5F1116BB
P 4950 6000
F 0 "#PWR0116" H 4950 5850 50  0001 C CNN
F 1 "+5V" H 4965 6173 50  0000 C CNN
F 2 "" H 4950 6000 50  0001 C CNN
F 3 "" H 4950 6000 50  0001 C CNN
	1    4950 6000
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR0117
U 1 1 5F111E7A
P 6000 6100
F 0 "#PWR0117" H 6000 5950 50  0001 C CNN
F 1 "+5V" H 6015 6273 50  0000 C CNN
F 2 "" H 6000 6100 50  0001 C CNN
F 3 "" H 6000 6100 50  0001 C CNN
	1    6000 6100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 5F112453
P 5050 6200
F 0 "#PWR0118" H 5050 5950 50  0001 C CNN
F 1 "GND" H 5055 6027 50  0000 C CNN
F 2 "" H 5050 6200 50  0001 C CNN
F 3 "" H 5050 6200 50  0001 C CNN
	1    5050 6200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 5F112FA4
P 6100 5900
F 0 "#PWR0119" H 6100 5650 50  0001 C CNN
F 1 "GND" H 6105 5727 50  0000 C CNN
F 2 "" H 6100 5900 50  0001 C CNN
F 3 "" H 6100 5900 50  0001 C CNN
	1    6100 5900
	-1   0    0    1   
$EndComp
Wire Wire Line
	6100 5900 6100 6100
Wire Wire Line
	5050 6000 5050 6200
Text GLabel 10500 4900 2    50   Input ~ 0
LED_ROW0
Text GLabel 10200 4400 2    50   Input ~ 0
BRIGHTNESS
$Comp
L LED:WS2812B D6
U 1 1 5F13974B
P 2550 1650
F 0 "D6" H 2650 2050 50  0000 L CNN
F 1 "WS2812B" H 2650 1950 50  0000 L CNN
F 2 "WS2812B:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 2600 1350 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 2650 1275 50  0001 L TNN
	1    2550 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0122
U 1 1 5F139ED7
P 1950 1950
F 0 "#PWR0122" H 1950 1700 50  0001 C CNN
F 1 "GND" H 1955 1777 50  0000 C CNN
F 2 "" H 1950 1950 50  0001 C CNN
F 3 "" H 1950 1950 50  0001 C CNN
	1    1950 1950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0123
U 1 1 5F13A226
P 1950 1350
F 0 "#PWR0123" H 1950 1200 50  0001 C CNN
F 1 "+5V" H 1965 1523 50  0000 C CNN
F 2 "" H 1950 1350 50  0001 C CNN
F 3 "" H 1950 1350 50  0001 C CNN
	1    1950 1350
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D7
U 1 1 5F149E65
P 1950 2700
F 0 "D7" H 2050 3100 50  0000 L CNN
F 1 "WS2812B" H 2050 3000 50  0000 L CNN
F 2 "WS2812B:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 2000 2400 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 2050 2325 50  0001 L TNN
	1    1950 2700
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D8
U 1 1 5F14A3E6
P 1950 3750
F 0 "D8" H 2050 4150 50  0000 L CNN
F 1 "WS2812B" H 2050 4050 50  0000 L CNN
F 2 "WS2812B:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 2000 3450 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 2050 3375 50  0001 L TNN
	1    1950 3750
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D9
U 1 1 5F14AAFC
P 1950 4800
F 0 "D9" H 2050 5200 50  0000 L CNN
F 1 "WS2812B" H 2050 5100 50  0000 L CNN
F 2 "WS2812B:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 2000 4500 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 2050 4425 50  0001 L TNN
	1    1950 4800
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D11
U 1 1 5F14B350
P 2550 2700
F 0 "D11" H 2650 3100 50  0000 L CNN
F 1 "WS2812B" H 2650 3000 50  0000 L CNN
F 2 "WS2812B:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 2600 2400 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 2650 2325 50  0001 L TNN
	1    2550 2700
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D12
U 1 1 5F14B776
P 2550 3750
F 0 "D12" H 2650 4150 50  0000 L CNN
F 1 "WS2812B" H 2650 4050 50  0000 L CNN
F 2 "WS2812B:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 2600 3450 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 2650 3375 50  0001 L TNN
	1    2550 3750
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D10
U 1 1 5F14BC7D
P 2550 4800
F 0 "D10" H 2650 5200 50  0000 L CNN
F 1 "WS2812B" H 2650 5100 50  0000 L CNN
F 2 "WS2812B:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 2600 4500 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 2650 4425 50  0001 L TNN
	1    2550 4800
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x02_Odd_Even J2
U 1 1 5F151A43
P 3950 6050
F 0 "J2" H 4000 6267 50  0000 C CNN
F 1 "Conn_02x02_Odd_Even" H 4000 6176 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x02_P2.54mm_Vertical" H 3950 6050 50  0001 C CNN
F 3 "~" H 3950 6050 50  0001 C CNN
	1    3950 6050
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J4
U 1 1 5F176518
P 2600 6000
F 0 "J4" H 2680 6042 50  0000 L CNN
F 1 "Conn_01x01" H 2680 5951 50  0000 L CNN
F 2 "PTC:cap_touch" H 2600 6000 50  0001 C CNN
F 3 "~" H 2600 6000 50  0001 C CNN
	1    2600 6000
	1    0    0    -1  
$EndComp
Text GLabel 2400 6000 0    50   Input ~ 0
PTC
NoConn ~ 2500 6950
NoConn ~ 2500 7050
NoConn ~ 2500 7150
NoConn ~ 2500 7450
$Comp
L power:GND #PWR0111
U 1 1 5F18AC73
P 1650 6000
F 0 "#PWR0111" H 1650 5750 50  0001 C CNN
F 1 "GND" H 1655 5827 50  0000 C CNN
F 2 "" H 1650 6000 50  0001 C CNN
F 3 "" H 1650 6000 50  0001 C CNN
	1    1650 6000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0112
U 1 1 5F18B2F0
P 850 6000
F 0 "#PWR0112" H 850 5850 50  0001 C CNN
F 1 "+5V" H 865 6173 50  0000 C CNN
F 2 "" H 850 6000 50  0001 C CNN
F 3 "" H 850 6000 50  0001 C CNN
	1    850  6000
	1    0    0    -1  
$EndComp
Text GLabel 1300 5650 2    50   Input ~ 0
BRIGHTNESS
$Comp
L Device:C C1
U 1 1 5F1952A3
P 9400 3800
F 0 "C1" V 9148 3800 50  0000 C CNN
F 1 "47uF" V 9239 3800 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9438 3650 50  0001 C CNN
F 3 "~" H 9400 3800 50  0001 C CNN
	1    9400 3800
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5F1973A3
P 9200 3850
F 0 "#PWR0115" H 9200 3600 50  0001 C CNN
F 1 "GND" H 9205 3677 50  0000 C CNN
F 2 "" H 9200 3850 50  0001 C CNN
F 3 "" H 9200 3850 50  0001 C CNN
	1    9200 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 3700 9600 3800
Wire Wire Line
	9250 3800 9200 3800
Wire Wire Line
	9200 3800 9200 3850
Wire Wire Line
	9550 3800 9600 3800
Connection ~ 9600 3800
Wire Wire Line
	9600 3800 9600 4000
$Comp
L TC33X-2-103E:TC33X-2-103E R1
U 1 1 5F19D879
P 1250 6000
F 0 "R1" H 1250 5725 50  0000 C CNN
F 1 "TC33X-2-103E" H 1250 5634 50  0000 C CNN
F 2 "TC33X-2-103E:35WR" H 1250 6000 50  0001 L BNN
F 3 "" H 1250 6000 50  0001 C CNN
	1    1250 6000
	1    0    0    -1  
$EndComp
NoConn ~ 10200 5600
NoConn ~ 10200 5200
NoConn ~ 10200 4800
NoConn ~ 10200 4700
NoConn ~ 10200 4600
NoConn ~ 10200 4300
NoConn ~ 9000 5100
NoConn ~ 9000 5200
NoConn ~ 9000 5300
NoConn ~ 9000 5400
Text GLabel 1050 4800 0    50   Input ~ 0
LED_ROW3
$Comp
L LED:WS2812B D4
U 1 1 5F0BB0E7
P 1350 4800
F 0 "D4" H 1450 5200 50  0000 L CNN
F 1 "WS2812B" H 1450 5100 50  0000 L CNN
F 2 "WS2812B:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 1400 4500 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 1450 4425 50  0001 L TNN
	1    1350 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5F0BDEB7
P 1350 5100
F 0 "#PWR0109" H 1350 4850 50  0001 C CNN
F 1 "GND" H 1355 4927 50  0000 C CNN
F 2 "" H 1350 5100 50  0001 C CNN
F 3 "" H 1350 5100 50  0001 C CNN
	1    1350 5100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0110
U 1 1 5F0BE689
P 1350 4500
F 0 "#PWR0110" H 1350 4350 50  0001 C CNN
F 1 "+5V" H 1365 4673 50  0000 C CNN
F 2 "" H 1350 4500 50  0001 C CNN
F 3 "" H 1350 4500 50  0001 C CNN
	1    1350 4500
	1    0    0    -1  
$EndComp
Text GLabel 1050 3750 0    50   Input ~ 0
LED_ROW2
$Comp
L LED:WS2812B D3
U 1 1 5F0BAC82
P 1350 3750
F 0 "D3" H 1450 4150 50  0000 L CNN
F 1 "WS2812B" H 1450 4050 50  0000 L CNN
F 2 "WS2812B:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 1400 3450 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 1450 3375 50  0001 L TNN
	1    1350 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5F0BDA39
P 1350 4050
F 0 "#PWR0108" H 1350 3800 50  0001 C CNN
F 1 "GND" H 1355 3877 50  0000 C CNN
F 2 "" H 1350 4050 50  0001 C CNN
F 3 "" H 1350 4050 50  0001 C CNN
	1    1350 4050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0107
U 1 1 5F0BD3A9
P 1350 3450
F 0 "#PWR0107" H 1350 3300 50  0001 C CNN
F 1 "+5V" H 1365 3623 50  0000 C CNN
F 2 "" H 1350 3450 50  0001 C CNN
F 3 "" H 1350 3450 50  0001 C CNN
	1    1350 3450
	1    0    0    -1  
$EndComp
Text GLabel 1050 2700 0    50   Input ~ 0
LED_ROW1
$Comp
L LED:WS2812B D2
U 1 1 5F0BA180
P 1350 2700
F 0 "D2" H 1450 3100 50  0000 L CNN
F 1 "WS2812B" H 1450 3000 50  0000 L CNN
F 2 "WS2812B:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 1400 2400 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 1450 2325 50  0001 L TNN
	1    1350 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5F0BD0EA
P 1350 3000
F 0 "#PWR0106" H 1350 2750 50  0001 C CNN
F 1 "GND" H 1355 2827 50  0000 C CNN
F 2 "" H 1350 3000 50  0001 C CNN
F 3 "" H 1350 3000 50  0001 C CNN
	1    1350 3000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0105
U 1 1 5F0BCC2D
P 1350 2400
F 0 "#PWR0105" H 1350 2250 50  0001 C CNN
F 1 "+5V" H 1365 2573 50  0000 C CNN
F 2 "" H 1350 2400 50  0001 C CNN
F 3 "" H 1350 2400 50  0001 C CNN
	1    1350 2400
	1    0    0    -1  
$EndComp
Text GLabel 1050 1650 0    50   Input ~ 0
LED_ROW0
$Comp
L power:+5V #PWR01
U 1 1 5F090F16
P 1350 1350
F 0 "#PWR01" H 1350 1200 50  0001 C CNN
F 1 "+5V" H 1365 1523 50  0000 C CNN
F 2 "" H 1350 1350 50  0001 C CNN
F 3 "" H 1350 1350 50  0001 C CNN
	1    1350 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5F087260
P 1350 1950
F 0 "#PWR02" H 1350 1700 50  0001 C CNN
F 1 "GND" H 1355 1777 50  0000 C CNN
F 2 "" H 1350 1950 50  0001 C CNN
F 3 "" H 1350 1950 50  0001 C CNN
	1    1350 1950
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D1
U 1 1 5F081D5E
P 1350 1650
F 0 "D1" H 1450 2050 50  0000 L CNN
F 1 "WS2812B" H 1450 1950 50  0000 L CNN
F 2 "WS2812B:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 1400 1350 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 1450 1275 50  0001 L TNN
	1    1350 1650
	1    0    0    -1  
$EndComp
Text Notes 650  1050 0    50   ~ 0
AtTiny3216: Ample Flash for designs, $1/unit, well supported, Capacitive Touch\nX COLS x 5 ROWS LEDs WS2812B, $0.09/unit@1000, Tall enough for 5-pixel alpha numeric, aspect ratio of name tag\n5V micro USB power: COTS USB solution, about 1/3rd cost of USB-C\n- multiple footprints to give design flexibility (only pop one in production unit)\nAllow for user input via magnet (Hall effect sensor)\nprogram over 100 mil 2x3?\nFeed last LED back to processor for functionality check\nconsider allowing 4x PCBs to be combiuned for 2x2 bigger display\n- flip L/R and flip U/D config\nallow for 5V power over hollw bolt from rear of unit\n3.81 mm body height + 5.84 mm mating = 9.65 mm min height from pcb, 0.38", 3/8"\nedge tolerance +-0.15 mm --> allow 0.3 mm between CCAs, 12 mils\nconsidered using all 12 cap touch sensors as a slider along the top/bottom of device.  Too many driving constraints (isolation, line length, etc) to implment\n0.3 mm/12 mil edge to copper keep out\nadd 10k pot for user input on brightness
$Comp
L LED:WS2812B D5
U 1 1 5F12ECF4
P 1950 1650
F 0 "D5" H 2050 2050 50  0000 L CNN
F 1 "WS2812B" H 2050 1950 50  0000 L CNN
F 2 "WS2812B:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 2000 1350 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 2050 1275 50  0001 L TNN
	1    1950 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 5650 1300 5650
Wire Wire Line
	800  6950 850  6950
Wire Wire Line
	1300 6600 1250 6600
Wire Wire Line
	1250 6600 1250 6650
Wire Notes Line
	6950 6500 6950 5500
Wire Notes Line
	6950 5500 500  5500
Wire Notes Line
	500  6450 6950 6450
Wire Notes Line
	5850 6450 5850 7750
Wire Notes Line
	4200 6450 4200 7750
Wire Notes Line
	4700 6450 4700 5500
Wire Notes Line
	3250 6450 3250 5500
Wire Notes Line
	2000 5500 2000 7500
Text Notes 2700 6650 0    50   ~ 0
USB Power Input
Text Notes 2300 5700 0    50   ~ 0
User Touch Input
Text Notes 550  5800 0    50   ~ 0
Potentiometer\nBrighntess\nAdjust
Text Notes 6000 6600 0    50   ~ 0
Holes and Fiducials
$Comp
L Device:R R2
U 1 1 5F1F6185
P 10350 4900
F 0 "R2" V 10143 4900 50  0000 C CNN
F 1 "470R" V 10234 4900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 10280 4900 50  0001 C CNN
F 3 "~" H 10350 4900 50  0001 C CNN
	1    10350 4900
	0    1    1    0   
$EndComp
$Comp
L MCU_Microchip_ATtiny:ATtiny3216-S U1
U 1 1 5F082F06
P 9600 4900
F 0 "U1" H 9750 6000 50  0000 L CNN
F 1 "ATtiny3216-S" H 9750 5900 50  0000 L CNN
F 2 "Package_SO:SOIC-20W_7.5x12.8mm_P1.27mm" H 9600 4900 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATtiny3216_ATtiny1616-data-sheet-40001997B.pdf" H 9600 4900 50  0001 C CNN
	1    9600 4900
	1    0    0    -1  
$EndComp
NoConn ~ 10200 5500
$Comp
L power:+5V #PWR0120
U 1 1 5F209645
P 2550 1350
F 0 "#PWR0120" H 2550 1200 50  0001 C CNN
F 1 "+5V" H 2565 1523 50  0000 C CNN
F 2 "" H 2550 1350 50  0001 C CNN
F 3 "" H 2550 1350 50  0001 C CNN
	1    2550 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0121
U 1 1 5F209902
P 2550 1950
F 0 "#PWR0121" H 2550 1700 50  0001 C CNN
F 1 "GND" H 2555 1777 50  0000 C CNN
F 2 "" H 2550 1950 50  0001 C CNN
F 3 "" H 2550 1950 50  0001 C CNN
	1    2550 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0124
U 1 1 5F209B12
P 1950 3000
F 0 "#PWR0124" H 1950 2750 50  0001 C CNN
F 1 "GND" H 1955 2827 50  0000 C CNN
F 2 "" H 1950 3000 50  0001 C CNN
F 3 "" H 1950 3000 50  0001 C CNN
	1    1950 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 5F209F24
P 2550 3000
F 0 "#PWR0125" H 2550 2750 50  0001 C CNN
F 1 "GND" H 2555 2827 50  0000 C CNN
F 2 "" H 2550 3000 50  0001 C CNN
F 3 "" H 2550 3000 50  0001 C CNN
	1    2550 3000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0126
U 1 1 5F20A166
P 1950 2400
F 0 "#PWR0126" H 1950 2250 50  0001 C CNN
F 1 "+5V" H 1965 2573 50  0000 C CNN
F 2 "" H 1950 2400 50  0001 C CNN
F 3 "" H 1950 2400 50  0001 C CNN
	1    1950 2400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0127
U 1 1 5F20A4CB
P 2550 2400
F 0 "#PWR0127" H 2550 2250 50  0001 C CNN
F 1 "+5V" H 2565 2573 50  0000 C CNN
F 2 "" H 2550 2400 50  0001 C CNN
F 3 "" H 2550 2400 50  0001 C CNN
	1    2550 2400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0128
U 1 1 5F20A88E
P 1950 3450
F 0 "#PWR0128" H 1950 3300 50  0001 C CNN
F 1 "+5V" H 1965 3623 50  0000 C CNN
F 2 "" H 1950 3450 50  0001 C CNN
F 3 "" H 1950 3450 50  0001 C CNN
	1    1950 3450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0129
U 1 1 5F20ACAB
P 2550 3450
F 0 "#PWR0129" H 2550 3300 50  0001 C CNN
F 1 "+5V" H 2565 3623 50  0000 C CNN
F 2 "" H 2550 3450 50  0001 C CNN
F 3 "" H 2550 3450 50  0001 C CNN
	1    2550 3450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0130
U 1 1 5F20B05B
P 1950 4500
F 0 "#PWR0130" H 1950 4350 50  0001 C CNN
F 1 "+5V" H 1965 4673 50  0000 C CNN
F 2 "" H 1950 4500 50  0001 C CNN
F 3 "" H 1950 4500 50  0001 C CNN
	1    1950 4500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0131
U 1 1 5F20B57E
P 2550 4500
F 0 "#PWR0131" H 2550 4350 50  0001 C CNN
F 1 "+5V" H 2565 4673 50  0000 C CNN
F 2 "" H 2550 4500 50  0001 C CNN
F 3 "" H 2550 4500 50  0001 C CNN
	1    2550 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0132
U 1 1 5F20B948
P 1950 4050
F 0 "#PWR0132" H 1950 3800 50  0001 C CNN
F 1 "GND" H 1955 3877 50  0000 C CNN
F 2 "" H 1950 4050 50  0001 C CNN
F 3 "" H 1950 4050 50  0001 C CNN
	1    1950 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0133
U 1 1 5F20BC7E
P 2550 4050
F 0 "#PWR0133" H 2550 3800 50  0001 C CNN
F 1 "GND" H 2555 3877 50  0000 C CNN
F 2 "" H 2550 4050 50  0001 C CNN
F 3 "" H 2550 4050 50  0001 C CNN
	1    2550 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0134
U 1 1 5F20BED3
P 1950 5100
F 0 "#PWR0134" H 1950 4850 50  0001 C CNN
F 1 "GND" H 1955 4927 50  0000 C CNN
F 2 "" H 1950 5100 50  0001 C CNN
F 3 "" H 1950 5100 50  0001 C CNN
	1    1950 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0135
U 1 1 5F20C126
P 2550 5100
F 0 "#PWR0135" H 2550 4850 50  0001 C CNN
F 1 "GND" H 2555 4927 50  0000 C CNN
F 2 "" H 2550 5100 50  0001 C CNN
F 3 "" H 2550 5100 50  0001 C CNN
	1    2550 5100
	1    0    0    -1  
$EndComp
$EndSCHEMATC
