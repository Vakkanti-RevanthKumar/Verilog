`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.05.2025 16:20:34
// Design Name: 
// Module Name: sr_to_d_ff_tb
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


module sr_to_d_ff_tb();

reg d,clk;
wire q,qb;

sr_to_d_ff dut(d,clk,q,qb);

initial begin
    clk = 0;
    d = 0;
    $monitor("time = %t | d = %b | q = %b | qb = %b",$time, d, q, qb);
    #100 $finish;
end

always #5 clk = ~clk;
always #20 d = ~d;

endmodule
