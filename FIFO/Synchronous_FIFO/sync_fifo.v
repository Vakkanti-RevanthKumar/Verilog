`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2025 08:09:14
// Design Name: 
// Module Name: sync_fifo
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

module syn_fifo #( parameter DATA = 8, 
                   parameter ADDR = 4, 
                   parameter DEPTH = 16
                 )( input clk,rst,
                    input wr_en, rd_en,
                    input [DATA - 1 : 0] din,
                    output reg [DATA - 1 : 0] dout,
                    output full, empty
                  );
  
  reg [DATA - 1 : 0] mem [0 : DEPTH];
  reg [ADDR - 1 : 0] wr_ptr, rd_ptr;
  
  always @(posedge clk or posedge rst) 
    begin
      if (rst)
        begin
          wr_ptr <= 0;
          rd_ptr <= 0;
          dout   <= 0;
        end
    else
    begin
      
      if(wr_en && !full)
        begin
          mem[wr_ptr] <= din;
          wr_ptr <= wr_ptr + 1;
        end
      
      if(rd_en && !empty)
        begin
          dout <= mem[rd_ptr];
          rd_ptr <= rd_ptr + 1;
        end
    end
  end
  assign full = ((wr_ptr + 1) == rd_ptr);
  assign empty = (wr_ptr == rd_ptr);
  
endmodule





















//module fifo #(
//    parameter DATA_WIDTH = 8,
//    parameter DEPTH = 16,
//    parameter ADDR_WIDTH = 4  // log2(DEPTH)
//)(
//    input wire clk,
//    input wire rst,
//    input wire wr_en,
//    input wire rd_en,
//    input wire [DATA_WIDTH-1:0] din,
//    output reg [DATA_WIDTH-1:0] dout,
//    output wire full,
//    output wire empty
//);

//    // Memory
//    reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];

//    // Pointers
//    reg [ADDR_WIDTH-1:0] wr_ptr = 0;
//    reg [ADDR_WIDTH-1:0] rd_ptr = 0;

//    // Counter to track number of elements
//    reg [ADDR_WIDTH:0] count = 0;

//    // Write logic
//    always @(posedge clk) begin
//        if (rst) begin
//            wr_ptr <= 0;
//        end else if (wr_en && !full) begin
//            mem[wr_ptr] <= din;
//            wr_ptr <= wr_ptr + 1;
//        end
//    end

//    // Read logic
//    always @(posedge clk) begin
//        if (rst) begin
//            rd_ptr <= 0;
//            dout <= 0;
//        end else if (rd_en && !empty) begin
//            dout <= mem[rd_ptr];
//            rd_ptr <= rd_ptr + 1;
//        end
//    end

//    // Count logic
//    always @(posedge clk) begin
//        if (rst) begin
//            count <= 0;
//        end else begin
//            case ({wr_en && !full, rd_en && !empty})
//                2'b10: count <= count + 1; // write only
//                2'b01: count <= count - 1; // read only
//                default: count <= count;   // no change or simultaneous read/write
//            endcase
//        end
//    end

//    // Flags
//    assign full = (count == DEPTH);
//    assign empty = (count == 0);

//endmodule

