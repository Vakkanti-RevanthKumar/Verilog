`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.05.2025 10:27:05
// Design Name: 
// Module Name: sr_ff
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


module sr_ff_async(
    input s,r,
    input clk,
    input preset, clear,
    output reg q,
    output qb
    );
    
    assign qb = ~q;
    
    always @(posedge clk or negedge preset or negedge clear)
    begin
        if(!clear)
            q <= 0;
        else if(!preset)
            q <= 1;
        else begin
            case({s,r})
                2'b00: q <= q;
                2'b01: q <= 0;
                2'b10: q <= 1;
                2'b11: q <= 1'bx;
            endcase
        end
   end
endmodule
