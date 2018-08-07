/*
" TOP Module "
This module is the top module.
It takes parameters which user wants as input
and gives the BER based on those paramaeters as output
*/
module combined(
input control, // Input for choosing between PRBS-7 or PRBS-13
input sel, // For choosing between normal input or test pattern input
input [2:0] ctrl_sig, // This input is for deciding whether to reset the channel or not.  
input [2:0] val,
input [24:0] wanted_cl_val ,// This input refers to clock frequency that the user wants.
input clock, // The System Clock frequency
input signed [2:0] taps, // The tap values for pre-emphasis
input [12:0] normal_input,
output  [12:0] error,
output   [12:0] total_error, // The total number of errors 
output [31:0] count // The number of bits transmitted 
);
wire channel_reset ;
wire [2:0] datawidth; 
wire ref_clock; 
wire [24:0] val1 = 20000000;
/*
real frequency;
initial
begin
	@ (posedge clock) t0 = $realtime;
        @ (posedge clock) t1 = $realtime;
        frequency = 1.0e9 / (t1 - t0);
end
*/
DCW d1(ctrl_sig,val,wanted_cl_val,val1,clock,channel_reset,datawidth,ref_clock);// DCW is the data channel wrapper Module
test_control test(control,sel,channel_reset,ref_clock,taps,normal_input,error,total_error,count); // The test controller Module

endmodule
