`default_nettype none
`timescale 1ns/1ps
// Simulation module for count
module sim_count();
   logic clk;
   logic [6:0] hex[3:0];
   logic [17:0] sw;
   logic [3:0] 	KEY;
 
  count
    count_inst
      (
       .clk(clk),
       .sw(sw),
       .KEY(KEY),
       .hex[3:0](hex[3:0])
       );

    initial begin
      clk <= 1'b0;
  
       
      repeat (100 * 50 ) begin
       #10
         clk <= 1'b1;
       #10
         clk <= 1'b0;

      end
      $finish;
    end // initial begin

   

   initial begin
      KEY[0] <= 0;
      
      #30
	KEY[0] <= 1;
      
      repeat (9999) begin
	 #1000
	   print();
	   ;
      end
   end

   initial begin
      sw[0] <= 0;
      sw[1] <= 0;
      sw[2] <= 0;
      

      #10000
	sw[0] <= 1;
      $write("sw[0] <= 1\n");
 

      #8000
	sw[0] <= 0;
      sw[1] <= 1;
      
      $write("sw[0] <= 0\n");
      $write("sw[1] <= 1\n");
      
      #10000
	sw[0] <= 1;

      $write("sw[0] <= 1\n");

      #1000
	sw[2] <= 1;
      $write("sw[2] <= 1\n");
	

   end
   
   task print();
      $write("count = [ %1d %1d %1d %1d]  %d\n", 
             count_inst.num[0],
             count_inst.num[1],              
             count_inst.num[2], 
             count_inst.num[3], 
	     count_inst.cnt
             );
   endtask
endmodule   
`default_nettype wire
