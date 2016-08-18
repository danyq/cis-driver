
CC = gcc
CFLAGS = -Wall -g
LIBS =

CFLAGS += `pkg-config --cflags libftdi1`
LIBS += `pkg-config --libs libftdi1`

read: read.c
	$(CC) $(CFLAGS) $< $(LIBS) -o $@

clean:
	rm read
