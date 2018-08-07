/* Pre-Emphasis Module */
/* 
This module is use to perform pre-emphasis based on the tap values user inputs
*/
module preemph(
input clk, // This clock is not the system clock but the reference clock which data channel wrapper module generates based on what user wants
input signed [2:0]taps, // The tap values which user inputs.
input signed [12:0] a,
output reg signed [12:0] b // The ouput of pre-emphasis filter
);
    wire signed   [12:0] MCM1,MCM2,MCM3,add_out1,add_out2;
    wire signed     [12:0] Q1,Q2,Q3;
   
    assign MCM3 = taps[2]*a;
    assign MCM2 = taps[1]*a;
    assign MCM1 = taps[0]*a;

//adders
    assign add_out1 = Q1 + MCM2;
    assign add_out2 = Q2 + MCM1;

//flipflop instantiations (for introducing a delay).
    DFF dff1 (.clk(clk),.D(MCM3),.Q(Q1));
    DFF dff2 (.clk(clk),.D(add_out1),.Q(Q2));

//Assign the last adder output to final output.
    always@ (posedge clk)
        b <= add_out2;

endmodule
