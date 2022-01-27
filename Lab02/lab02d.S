
.section .text
.globl lab02d

lab02d:
	ADRP X1, myvalue
	ADD X1,X1, :lo12:myvalue //load address of myvalue into x1

	ADD X2, X0, 0x3E8 //x2= myvalue + 1000
	STUR X2, [X1, 0] // store new value into the address of myvalue
	ADD X0, X1, 0x00 // return the address of where the value was
	BR X30

 .section       .data
        myvalue:	.word 0x00
