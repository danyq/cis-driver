EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:steven
LIBS:icezum
LIBS:Scanner PCB-cache
EELAYER 25 0
EELAYER END
$Descr USLedger 17000 11000
encoding utf-8
Sheet 7 8
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
L IS61WV6416DBLL U?
U 1 1 57EA7B9C
P 8350 5000
F 0 "U?" H 7950 6300 60  0000 C CNN
F 1 "IS61WV6416DBLL" H 8900 3550 60  0000 C CNN
F 2 "" H 8700 5700 60  0001 C CNN
F 3 "" H 8700 5700 60  0001 C CNN
	1    8350 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 3000 8400 3650
Wire Wire Line
	7150 3000 8400 3000
Wire Wire Line
	8300 3650 8300 3500
Wire Wire Line
	8300 3500 8400 3500
Connection ~ 8400 3500
Wire Wire Line
	8400 6500 8400 6800
Wire Wire Line
	8400 6600 8300 6600
Wire Wire Line
	8300 6600 8300 6500
$Comp
L GND #PWR?
U 1 1 57EA7C00
P 8400 6800
F 0 "#PWR?" H 8400 6550 50  0001 C CNN
F 1 "GND" H 8400 6650 50  0000 C CNN
F 2 "" H 8400 6800 50  0000 C CNN
F 3 "" H 8400 6800 50  0000 C CNN
	1    8400 6800
	1    0    0    -1  
$EndComp
Connection ~ 8400 6600
$Comp
L +3V3 #PWR?
U 1 1 57EA7C24
P 7150 2850
F 0 "#PWR?" H 7150 2700 50  0001 C CNN
F 1 "+3V3" H 7150 2990 50  0000 C CNN
F 2 "" H 7150 2850 50  0000 C CNN
F 3 "" H 7150 2850 50  0000 C CNN
	1    7150 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 2850 7150 3000
$Comp
L C C?
U 1 1 57EA7C49
P 7500 3300
F 0 "C?" H 7525 3400 50  0000 L CNN
F 1 "0.1u" H 7525 3200 50  0000 L CNN
F 2 "" H 7538 3150 50  0000 C CNN
F 3 "" H 7500 3300 50  0000 C CNN
	1    7500 3300
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 57EA7C87
P 7750 3300
F 0 "C?" H 7775 3400 50  0000 L CNN
F 1 "0.1u" H 7775 3200 50  0000 L CNN
F 2 "" H 7788 3150 50  0000 C CNN
F 3 "" H 7750 3300 50  0000 C CNN
	1    7750 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 3150 7500 3000
Connection ~ 7500 3000
Wire Wire Line
	7750 3150 7750 3000
Connection ~ 7750 3000
$Comp
L GND #PWR?
U 1 1 57EA7CC3
P 7500 3550
F 0 "#PWR?" H 7500 3300 50  0001 C CNN
F 1 "GND" H 7500 3400 50  0000 C CNN
F 2 "" H 7500 3550 50  0000 C CNN
F 3 "" H 7500 3550 50  0000 C CNN
	1    7500 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 3550 7500 3450
$Comp
L GND #PWR?
U 1 1 57EA7CEA
P 7750 3550
F 0 "#PWR?" H 7750 3300 50  0001 C CNN
F 1 "GND" H 7750 3400 50  0000 C CNN
F 2 "" H 7750 3550 50  0000 C CNN
F 3 "" H 7750 3550 50  0000 C CNN
	1    7750 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 3550 7750 3450
Wire Wire Line
	7750 4050 7300 4050
Wire Wire Line
	7750 4150 7300 4150
Wire Wire Line
	7750 4250 7300 4250
Wire Wire Line
	7750 4350 7300 4350
Wire Wire Line
	7750 4450 7300 4450
Wire Wire Line
	7750 4550 7300 4550
Wire Wire Line
	7750 4650 7300 4650
Wire Wire Line
	7750 4750 7300 4750
Wire Wire Line
	7750 4850 7300 4850
Wire Wire Line
	7750 4950 7300 4950
Wire Wire Line
	7750 5050 7300 5050
Wire Wire Line
	7750 5150 7300 5150
Wire Wire Line
	7750 5250 7300 5250
Wire Wire Line
	7750 5350 7300 5350
Wire Wire Line
	7750 5450 7300 5450
