
module ref_gen_clock(
input [24:0] wanted_cl_val ,
input [24:0] earlier_cl_val ,
input clock ,
output ref_clock
);
reg [24:0] counter = 0 ;
wire [24:0] count = counter[24] ? (wanted_cl_val) : (wanted_cl_val - earlier_cl_val);
wire [24:0] final = counter + count;
always @(posedge clock)
begin
  counter = final;
end
assign ref_clock = ~counter[24];
endmodule
