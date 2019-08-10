// target : DE2-115

module i2sc(
	input wire scl,
	input wire sda,
	input wire sw,
	output wire [6:0] led [3:0]
);
genvar i;

wire [6:0] sclcnt7s [3:0];
wire [6:0] sdacnt7s [3:0];

reg [15:0] sclcnt;
reg [15:0] sdacnt;

assign led = sw ? sclcnt7s: sdacnt7s;

always@(posedge scl) begin
	sclcnt <= sclcnt + 16'b1;
end

always@(posedge sda) begin
	sdacnt <= sdacnt + 16'b1;
end

generate
for (i = 0; i < 4; i = i + 1) begin: gcenc
  enc7led e7lc(
		.vinp(sclcnt[(i + 1) * 4:i * 4]), 
		.enchx(1'b1),
		.leds(sclcnt7s[i])
	);
end
for (i = 0; i < 4; i = i + 1) begin: gdenc
  enc7led e7ld(
		.vinp(sdacnt[(i + 1) * 4:i * 4]), 
		.enchx(1'b1),
		.leds(sdacnt7s[i])
	);
end
endgenerate

endmodule
