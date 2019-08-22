`default_nettype none
module count
  (
   input wire 	     clk,
   input wire [17:0] sw,
   input wire [3:0]  KEY,
   output wire [6:0] hex[3:0]
   );
   localparam clk_50 = 50*1000*1000;
   reg [$clog2(clk_50):0] cnt;
   reg [3:0] 		  num[3:0];
  
   always_ff@ (posedge clk) begin
      if (KEY[0] != 1) begin
	 cnt <= 0;
      end
      else if (sw[2] == 1'b0) begin
	 if(sw[1] == 1'b1) begin
	   cnt <= ((cnt != clk_50 / 2 - 1) && (cnt != clk_50 - 1)) ? cnt + 1'b1: 1'b0;
	 end
	 else begin
	   cnt <= (cnt != clk_50 - 1) ? cnt + 1'b1: 1'b0;
	 end
      end

      if (KEY[0] != 1) begin
	 num[3] <= 1'b0;
	 num[2] <= 1'b0;
	 num[1] <= 1'b0;
	 num[0] <= 1'b0;
      end
      else if (sw[0] == 1'b0) begin
      	 if (cnt == 1'b0 && num[3] != 4'd9) begin
      	    num[3] <= num[3] + 4'b1;
      	 end 
      	 else if (cnt == 1'b0) begin
      	    num[3] <= 4'b0;
      	 end
      	 if (cnt == 1'b0 && num[2] != 4'd9 && num[3] == 4'd9) begin
      	    num[2] <= num[2] + 4'b1;
      	 end
      	 else if (cnt == 1'b0 && num[3] == 4'd9) begin
      	    num[2] <= 4'b0;
      	 end
      	 if (cnt == 1'b0 && num[1] != 4'd9 && num[2] == 4'd9 && num[3] == 4'd9) begin
      	    num[1] <= num[1] + 4'b1;
      	 end
      	 else if (cnt == 1'b0 && num[2] == 4'd9 && num[3] == 4'd9) begin
      	    num[1] <= 4'b0;
      	 end 
      	 if (cnt == 1'b0 && num[0] != 4'd9 && num[1] == 4'd9 && num[2] == 4'd9 && num[3] == 4'd9) begin
      	    num[0] <= num[0] + 4'b1;
      	 end
      	 else if (cnt == 1'b0 && num[1] == 4'd9 && num[2] == 4'd9 && num[3] == 4'd9) begin
      	    num[0] <= 4'b0;
      	 end
      end    
      else begin
	 if (cnt == 1'b0 && num[3] != 4'b0) begin
      	    num[3] <= num[3] - 4'b1;
      	 end 
      	 else if (cnt == 1'b0) begin
      	    num[3] <= 4'd9;
      	 end
      	 if (cnt == 1'b0 && num[2] != 4'b0 && num[3] == 4'b0) begin
      	    num[2] <= num[2] - 4'b1;
      	 end
      	 else if (cnt == 1'b0 && num[3] == 4'b0) begin
      	    num[2] <= 4'd9;
      	 end
      	 if (cnt == 1'b0 && num[1] != 4'b0 && num[2] == 4'b0 && num[3] == 4'b0) begin
      	    num[1] <= num[1] - 4'b1;
      	 end
      	 else if (cnt == 1'b0 && num[2] == 4'b0 && num[3] == 4'b0) begin
      	    num[1] <= 4'd9;
      	 end 
      	 if (cnt == 1'b0 && num[0] != 4'b0 && num[1] == 4'b0 && num[2] == 4'b0 && num[3] == 4'b0) begin
      	    num[0] <= num[0] - 4'b1;
      	 end
      	 else if (cnt == 1'b0 && num[1] == 4'b0 && num[2] == 4'b0 && num[3] == 4'b0) begin
      	    num[0] <= 4'd9;
      	 end
      end
   end // always_ff@ (posedge clk)
   
   genvar i;
   generate
      for (i = 0; i < 4; i = i + 1) begin: Generatedecode_7seg
	 decode_7seg  decode_7seg_inst(.din(num[i]), .dout(hex[i]));
      end
   endgenerate
   
endmodule
`default_nettype wire
