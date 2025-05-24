`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.05.2025 20:05:49
// Design Name: 
// Module Name: sr_to_t_ff_tb
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


module sr_to_t_ff_tb();

    reg t,clk;
    wire q,qb;
    
    sr_to_t_ff dut(t,clk,q,qb);
    
    initial begin
        clk = 0;
        t = 0;
        $monitor("time = %t | t = %b | q = %b | qb = %b",$time, t, q, qb);
        #100 $finish;
    end
    
    always #5 clk = ~clk;
//    always #10 t = $random;
    always #10 t = ~t;

endmodule
