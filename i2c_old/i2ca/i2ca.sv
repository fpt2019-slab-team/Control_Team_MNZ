// target : DE2-115
// Cyclone 4

// I2C Analyzer
module i2ca(
	input wire scl,	//GPIO 0
	input wire sda,	//GPIO 1
	input wire sw, 	//SW17
	output wire [6:0] hxled [3:0]
);
genvar i;

wire [6:0] sclcnt7s [3:0];
wire [6:0] sdacnt7s [3:0];

reg [15:0] sclcnt;
reg [15:0] sdacnt;

assign hxled = sw ? sclcnt7s: sdacnt7s;

always@(posedge scl) begin
	sclcnt <= sclcnt + 16'b1;
end

always@(posedge sda) begin
	sdacnt <= sdacnt + 16'b1;
end

generate
for (i = 0; i < 4; i = i + 1) begin: gcenc
  enc7led e7lc(
		.vinp(sclcnt[(i + 1) * 4 - 1:i * 4]), 
		.enchx(1'b1),
		.leds(sclcnt7s[i])
	);
end
for (i = 0; i < 4; i = i + 1) begin: gdenc
  enc7led e7ld(
		.vinp(sdacnt[(i + 1) * 4 - 1:i * 4]), 
		.enchx(1'b1),
		.leds(sdacnt7s[i])
	);
end
endgenerate

endmodule
