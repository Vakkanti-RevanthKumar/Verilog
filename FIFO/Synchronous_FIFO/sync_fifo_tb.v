`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2025 08:09:53
// Design Name: 
// Module Name: sync_fifo_tb
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

module syn_fifo_tb;

  parameter DATA  = 8;
  parameter ADDR  = 4;
  parameter DEPTH = 16;

  reg clk, rst;
  reg wr_en, rd_en;
  reg [DATA-1:0] din;
  wire [DATA-1:0] dout;
  wire full, empty;

  syn_fifo #(DATA, ADDR, DEPTH) dut (
    .clk(clk),
    .rst(rst),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .din(din),
    .dout(dout),
    .full(full),
    .empty(empty)
  );

  always #5 clk = ~clk;

  initial begin

    clk   = 0;
    rst   = 1;
    wr_en = 0;
    rd_en = 0;
    din   = 0;

    $monitor("Time=%0t | rst=%b wr_en=%b rd_en=%b din=%h dout=%h full=%b empty=%b",
              $time, rst, wr_en, rd_en, din, dout, full, empty);

    #12 rst = 0;

    repeat(5) begin
      @(posedge clk);
      wr_en = 1;
      din = $random;
    end
    
    @(posedge clk) wr_en = 0;

    repeat(5) begin
      @(posedge clk);
      rd_en = 1;
    end
    @(posedge clk) rd_en = 0;

    // Write more until full
    while(!full) begin
      @(posedge clk);
      wr_en = 1;
      din = $random;
    end
    @(posedge clk) wr_en = 0;

    // Read all until empty
    while(!empty) begin
      @(posedge clk);
      rd_en = 1;
    end
    @(posedge clk) rd_en = 0;

    #20 $finish;
  end

endmodule





















//module fifo_tb;

//    // Parameters
//    parameter DATA_WIDTH = 8;
//    parameter DEPTH = 16;
//    parameter ADDR_WIDTH = 4;

//    // Testbench signals
//    reg clk;
//    reg rst;
//    reg wr_en;
//    reg rd_en;
//    reg [DATA_WIDTH-1:0] din;
//    wire [DATA_WIDTH-1:0] dout;
//    wire full;
//    wire empty;

//    // Instantiate the FIFO
//    fifo #(
//        .DATA_WIDTH(DATA_WIDTH),
//        .DEPTH(DEPTH),
//        .ADDR_WIDTH(ADDR_WIDTH)
//    ) dut (
//        .clk(clk),
//        .rst(rst),
//        .wr_en(wr_en),
//        .rd_en(rd_en),
//        .din(din),
//        .dout(dout),
//        .full(full),
//        .empty(empty)
//    );

//    // Clock generation
//    always #5 clk = ~clk;

//    // Test sequence
//    initial begin
//        $display("Starting FIFO testbench...");
//        clk = 0;
//        rst = 1;
//        wr_en = 0;
//        rd_en = 0;
//        din = 0;

//        // Reset
//        #10 rst = 0;

//        // Write to FIFO
//        repeat (8) begin
//            @(posedge clk);
//            wr_en = 1;
//            din = din + 1;
//        end

//        @(posedge clk);
//        wr_en = 0;

//        // Read from FIFO
//        repeat (8) begin
//            @(posedge clk);
//            rd_en = 1;
//        end

//        @(posedge clk);
//        rd_en = 0;

//        // Final check
//        @(posedge clk);
//        if (empty && !full)
//            $display("Test Passed: FIFO is empty after read");
//        else
//            $display("Test Failed");

//         $finish;
//    end

//endmodule

