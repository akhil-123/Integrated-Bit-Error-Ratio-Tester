/* 		" Error Adding Module "   		*/
/*
This Module adds random error to the transmitted pattern
*/
module error(
	input [12:0] A,
	output reg [12:0] B 
);
wire [12:0] er;
reg [12:0] make_error ;
assign  er = A^make_error ;

/*
The Random function is used so as to make the error adder module like a real world error prone channel which is random
*/
always @(A)begin
if (A[0]==1 || A[3]==1)begin
   make_error <= 13'h01;
end 
else begin
   make_error <= 13'h00;
end
if ((A[1])==1 || A[4]==1)begin
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
