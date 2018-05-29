`timescale 1ns / 1ps

module test_error;

 // Inputs

 reg [7:0] A;

 // Outputs

 wire [7:0] B;

 // Instantiate the Unit Under Test (UUT)

 error uut (

  .A(A), 

  .B(B)

 );

 initial begin

  // Initialize Inputs

  A = 8'b0;
  // Wait 100 ns for global reset to finish

  #100;

        

  // Add stimulus here

  A = 8'd8;



  #20;

  A = 8'd100;

  

  #20;

  A = 8'd250;

  

  #20;

  A =  8'd0;



  #20;

  A = -8'd5;
  #20;

  A = 8'd100;

  

  #20;

  A = 8'd250;

  

  #20;

  A =  8'd0;



  #20;

  A = -8'd5;
  #20;

 end

endmodule
