`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.05.2025 16:06:43
// Design Name: 
// Module Name: sr_to_d_ff
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

module sr_ff(
    input s,r,
    input clk,
    output reg q = 1,
    output  qb
    );
    
    assign qb = ~q;

    always @(posedge clk)
        begin
            case({s,r})
                2'b00: q <= q;
                2'b01: q <= 0;
                2'b10: q <= 1;
                2'b11: q <= 1'bx;
            endcase
        end        
endmodule

module sr_to_d_ff(
    input d,clk,
    output q,qb);
   
    sr_ff srd(d,(~d),clk,q,qb);
    
endmodule
