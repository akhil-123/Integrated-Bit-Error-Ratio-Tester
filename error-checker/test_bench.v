`timescale 1ns / 1ps

module test_bench;

 // Inputs

 reg [7:0] A;

 reg [7:0] B;

 // Outputs

 wire [7:0] error;
wire [7:0] BER;

 // Instantiate the Unit Under Test (UUT)

 comp uut (

  .A(A), 

  .B(B),  

.BER(BER),

  .error(error)

 );

 initial begin

  // Initialize Inputs

  A = 8'b0;

  B = 8'b0;

  // Wait 100 ns for global reset to finish

  #100;

        

  // Add stimulus here

  A = 8'd8;

  B = 8'd7;

  #20;

  A = 8'd100;

  B = 8'd120;

  #20;

  A = 8'd250;

  B = 8'd250;

  #20;

  A =  8'd0;

  B = -8'd5;

  #20;

  A = -8'd5;

  B = -8'd5;

  #20;

 end

endmodule
