`timescale 1ns/1ps
module Mux21(out, in, sel);
    input [1:0] in;
    input wire sel;
    output wire out;
    
    wire a, b, c;
    not not0(a, sel);//not sel
    and and0(b, in[0], a);//sekect the first input if not sel
    and and1(c, in[1], sel); //select the second input if sel
    or or0(out, b,c);
endmodule