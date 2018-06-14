
module DCW(
input [2:0] ctrl_sig ,
input [2:0] val ,
input [2:0] val1 ,
//input [2:0] cl_val ;
input clock ,
output reg channel_reset ,
output reg [2:0] datawidth 
//output [2:0] ref_clock ;
);

always @(*)begin

if(ctrl_sig==1)begin
	channel_reset <= 1 ;
	datawidth <= val ;
end
else if(ctrl_sig==2)begin
	channel_reset <= 0 ;
	datawidth <=val ;
end
else if(ctrl_sig==3)begin
	channel_reset <= 0 ;
	datawidth <=val1;
end

end
	
endmodule
