EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
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
L microUSB:10118194-0001LF J?
U 1 1 5F2A31A2
P 3000 7150
AR Path="/5F2A31A2" Ref="J?"  Part="1" 
AR Path="/5F23BB4A/5F2A31A2" Ref="J?"  Part="1" 
F 0 "J?" H 3330 7196 50  0000 L CNN
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
L power:GND #PWR?
U 1 1 5F2A31A8
P 2300 7250
AR Path="/5F2A31A8" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A31A8" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2300 7000 50  0001 C CNN
F 1 "GND" H 2305 7077 50  0000 C CNN
F 2 "" H 2300 7250 50  0001 C CNN
F 3 "" H 2300 7250 50  0001 C CNN
	1    2300 7250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F2A31AE
P 2300 6850
AR Path="/5F2A31AE" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A31AE" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2300 6700 50  0001 C CNN
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
L power:+5V #PWR?
U 1 1 5F2A31B6
P 9600 3700
AR Path="/5F2A31B6" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A31B6" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9600 3550 50  0001 C CNN
F 1 "+5V" H 9615 3873 50  0000 C CNN
F 2 "" H 9600 3700 50  0001 C CNN
F 3 "" H 9600 3700 50  0001 C CNN
	1    9600 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F2A31BC
P 9600 5800
AR Path="/5F2A31BC" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A31BC" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9600 5550 50  0001 C CNN
F 1 "GND" H 9605 5627 50  0000 C CNN
F 2 "" H 9600 5800 50  0001 C CNN
F 3 "" H 9600 5800 50  0001 C CNN
	1    9600 5800
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J?
U 1 1 5F2A31C2
P 5100 7200
AR Path="/5F2A31C2" Ref="J?"  Part="1" 
AR Path="/5F23BB4A/5F2A31C2" Ref="J?"  Part="1" 
F 0 "J?" H 5150 7517 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 5150 7426 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical_SMD" H 5100 7200 50  0001 C CNN
F 3 "~" H 5100 7200 50  0001 C CNN
	1    5100 7200
	1    0    0    -1  
$EndComp
Text GLabel 4900 7100 0    50   Input ~ 0
UPDI_DATA
$Comp
L power:+5V #PWR?
U 1 1 5F2A31C9
P 5650 7100
AR Path="/5F2A31C9" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A31C9" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5650 6950 50  0001 C CNN
F 1 "+5V" H 5665 7273 50  0000 C CNN
F 2 "" H 5650 7100 50  0001 C CNN
F 3 "" H 5650 7100 50  0001 C CNN
	1    5650 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 7100 5400 7100
$Comp
L power:GND #PWR?
U 1 1 5F2A31D0
P 5400 7300
AR Path="/5F2A31D0" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A31D0" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5400 7050 50  0001 C CNN
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
L Mechanical:Fiducial FID?
U 1 1 5F2A31DD
P 6200 7250
AR Path="/5F2A31DD" Ref="FID?"  Part="1" 
AR Path="/5F23BB4A/5F2A31DD" Ref="FID?"  Part="1" 
F 0 "FID?" H 6285 7296 50  0000 L CNN
F 1 "Fiducial" H 6285 7205 50  0000 L CNN
F 2 "Fiducial:Fiducial_1mm_Mask2mm" H 6200 7250 50  0001 C CNN
F 3 "~" H 6200 7250 50  0001 C CNN
	1    6200 7250
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Fiducial FID?
U 1 1 5F2A31E3
P 6200 7450
AR Path="/5F2A31E3" Ref="FID?"  Part="1" 
AR Path="/5F23BB4A/5F2A31E3" Ref="FID?"  Part="1" 
F 0 "FID?" H 6285 7496 50  0000 L CNN
F 1 "Fiducial" H 6285 7405 50  0000 L CNN
F 2 "Fiducial:Fiducial_1mm_Mask2mm" H 6200 7450 50  0001 C CNN
F 3 "~" H 6200 7450 50  0001 C CNN
	1    6200 7450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Fiducial FID?
