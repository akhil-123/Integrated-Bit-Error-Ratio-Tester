module test_combined;
 
 // Inputs
 reg sel;
 reg clock;
 reg reset;
 reg signed [2:0] taps ;
 reg [7:0] normal_input;

 // Outputs
 wire [7:0] error;
 wire [7:0] total_error;
 wire [31:0] count;
 
 // Instantiate the Unit Under Test (UUT)
 test_control uut (
  .sel(sel),
  .clock(clock), 
  .reset(reset),
  .taps(taps),
  .normal_input(normal_input), 
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
  sel = 1 ;
  // Wait 100 ns for global reset to finish
  #100;
      reset = 1;
      sel = 1 ;
  #200;
  reset = 0;
  sel = 1;
  // Add stimulus here
 
 end

initial begin
  // Initialize Inputs

 normal_input = 8'b0;
 taps = 3; 
  // Wait 100 ns for global reset to finish

  #100;

        

  // Add stimulus here

  normal_input = 8'd8;
taps = 3; 
  #20;

  normal_input = 8'd100;
taps = 3; 
  #20;

  normal_input = 8'd250;
taps = 3; 
  #20;

  normal_input =  8'd0;
taps = 3; 
  #20;

  normal_input = -8'd5;
taps = 3; 
  #20;
 
 end


endmodule
