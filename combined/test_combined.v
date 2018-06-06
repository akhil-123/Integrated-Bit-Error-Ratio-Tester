module test_combined;
 
 // Inputs
 reg clock;
 reg reset;
 
 // Outputs
 wire [7:0] error;
 wire [7:0] total_error;
 wire [31:0] count;
 
 // Instantiate the Unit Under Test (UUT)
 combined uut (
  .clock(clock), 
  .reset(reset), 
  .error(error),
  .total_error(total_error),
  .count(count)
 );
  
 initial begin
  clock = 0;
  forever
   #50 clock = ~clock;
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

endmodule
