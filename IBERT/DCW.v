/* 
" Data Channel Wrapper Module "
This module generates the reference clock
what the user wants from system clock and 
gives an option to reset the channel.
*/
module DCW(
input [2:0] ctrl_sig ,
input [2:0] val ,
	input [24:0] wanted_cl_val , //The clock what the user wants
	input [24:0] earlier_cl_val , // System clock
input clock ,
output reg channel_reset ,
output reg [2:0] datawidth, 
output  reg ref_clock // The clock generated from the system clock
);

reg [24:0] counter ;
reg temp;

initial begin
counter = 0 ;
temp = 0 ;
end

wire [24:0] count = counter[24] ? (wanted_cl_val) : (wanted_cl_val - earlier_cl_val);
wire [24:0] final = counter + count;

always @(posedge clock)
begin
  if(wanted_cl_val==earlier_cl_val)begin
  temp=0; end
else begin
  counter = final;
  ref_clock = ~counter[24];
  temp = 1;
end
end

always@(*)
begin
if(temp==0)begin
ref_clock = clock ;end
end

always @(*)begin

if(ctrl_sig==1)begin
	channel_reset <= 1 ; // 1 means reset the channel
	datawidth <= val ;
end
else if(ctrl_sig==2)begin
	channel_reset <= 0 ; // 0 means do not reset the channel
	datawidth <=val ;
end	

end
endmodule