Wire Wire Line
	7750 5550 7300 5550
Wire Wire Line
	9400 4050 8950 4050
Wire Wire Line
	9400 4150 8950 4150
Wire Wire Line
	9400 4250 8950 4250
Wire Wire Line
	9400 4350 8950 4350
Wire Wire Line
	9400 4450 8950 4450
Wire Wire Line
	9400 4550 8950 4550
Wire Wire Line
	9400 4650 8950 4650
Wire Wire Line
	9400 4750 8950 4750
Wire Wire Line
	9400 4850 8950 4850
Wire Wire Line
	9400 4950 8950 4950
Wire Wire Line
	9400 5050 8950 5050
Wire Wire Line
	9400 5150 8950 5150
Wire Wire Line
	9400 5250 8950 5250
Wire Wire Line
	9400 5350 8950 5350
Wire Wire Line
	9400 5450 8950 5450
Wire Wire Line
	9400 5550 8950 5550
Wire Wire Line
	7750 5700 7300 5700
Wire Wire Line
	7750 5800 7300 5800
Wire Wire Line
	7750 5900 7300 5900
Wire Wire Line
	7750 6000 7300 6000
Wire Wire Line
	7750 6100 7300 6100
Text HLabel 7300 4050 0    60   Input ~ 0
A15_SRAM
Text HLabel 7300 4150 0    60   Input ~ 0
A14_SRAM
Text HLabel 7300 4250 0    60   Input ~ 0
A13_SRAM
Text HLabel 7300 4350 0    60   Input ~ 0
A12_SRAM
Text HLabel 7300 4450 0    60   Input ~ 0
A11_SRAM
Text HLabel 7300 4550 0    60   Input ~ 0
A10_SRAM
Text HLabel 7300 4650 0    60   Input ~ 0
A9_SRAM
Text HLabel 7300 4750 0    60   Input ~ 0
A8_SRAM
Text HLabel 7300 4850 0    60   Input ~ 0
A7_SRAM
Text HLabel 7300 4950 0    60   Input ~ 0
A6_SRAM
Text HLabel 7300 5050 0    60   Input ~ 0
A5_SRAM
Text HLabel 7300 5150 0    60   Input ~ 0
A4_SRAM
Text HLabel 7300 5250 0    60   Input ~ 0
A3_SRAM
Text HLabel 7300 5350 0    60   Input ~ 0
A2_SRAM
Text HLabel 7300 5450 0    60   Input ~ 0
A1_SRAM
Text HLabel 7300 5550 0    60   Input ~ 0
A0_SRAM
Text HLabel 9400 4050 2    60   Input ~ 0
D15_SRAM
Text HLabel 9400 4150 2    60   Input ~ 0
D14_SRAM
Text HLabel 9400 4250 2    60   Input ~ 0
D13_SRAM
Text HLabel 9400 4350 2    60   Input ~ 0
D12_SRAM
Text HLabel 9400 4450 2    60   Input ~ 0
D11_SRAM
Text HLabel 9400 4550 2    60   Input ~ 0
D10_SRAM
Text HLabel 9400 4650 2    60   Input ~ 0
D9_SRAM
Text HLabel 9400 4750 2    60   Input ~ 0
D8_SRAM
Text HLabel 9400 4850 2    60   Input ~ 0
D7_SRAM
Text HLabel 9400 4950 2    60   Input ~ 0
D6_SRAM
Text HLabel 9400 5050 2    60   Input ~ 0
D5_SRAM
Text HLabel 9400 5150 2    60   Input ~ 0
D4_SRAM
Text HLabel 9400 5250 2    60   Input ~ 0
D3_SRAM
Text HLabel 9400 5350 2    60   Input ~ 0
D2_SRAM
Text HLabel 9400 5450 2    60   Input ~ 0
D1_SRAM
Text HLabel 9400 5550 2    60   Input ~ 0
D0_SRAM
Text HLabel 7300 5700 0    60   Input ~ 0
CE_SRAM_L
Text HLabel 7300 5800 0    60   Input ~ 0
OE_SRAM_L
Text HLabel 7300 5900 0    60   Input ~ 0
WE_SRAM_L
Text HLabel 7300 6000 0    60   Input ~ 0
UB_SRAM_L
Text HLabel 7300 6100 0    60   Input ~ 0
LB_SRAM_L
$EndSCHEMATC
