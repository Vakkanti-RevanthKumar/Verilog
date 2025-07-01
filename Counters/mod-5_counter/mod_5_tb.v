`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2025 19:35:03
// Design Name: 
// Module Name: mod_5_tb
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


module mod_5_tb();
    
    reg clk,rst;
    wire [2:0] q;
    
    mod_5 dut(clk,rst,q);
    
    initial clk = 0;
    always #10 clk = ~clk;
    
    initial begin
     $monitor("Time = %0t, q = %b", $time, q);
     

         rst =1;
         
         
         #100 rst = 0;
         
         #1000 $finish;
    end
        
endmodule

