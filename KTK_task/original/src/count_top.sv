`default_nettype none

module count_top
  (
   input wire 	     clk,// clock 
   input wire [17:0] sw,// slide switch
   input wire [3:0]  KEY,// Push buttons
   output wire [6:0] hex1,
   output wire [6:0] hex2,
   output wire [6:0] hex3,
   output wire [6:0] hex4
   );

count count_inst
  (
   .clk(clk),
   .sw(sw),
   .KEY(KEY),
   .hex1(hex1),
   .hex2(hex2),
   .hex3(hex3),
   .hex4(hex4)   
   );

 
endmodule

`default_nettype wire
