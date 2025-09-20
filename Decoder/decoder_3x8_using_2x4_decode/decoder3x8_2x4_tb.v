module decoder3x8_tb;

  reg [2:0] i;       
  wire [7:0] y;     

  decoder3x8_2x4 uut (
    .i(i),
    .y(y)
  );

  initial begin
    $monitor("Time = %t | i = %b | y = %b", $time, i, y);

    i = 3'b000; #10;
    i = 3'b001; #10;
    i = 3'b010; #10;
    i = 3'b011; #10;
    i = 3'b100; #10;
    i = 3'b101; #10;
    i = 3'b110; #10;
    i = 3'b111; #10;

    #20 $finish;
  end
endmodule
