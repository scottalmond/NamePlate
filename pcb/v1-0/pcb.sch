EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 6950 6450 0    50   ~ 0
verify ws2182 footprint\nverify pinout of led\nwriteup parts list\nattiny: PTC, program, hall effect, USB power, Array led\n2x3 pin #s? conn_02x03\nallow for pogo programming\nensure LEDs are OFF during program upload\nadd UPDI pinout to silk screen\npick screw size, figure out PCB outline\nenter in space between traces into layout preferences\nbuy anodized aluminum\nbuy two color acrylic - info badge\nnameplate screws: threaded standoff caps\ndesign for enclosure - height from LEDs\ntwo-piece standoff panel-hanging brackets\ncaptive pins appear cheaper\nPlastic-Head Thumb Screws\n4-40, 0.33/screw: https://www.mcmaster.com/91185A233/\nusb port on reverse side? no - top side reflow only\nround corners of pcb\nput arrow on RxD and TxD showing data flow direciton\nSense Line thickness should be between 0.1mm to 0.5mm\n T: front panel thickness, 1.6 mm\n6" max line length on sense lines
Text Notes 550  1750 0    50   ~ 0
AtTiny3216: Ample Flash for designs, $1/unit, well supported, Capacitive Touch\nX COLS x 5 ROWS LEDs WS2812B, $0.09/unit@1000, Tall enough for 5-pixel alpha numeric, aspect ratio of name tag\n5V micro USB power: COTS USB solution, about 1/3rd cost of USB-C\n- multiple footprints to give design flexibility (only pop one in production unit)\nAllow for user input via magnet (Hall effect sensor)\nprogram over 100 mil 2x3?\nFeed last LED back to processor for functionality check\nconsider allowing 4x PCBs to be combiuned for 2x2 bigger display\n- flip L/R and flip U/D config\nallow for 5V power over hollw bolt from rear of unit\n3.81 mm body height + 5.84 mm mating = 9.65 mm min height from pcb, 0.38", 3/8"\nedge tolerance +-0.15 mm --> allow 0.3 mm between CCAs, 12 mils\nconsidered using all 12 cap touch sensors as a slider along the top/bottom of device.  Too many driving constraints (isolation, line length, etc) to implment\n0.3 mm/12 mil edge to copper keep out\nadd 10k pot for user input on brightness
$Sheet
S 900  2350 500  150 
U 5F0AD215
F0 "Page_1" 50
F1 "Page_1.sch" 50
$EndSheet
$Sheet
S 1700 2350 550  150 
U 5F1120A6
F0 "Page_2" 50
F1 "Page_2.sch" 50
$EndSheet
$EndSCHEMATC
