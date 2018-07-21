module error(
	input [12:0] A,
	output reg [12:0] B 
);
wire [12:0] er;
reg [12:0] make_error ;
assign  er = A^make_error ;

always @(A)begin
if (($random % 2 & 2'b01)==0)begin
   make_error <= 13'h01;
end 
else begin
   make_error <= 13'h00;
end
if (($random % 2 & 2'b11)==0)begin
   make_error <= 13'h01;
end 
else begin
   make_error <= 13'h00;
end
//make_error = $random % 8 ;
//make_error <= 8'h01;
B <= er ;
end
endmodule
