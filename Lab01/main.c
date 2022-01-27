/* Part 6 of the program


 main.c simple program to test assembler program

#include <stdio.h>

extern long long int test();  // removing all arguments in main.c

int main(void)
{
    long long int a = test();   //call assembly from test.S
    printf("Result of test(3,7) = %ld\n", a);
    return 0;
}
*/

/*part 7 mod */

/* main.c simple program to test your assembly program */

#include <stdio.h>

extern long long int test ( long long int b);

int main ( void ){

	long long int a = test (32) ;  // Replace Y with any number you like, I used 32

	printf ("Result is = %d\n", a);

	return 0;

}

