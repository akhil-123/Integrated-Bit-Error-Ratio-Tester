
module test_bench;
 
 // Inputs
 reg clk;
 reg reset;
 reg [2:0] taps ;
 
 // Outputs
 wire [7:0] b;
 
 // Instantiate the Unit Under Test (UUT)
 transmit uut (
  .clk(clk), 
  .reset(reset),
  .taps(taps),
  .b(b)
 );
  
 initial begin
  clk = 0;
  forever
   #50 clk = ~clk;
  end
   
 initial begin
  // Initialize Inputs
   
  reset = 0;
 
  // Wait 100 ns for global reset to finish
  #100;
      reset = 1;
  #200;
  reset = 0;
  // Add stimulus here
 
 end
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
          taps = 3; #10;
          taps = 3; #10;
           taps = 3; #10;
          taps = 3; #10;
           taps = 3; #10;
           taps = 3; #10;
    end


endmodule
