
module choose(
	input control,
	input clock,
	input reset,
	output reg [12:0] pattern
//	output [12:0] error
);
wire [7:0]rnd;
wire [12:0]rnd1 ;
seven s1(control,clock,reset,rnd);
thirteen tt1(control,clock,reset,rnd1);
always @(*)begin
if(rnd==0)begin
pattern <=rnd1 ;
end
else if(rnd1==0)begin
pattern <=rnd ;
end
end
//error_adder e1(pattern,error);
endmodule
