 .globl lab04b

lab04b:
	SUB SP, SP, #16          //make room for the 2 items on stack
    STUR X30, [SP, #8]   //store return address
    STUR X0, [SP, #0]   // store the current value

    CBNZ X0, loop // if the value is not equal to zero, do the loop
    MOVZ X0, #1  // 0!=1
    ADD SP, SP, #16  // pop items off stack
    BR X30  // return to caller




loop:
	SUB X0, X0, #1 // n-=1
	BL lab04b  // call lab04b again
	LDUR X1, [SP, #0]  // load the pervious value into X1
	BL my_mul  //call the multiplication functiuon for X0 *X1
	LDUR X30, [SP, #8]  //load the return address
	ADD SP, SP, #16  // pop items off stack
	BR X30



