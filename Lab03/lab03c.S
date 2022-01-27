.globl lab03c
lab03c:

	ADRP X1, fd
	ADD X1, X1, :lo12:fd  //load address of first digit into X1
	LDUR X0, [X1,#0]  // load the value of first digit into X0

	MOVZ X2, #10 //maxium count number
	MOV X3, XZR //i=0

	ADRP X4, my_array
	ADD X4, X4, :lo12:my_array  // load address of array into x5

for1: CMP X3, X2
	B.GE exit1 // if X3>=X2, go to exit1
	STUR X0, [X4,#0] // my_array[i] = fd
	ADD X0, X0, #1 // fd+=1
	ADD X4, X4, #4 // go to the next word's address
	ADD X3, X3, #1 // i+=1
	B for1 // loop

exit1: BR X30 //return to main

.section .data
my_array: .space 0x28 //10 words, each for 4 bytes
fd: .word 0x8
