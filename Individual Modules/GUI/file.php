<?php
 $file = 'file_to_edit.v';
 if(file_exists($file)) {
	unlink($file);
 }
 $fp = fopen($file, 'w');
 $str = "module final_testbench;
 reg sel;
 reg [2:0] ctrl_sig ;
reg [2:0] val ;
reg [24:0]wanted_cl_val ;
reg clock ;
reg signed [2:0] taps ;
 reg [7:0] normal_input;

wire [7:0] error;
 wire [7:0] total_error;
 wire [31:0] count;
 
 // Instantiate the Unit Under Test (UUT)
 combined uut (
  .sel(sel),
  .ctrl_sig(ctrl_sig), 
  .val(val), 
  .wanted_cl_val(wanted_cl_val),
  .clock(clock),
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
	sel = 1;
	ctrl_sig = 1 ;
	val = 7 ;
	wanted_cl_val =  20000000 ;
#400 ;
	sel = 1;
	ctrl_sig = 2 ;
	val = 7 ;
	wanted_cl_val =  10000000 ;
#800 ;
	sel = 1;
	ctrl_sig = 3 ;
	val = 7 ;
	wanted_cl_val =  20000000 ;
 
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

endmodule";
 $fwrite = fwrite($fp, $str);
?>