U 1 1 5F2A31E9
P 6200 7650
AR Path="/5F2A31E9" Ref="FID?"  Part="1" 
AR Path="/5F23BB4A/5F2A31E9" Ref="FID?"  Part="1" 
F 0 "FID?" H 6285 7696 50  0000 L CNN
F 1 "Fiducial" H 6285 7605 50  0000 L CNN
F 2 "Fiducial:Fiducial_1mm_Mask2mm" H 6200 7650 50  0001 C CNN
F 3 "~" H 6200 7650 50  0001 C CNN
	1    6200 7650
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H?
U 1 1 5F2A31EF
P 6200 7000
AR Path="/5F2A31EF" Ref="H?"  Part="1" 
AR Path="/5F23BB4A/5F2A31EF" Ref="H?"  Part="1" 
F 0 "H?" H 6300 7046 50  0000 L CNN
F 1 "MountingHole" H 6300 6955 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.5mm" H 6200 7000 50  0001 C CNN
F 3 "~" H 6200 7000 50  0001 C CNN
	1    6200 7000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H?
U 1 1 5F2A31F5
P 6200 6750
AR Path="/5F2A31F5" Ref="H?"  Part="1" 
AR Path="/5F23BB4A/5F2A31F5" Ref="H?"  Part="1" 
F 0 "H?" H 6300 6796 50  0000 L CNN
F 1 "MountingHole" H 6300 6705 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.5mm" H 6200 6750 50  0001 C CNN
F 3 "~" H 6200 6750 50  0001 C CNN
	1    6200 6750
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP?
U 1 1 5F2A31FC
P 7900 2300
AR Path="/5F2A31FC" Ref="JP?"  Part="1" 
AR Path="/5F23BB4A/5F2A31FC" Ref="JP?"  Part="1" 
F 0 "JP?" V 7854 2368 50  0000 L CNN
F 1 "SolderJumper_2_Bridged" V 7945 2368 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 7900 2300 50  0001 C CNN
F 3 "~" H 7900 2300 50  0001 C CNN
	1    7900 2300
	0    1    1    0   
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP?
U 1 1 5F2A3202
P 7950 3500
AR Path="/5F2A3202" Ref="JP?"  Part="1" 
AR Path="/5F23BB4A/5F2A3202" Ref="JP?"  Part="1" 
F 0 "JP?" V 7904 3568 50  0000 L CNN
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
L Sensor_Magnetic:AH1806-W U?
U 1 1 5F2A320B
P 1250 6950
AR Path="/5F2A320B" Ref="U?"  Part="1" 
AR Path="/5F23BB4A/5F2A320B" Ref="U?"  Part="1" 
F 0 "U?" V 1000 7000 50  0000 R CNN
F 1 "SI7211-B-00-IV" V 900 7300 50  0000 R CNN
F 2 "Package_TO_SOT_SMD:SC-59" H 1800 6600 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/AH1806.pdf" H 1250 6950 50  0001 C CNN
	1    1250 6950
	0    -1   -1   0   
$EndComp
Text Notes 550  7750 0    50   ~ 0
Alt (2x more sensitive, costs more)\nDRV5053VAQDBZR\n5 mT is strength of typical refrigerator magnet\nhttps://en.wikipedia.org/wiki/Orders_of_magnitude_(magnetic_field)
$Comp
L power:GND #PWR?
U 1 1 5F2A3212
P 1650 6950
AR Path="/5F2A3212" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A3212" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1650 6700 50  0001 C CNN
F 1 "GND" H 1655 6777 50  0000 C CNN
F 2 "" H 1650 6950 50  0001 C CNN
F 3 "" H 1650 6950 50  0001 C CNN
	1    1650 6950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F2A3218
P 800 6950
AR Path="/5F2A3218" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A3218" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 800 6800 50  0001 C CNN
F 1 "+5V" H 815 7123 50  0000 C CNN
F 2 "" H 800 6950 50  0001 C CNN
F 3 "" H 800 6950 50  0001 C CNN
	1    800  6950
	1    0    0    -1  
