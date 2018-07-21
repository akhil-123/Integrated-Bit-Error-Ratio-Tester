
module DCW(
input [2:0] ctrl_sig ,
input [2:0] val ,
input [24:0] wanted_cl_val ,
input [24:0] earlier_cl_val ,
input clock ,
output reg channel_reset ,
output reg [2:0] datawidth, 
output  reg ref_clock 
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
	channel_reset <= 1 ;
	datawidth <= val ;
end
else if(ctrl_sig==2)begin
	channel_reset <= 0 ;
	datawidth <=val ;
end	

end
endmodule
