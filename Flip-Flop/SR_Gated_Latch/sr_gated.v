`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2025 10:56:02
// Design Name: 
// Module Name: sr_gated
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


module sr_gated(
    input s,r,
    input en,
    output reg q,
    output qb
    );
    
    assign qb = ~q;
    always @(*) begin
    if(en) begin
        case({s,r})
            2'b00: q <= q;
            2'b01: q <= 0;
            2'b10: q <= 1;
            2'b11: q <= 1'bx;
        endcase
    end
 end  
endmodule
