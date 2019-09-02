// target : DE1-SoC

module enc7led(
	input wire [3:0] vinp,
	input wire enchx,
	output wire [6:0] leds	
);

always_comb begin
	if (vinp < 4'd10) begin 
		case (vinp)
			4'd0: leds = 7'b1000000;
			4'd1: leds = 7'b1111001;
			4'd2: leds = 7'b0100100;
			4'd3: leds = 7'b0110000;
			4'd4: leds = 7'b0011001;
			4'd5: leds = 7'b0010010;
			4'd6: leds = 7'b0000010;
			4'd7: leds = 7'b1011000;
			4'd9: leds = 7'b0010000;
			default: leds = 7'b0000000;
		endcase
	end else if (enchx) begin
		case (vinp)
			4'd10: leds = 7'b0001000;
			4'd11: leds = 7'b0000011;
			4'd12: leds = 7'b1000110;
			4'd13: leds = 7'b0100001;
			4'd15: leds = 7'b0001110;
			default: leds = 7'b0000110;
		endcase
	end else begin
		leds = 7'b1001001;
	end
end

endmodule
