`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:02:47 03/05/2009
// Design Name:   ALU
// Module Name:   E:/350/Lab8/ALU/ALUTest.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

`define STRLEN 32
module ALUTest_v;

	task passTest;
		input [64:0] actualOut, expectedOut;
		input [`STRLEN*8:0] testType;
		inout [7:0] passed;
	
		if(actualOut == expectedOut) begin $display ("%s passed", testType); passed = passed + 1; end
		else $display ("%s failed: %x should be %x", testType, actualOut, expectedOut);
	endtask
	
	task allPassed;
		input [7:0] passed;
		input [7:0] numTests;
		
		if(passed == numTests) $display ("All tests passed");
		else $display("Some tests failed");
	endtask

	// Inputs
	reg [63:0] BusA;
	reg [63:0] BusB;
	reg [3:0] ALUCtrl;
	reg [7:0] passed;

	// Outputs
	wire [63:0] BusW;
	wire Zero;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.BusW(BusW), 
		.Zero(Zero), 
		.BusA(BusA), 
		.BusB(BusB), 
		.ALUCtrl(ALUCtrl)
	);

	initial begin
		// Initialize Inputs
		BusA = 0;
		BusB = 0;
		ALUCtrl = 0;
		passed = 0;

                // Here is one example test vector, testing the ADD instruction:
		{BusA, BusB, ALUCtrl} = {64'h1234, 64'hABCD0000, 4'h2}; #40; passTest({Zero, BusW}, 65'h0ABCD1234, "ADD 0x1234,0xABCD0000", passed);
		//Reformate and add your test vectors from the prelab here following the example of the testvector above.	
		//AND
		{BusA, BusB, ALUCtrl} = {64'h2, 64'h3, 4'h0}; #40; passTest({Zero, BusW}, 65'h2, "AND 0x2,0x3", passed);
		{BusA, BusB, ALUCtrl} = {64'ha, 64'h4, 4'h0}; #40; passTest({Zero, BusW}, 65'h10000000000000000, "AND 0xa,0x4", passed);
		{BusA, BusB, ALUCtrl} = {64'h10, 64'h10, 4'h0}; #40; passTest({Zero, BusW}, 65'h10, "AND 0x10,0x10", passed);
		
		//OR
		{BusA, BusB, ALUCtrl} = {64'h4, 64'h8, 4'h1}; #40; passTest({Zero, BusW}, 65'hc, "OR 0x4,0x8", passed);
		{BusA, BusB, ALUCtrl} = {64'ha, 64'hc, 4'h1}; #40; passTest({Zero, BusW}, 65'he, "OR 0xa,0xc", passed);
		{BusA, BusB, ALUCtrl} = {64'h15, 64'h20, 4'h1}; #40; passTest({Zero, BusW}, 65'h35, "OR 0x15,0x20", passed);
		
		//ADD
		{BusA, BusB, ALUCtrl} = {64'h2, 64'h6, 4'h2}; #40; passTest({Zero, BusW}, 65'h8, "ADD 0x2,0x6", passed);
		{BusA, BusB, ALUCtrl} = {64'h10, 64'h15, 4'h2}; #40; passTest({Zero, BusW}, 65'h25, "ADD 0x10,0x15", passed);
		{BusA, BusB, ALUCtrl} = {64'h20, 64'h20, 4'h2}; #40; passTest({Zero, BusW}, 65'h40, "ADD 0x20,0x20", passed);
		
		//SUB
		{BusA, BusB, ALUCtrl} = {64'h3, 64'h1, 4'h6}; #40; passTest({Zero, BusW}, 65'h2, "SUB 0x3,0x1", passed);
		{BusA, BusB, ALUCtrl} = {64'hf, 64'he, 4'h6}; #40; passTest({Zero, BusW}, 65'h1, "SUB 0xf,0xe", passed);
		{BusA, BusB, ALUCtrl} = {64'h15, 64'he, 4'h6}; #40; passTest({Zero, BusW}, 65'h7, "SUB 0x15,0xe", passed);
		
		//PassB
		{BusA, BusB, ALUCtrl} = {64'h5, 64'h2, 4'h7}; #40; passTest({Zero, BusW}, 65'h2, "PassB 0x5,0x2", passed);
		{BusA, BusB, ALUCtrl} = {64'h457abc, 64'h0, 4'h7}; #40; passTest({Zero, BusW}, 65'h10000000000000000, "PassB 0x457abc,0x0", passed);
		{BusA, BusB, ALUCtrl} = {64'hfeb1235, 64'he, 4'h7}; #40; passTest({Zero, BusW}, 65'he, "PassB 0xfeb1235,0xe", passed);
		
		//LSL
		{BusA, BusB, ALUCtrl} = {64'h151cde, 64'h8, 4'h3}; #40; passTest({Zero, BusW}, 65'h151cde00, "LSL 0x151cde,0x1000", passed);
		{BusA, BusB, ALUCtrl} = {64'he100, 64'h1, 4'h3}; #40; passTest({Zero, BusW}, 65'h1c200, "LSL 0xe100,0x1", passed);
		{BusA, BusB, ALUCtrl} = {64'heaf854, 64'h14, 4'h3}; #40; passTest({Zero, BusW}, 65'heaf85400000, "LSL 0x151cde,0x1000", passed);
		
		//LSR
		{BusA, BusB, ALUCtrl} = {64'hbf109, 64'h3, 4'h4}; #40; passTest({Zero, BusW}, 65'h17e21, "LSR 0xbf109,0x3", passed);
		{BusA, BusB, ALUCtrl} = {64'hcba404, 64'h4, 4'h4}; #40; passTest({Zero, BusW}, 65'h0cba40, "LSR 0xcba404,0x4", passed);
		{BusA, BusB, ALUCtrl} = {64'ha53bf109, 64'h10, 4'h4}; #40; passTest({Zero, BusW}, 65'ha53b, "LSR 0xa53bf109,0x10", passed);

		allPassed(passed, 22);
	end
      
endmodule

