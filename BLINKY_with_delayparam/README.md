# BareMetal_STM32
# Parameterized LED Blinky with Flash-based Delay Control

In this update, the LED blinky project has a parameterized delay. The delay is stored as a parameter in flash memory at a fixed address. This allows you to change the LED blink rate without recompiling the code, simply by writing a new value to flash.

How it Works

A variable in main.c points to a predefined flash memory address.

At runtime, the code dereferences this address and uses the value as the delay parameter.

If the value is valid, it directly controls the LED blink speed.

# Usage Steps:

Flash the firmware binary as usual.

Open STM32CubeProgrammer (GUI/CLI).

Write the desired delay parameter value to the configured flash memory address.

Example: Address 0x0800F800 (choose according to linker script).

Reset the MCU — the LED now blinks with the new delay.

📸 <img width="2880" height="1800" alt="image" src="https://github.com/user-attachments/assets/f9b1f6ff-0851-4cb1-b2e5-06a13ba9b5a7" />


Safety Checks

To keep the demo robust:

If the parameter is missing, zero, or too large, the program ignores it.

In such cases, a default delay defined in main.c is used.

Only values within a safe threshold are accepted. In this code default threshold is delay_val=1500000


