`default_nettype none
module count
  (
   input wire 	     clk,
   input wire [17:0] sw,
   input wire [3:0]  KEY,
   output wire [6:0] hex1,
   output wire [6:0] hex2,
   output wire [6:0] hex3,
   output wire [6:0] hex4
   );
   localparam clk_50 = 50*1000*1000;
   //parameter integer clk_50 = 50;
   reg [$clog2(clk_50):0] cnt;
   reg [3:0] 		  num1;
   reg [3:0] 		  num2;
   reg [3:0] 		  num3;
   reg [3:0] 		  num4;
   
   always_ff@ (posedge clk) begin//cnt
      if (KEY[0] != 1) begin
	 cnt <= 0;
      end
      else if (sw[2] == 1'b0) begin
	 if(sw[1] == 1'b1) // 2bai
	   cnt <= ((cnt != clk_50 / 2 - 1) && (cnt != clk_50 - 1)) ? cnt + 1'b1: 1'b0;
	 else // 1bai
	   cnt <= (cnt != clk_50 - 1) ? cnt + 1'b1: 1'b0;
      end
   end
   
   always_ff@ (posedge clk) begin//num4
      if (KEY[0] != 1) begin
	 num4 <= 0;
      end	 
      else if (sw[0] == 1'b0) begin // nor
	 if(cnt == 1'b0 && num4 != 4'd9)
	   num4 <= num4 + 1'b1;
	 else if(cnt == 1'b0)
	   num4 <= 1'b0;
      end
      else begin // rev
	 if (cnt == 1'b0 && num4 != 1'b0) begin
	    num4 <= num4 - 1'b1;
	 end
	 else if (cnt == 1'b0) begin
	    num4 <= 4'd9;
	 end
      end
   end
   
   always_ff@ (posedge clk) begin//num3
      if (KEY[0] != 1) begin
	 num3 <= 0;
      end
      else if (sw[0] == 1'b0) begin//nor
	 if(cnt == 1'b0 && num3 != 4'd9 && num4 == 4'd9) begin
	    num3 <= num3 + 1'b1;
	 end 
	 else if(cnt == 1'b0 && num3 == 4'd9 && num4 == 4'd9) begin
	    num3 <= 1'b0;
	 end
      end
      else begin//rev
	 if(cnt == 1'b0 && num3 != 1'b0 && num4 == 1'b0) begin
	    num3 <= num3 - 1'b1;
	 end
	 else if(cnt == 1'b0 && num3 == 1'b0 && num4 == 1'b0) begin
	    num3 <= 4'd9;
	 end
      end
   end
   
   always_ff@ (posedge clk) begin//num2
      if( KEY[0] != 1 )
	num2 <= 0;
      else if ( sw[0] == 1'b0 ) begin//nor
	 if (cnt == 1'b0 && num2 != 4'd9 && num3 == 4'd9 && num4 == 4'd9) begin
	    num2 <= num2 + 1'b1;
	 end
	 else if (cnt == 1'b0 && num2 == 4'd9 && num3 == 4'd9 && num4 == 4'd9) begin
	    num2 <= 1'b0;
	 end
      end
      else begin//rev
	 if (cnt == 1'b0 && num2 != 1'b0 && num3 == 1'b0 && num4 == 1'b0) begin
	    num2 <= num2 - 1'b1;
	 end 
	 else if (cnt == 1'b0 && num2 == 1'b0 && num3 == 1'b0 && num4 == 1'b0) begin
	    num2 <= 4'd9;
	 end
      end
   end
   
   
   always_ff@ (posedge clk) begin//num1
      if(KEY[0] != 1) begin
	 num1 <= 0;
      end
      else if (sw[0] == 0) begin//nor
	 if(cnt == 1'b0 && num1 != 4'd9 && num2 == 4'd9 && num3 == 4'd9 && num4 ==4'd9) begin
	    num1 <= num1 + 1'b1;
	 end
	 else if(cnt == 1'b0 && num1 == 4'd9 && num2 == 4'd9 && num3 == 4'd9 && num4 == 4'd9) begin
	    num1 <= num1 + 1'b0;
	 end
      end
      else begin//rev
	 if(cnt == 1'b0 && num1 != 1'b0 && num2 == 1'b0 && num3 == 1'b0 && num4 ==1'b0) begin
	    num1 <= num1 - 1'b1;
	 end
	 else if(cnt == 1'b0 && num1 == 1'b0 && num2 == 1'b0 && num3 == 1'b0 && num4 == 1'b0) begin
	    num1 <= 4'd9;
	 end
      end
   end
   
   decode_7seg decode_7seg_inst1(.din(num1), .dout(hex1));
   decode_7seg decode_7seg_inst2(.din(num2), .dout(hex2));
   decode_7seg decode_7seg_inst3(.din(num3), .dout(hex3));
   decode_7seg decode_7seg_inst4(.din(num4), .dout(hex4));
endmodule // count

module decode_7seg
  (
   input wire [3:0]   din,
   output logic [7:0] dout
   );
   
   always_comb begin
      case (din)
        4'd0:    dout <= 7'b1000000;
        4'd1:    dout <= 7'b1111001;
        4'd2:    dout <= 7'b0100100;
        4'd3:    dout <= 7'b0110000;
        4'd4:    dout <= 7'b0011001;
        4'd5:    dout <= 7'b0010010;
	4'd6:    dout <= 7'b0000010;
	4'd7:    dout <= 7'b1111000;
	4'd8:    dout <= 7'b0000000;
	4'd9:    dout <= 7'b0010000;
        default: dout <= 7'b1111111;
      endcase
   end
endmodule
`default_nettype wire
