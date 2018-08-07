
module mux(
input sel,
input [7:0] a ,
input [7:0] b ,
output reg[7:0] c 
);

always@(*)begin
if(sel==1)begin
c <= a ;
end
else if(sel==0) begin
c <= b ;
end
end
endmodule
