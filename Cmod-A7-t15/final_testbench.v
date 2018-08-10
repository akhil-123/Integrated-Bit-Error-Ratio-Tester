`timescale 1ps / 1ps 
module final_testbench;
 reg control;
 reg sel;
 reg [2:0] ctrl_sig ;
reg [2:0] val ;
reg [24:0]wanted_cl_val ;
reg clock ;
reg signed [2:0] taps ;
 reg  normal_input;

wire [12:0] error;
 wire [12:0] total_error;
 wire [15:0] count;
 
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



taps[0] = -1;
taps[1] = 2;
taps[2] = 3;
control=1;
sel = 1;
ctrl_sig = 1 ;
val = 7 ;
wanted_cl_val = 10000000;
#10000000 ;



control=1 ;
 
taps[0] = -1;
taps[1] = 2;
taps[2] = 3;
sel = 1;
ctrl_sig = 1 ;
val = 7 ;
wanted_cl_val =10000000 ;
#10000000 ;


control=1 ;

taps[0] = -1;
taps[1] = 2;
taps[2] = 3;
sel = 1;
ctrl_sig = 2 ;
val = 7 ;
wanted_cl_val =10000000 ;
#30000000 ;

$display("%d",total_error);
$display("%d", count);
 #300000 $finish;
 end
 
endmodule
