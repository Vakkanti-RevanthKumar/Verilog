`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2025 11:53:35
// Design Name: 
// Module Name: bcd_odd_gre_3
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


/* Design a BCD counter with inputs(ABCD) which counts only ODD numbers which greater than 3 
 and its simplified equation implement this using only any number of input NAND gates? */


module odd_bcd_counter (
    input clk,
    input reset,
    output reg [3:0] count
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 4'b0101;
        end else begin
            case (count)
                4'b0101: count <= 4'b0111; // 5 ? 7
                4'b0111: count <= 4'b1001; // 7 ? 9
                4'b1001: count <= 4'b0101; // 9 ? 5
                default: count <= 4'b0101;
            endcase
        end
    end

endmodule