$EndComp
Text GLabel 1300 6600 2    50   Input ~ 0
MAG
$Comp
L power:GND #PWR?
U 1 1 5F2A321F
P 4250 6150
AR Path="/5F2A321F" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A321F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4250 5900 50  0001 C CNN
F 1 "GND" V 4255 6022 50  0000 R CNN
F 2 "" H 4250 6150 50  0001 C CNN
F 3 "" H 4250 6150 50  0001 C CNN
	1    4250 6150
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F2A3225
P 4250 6050
AR Path="/5F2A3225" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A3225" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4250 5900 50  0001 C CNN
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
L Connector_Generic:Conn_01x04 J?
U 1 1 5F2A322F
P 5050 5800
AR Path="/5F2A322F" Ref="J?"  Part="1" 
AR Path="/5F23BB4A/5F2A322F" Ref="J?"  Part="1" 
F 0 "J?" V 5014 5512 50  0000 R CNN
F 1 "Conn_01x04" V 4923 5512 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 5050 5800 50  0001 C CNN
F 3 "~" H 5050 5800 50  0001 C CNN
	1    5050 5800
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J?
U 1 1 5F2A3235
P 6100 6300
AR Path="/5F2A3235" Ref="J?"  Part="1" 
AR Path="/5F23BB4A/5F2A3235" Ref="J?"  Part="1" 
F 0 "J?" V 5972 6012 50  0000 R CNN
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
L power:+5V #PWR?
U 1 1 5F2A323F
P 4950 6000
AR Path="/5F2A323F" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A323F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4950 5850 50  0001 C CNN
F 1 "+5V" H 4965 6173 50  0000 C CNN
F 2 "" H 4950 6000 50  0001 C CNN
F 3 "" H 4950 6000 50  0001 C CNN
	1    4950 6000
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F2A3245
P 6000 6100
AR Path="/5F2A3245" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A3245" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6000 5950 50  0001 C CNN
F 1 "+5V" H 6015 6273 50  0000 C CNN
F 2 "" H 6000 6100 50  0001 C CNN
F 3 "" H 6000 6100 50  0001 C CNN
	1    6000 6100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F2A324B
P 5050 6200
AR Path="/5F2A324B" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A324B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5050 5950 50  0001 C CNN
F 1 "GND" H 5055 6027 50  0000 C CNN
F 2 "" H 5050 6200 50  0001 C CNN
F 3 "" H 5050 6200 50  0001 C CNN
	1    5050 6200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F2A3251
P 6100 5900
AR Path="/5F2A3251" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A3251" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6100 5650 50  0001 C CNN
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
L LED:WS2812B D?
U 1 1 5F2A325B
P 2550 1650
AR Path="/5F2A325B" Ref="D?"  Part="1" 
AR Path="/5F23BB4A/5F2A325B" Ref="D?"  Part="1" 
F 0 "D?" H 2650 2050 50  0000 L CNN
F 1 "WS2812B" H 2650 1950 50  0000 L CNN
F 2 "WS2812B:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 2600 1350 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 2650 1275 50  0001 L TNN
	1    2550 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F2A3261
P 1950 1950
AR Path="/5F2A3261" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A3261" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1950 1700 50  0001 C CNN
F 1 "GND" H 1955 1777 50  0000 C CNN
F 2 "" H 1950 1950 50  0001 C CNN
F 3 "" H 1950 1950 50  0001 C CNN
	1    1950 1950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F2A3267
