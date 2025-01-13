include env.mk

.SUFFIXES: .o .asm .c

AS=aarch64-linux-gnu-as
ASFLAGS= -g -o
CFLAGS= -g -march=armv8-a -static
CC=aarch64-linux-gnu-gcc

.asm.o:
	$(AS) $(ASFLAGS) $*.o $*.asm -al=$*.lst

.c.o:
	$(CC) -c $(CFLAGS) $*.c

all: $(BINARY)

$(BINARY): $(CODE_C).o $(CODE_ASM).o
	$(CC) $(CFLAGS) -o $(BINARY) $(CODE_C).o $(CODE_ASM).o

$(CODE_ASM).o : $(CODE_ASM).asm

$(CODE_C).o : $(CODE_C).c

clean :
	rm -f *.o
	rm -f *.lst
	rm -f $(BINARY)

debug:
	echo "ATTENTION:" 
	echo "press Crt-b + o to switch terminals and type input"
	echo "Starting in 5 seconds..."
	sleep 5
	./run_debug.sh

run:
	./$(BINARY)