module test_DCW;
 
 reg [2:0] ctrl_sig ;
reg [2:0] val ;
reg [2:0] val1 ;
reg [24:0]wanted_cl_val ;
reg [24:0]earlier_cl_val ;
reg clock ;

wire channel_reset ;
wire [2:0] datawidth ; 
wire ref_clock ;
 
 // Instantiate the Unit Under Test (UUT)
 DCW uut (
  .ctrl_sig(ctrl_sig), 
  .val(val), 
  .val1(val1),
  .wanted_cl_val(wanted_cl_val),
  .earlier_cl_val(earlier_cl_val),
  .clock(clock),
  .channel_reset(channel_reset),
  .datawidth(datawidth),
  .ref_clock(ref_clock)
 );
  
 initial begin
  clock = 0;
  forever
   #50 clock = ~clock;
  end
   
 initial begin
	ctrl_sig = 1 ;
	val = 7 ;
	val1 = 7 ;
	earlier_cl_val = 20000000 ;
	wanted_cl_val =  20000000 ;
#400 ;
	ctrl_sig = 2 ;
	val = 7 ;
	val1 = 7 ;
	earlier_cl_val = 20000000 ;
	wanted_cl_val =  10000000 ;
#800 ;
	ctrl_sig = 3 ;
	val = 7 ;
	val1 = 13 ;
	earlier_cl_val = 20000000 ;
	wanted_cl_val =  20000000 ;
 
 end

endmodule