P 1950 1350
AR Path="/5F2A3267" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A3267" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1950 1200 50  0001 C CNN
F 1 "+5V" H 1965 1523 50  0000 C CNN
F 2 "" H 1950 1350 50  0001 C CNN
F 3 "" H 1950 1350 50  0001 C CNN
	1    1950 1350
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D?
U 1 1 5F2A326D
P 1950 2700
AR Path="/5F2A326D" Ref="D?"  Part="1" 
AR Path="/5F23BB4A/5F2A326D" Ref="D?"  Part="1" 
F 0 "D?" H 2050 3100 50  0000 L CNN
F 1 "WS2812B" H 2050 3000 50  0000 L CNN
F 2 "WS2812B:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 2000 2400 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 2050 2325 50  0001 L TNN
	1    1950 2700
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D?
U 1 1 5F2A3273
P 1950 3750
AR Path="/5F2A3273" Ref="D?"  Part="1" 
AR Path="/5F23BB4A/5F2A3273" Ref="D?"  Part="1" 
F 0 "D?" H 2050 4150 50  0000 L CNN
F 1 "WS2812B" H 2050 4050 50  0000 L CNN
F 2 "WS2812B:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 2000 3450 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 2050 3375 50  0001 L TNN
	1    1950 3750
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D?
U 1 1 5F2A3279
P 1950 4800
AR Path="/5F2A3279" Ref="D?"  Part="1" 
AR Path="/5F23BB4A/5F2A3279" Ref="D?"  Part="1" 
F 0 "D?" H 2050 5200 50  0000 L CNN
F 1 "WS2812B" H 2050 5100 50  0000 L CNN
F 2 "WS2812B:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 2000 4500 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 2050 4425 50  0001 L TNN
	1    1950 4800
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D?
U 1 1 5F2A327F
P 2550 2700
AR Path="/5F2A327F" Ref="D?"  Part="1" 
AR Path="/5F23BB4A/5F2A327F" Ref="D?"  Part="1" 
F 0 "D?" H 2650 3100 50  0000 L CNN
F 1 "WS2812B" H 2650 3000 50  0000 L CNN
F 2 "WS2812B:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 2600 2400 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 2650 2325 50  0001 L TNN
	1    2550 2700
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D?
U 1 1 5F2A3285
P 2550 3750
AR Path="/5F2A3285" Ref="D?"  Part="1" 
AR Path="/5F23BB4A/5F2A3285" Ref="D?"  Part="1" 
F 0 "D?" H 2650 4150 50  0000 L CNN
F 1 "WS2812B" H 2650 4050 50  0000 L CNN
F 2 "WS2812B:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 2600 3450 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 2650 3375 50  0001 L TNN
	1    2550 3750
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D?
U 1 1 5F2A328B
P 2550 4800
AR Path="/5F2A328B" Ref="D?"  Part="1" 
AR Path="/5F23BB4A/5F2A328B" Ref="D?"  Part="1" 
F 0 "D?" H 2650 5200 50  0000 L CNN
F 1 "WS2812B" H 2650 5100 50  0000 L CNN
F 2 "WS2812B:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 2600 4500 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 2650 4425 50  0001 L TNN
	1    2550 4800
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x02_Odd_Even J?
U 1 1 5F2A3291
P 3950 6050
AR Path="/5F2A3291" Ref="J?"  Part="1" 
AR Path="/5F23BB4A/5F2A3291" Ref="J?"  Part="1" 
F 0 "J?" H 4000 6267 50  0000 C CNN
F 1 "Conn_02x02_Odd_Even" H 4000 6176 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x02_P2.54mm_Vertical" H 3950 6050 50  0001 C CNN
F 3 "~" H 3950 6050 50  0001 C CNN
	1    3950 6050
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J?
U 1 1 5F2A3297
P 2600 6000
AR Path="/5F2A3297" Ref="J?"  Part="1" 
AR Path="/5F23BB4A/5F2A3297" Ref="J?"  Part="1" 
F 0 "J?" H 2680 6042 50  0000 L CNN
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
L power:GND #PWR?
U 1 1 5F2A32A2
P 1650 6000
AR Path="/5F2A32A2" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A32A2" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1650 5750 50  0001 C CNN
F 1 "GND" H 1655 5827 50  0000 C CNN
F 2 "" H 1650 6000 50  0001 C CNN
F 3 "" H 1650 6000 50  0001 C CNN
	1    1650 6000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F2A32A8
P 850 6000
AR Path="/5F2A32A8" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A32A8" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 850 5850 50  0001 C CNN
F 1 "+5V" H 865 6173 50  0000 C CNN
F 2 "" H 850 6000 50  0001 C CNN
F 3 "" H 850 6000 50  0001 C CNN
	1    850  6000
	1    0    0    -1  
