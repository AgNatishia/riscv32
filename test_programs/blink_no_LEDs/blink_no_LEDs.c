#include <stdint.h>

const int value = 0;
const int tristate = 1;
int32_t volatile * const buttons = (int32_t*) 0x40010000;
int32_t volatile * const LEDs    = (int32_t*) 0x40020000;

int main()
{
  // Turn off all LEDs
  LEDs[tristate] = 0;

  while(1)
  {
    for(int i = 0; i < 16; i++)
    {
      LEDs[value] = 0;
    }
  }

  return 0;
}
