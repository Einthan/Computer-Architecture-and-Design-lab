module SignExtender(BusImm, Imm32);
  output reg [63:0] BusImm;
  input [31:0] Imm32;


  
  always@(*)
     begin
         
         if(Imm32[31:26]  == 6'b000101) // B type
         begin
           assign BusImm = {{38{Imm32[25]}}, Imm32[25:0]}; //offset 26 bit, from 0 to 25
         end
         
         else if(Imm32[31:24] == 8'b10110100) // CB type
         begin
           assign BusImm = {{45{Imm32[23]}}, Imm32[23:5]}; //offset 19 bit, from 5 to 23
         end
         
         else if(Imm32[31: 21] == 11'b11111000000 || Imm32[31: 21] == 11'b11111000010)// D type
         begin
            assign BusImm = {{55{Imm32[20]}}, Imm32[20:12]}; //offset 9 bit, from 12 to 20
         end
         
         else if (Imm32[31:21] == 11'b11010011011) begin //LSL

            assign BusImm = {{58{Imm32[15]}},Imm32[15:10]}; 
           end
    
         else
         begin
            assign BusImm = 64'b0;
         end
      end
      
 endmodule
      