$EndComp
Text GLabel 1300 5650 2    50   Input ~ 0
BRIGHTNESS
$Comp
L Device:C C?
U 1 1 5F2A32AF
P 9400 3800
AR Path="/5F2A32AF" Ref="C?"  Part="1" 
AR Path="/5F23BB4A/5F2A32AF" Ref="C?"  Part="1" 
F 0 "C?" V 9148 3800 50  0000 C CNN
F 1 "47uF" V 9239 3800 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9438 3650 50  0001 C CNN
F 3 "~" H 9400 3800 50  0001 C CNN
	1    9400 3800
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F2A32B5
P 9200 3850
AR Path="/5F2A32B5" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A32B5" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9200 3600 50  0001 C CNN
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
L TC33X-2-103E:TC33X-2-103E R?
U 1 1 5F2A32C1
P 1250 6000
AR Path="/5F2A32C1" Ref="R?"  Part="1" 
AR Path="/5F23BB4A/5F2A32C1" Ref="R?"  Part="1" 
F 0 "R?" H 1250 5725 50  0000 C CNN
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
L LED:WS2812B D?
U 1 1 5F2A32D2
P 1350 4800
AR Path="/5F2A32D2" Ref="D?"  Part="1" 
AR Path="/5F23BB4A/5F2A32D2" Ref="D?"  Part="1" 
F 0 "D?" H 1450 5200 50  0000 L CNN
F 1 "WS2812B" H 1450 5100 50  0000 L CNN
F 2 "WS2812B:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 1400 4500 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 1450 4425 50  0001 L TNN
	1    1350 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F2A32D8
P 1350 5100
AR Path="/5F2A32D8" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A32D8" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1350 4850 50  0001 C CNN
F 1 "GND" H 1355 4927 50  0000 C CNN
F 2 "" H 1350 5100 50  0001 C CNN
F 3 "" H 1350 5100 50  0001 C CNN
	1    1350 5100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F2A32DE
P 1350 4500
AR Path="/5F2A32DE" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A32DE" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1350 4350 50  0001 C CNN
F 1 "+5V" H 1365 4673 50  0000 C CNN
F 2 "" H 1350 4500 50  0001 C CNN
F 3 "" H 1350 4500 50  0001 C CNN
	1    1350 4500
	1    0    0    -1  
$EndComp
Text GLabel 1050 3750 0    50   Input ~ 0
LED_ROW2
$Comp
L LED:WS2812B D?
U 1 1 5F2A32E5
P 1350 3750
AR Path="/5F2A32E5" Ref="D?"  Part="1" 
AR Path="/5F23BB4A/5F2A32E5" Ref="D?"  Part="1" 
F 0 "D?" H 1450 4150 50  0000 L CNN
F 1 "WS2812B" H 1450 4050 50  0000 L CNN
F 2 "WS2812B:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 1400 3450 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 1450 3375 50  0001 L TNN
	1    1350 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F2A32EB
P 1350 4050
AR Path="/5F2A32EB" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A32EB" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1350 3800 50  0001 C CNN
F 1 "GND" H 1355 3877 50  0000 C CNN
F 2 "" H 1350 4050 50  0001 C CNN
F 3 "" H 1350 4050 50  0001 C CNN
	1    1350 4050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F2A32F1
P 1350 3450
AR Path="/5F2A32F1" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A32F1" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1350 3300 50  0001 C CNN
F 1 "+5V" H 1365 3623 50  0000 C CNN
F 2 "" H 1350 3450 50  0001 C CNN
F 3 "" H 1350 3450 50  0001 C CNN
	1    1350 3450
	1    0    0    -1  
$EndComp
Text GLabel 1050 2700 0    50   Input ~ 0
LED_ROW1
$Comp
L LED:WS2812B D?
U 1 1 5F2A32F8
P 1350 2700
AR Path="/5F2A32F8" Ref="D?"  Part="1" 
AR Path="/5F23BB4A/5F2A32F8" Ref="D?"  Part="1" 
F 0 "D?" H 1450 3100 50  0000 L CNN
F 1 "WS2812B" H 1450 3000 50  0000 L CNN
F 2 "WS2812B:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 1400 2400 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 1450 2325 50  0001 L TNN
	1    1350 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F2A32FE
