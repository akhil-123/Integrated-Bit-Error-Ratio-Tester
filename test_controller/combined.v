
module combined(
input sel,
input reset,
input clock,
input signed [2:0] taps,
input [7:0] normal_input,
output  [7:0] error,
output  reg [7:0] total_error,
output reg [31:0] count
);
wire signed [7:0] corrupted,original,test_pattern;
wire signed [31:0] count1 ;
wire signed [7:0] sum_error;
reg [2:0] flag;

initial begin
	 total_error [7:0] <= 8'b0;
	 count [31:0] <= 0;
	 flag [2:0] <= 0 ;
end

//LFSR l1 (clock,reset,test_pattern);
transmit t1(clock,reset,taps,test_pattern);
mux m1(sel,test_pattern,normal_input,original);
error e1 (original,corrupted);
comp c1 (original,corrupted,error,sum_error,count1);
always @(*)begin

if((sum_error==total_error) && flag==1)begin
count = 0;
end

if((sum_error == 8'h00) || (sum_error == 8'h01))
begin
total_error =  total_error+sum_error ;
flag=flag+1;
count = count + 8;
end
else if(total_error!=8'b0)
begin
total_error = total_error ;
//count = count + 8'd8 ;
end
else begin
total_error =  8'b0;
end
end
endmodule
