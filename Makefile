# Makefile to build libqrencode as static library (.lib) using MinGW

CC = gcc
AR = ar
CFLAGS = -O2 -Wall -I.
OBJS = bitstream.o mask.o mmask.o mqrspec.o qrenc.o qrencode.o qrinput.o qrspec.o rsecc.o split.o

TARGET = libqrencode.lib

.SUFFIXES: .c .o

all: $(TARGET)

$(TARGET): $(OBJS)
	$(AR) rcs libqrencode.a $(OBJS)
	@copy /Y libqrencode.a libqrencode.lib

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@ -DSTATIC_IN_RELEASE=static -DMAJOR_VERSION=4 -DMINOR_VERSION=1 -DMICRO_VERSION=1 -DVERSION="\"4.1.1\""

clean:
	del *.o *.a *.lib

.PHONY: all clean