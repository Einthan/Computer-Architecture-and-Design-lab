`timescale 1ns/1ps
module ALUControl(ALUCtrl, ALUop, Opcode);
     input [1:0] ALUop;
     input [10:0] Opcode;
     output reg [3:0] ALUCtrl;
     
     always@(*) begin
        if(ALUop == 2'b00)// case LDUR and STUR
        begin
            ALUCtrl <=  #2 4'b0010;
        end
        
        else if(ALUop == 2'b01)// case CBZ
        begin
            ALUCtrl <=  #2 4'b0111;
        end
        
        else if(ALUop == 2'b10)// case LDUR and STUR
        begin
            if(Opcode == 11'b10001011000)//add
            begin
                ALUCtrl <=  #2 4'b0010;
            end
            
           else if(Opcode == 11'b11001011000)//sub
            begin
                ALUCtrl <=  #2 4'b0110;
            end
            
            else if(Opcode == 11'b10001010000)//and
            begin
                ALUCtrl <=  #2 4'b0000;
            end
            
            else if(Opcode == 11'b10101010000)//or
            begin
                ALUCtrl <=  #2 4'b0001;
            end
          end
        end
endmodule