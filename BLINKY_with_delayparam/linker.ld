ENTRY(Reset_Handler)

/* --------------------------------------------------------------------
 * Memory layout for STM32L433
 * ------------------------------------------------------------------*/
MEMORY
{
  FLASH (rx)  : ORIGIN = 0x08000000, LENGTH = 256K
  RAM   (rwx) : ORIGIN = 0x20000000, LENGTH = 48K
}

/* --------------------------------------------------------------------
 * Sections
 * ------------------------------------------------------------------*/
SECTIONS
{
  /* Vector table goes first in FLASH */
  .isr_vector :
  {
    KEEP(*(.isr_vector))   /* startup.s */
  } > FLASH

  /* Program code and read-only data */
  .text :
  {
    *(.text*)              /* all .text sections */
    *(.rodata*)            /* read-only data */
    KEEP(*(.init))
    KEEP(*(.fini))
  } > FLASH

  /* Initialized data section (in RAM, loaded from FLASH) */
  .data : AT (LOADADDR(.text) + SIZEOF(.text))
  {
    _sdata = .;            /* start of .data in RAM */
    *(.data*)              /* all .data sections */
    _edata = .;            /* end of .data in RAM */
  } > RAM
  _sidata = LOADADDR(.data); /* flash location of .data init values */

  /* Uninitialized data (.bss) */
  .bss :
  {
    _sbss = .;             /* start of .bss */
    *(.bss*)
    *(COMMON)
    _ebss = .;             /* end of .bss */
  } > RAM

   /* Stack top (grows downward) */
  _estack = ORIGIN(RAM) + LENGTH(RAM);
}
