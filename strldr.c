/*
strldr.c 23.8.2023
Reads 1 integer value from the keyboard
Passes this integer to the function and gets the same value back
In case of an error the function gives a -1 back.
*/

#include <stdio.h>
#include <stdlib.h>


extern long long int strldr_asm ( long long int val01, long long int *val02);

int main()
{
  long long int val2str, val2ldr;
  int error;	

  printf("Please give the value to be stored -> ");
  scanf("%ld", &val2str);
  printf("Value to be stored: %ld\n", val2str);
  

  error = strldr_asm(val2str, &val2ldr);	// calls the assembly program

  if(error == -1)
    printf("Error!\n");
  else
    printf("Value read is -> %ld\n", val2ldr);

  return 0;
}
