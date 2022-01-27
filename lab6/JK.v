`timescale 1ns / 1ps
`default_nettype none
module JK (out,j,k,clk,reset);
    output wire out;
    input wire j, k, clk, reset;
    
    wire nout,nr, n1, n2, q, nq;

//    not not0(nq, q); //qbar
//    not not1(nr, reset); //not reset
    
    nand #2 nan0(n1, j, nq, clk);
    
    nand #2 nan1(n2, k, out, clk);  
    
    nand #2 nan2(out, nq, n1); 
    
    nand #2 nan3(nq, n2, out,~reset);
   
   

endmodule