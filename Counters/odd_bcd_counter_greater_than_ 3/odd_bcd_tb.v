`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2025 11:55:24
// Design Name: 
// Module Name: odd_bcd_tb
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

module odd_bcd_counter_tb();

    reg clk;
    reg reset;
    wire [3:0] count;

    odd_bcd_counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    always #5 clk = ~clk;

    initial begin
        $monitor("time = %t | rst = %b | count = %b", $time, reset, count);

        clk = 0;
        reset = 1;

        #10 reset = 0;
        #100;
        reset = 1;
        #10 reset = 0;

        #50 $finish;
    end

endmodule

