
module combined(
input control,
input sel,
input [2:0] ctrl_sig,
input [2:0] val,
input [24:0] wanted_cl_val ,
input clock,
input signed [2:0] taps,
input [12:0] normal_input,
output  [12:0] error,
output   [12:0] total_error,
output [31:0] count
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
DCW d1(ctrl_sig,val,wanted_cl_val,val1,clock,channel_reset,datawidth,ref_clock);
test_control test(control,sel,channel_reset,ref_clock,taps,normal_input,error,total_error,count);

endmodule
