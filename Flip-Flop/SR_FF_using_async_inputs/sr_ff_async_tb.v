`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.05.2025 10:46:07
// Design Name: 
// Module Name: sr_ff_async_tb
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


module sr_ff_async_tb();

    reg s,r;
    reg clk;
    reg preset, clear;
    wire q;
    wire qb;
    
    sr_ff_async dut(s, r, clk, preset, clear, q, qb);
    
    initial clk = 0;
    always #10 clk = ~clk;
    
    initial begin
    
    $monitor(" time = %t | s = %b | r = %b | preset = %b | clear = %b | q = %b | qb = %b ", $time, s, r, preset, clear, q, qb ); 
    
    preset = 0; clear = 0; s = 0; r = 0;
    #10 preset = 0; clear = 1; s = 0; r = 1;
    #10 preset = 1; clear = 0; s = 1; r = 0;
    
    #10 preset = 1; clear = 1;
    #10 s = 0; r = 0;
    #10 s = 0; r = 1;
    #10 s = 1; r = 0;
    #10 s = 1; r = 1; 
        
    #10 $finish;
    end 
endmodule
