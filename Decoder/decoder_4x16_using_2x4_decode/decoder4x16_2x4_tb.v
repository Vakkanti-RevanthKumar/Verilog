module decoder4x16_tb;

  reg  [3:0] i;         
  wire [15:0] y;        

  
  decoder4x16_2x4 uut (
    .i(i),
    .y(y)
  );

  initial begin
    $monitor("Time = %0t | i = %b | y = %b", $time, i, y);

    i = 4'b0000; #10;
    i = 4'b0001; #10;
    i = 4'b0010; #10;
    i = 4'b0011; #10;
    i = 4'b0100; #10;
    i = 4'b0101; #10;
    i = 4'b0110; #10;
    i = 4'b0111; #10;
    i = 4'b1000; #10;
    i = 4'b1001; #10;
    i = 4'b1010; #10;
    i = 4'b1011; #10;
    i = 4'b1100; #10;
    i = 4'b1101; #10;
    i = 4'b1110; #10;
    i = 4'b1111; #10;

    #20 $finish;
  end

endmodule
