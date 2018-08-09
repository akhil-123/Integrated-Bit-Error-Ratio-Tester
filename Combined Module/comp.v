 					/*   "Comparator Module"   */
/*
This Module compares the transmitted and received pattern and calculates the error.
*/
module comp
(
	input [12:0] A,
	input [12:0] B, 
	output reg [12:0] error,
	output reg [12:0] total_error,
	output reg [15:0] count1
);
initial begin
	error[12:0] <= 13'b0;
	total_error[12:0] <= 13'b0;
	count1[15:0] <= 13'b0;
end
always @(A or B)
begin 
error[0] = ( A[0] == B[0])? 1'b0 : 1'b1;
error[1] = ( A[1] == B[1])? 1'b0 : 1'b1;
error[2] = ( A[2] == B[2])? 1'b0 : 1'b1;
error[3] = ( A[3] == B[3])? 1'b0 : 1'b1;
error[4] = ( A[4] == B[4])? 1'b0 : 1'b1;
error[5] = ( A[5] == B[5])? 1'b0 : 1'b1;
error[6] = ( A[6] == B[6])? 1'b0 : 1'b1;
error[7] = ( A[7] == B[7])? 1'b0 : 1'b1;
error[8] = ( A[8] == B[8])? 1'b0 : 1'b1;
error[9] = ( A[9] == B[9])? 1'b0 : 1'b1;
error[10] = ( A[10] == B[10])? 1'b0 : 1'b1;
error[11] = ( A[11] == B[11])? 1'b0 : 1'b1;
error[12] = ( A[12] == B[12])? 1'b0 : 1'b1;
total_error = error[0]+error[1]+error[2]+ error[3] + error[4] +  error[5] +  error[6] +  error[7] + error[8] +  error[9] +  error[10] +  error[11] + error[12] ;
//count = count + 8'd8 ;
count1 = 13;
end
endmodule
