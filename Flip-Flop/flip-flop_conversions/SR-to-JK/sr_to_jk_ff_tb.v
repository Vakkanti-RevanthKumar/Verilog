`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.05.2025 13:04:39
// Design Name: 
// Module Name: sr_to_jk_ff_tb
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


module sr_to_jk_ff_tb();
    reg j,k;
    reg clk;
    wire q;
    wire qb;
    
    sr_to_jk_ff  dut(j,k,clk,q,qb);
    
    initial clk = 0;
    always #5 clk = ~clk;
        
    initial begin
    $monitor(" time = %t | j = %b | k = %b | q = %b | qb = %b ", $time, j,k,q,qb);
    

    {j,k} = 2'b00;
    #10 {j,k} = 2'b01;
    #10 {j,k} = 2'b10;
    #10 {j,k} = 2'b11;
    
    #10 $finish;
    end
endmodule
