
module DFF
        (input clk,
        input [12:0] D,
        output reg [12:0] Q
        );

always@ (posedge clk)
        Q = D;
endmodule
