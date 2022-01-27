module NextPCLogic(NextPC, CurrentPC, SignExtImm64, Branch, ALUZero, UCbranch);
       input [63:0] CurrentPC, SignExtImm64;
       input Branch, ALUZero, UCbranch;
       output reg [63:0] NextPC;
       
       
       always@(*)
       begin
           if(UCbranch || (Branch && ALUZero)) // for b or cb type, goto address
           begin
            NextPC <= #3 CurrentPC + (SignExtImm64<<2);// general additon and mutiplexer delay
           end
           
           else
           begin
            NextPC <= #1 CurrentPC + 4;//addition with constant delay
           end
       end
       
       
endmodule