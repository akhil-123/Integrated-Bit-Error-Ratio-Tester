`timescale 1ps / 1ps 
module final_testbench;
 reg control;
 reg sel;
 reg [2:0] ctrl_sig ;
reg [2:0] val ;
reg [24:0]wanted_cl_val ;
reg clock ;
reg signed [2:0] taps ;
 reg [12:0] normal_input;

wire [12:0] error;
 wire [12:0] total_error;
 wire [31:0] count;
 
 // Instantiate the Unit Under Test (UUT)
 combined uut (
  .control(control),
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
 //$dumpfile("sim.vcd");
 //$dumpvars(0,final_testbench);
  normal_input = -13'd5;
taps[0] = 0;
taps[1] = 1;
taps[2] = 1;
	control=0;
	sel = 1;
	ctrl_sig = 1 ;
	val = 7 ;
	wanted_cl_val =  20000000 ;
#1000000 ;
//$display("%d %d", count,total_error);
//$monitor("%d %d", count,total_error);

control=0 ;
  normal_input = -13'd5;
  taps[0] = 0;
taps[1] = 1;
taps[2] = 1;
	sel = 1;
	ctrl_sig = 2 ;
	val = 7 ;
	wanted_cl_val =  10000000 ;
#1000000 ;
// $display("%d %d", count,total_error);

control=0 ;
  normal_input = -13'd5;
taps[0] = 0;
taps[1] = 1;
taps[2] = 1;
	sel = 1;
	ctrl_sig = 3 ;
	val = 7 ;
	wanted_cl_val =  20000000 ;
#3000000 ;
//$monitor("%d %d", count,total_error);
//$display("%d %d", count,total_error);
//$display("\n");
$display("%d",total_error);
$display("%d", count);	
 #300000 $finish;
 end
 /*
initial begin
  // Initialize Inputs
 control=0 ;
 normal_input = 13'b0;
 taps = 3; 
  // Wait 100 ns for global reset to finish

  #100;

        

  // Add stimulus here
 control=1 ;
  normal_input = 13'd8;
taps = 3; 
  #20;

control=1 ;
  normal_input = 13'd100;
taps = 3; 
  #20;

control=1 ;
  normal_input = 13'd250;
taps = 3; 
  #20;

control=1 ;
  normal_input =  13'd0;
taps = 3; 
  #20;

control=1 ;
  normal_input = -13'd5;
taps = 3; 
  #20;
 
 end
*/
endmodule
