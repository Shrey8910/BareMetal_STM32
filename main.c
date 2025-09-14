typedef unsigned int   uint32_t;
typedef unsigned short uint16_t;
typedef unsigned char  uint8_t;
#define RCC_AHB2ENR   (*(volatile uint32_t *)0x4002104C)            //Clock enable register for GPIO ports.
#define GPIOB_MODER   (*(volatile uint32_t *) 0x48000400) //Mode register for GPIOA.
#define GPIOB_OTYPER  (*(volatile uint32_t *) (0x48000400 + 0x04)) //Output type (push-pull/open-drain) for GPIOA.
#define GPIOB_ODR     (*(volatile uint32_t *) (0x48000400 + 0x14)) //Output data register (write 1/0 to set pin HIGH/LOW).

void delay(volatile uint32_t count){
    while(count--);
}

int main(){

RCC_AHB2ENR |= (1<<1);
//set GPIOB pin 13 as output
// to set pin as Output, the bits of the MODER GPIO register should be 01
GPIOB_MODER &= (~(3 << 26)); //clear bit 26 and 27 of GPIOA modeR register
GPIOB_MODER |= (1<< 26);//set bit 26th of modeR GPIOA reg, 01: to set gpio pin as output pin..

 // Optional: Set output type to push-pull (clear bit 13), redundant code as this is default set
    GPIOB_OTYPER &= ~(1 << 13);
 
while(1){

 GPIOB_ODR ^= (1 << 13); //toggle
 delay(1500000);
}
}
/*

return 0;
}


//set GPIOA pin 01 as output
// to set pin as Output, the bits of the MODER GPIO register should be 01
*(volatile uint32_t *) (0x48000000 + 0x00) &= ~(3 << 2); //clear bit 3 and 4 of GPIOA modeR register
*(volatile uint32_t *) (0x48000000 + 0x00) |= (1<< 2);//set bit 3 of modeR GPIOA reg, 01: to set gpio pin as output pin..


//set GPIOB pin 5 as Analog
// to set pin as analog, the bits of te MODER GPIO register should be 11
*(volatile uint32_t *) (0x48000400 + 0x00) &= ~(3 << 10); //clear bit 10, 11
*(volatile uint32_t *) (0x48000400 + 0x00) |= (3 << 10); //set 10 and 11th bit, to set pin 5 of GPIOA analog mode


//write high to pin 3 of GPIOC
// to set or write any value to GPIO pin configured as iutput pin, we need to modify output data register of GPIO, from AB2 bus initial gpio address it is at an offset
*(volatile uint32_t *) (0x48000800 + 0x14) |= (1 << 3);
*(volatile uint32_t *) (0x48000800 + 0x14) &= ~(1 << 3);

