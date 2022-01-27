module SignExtender(BusImm, Imm32, Ctrl);
  output reg [63:0] BusImm;
  input [31:0] Imm32;
  input [2:0] Ctrl;

  /*wire extBit;
  assign #1 extBit = (Ctrl ? 1'b0 : Imm16[15]);
  assign BusImm = {{16{extBit}}, Imm16};
  
  assign #1 exitBit = (Ctrl ? 2'b00 : Imm32[20:12]};
  assign BusImm = {{55{Imm32[20]}}, Imm32[20:12]};
  
  .... = {Ctrl ? 2'b01 : Imm32[25:0]}
  */
  
  always@(*)
     begin
         if(Ctrl == 2'b00) // D type
         begin
            BusImm = {{55{Imm32[20]}}, Imm32[20:12]}; //offset 9 bit, from 12 to 20
         end
         
         else if(Ctrl == 2'b01) // B type
         begin
            BusImm = {{38{Imm32[25]}}, Imm32[25:0]}; //offset 26 bit, from 0 to 25
         end
         
         else if(Ctrl == 2'b10) // CB type
         begin
            BusImm = {{45{Imm32[23]}}, Imm32[23:5]}; //offset 19 bit, from 5 to 23
         end
      end
      
 endmodule
      
