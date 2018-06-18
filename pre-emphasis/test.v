module test;

    // Inputs
    reg clk;
    reg signed [2:0] taps ;
    reg signed [7:0] a;

    // Outputs
    wire signed [7:0] b;

    // Instantiate the Unit Under Test (UUT)
    preemph uut (
        .clk(clk),
	.taps(taps), 
        .a(a), 
        .b(b)
    );
    
    //Generate a clock with 10 ns clock period.
    initial clk = 0;
    always #5 clk =~clk;

//Initialize and apply the inputs.
    initial begin
/*
  a = -2;taps[0] = -1;taps[1] = 2;taps[2]=-1; #10;
          a = 3;taps[0] = -1;taps[1] = 2;taps[2]=-1; #10;
          a = 7;taps[0] = -1;taps[1] = 2;taps[2]=-1;  #10;
          a = -5;taps[0] = -1;taps[1] = 2;taps[2]=-1; #10;
          a = 6;taps[0] = -1;taps[1] = 2;taps[2]=-1;  #10;
          a = 0;taps[0] = -1;taps[1] = 2;taps[2]=-1;  #10;
*//*
          a = 3;taps = 2; #1650;
          a = 7; taps = 7; #1650;
          a = 5; taps = 2 ;*/  #10;
          a = 0;taps = 3; #10;
          a = 1;taps = 3; #10;
          a = 0; taps = 3; #10;
          a = 1;taps = 3; #10;
          a = 1; taps = 3; #10;
          a = 0; taps = 3; #10;
    end
      
endmodule
