module count_ones (
    input  [7:0] data_in,     // 8-bit input
    output reg [3:0] count    // maximum 8 ones -> needs 4 bits
);

integer i;

always @(*) begin
    count = 0;                // initialize count
    
    for(i = 0; i < 8; i = i + 1) begin
    
        if(data_in[i] == 1'b1)
        
            count = count + 1;
            
    end
end


endmodule
