/* main.c simple program to test assembler program */

#include <stdio.h>

extern long long int my_mul(long long int a, long long int b);
extern long long int lab04b(long long int c);

int main(void)
{
    //long long int a = lab04b(3, 5);
    //printf("Result of mul(3, 5) = %ld\n", a);
	long long int c = lab04b(3);
	printf("Result of factorial(3) = %ld\n", c);
    return 0;
}
