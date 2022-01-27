`timescale 1ns / 1ps
`define STRLEN 32
module RegFileTest2;


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
	reg [63:0] BusW;
	reg [4:0] RA;
	reg [4:0] RB;
	reg [4:0] RW;
	reg RegWr;
	reg Clk;
	reg [7:0] passed;

	// Outputs
	wire [63:0] BusA;
	wire [63:0] BusB;

	// Instantiate the Unit Under Test (UUT)
	RegisterFile uut (
		.BusA(BusA), 
		.BusB(BusB), 
		.BusW(BusW), 
		.RA(RA), 
		.RB(RB), 
		.RW(RW), 
		.RegWr(RegWr), 
		.Clk(Clk)
	);

	initial begin
		// Initialize Inputs
		BusW = 0;
		RA = 0;
		RB = 0;
		RW = 0;
		RegWr = 0;
		Clk = 1;
		passed = 0;
		
		#10;
		
		// Add stimulus here
		
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd0, 64'h0, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd1, 64'h1, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd2, 64'h2, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd3, 64'h3, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd4, 64'h4, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd5, 64'h5, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd6, 64'h6, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd7, 64'h7, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd8, 64'h8, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd9, 64'h9, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd10, 64'h10, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd11, 64'h11, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd12, 64'h12, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd13, 64'h13, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd14, 64'h14, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd15, 64'h15, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd16, 64'h16, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd17, 64'h17, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd18, 64'h18, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd19, 64'h19, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd20, 64'h20, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd21, 64'h21, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd22, 64'h22, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd23, 64'h23, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd24, 64'h24, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd25, 64'h25, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd26, 64'h26, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd27, 64'h27, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd28, 64'h28, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd29, 64'h29, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd30, 64'h30, 1'b1};#10; Clk = 0; #10; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd31, 64'h31, 1'b1};#10; Clk = 0; #10; Clk = 1;
		
		//test1
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd1, 5'd0, 64'h0, 1'b0};
		#4;
		passTest(BusA, 64'h0, "Initial Value Check X0", passed);
		passTest(BusB, 64'h1, "Initial Value Check X1", passed);
		#6; Clk = 0; #10; Clk = 1;
		passTest(BusA, 64'h0, "X0 stay same", passed);
		passTest(BusB, 64'h1, "X1 stay same ", passed);
		
		//test2
		{RA, RB, RW, BusW, RegWr} = {5'd2, 5'd3, 5'd1, 64'h1000, 1'b0};
		#4;
		passTest(BusA, 64'h2, "Initial Value Check X2", passed);
		passTest(BusB, 64'h3, "Initial Value Check X3", passed);
		#6; Clk = 0; #10; Clk = 1;
		passTest(BusA, 64'h2, "X2 stay same", passed);
		passTest(BusB, 64'h3, "X3 stay same", passed);
		
		//test3
		{RA, RB, RW, BusW, RegWr} = {5'd4, 5'd5, 5'd0, 64'h1000, 1'b1};
		#4;
		passTest(BusA, 64'h4, "Initial Value Check X4", passed);
		passTest(BusB, 64'h5, "Initial Value Check X5", passed);
		#6; Clk = 0; #10; Clk = 1;
		passTest(BusA, 64'h4, "X4 stay same", passed);
		passTest(BusB, 64'h5, "X5 stay same", passed);
		
		//test4
		{RA, RB, RW, BusW, RegWr} = {5'd6, 5'd7, 5'd10, 64'h1010, 1'b1};
		#4;
		passTest(BusA, 64'h6, "Initial Value Check X6", passed);
		passTest(BusB, 64'h7, "Initial Value Check X7", passed);
		#6; Clk = 0; #10; Clk = 1;
		passTest(BusA, 64'h6, "X6 stay same ", passed);
		passTest(BusB, 64'h7, "X7 stay same", passed);
		
		//test5
		{RA, RB, RW, BusW, RegWr} = {5'd8, 5'd9, 5'd11, 64'h103000, 1'b1};
		#4;
		passTest(BusA, 64'h8, "Initial Value Check X8", passed);
		passTest(BusB, 64'h9, "Initial Value Check X9", passed);
		#6; Clk = 0; #10; Clk = 1;
		passTest(BusA, 64'h8, "X8 stay same ", passed);
		passTest(BusB, 64'h9, "X9 stay same", passed);
		
		//test6
		{RA, RB, RW, BusW, RegWr} = {5'd10, 5'd11, 5'd12, 64'h0, 1'b0};
		#4;
		passTest(BusA, 64'h1010, "Initial Value Check X10 updated from test4", passed);
		passTest(BusB, 64'h103000, "Initial Value Check X11 updated from test 5", passed);
		#6; Clk = 0; #10; Clk = 1;
		passTest(BusA, 64'h1010, "X10 stay same ", passed);
		passTest(BusB, 64'h103000, "X11 stay same", passed);
		
		//test7
		{RA, RB, RW, BusW, RegWr} = {5'd12, 5'd13, 5'd13, 64'hABCD, 1'b1};
		#4;
		passTest(BusA, 64'h12, "Initial Value Check X12", passed);
		passTest(BusB, 64'h13, "Initial Value Check X13", passed);
		#6; Clk = 0; #10; Clk = 1;
		passTest(BusA, 64'h12, "X12 stay same ", passed);
		passTest(BusB, 64'hABCD, "X13 updated", passed);
		
		//test8
		{RA, RB, RW, BusW, RegWr} = {5'd14, 5'd15, 5'd14, 64'h9080009, 1'b0};
		#4;
		passTest(BusA, 64'h14, "Initial Value Check X14", passed);
		passTest(BusB, 64'h15, "Initial Value Check X15", passed);
		#6; Clk = 0; #10; Clk = 1;
		passTest(BusA, 64'h14, "X14 stay same ", passed);
		passTest(BusB, 64'h15, "X15 stay same", passed);
		allPassed(passed, 32);
		end
		endmodule
		