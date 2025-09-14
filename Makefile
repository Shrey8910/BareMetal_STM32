# Toolchain
CC      = arm-none-eabi-gcc
AS      = arm-none-eabi-as
OBJCOPY = arm-none-eabi-objcopy

# Flags
CFLAGS  = -mcpu=cortex-m4 -mthumb -O0 -Wall
ASFLAGS = -mcpu=cortex-m4 -mthumb
LDFLAGS = -T linker.ld -nostdlib -Wl,--gc-sections

# Files
SRCS    = main.c startup.s
OBJS    = $(SRCS:.c=.o)
OBJS    := $(OBJS:.s=.o)

# Targets
all: main.bin

main.elf: main.o startup.o
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

main.bin: main.elf
	$(OBJCOPY) -O binary $< $@

main.o: main.c
	$(CC) $(CFLAGS) -c $< -o $@

startup.o: startup.s
	$(AS) $(ASFLAGS) $< -o $@

clean:
	rm -f *.o *.elf *.bin
