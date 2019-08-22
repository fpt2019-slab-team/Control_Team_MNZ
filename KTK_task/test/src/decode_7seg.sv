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
