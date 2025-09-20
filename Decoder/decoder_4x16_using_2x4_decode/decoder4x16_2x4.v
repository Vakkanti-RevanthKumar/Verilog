module decode2to4(
  input  [1:0] i,
  input        e,
  output [3:0] y
);
  assign y[0] = e & ~i[1] & ~i[0];
  assign y[1] = e & ~i[1] &  i[0];
  assign y[2] = e &  i[1] & ~i[0];
  assign y[3] = e &  i[1] &  i[0];
endmodule


module decoder4x16_2x4(
  input  [3:0] i,
  output [15:0] y
);
  wire [3:0] en;   

  decode2to4 d0 (
    .i(i[3:2]),
    .e(1'b1),   
    .y(en)
  );

  decode2to4 d1 (.i(i[1:0]), .e(en[0]), .y(y[3:0]));
  decode2to4 d2 (.i(i[1:0]), .e(en[1]), .y(y[7:4]));
  decode2to4 d3 (.i(i[1:0]), .e(en[2]), .y(y[11:8]));
  decode2to4 d4 (.i(i[1:0]), .e(en[3]), .y(y[15:12]));

endmodule
