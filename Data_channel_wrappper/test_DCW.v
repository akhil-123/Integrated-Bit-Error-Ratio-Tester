module test_DCW;
 
 reg [2:0] ctrl_sig ;
reg [2:0] val ;
reg [2:0] val1 ;
reg clock ;

wire channel_reset ;
wire [2:0] datawidth ; 
 
 // Instantiate the Unit Under Test (UUT)
 DCW uut (
  .ctrl_sig(ctrl_sig), 
  .val(val), 
  .val1(val1),
  .clock(clock),
  .channel_reset(channel_reset),
  .datawidth(datawidth)
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
#70 ;
	ctrl_sig = 2 ;
	val = 7 ;
	val1 = 7 ;
#140 ;
	ctrl_sig = 3 ;
	val = 7 ;
	val1 = 13 ;
 
 end

endmodule
