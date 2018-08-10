/*      Transmit Module       */
/*
This module sends control signals to choose module to select between PRBS-7 and PRBS-13.
It also ask pre-emphasis module to perform pre-emphasis based on tap values given by user.
*/
module transmit(
input control ,
input clk ,
input reset ,
input signed [2:0] taps ,
output signed [12:0] b 
);
wire signed [12:0] pattern ;

//LFSR l1(clk,reset,pattern);
choose cc1(control,clk,reset,pattern);
preemph p1(clk,taps,pattern,b);

endmodule