P 1350 3000
AR Path="/5F2A32FE" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A32FE" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1350 2750 50  0001 C CNN
F 1 "GND" H 1355 2827 50  0000 C CNN
F 2 "" H 1350 3000 50  0001 C CNN
F 3 "" H 1350 3000 50  0001 C CNN
	1    1350 3000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F2A3304
P 1350 2400
AR Path="/5F2A3304" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A3304" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1350 2250 50  0001 C CNN
F 1 "+5V" H 1365 2573 50  0000 C CNN
F 2 "" H 1350 2400 50  0001 C CNN
F 3 "" H 1350 2400 50  0001 C CNN
	1    1350 2400
	1    0    0    -1  
$EndComp
Text GLabel 1050 1650 0    50   Input ~ 0
LED_ROW0
$Comp
L power:+5V #PWR?
U 1 1 5F2A330B
P 1350 1350
AR Path="/5F2A330B" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A330B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1350 1200 50  0001 C CNN
F 1 "+5V" H 1365 1523 50  0000 C CNN
F 2 "" H 1350 1350 50  0001 C CNN
F 3 "" H 1350 1350 50  0001 C CNN
	1    1350 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F2A3311
P 1350 1950
AR Path="/5F2A3311" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A3311" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1350 1700 50  0001 C CNN
F 1 "GND" H 1355 1777 50  0000 C CNN
F 2 "" H 1350 1950 50  0001 C CNN
F 3 "" H 1350 1950 50  0001 C CNN
	1    1350 1950
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D?
U 1 1 5F2A3317
P 1350 1650
AR Path="/5F2A3317" Ref="D?"  Part="1" 
AR Path="/5F23BB4A/5F2A3317" Ref="D?"  Part="1" 
F 0 "D?" H 1450 2050 50  0000 L CNN
F 1 "WS2812B" H 1450 1950 50  0000 L CNN
F 2 "WS2812B:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 1400 1350 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 1450 1275 50  0001 L TNN
	1    1350 1650
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D?
U 1 1 5F2A331E
P 1950 1650
AR Path="/5F2A331E" Ref="D?"  Part="1" 
AR Path="/5F23BB4A/5F2A331E" Ref="D?"  Part="1" 
F 0 "D?" H 2050 2050 50  0000 L CNN
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
L Device:R R?
U 1 1 5F2A3334
P 10350 4900
AR Path="/5F2A3334" Ref="R?"  Part="1" 
AR Path="/5F23BB4A/5F2A3334" Ref="R?"  Part="1" 
F 0 "R?" V 10143 4900 50  0000 C CNN
F 1 "470R" V 10234 4900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 10280 4900 50  0001 C CNN
F 3 "~" H 10350 4900 50  0001 C CNN
	1    10350 4900
	0    1    1    0   
$EndComp
$Comp
L MCU_Microchip_ATtiny:ATtiny3216-S U?
U 1 1 5F2A333A
P 9600 4900
AR Path="/5F2A333A" Ref="U?"  Part="1" 
AR Path="/5F23BB4A/5F2A333A" Ref="U?"  Part="1" 
F 0 "U?" H 9750 6000 50  0000 L CNN
F 1 "ATtiny3216-S" H 9750 5900 50  0000 L CNN
F 2 "Package_SO:SOIC-20W_7.5x12.8mm_P1.27mm" H 9600 4900 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATtiny3216_ATtiny1616-data-sheet-40001997B.pdf" H 9600 4900 50  0001 C CNN
	1    9600 4900
	1    0    0    -1  
$EndComp
NoConn ~ 10200 5500
$Comp
L power:+5V #PWR?
U 1 1 5F2A3341
P 2550 1350
AR Path="/5F2A3341" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A3341" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2550 1200 50  0001 C CNN
F 1 "+5V" H 2565 1523 50  0000 C CNN
F 2 "" H 2550 1350 50  0001 C CNN
F 3 "" H 2550 1350 50  0001 C CNN
	1    2550 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F2A3347
P 2550 1950
AR Path="/5F2A3347" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A3347" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2550 1700 50  0001 C CNN
F 1 "GND" H 2555 1777 50  0000 C CNN
F 2 "" H 2550 1950 50  0001 C CNN
F 3 "" H 2550 1950 50  0001 C CNN
	1    2550 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F2A334D
