.section .text
.globl test2

test2:
	SUB SP, SP, 16 // make room for two items on stack

	SUB X1, X0, X1 //sub function
	STUR X1, [SP, 8]  //store the value in the second order
	STUR X30, [SP,0]  //store the return address in the first order

	ADRP X0, string
	ADD X0, X0, :lo12:string // get the address of the string
	BL printf  // branch and link to printf

	LDUR X30, [SP, 0]//load the return address
	LDUR X1, [SP,8]  // load the value
	ADD SP, SP, 16  //pop two items off stack
	BR X30  // return



.section .data
string: .asciz "Result of test2(6,5) = %d\n"
