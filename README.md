# STM32L433 Bare-Metal LED Blink
A bare-metal ARM Cortex-M4 project for the STM32L433 Nucleo board. This project demonstrates low-level embedded programming without HAL or CMSIS, using a custom linker script, startup assembly, and direct GPIO register access.


# Overview
Runs an LED blink on STM32L433 at register level.
Shows complete bare-metal workflow: startup code, vector table, linker script, Makefile, and flashing.
Built with GNU Arm Embedded Toolchain (arm-none-eabi-gcc).

# Tech Stack
Language: C (No use of any inbuild C libraries), ARM Assembly

Toolchain: GNU Arm Embedded Toolchain (arm-none-eabi-gcc)

Target MCU: STM32L433RC (ARM Cortex-M4)

Board: STM32L433 Nucleo-64

Flashing/Debug: ST-LINK with STM32CubeProgrammer