P 1950 3000
AR Path="/5F2A334D" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A334D" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1950 2750 50  0001 C CNN
F 1 "GND" H 1955 2827 50  0000 C CNN
F 2 "" H 1950 3000 50  0001 C CNN
F 3 "" H 1950 3000 50  0001 C CNN
	1    1950 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F2A3353
P 2550 3000
AR Path="/5F2A3353" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A3353" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2550 2750 50  0001 C CNN
F 1 "GND" H 2555 2827 50  0000 C CNN
F 2 "" H 2550 3000 50  0001 C CNN
F 3 "" H 2550 3000 50  0001 C CNN
	1    2550 3000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F2A3359
P 1950 2400
AR Path="/5F2A3359" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A3359" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1950 2250 50  0001 C CNN
F 1 "+5V" H 1965 2573 50  0000 C CNN
F 2 "" H 1950 2400 50  0001 C CNN
F 3 "" H 1950 2400 50  0001 C CNN
	1    1950 2400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F2A335F
P 2550 2400
AR Path="/5F2A335F" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A335F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2550 2250 50  0001 C CNN
F 1 "+5V" H 2565 2573 50  0000 C CNN
F 2 "" H 2550 2400 50  0001 C CNN
F 3 "" H 2550 2400 50  0001 C CNN
	1    2550 2400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F2A3365
P 1950 3450
AR Path="/5F2A3365" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A3365" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1950 3300 50  0001 C CNN
F 1 "+5V" H 1965 3623 50  0000 C CNN
F 2 "" H 1950 3450 50  0001 C CNN
F 3 "" H 1950 3450 50  0001 C CNN
	1    1950 3450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F2A336B
P 2550 3450
AR Path="/5F2A336B" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A336B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2550 3300 50  0001 C CNN
F 1 "+5V" H 2565 3623 50  0000 C CNN
F 2 "" H 2550 3450 50  0001 C CNN
F 3 "" H 2550 3450 50  0001 C CNN
	1    2550 3450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F2A3371
P 1950 4500
AR Path="/5F2A3371" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A3371" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1950 4350 50  0001 C CNN
F 1 "+5V" H 1965 4673 50  0000 C CNN
F 2 "" H 1950 4500 50  0001 C CNN
F 3 "" H 1950 4500 50  0001 C CNN
	1    1950 4500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F2A3377
P 2550 4500
AR Path="/5F2A3377" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A3377" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2550 4350 50  0001 C CNN
F 1 "+5V" H 2565 4673 50  0000 C CNN
F 2 "" H 2550 4500 50  0001 C CNN
F 3 "" H 2550 4500 50  0001 C CNN
	1    2550 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F2A337D
P 1950 4050
AR Path="/5F2A337D" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A337D" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1950 3800 50  0001 C CNN
F 1 "GND" H 1955 3877 50  0000 C CNN
F 2 "" H 1950 4050 50  0001 C CNN
F 3 "" H 1950 4050 50  0001 C CNN
	1    1950 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F2A3383
P 2550 4050
AR Path="/5F2A3383" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A3383" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2550 3800 50  0001 C CNN
F 1 "GND" H 2555 3877 50  0000 C CNN
F 2 "" H 2550 4050 50  0001 C CNN
F 3 "" H 2550 4050 50  0001 C CNN
	1    2550 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F2A3389
P 1950 5100
AR Path="/5F2A3389" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A3389" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1950 4850 50  0001 C CNN
F 1 "GND" H 1955 4927 50  0000 C CNN
F 2 "" H 1950 5100 50  0001 C CNN
F 3 "" H 1950 5100 50  0001 C CNN
	1    1950 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F2A338F
P 2550 5100
AR Path="/5F2A338F" Ref="#PWR?"  Part="1" 
AR Path="/5F23BB4A/5F2A338F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2550 4850 50  0001 C CNN
F 1 "GND" H 2555 4927 50  0000 C CNN
F 2 "" H 2550 5100 50  0001 C CNN
F 3 "" H 2550 5100 50  0001 C CNN
	1    2550 5100
	1    0    0    -1  
$EndComp
$EndSCHEMATC
