`timescale 1ns / 1ps
`define STRLEN 15
module SignExtendertb;

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
	reg [31:0] Imm32;
	reg [2:0] Ctrl;
	reg [3:0] passed;

	// Outputs
	wire [63:0] BusImm;
	
	SignExtender uut (
		     .BusImm(BusImm),
		     .Imm32(Imm32),
		     .Ctrl(Ctrl)	    
		     );
		     
    initial begin
		// Initialize Inputs
		Imm32 = 0;
		passed = 0;

		// Add stimulus here
		
		// STUR 
      #90; {Ctrl,Imm32} = {2'b00, 32'b11111000000_100001010_001000000001}; #10; 
      passTest(BusImm, 64'b1111111111111111111111111111111111111111111111111111111100001010, "STUR", passed);
      
      // LDUR 
      #90; {Ctrl,Imm32} = {2'b00, 32'b11111000010_010111001_011000010011}; #10; 
      passTest(BusImm, 64'b0000000000000000000000000000000000000000000000000000000010111001, "LDUR", passed);
      
      // B 
      #90; {Ctrl,Imm32} = {2'b01, 32'b000101_00000000000000000000010011}; #10; 
      passTest(BusImm, 64'b0000000000000000000000000000000000000000000000000000000000010011, "B", passed);
		
	   // CB  
      #90; {Ctrl, Imm32} = {2'b10, 32'b10110101_0000000000000001010_00011}; #10; 
      passTest(BusImm, 64'b0000000000000000000000000000000000000000000000000000000000001010, "CBNZ", passed);
      #90;
      
	  allPassed(passed, 4);
	 
		
    end
    endmodule
		
		