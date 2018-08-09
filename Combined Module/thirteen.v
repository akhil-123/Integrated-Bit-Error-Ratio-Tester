/* 	Module for PRBS-13	*/
/* 
This module generated PRBS-13 pattern, here the input control is send by user.
*/
module thirteen (
    input control,
    input clock,
    input reset,
    output [12:0] rnd 
    );
    reg [12:0] random;
wire feedback = random[12] ^ random[3] ^ random[2] ^ random[0];
always @(posedge clock)begin
  if (reset==1) begin
    random <= 13'hf;
    end
  else begin
    random <= {random[12:0], feedback} ;
    end
end
assign rnd = random;
endmodule
