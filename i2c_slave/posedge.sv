module pedge (
	input wire sysclk,
	input wire clk,
	output wire edgef
);

	reg bclk;

	assign edgef = (!bclk & clk) ? 1'b1 : 1'b0;

	always @(posedge sysclk) begin
		bclk <= clk;
	end

endmodule

module nedge (
	input wire sysclk,
	input wire clk,
	output wire edgef
);

	reg bclk;

	assign edgef = (bclk & !clk) ? 1'b1 : 1'b0;

	always @(posedge sysclk) begin
		bclk <= clk;
	end

endmodule
