`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2025 11:16:49
// Design Name: 
// Module Name: sr_gated_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sr_gated_tb();

    reg s,r;
    reg en;
    wire q,qb;
    
    sr_gated dut(s,r,en,q,qb);
    
    initial begin
    $monitor("Time = %t | s = %b | r = %b | en = %b | q = %b | qb = %b", $time, s, r, en, q, qb);
    
    en = 0; {s,r} = 2'b00;
    #10 {s,r} = 2'b01;
    #10 {s,r} = 2'b10;
    #10 {s,r} = 2'b11;
     
    #20 en = 1; {s,r} = 2'b00;
    #10 {s,r} = 2'b01;
    #10 {s,r} = 2'b10;
    #10 {s,r} = 2'b11;
    
    #10 $finish;
    end
endmodule
