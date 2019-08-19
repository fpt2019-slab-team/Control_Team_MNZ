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
   reg [$clog2(clk_50):0] 	     cnt;
   reg [3:0] 			     num1;
   reg [3:0] 			     num2;
   reg [3:0] 			     num3 ;
   reg [3:0] 			     num4;
   
   
   always_ff@(posedge clk)begin//cnt
      if( KEY[0] )
	cnt <= 0;
      else if(sw[2] == 1'b0 ) begin
//      else begin
	 if( sw[1] == 1'b1 ) // 2bai
	   cnt <= ( (cnt != clk_50/2-1) && (cnt != clk_50-1) )?cnt + 1'b1 : 1'b0;
	 else
	   cnt <= (cnt != clk_50-1)?cnt + 1'b1 : 1'b0;
      end
   end

   always_ff@(posedge clk)begin//num4
      if( KEY[0] )
	num4 <= 0;
      else if( sw[0] == 1'b0 ) begin // nor
	 if(cnt == 1'b0 && num4 != 4'd9)
	   num4 <= num4 + 1'b1;
	 else if(cnt == 1'b0)
	   num4 <= 1'b0;
      end
      else begin // rev
	 if(cnt == 1'b0 && num4 != 1'b0)
	   num4 <= num4 - 1'b1;
	 else if(cnt == 1'b0)
	   num4 <= 4'd9;
      end
   end

   always_ff@(posedge clk)begin//num3
      if( KEY[0] )
	num3 <= 0;
      else if( sw[0] == 1'b0)begin//nor
	 if(cnt == 1'b0 && num3 != 4'd9 && num4 == 4'd9)
	   num3 <= num3 + 1'b1;
	 else if(cnt == 1'b0 && num3 == 4'd9 && num4 == 4'd9)
	   num3 <= 1'b0;
      end
      else begin//rev
	 if(cnt == 1'b0 && num3 != 1'b0 && num4 == 1'b0)
	   num3 <= num3 - 1'b1;
	 else if(cnt == 1'b0 && num3 == 1'b0 && num4 == 1'b0)
	   num3 <= 4'd9;
      end
   end
   
   always_ff@(posedge clk)begin//num2
      if( KEY[0] )
	num2 <= 0;
      else if( sw[0] == 1'b0 )begin//nor
	 if(cnt == 1'b0 && num2 != 4'd9 && num3 == 4'd9 && num4 == 4'd9)
	   num2 <= num2 + 1'b1;
	 else if(cnt == 1'b0 && num2 == 4'd9 && num3 == 4'd9 && num4 == 4'd9)
	   num2 <= 1'b0;
      end
      else begin//rev
	 if(cnt == 1'b0 && num2 != 1'b0 && num3 == 1'b0 && num4 == 1'b0)
	   num2 <= num2 - 1'b1;
	 else if(cnt == 1'b0 && num2 == 1'b0 && num3 == 1'b0 && num4 == 1'b0)
	   num2 <= 4'd9;
      end
   end
   

   always_ff@(posedge clk)begin//num1
      if( KEY[0] )
	num1 <= 0;
      else if( sw[0] == 0)begin//nor
	 if(cnt == 1'b0 && num1 != 4'd9 && num2 == 4'd9 && num3 == 4'd9 && num4 ==4'd9)
	   num1 <= num1 + 1'b1;
	 else if(cnt == 1'b0 && num1 == 4'd9 && num2 == 4'd9 && num3 == 4'd9 && num4 == 4'd9)
	   num1 <= num1 + 1'b0;
      end
      else begin//rev
	 if(cnt == 1'b0 && num1 != 1'b0 && num2 == 1'b0 && num3 == 1'b0 && num4 ==1'b0)
	   num1 <= num1 - 1'b1;
	 else if(cnt == 1'b0 && num1 == 1'b0 && num2 == 1'b0 && num3 == 1'b0 && num4 == 1'b0)
	   num1 <= num1 + 4'd9;
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
        4'd0:    dout <= 7'b0111111;
        4'd1:    dout <= 7'b0000110;
        4'd2:    dout <= 7'b1011011;
        4'd3:    dout <= 7'b1001111;
        4'd4:    dout <= 7'b1100110;
        4'd5:    dout <= 7'b1101101;
	4'd6:    dout <= 7'b1111101;
	4'd7:    dout <= 7'b0000111;
	4'd8:    dout <= 7'b1111111;
	4'd9:    dout <= 7'b1101111;
        default: dout <= 7'b0000000;
      endcase
   end
endmodule



`default_nettype wire
