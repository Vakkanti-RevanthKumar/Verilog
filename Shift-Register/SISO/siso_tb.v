`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.10.2024 09:49:30
// Design Name: 
// Module Name: siso_tb
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


module siso_tb(

    );
    reg clk,rst,din;
    wire out;
    
    siso sr(clk,rst,din,out);
    
    initial clk=0;
    always #10 clk=~clk;
    initial begin
    
    $monitor("Time = %0t | rst = %b | din = %b | out = %b |", $time, rst, din, out);
    
            rst = 1;
            
            #10 rst = 0; din = 1; 
            
            #10 din = 0; 
            #10 din = 1;
            #10 din = 0;
    
            #100 $finish;
    end
endmodule
