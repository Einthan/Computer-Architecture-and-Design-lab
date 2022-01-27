/*	part 6 mod
	.globl test
test:
	orr X0, XZR, #3   //use immediate form to make the register x0 become 0 or 3
	orr x1, XZR, #7   ///use immediate form to make the register x1 become 0 or 7
	add X0, X0, X1   //perform addition in form of assembly language
	br	X30
*/

//part 7 mod
	.globl test

test :

	// make sure you replace Z with the first digit of your UIN

	LSR X1, X0 , #8  //computation 1, result is in $X1, this is logical shift right of the User value by first digit of the Uin unit

	LSL X2 , X0 , #8 //computation 2, result is in $X2, this is logical shift left of the User value by first digit of the Uin unit

	// check the content of $X1 and $X2

	ADD X0 , X1 , X2

	BR X30 // return from main ; return address stored in X30

