module decode(
  input  [1:0] i,
  input        e,
  output [3:0] y
);

  assign y[0] =  e & ~i[1] & ~i[0];
  assign y[1] =  e & ~i[1] &  i[0];
  assign y[2] =  e &  i[1] & ~i[0];
  assign y[3] =  e &  i[1] &  i[0];

endmodule


module decoder3x8_2x4(
  input  [2:0] i,
  output [7:0] y
);

  decode d0 (
    .i(i[1:0]),
    .e(~i[2]),
    .y(y[3:0])
  );

  decode d1 (
    .i(i[1:0]),
    .e(i[2]),
    .y(y[7:4])
  );

endmodule
