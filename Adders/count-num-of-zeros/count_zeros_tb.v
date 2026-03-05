`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.03.2026 10:16:00
// Design Name: 
// Module Name: count_one_tb
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


module count_ones_tb();

reg [7:0] data_in;
wire [3:0] count;

count_ones uut(
    .data_in(data_in),
    .count(count)
);

initial begin

$monitor("time=%0t data=%b count=%d",$time,data_in,count);

data_in = 8'b00000000; 
#10 data_in = 8'b11111111; 
#10 data_in = 8'b10101010; 
#10 data_in = 8'b01001100; 

#10 $finish;

end

endmodule
