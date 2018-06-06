
module combined(
input reset,
input clock,
output  [7:0] error,
output  reg [7:0] total_error,
output reg [31:0] count
);
wire [7:0] corrupted,original,count1 ;
wire [7:0] sum_error;
reg [2:0] flag;

initial begin
	 total_error [7:0] <= 8'b0;
	 count [31:0] <= 0;
	 flag [2:0] <= 0 ;
end

LFSR l1 (clock,reset,original);
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
