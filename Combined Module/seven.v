/* 	Module for PRBS-7	*/
/* 
This module generated PRBS-7 pattern, here the input control is send by user.
*/
module seven (
    input control,
    input clock,
    input reset,
    output [6:0] rnd 
    );
    reg [6:0] random;
wire feedback = random[6] ^ random[0]; 
always @(posedge clock)begin
  if (reset==1) begin
    random <= 7'hf;
    end
  else begin
    random <= {random[6:0], feedback} ;
    end
end
assign rnd = random;
endmodule
