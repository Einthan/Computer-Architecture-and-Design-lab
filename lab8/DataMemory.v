module DataMemory(ReadData, Address, WriteData,
                  MemoryRead, MemoryWrite, Clock);
     input [63:0] Address, WriteData;
     input MemoryRead, MemoryWrite, Clock;
     output reg [63:0] ReadData;
     reg [63:0] register [63:0]; //64 bits of 64 double words
     
     
     always @(negedge Clock)
     begin
         if(~MemoryRead && MemoryWrite)//memory write occures at negative clock 
             begin
             register[Address] <= #20 WriteData;
         end
     end
     
    always @(posedge Clock)
    begin
        if(MemoryRead && ~MemoryWrite)//memory read occures at positive clock 
        begin
        ReadData <= #20 register[Address];
        end
     end  
 endmodule
     