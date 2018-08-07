
module transmit(
input clk ,
input reset ,
input signed [2:0] taps ,
output signed [7:0] b 
);
wire signed [7:0] pattern ;

LFSR l1(clk,reset,pattern);
preemph p1(clk,taps,pattern,b);

endmodule
