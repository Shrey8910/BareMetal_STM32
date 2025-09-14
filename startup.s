.syntax unified
.cpu cortex-m4
.thumb

.global _start
.global Reset_Handler

/* --------------------------------------------------------------------
 * Vector Table
 * ------------------------------------------------------------------*/
.section .isr_vector,"a",%progbits
.type g_pfnVectors, %object
.size g_pfnVectors, .-g_pfnVectors

g_pfnVectors:
    .word _estack               /* Initial stack pointer */
    .word Reset_Handler         /* Reset handler */
    .word NMI_Handler
    .word HardFault_Handler
    .word MemManage_Handler
    .word BusFault_Handler
    .word UsageFault_Handler
    .word 0                     /* Reserved */
    .word 0                     /* Reserved */
    .word 0                     /* Reserved */
    .word 0                     /* Reserved */
    .word SVC_Handler
    .word DebugMon_Handler
    .word 0                     /* Reserved */
    .word PendSV_Handler
    .word SysTick_Handler

    /* External interrupts (IRQ0–IRQ84 = 85 entries for STM32L4x3) */
    .rept 85
        .word Default_Handler
    .endr

/* --------------------------------------------------------------------
 * Reset Handler
 * ------------------------------------------------------------------*/
.section .text.Reset_Handler,"ax",%progbits
.thumb_func
Reset_Handler:
    /* Copy .data section from FLASH to SRAM */
    ldr r0, =_sidata   /* source in FLASH */
    ldr r1, =_sdata    /* destination in SRAM */
    ldr r2, =_edata    /* end of .data */
1:
    cmp r1, r2
    ittt lt
    ldrlt r3, [r0], #4
    strlt r3, [r1], #4
    blt 1b

    /* Zero initialize .bss section */
    ldr r0, =_sbss
    ldr r1, =_ebss
    movs r2, #0
2:
    cmp r0, r1
    it lt
    strlt r2, [r0], #4
    blt 2b

    /* Call main */
    bl main

.hang: 
    b .hang

/* --------------------------------------------------------------------
 * Default Handlers
 * ------------------------------------------------------------------*/
.thumb_func
NMI_Handler:        b .
HardFault_Handler:  b .
MemManage_Handler:  b .
BusFault_Handler:   b .
UsageFault_Handler: b .
SVC_Handler:        b .
DebugMon_Handler:   b .
PendSV_Handler:     b .
SysTick_Handler:    b .
Default_Handler:    b .
