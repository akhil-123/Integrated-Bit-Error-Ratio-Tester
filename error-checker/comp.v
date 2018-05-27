module comp
(
	input [7:0] A,
	input [7:0] B, 
	output reg [7:0] error,
	output reg [7:0] total_error
);
reg [7:0] count ;
initial begin
	error[7:0] <= 8'b0;
	total_error [7:0] <= 8'b0;
	count[7:0] <= 8'b0;
end
always @(A or B)
begin 
/*	for(i=0;i<8;i+=1)begin
	error[i] <= ( A[i] == B[i])? 1'b0 : 1'b1;
	end
*/error[0] <= ( A[0] == B[0])? 1'b0 : 1'b1;
error[1] <= ( A[1] == B[1])? 1'b0 : 1'b1;
error[2] <= ( A[2] == B[2])? 1'b0 : 1'b1;
error[3] <= ( A[3] == B[3])? 1'b0 : 1'b1;
error[4] <= ( A[4] == B[4])? 1'b0 : 1'b1;
error[5] <= ( A[5] == B[5])? 1'b0 : 1'b1;
error[6] <= ( A[6] == B[6])? 1'b0 : 1'b1;
error[7] <= ( A[7] == B[7])? 1'b0 : 1'b1;
count = count + 8'd8 ;
end
always @(*)begin
total_error =  total_error + error[0]+error[1]+error[2]+ error[3] + error[4] +  error[5] +  error[6] +  error[7] ;
end
endmodule
