`timescale 1ns/1ps
module NextPClogic(NextPC, CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch);
       input [63:0] CurrentPC, SignExtImm64;
       input Branch, ALUZero, Uncondbranch;
       output reg [63:0] NextPC;
       
       always@(*)
       begin
           if(Uncondbranch || (Branch && ALUZero)) // for b or cb type, goto address
           begin
            NextPC <= #3 CurrentPC + (SignExtImm64<<2);// general additon and mutiplexer delay
           end
           
           else
           begin
            NextPC <= #2 CurrentPC + 4;//addition with constant delay
           end
       end
       
       
endmodule