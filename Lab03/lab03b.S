.globl lab03b

lab03b:

	MOV X1, XZR //i=0
	MOV X2, XZR
	ADD X2, X2, #10
	ADRP X3, UIN
	ADD X3, X3, :lo12:UIN // load uin address into X3
	LDUR X0, [X3,#0] // load value of the sum to X3

for1: CMP X1, X2
	 B.GE exit1 // if i>=10 go to exit
	 SUB X0, X0, #1 //uin- = 1

	 ADD X1, X1, #1	//i+1
	 B for1


exit1:
		STUR X0, [X3, #0]  //store the value back to X3
		BR X30

.section .data
UIN:
.word 0x28      //sum of my uin = 40
