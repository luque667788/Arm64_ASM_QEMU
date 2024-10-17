#

.SUFFIXES: .o .asm .c

AS=aarch64-linux-gnu-as
ASFLAGS= -g -o
CFLAGS= -g -march=armv8-a -static
CC=aarch64-linux-gnu-gcc

.asm.o:
		$(AS) $(ASFLAGS) $*.o $*.asm -al=$*.lst

.c.o:
		$(CC) -c $(CFLAGS) $*.c

all: Strldr

Strldr : strldr.o strldr_asm.o
		$(CC) $(CFLAGS) -o Strldr strldr.o strldr_asm.o

strldr_asm.o : strldr_asm.asm

strldr.o : strldr.c

clean :
		rm *.o
		rm *.lst
		rm Strldr

debug :
		echo "ATTENTION:" 
		echo "press Crt-b + o to switch terminals and type input"
		echo "Starting in 5 seconds..."
		sleep 5
		./run_debug.sh