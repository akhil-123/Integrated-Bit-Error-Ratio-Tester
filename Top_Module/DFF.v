
module DFF
        (input clk,
        input [7:0] D,
        output reg [7:0] Q
        );

always@ (posedge clk)
        Q = D;
endmodule
