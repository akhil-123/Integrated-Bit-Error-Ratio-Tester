/* 	Module for PRBS-13	*/
/* 
This module generated PRBS-13 pattern, here the input control is send by user.
If control =  1, then output of this module will be 0
and if control = 0, then the output of this module will be PRBS-7
*/
module thirteen (
    input control,
    input clock,
    input reset,
    output [12:0] rnd 
    );
reg [12:0] random, random_next, random_done;
wire feedback = random[12] ^ random[3] ^ random[2] ^ random[0]; 
reg [3:0] count, count_next; //to keep track of the shifts
 
always @ (posedge clock or posedge reset)
begin
 if (reset)
 begin
  random <= 13'hF; //An LFSR cannot have an all 0 state, thus reset to FF
  count <= 0;
 end
  
 else
 begin
  random <= random_next;
  count <= count_next;
 end
end
 
always @ (*)
begin
if(control==0)begin
	random_done = 0;
end
else begin
 random_next = random; //default state stays the same
 count_next = count;
   
  random_next = {random[11:0], feedback}; //shift left the xor'd every posedge clock
  count_next = count + 1;
 
 if (count == 13)
 begin
  count = 0;
  random_done = random; //assign the random number to output after 13 shifts
 end
end  
end
 
 
assign rnd = random_done;
 
endmodule