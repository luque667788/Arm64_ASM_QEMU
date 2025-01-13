#include <stdio.h>
#include <stdlib.h>

extern int setmask_asm(int a, int mask, int *results);

int main() 
{
  int a = 0; // Initialize a with some value
  int mask = 0; // Initialize mask with some value
  int results = 0; // Initialize results to store the output
  int status;

  printf("Hello, World!\n");

  status = setmask_asm(a, mask, &results);

  printf("setmask_asm returned: %d\n", status);
  printf("Result: %d\n", results);

  return status;
}