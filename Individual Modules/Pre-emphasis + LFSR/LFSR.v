module LFSR (
    input clk,
    input reset,
    output [7:0] rnd 
    );
reg [7:0] random, random_next, random_done;
wire feedback = random[6] ^ random[5] ^ random[0]; 
reg [3:0] count, count_next; //to keep track of the shifts
 
always @ (posedge clk or posedge reset)
begin
 if (reset)
 begin
  random <= 8'hF; //An LFSR cannot have an all 0 state, thus reset to FF
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
 random_next = random; //default state stays the same
 count_next = count;
   
  random_next = {random[6:0], feedback}; //shift left the xor'd every posedge clock
  count_next = count + 1;
 
 if (count == 8)
 begin
  count = 0;
  random_done = random; //assign the random number to output after 8 shifts
 end  
end
 
assign rnd = random_done;
//error e1 (random_done,rnd);
 
endmodule
