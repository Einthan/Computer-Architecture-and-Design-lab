module RegisterFile(BusA, BusB, BusW, RW, RegWr, Clk, RA, RB);
    output [63:0] BusA;
    output [63:0] BusB;
    input [63:0] BusW;
    input [4:0] RW, RA, RB;
    input RegWr;
    input Clk;
    reg [63:0] registers [31:0]; // make 64 of 32 bit registers
    
    always @(posedge Clk) begin
        registers[31] = 0; // set x31 to 0
    end
    
    assign #2 BusA = registers[RA];
    assign #2 BusB = registers[RB];
     
    always @ (negedge Clk) begin
        if(RegWr && RW != 31) // make sure x31 will not be written
            registers[RW] <= #3 BusW;
    end
endmodule
