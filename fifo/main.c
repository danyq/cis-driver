/*
	Simple example to open a maximum of 4 devices - write some data then read it back.
	Shows one method of using list devices also.
	Assumes the devices have a loopback connector on them and they also have a serial number

	To build use the following gcc statement 
	(assuming you have the d2xx library in the /usr/local/lib directory).
	gcc -o simple main.c -L. -lftd2xx -Wl,-rpath /usr/local/lib
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "../ftd2xx.h"
#include <mach/mach_time.h>

#define OneSector 65536
#define TRANSFER_COUNT 500000

int main()
{
	FT_HANDLE ftHandle;
	FT_STATUS ftStatus;
	UCHAR Mask = 0xff;
	UCHAR Mode;
	UCHAR LatencyTimer = 16; //our default setting is 16

	DWORD EventDWord;
	DWORD RxBytes;
	DWORD TxBytes;
	DWORD BytesReceived;

	DWORD RxBytes_1, RxBytes_2;

	char RxBuffer[OneSector];

	mach_timebase_info_data_t tb;
	kern_return_t mtiStatus;
	uint64_t start, end;
	uint64_t diff, loopCount=0, index, byteTotal=0;


	ftStatus = FT_Open(0, &ftHandle);
	if(ftStatus == FT_OK) {
		printf("FT_Open successful.\n");
	} else {
		printf("FT_Open failed!\n");
		return 1;
	}
		
	Mode = 0x00; //reset mode
	ftStatus = FT_SetBitMode(ftHandle, Mask, Mode);
	if(ftStatus == FT_OK) {
		printf("FT_SetBitMode successful.\n");
	} else {
		printf("FT_SetBitMode failed!\n");
		return 1;
	}

	sleep(1);

	Mode = 0x40; //Sync FIFO mode
	ftStatus = FT_SetBitMode(ftHandle, Mask, Mode);
	if(ftStatus == FT_OK) {
		printf("FT_SetBitMode successful.\n");
	} else {
		printf("FT_SetBitMode failed!\n");
		return 1;
	}

	ftStatus = FT_SetLatencyTimer(ftHandle, LatencyTimer);
	if(ftStatus == FT_OK) {
		printf("FT_SetLatencyTimer successful.\n");
	} else {
		printf("FT_SetLatencyTimer failed!\n");
		return 1;
	}

	ftStatus = FT_SetUSBParameters(ftHandle,0x10000,0x10000);
	if(ftStatus == FT_OK) {
		printf("FT_SetUSBParameters successful.\n");
	} else {
		printf("FT_SetUSBParameters failed!\n");
		return 1;
	}

	ftStatus = FT_SetFlowControl(ftHandle,FT_FLOW_RTS_CTS,0,0); //access data from here
	if(ftStatus == FT_OK) {
		printf("FT_SetFlowControl successful.\n");
	} else {
		printf("FT_SetFlowControl failed!\n");
		return 1;
	}

	sleep(1);

	ftStatus = FT_GetStatus(ftHandle, &RxBytes, &TxBytes, &EventDWord);
	if(ftStatus == FT_OK) {
		printf("FT_GetStatus successful.\n");
	} else {
		printf("FT_GetStatus failed!\n");
		return 1;
	}

	printf("RxBytes: %d\n", (int)RxBytes);
	printf("TxBytes: %d\n", (int)TxBytes);

	ftStatus = FT_Read(ftHandle, RxBuffer, RxBytes, &BytesReceived);
	if(ftStatus == FT_OK) {
		printf("FT_Read successful.\n");
	} else {
		printf("FT_Read failed!\n");
		return 1;
	}

	printf("BytesReceived: %d\n", (int)BytesReceived);

	for(index=0; index<100; index++){
		printf("RxBuffer[%d]: 0x%02x\n", (int)index, (uint8_t)RxBuffer[index]);
	}

	printf("Trying to exhaust buffer.\n");
	ftStatus = FT_GetStatus(ftHandle, &RxBytes, &TxBytes, &EventDWord);

	while (RxBytes >= 6400){
		ftStatus = FT_Read(ftHandle, RxBuffer, RxBytes, &BytesReceived);	
		ftStatus = FT_GetStatus(ftHandle, &RxBytes, &TxBytes, &EventDWord);
		loopCount++;
	}
	printf("Buffer not maxed out.\n");
	printf("RxBytes: %d\n", (int)RxBytes);
	printf("loopCount: %d\n", (int)loopCount);

	mtiStatus = mach_timebase_info(&tb);

	start = mach_absolute_time();
	ftStatus = FT_GetStatus(ftHandle, &RxBytes_1, &TxBytes, &EventDWord);
	ftStatus = FT_Read(ftHandle, RxBuffer, RxBytes, &BytesReceived);
	end = mach_absolute_time();

	diff = (end - start) * tb.numer / tb.denom;
	printf("elapsed process CPU time = %llu nanoseconds\n", (long long unsigned int) diff);

	start = mach_absolute_time();
	ftStatus = FT_GetStatus(ftHandle, &RxBytes_2, &TxBytes, &EventDWord);
	ftStatus = FT_Read(ftHandle, RxBuffer, RxBytes, &BytesReceived);	
	end = mach_absolute_time();

	diff = (end - start) * tb.numer / tb.denom;
	printf("elapsed process CPU time = %llu nanoseconds\n", (long long unsigned int) diff);

	printf("RxBytes_1: %d, RxBytes_2: %d\n", (int)RxBytes_1, (int)RxBytes_2);

	printf("Starting timing test\n");

	start = mach_absolute_time();
	for(index=0; index<TRANSFER_COUNT; index++){
		ftStatus = FT_GetStatus(ftHandle, &RxBytes, &TxBytes, &EventDWord);
		ftStatus = FT_Read(ftHandle, RxBuffer, RxBytes, &BytesReceived);	
		byteTotal += BytesReceived;
	}
	end = mach_absolute_time();

	diff = (end - start) * tb.numer / tb.denom;
	printf("elapsed process CPU time = %llu nanoseconds\n", (long long unsigned int) diff);
	printf("number of bytes transfered: %d\n", (int)byteTotal);

	FT_Close(ftHandle);
}
