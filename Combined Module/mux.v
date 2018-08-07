
module mux(
input sel,
input [12:0] a ,
input [12:0] b ,
output reg[12:0] c 
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
