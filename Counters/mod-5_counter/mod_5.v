`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2025 18:48:40
// Design Name: 
// Module Name: mod_5
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


module mod_5(
    input clk,rst,
    output [2:0] q
    );
    
    wire nd_out;
    wire clr;
    
    nand (nd_out, q[0], (~q[1]), q[2]);
    assign clr = ~(rst | ~nd_out);
    
    t_ff t0(.clk(clk), .rst(clr), .t(1'b1), .q(q[0]));
    t_ff t1(.clk(q[0]), .rst(clr), .t(1'b1), .q(q[1]));
    t_ff t2(.clk(q[1]), .rst(clr), .t(1'b1), .q(q[2]));
endmodule

module t_ff(
    input clk,rst,t,
    output reg q
    );
    
    always @(negedge clk or negedge rst)
        begin
            if(!rst)
                q <= 0;
            else
                q <= ~q;
        end
endmodule
    