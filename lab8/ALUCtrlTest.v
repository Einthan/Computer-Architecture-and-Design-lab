//ALU ControlTest.v
`timescale 1ns / 1ps
`define STRLEN 32
module ALUControlTest_v;


	task passTest;
		input [63:0] actualOut, expectedOut;
		input [`STRLEN*8:0] testType;
		inout [7:0] passed;
	
		if(actualOut == expectedOut) begin $display ("%s passed", testType); passed = passed + 1; end
		else $display ("%s failed: %d should be %d", testType, actualOut, expectedOut);
	endtask
	
	task allPassed;
		input [7:0] passed;
		input [7:0] numTests;
		
		if(passed == numTests) $display ("All tests passed");
		else $display("Some tests failed");
	endtask


	// Inputs
	reg [1:0] ALUop;
	reg [10:0] Opcode;
	reg [3:0] expect;
	reg [7:0] passed;

	// Outputs
	wire [3:0] ALUCtrl;

	// Instantiate UUT
	ALUControl uut (
		.ALUop(ALUop), .Opcode(Opcode), .ALUCtrl(ALUCtrl)
	);

	initial begin

	ALUop = 0;
	Opcode = 0;
	passed = 0;


	$monitor("ALUop = %b, Opcode = %b, ALUCtrl = %b, exp = %b", ALUop, Opcode, ALUCtrl, expect);		

	//Test #1
	expect = 4'b0010;

	#6{ALUop, Opcode} = {2'b00, 11'b11001011000};
	#6 passTest(ALUCtrl, expect, "Test #1 AlUop Input: 00", passed);

	
	//Test #2
	expect = 4'b0111;

	#6{ALUop, Opcode} = {2'b01, 11'b11001011000};
	#6 passTest(ALUCtrl, expect, "Test #2 AlUop input: 01", passed);

	
	//Test #3
	expect = 4'b0110;

	#6{ALUop, Opcode} = {2'b10, 11'b11001011000};
	#6 passTest(ALUCtrl, expect, "Test #3 AlUop input: 10", passed);
 
	//Test #4
	expect = 4'b0001;

	#6{ALUop, Opcode} = {2'b10, 11'b10101010000};
	#6 passTest(ALUCtrl, expect, "Test #4 AlUop input: 10", passed);

	
	//Test #5
	expect = 4'b0000;

	#6{ALUop, Opcode} = {2'b10, 11'b10001010000};
	#6 passTest(ALUCtrl, expect, "Test #5 AlUop input: 10", passed);

	
	//Test #6
	expect = 4'b0010;

	#6{ALUop, Opcode} <= {2'b10, 11'b10001011000};
	#6 passTest(ALUCtrl,expect, "Test #6 AlUop input: 10", passed);

	
	//Test #7
	expect = 4'b0001;

	#6{ALUop, Opcode} = {2'b10, 11'b10101010000};
	#6 passTest(ALUCtrl, expect, "Test #7 AlUop input: 10", passed);

	
	//Test #8
	expect = 4'b0010;

	#6{ALUop, Opcode} = {2'b10, 11'b10001011000};
	#6 passTest(ALUCtrl, expect, "Test #8 AlUop input: 10", passed);

	
	//Test #9
	expect = 4'b0110;

	#6{ALUop, Opcode} = {2'b10, 11'b11001011000};
	#6 passTest(ALUCtrl, expect, "Test #9 AlUop input: 10", passed);

	

	#2 allPassed(passed, 9);

	end

	 

endmodule


