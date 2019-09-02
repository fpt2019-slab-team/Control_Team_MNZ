// target : DE1-SoC
// Cyclone V

// I2C Analyzer
module i2ca(
	input wire scl,	//GPIO 0
	input wire sda,	//GPIO 1
	input wire wren, 	//SW 0
	input wire sw, 	//SW 9
	input wire msw, 	//SW 8
	input wire key,	//key 0
	input wire clk,
	output wire [6:0] hxled [3:0]
);
genvar i;

wire [6:0] sclcnt7s [3:0];
wire [6:0] sdacnt7s [3:0];
wire [6:0] memval7s [3:0];
wire [7:0] memval;

reg [15:0] sclcnt;
reg [15:0] sdacnt;
reg [15:0] octcnt;
reg [7:0] memcnt;

reg [7:0] csda;

assign hxled = msw ? memval7s: (sw ? sclcnt7s: sdacnt7s);

always@(posedge scl or negedge key) begin
	if (!key)
		sclcnt <= 16'b0;
	else begin
		sclcnt <= sclcnt + 16'b1;
		
		if (sclcnt % 16'd8 == 16'd7) begin
			octcnt <= octcnt + 16'b1;
			
		end
		
		case (sclcnt % 16'd8)
			16'd0: csda[0] <= sda;
			16'd1: csda[1] <= sda;
			16'd2: csda[2] <= sda;
			16'd3: csda[3] <= sda;
			16'd4: csda[4] <= sda;
			16'd5: csda[5] <= sda;
			16'd6: csda[6] <= sda;
			default: csda[7] <= sda;
		endcase
		
	end
end

always@(negedge sda or negedge key) begin
	if (!key)
		sdacnt <= 16'b0;
	else
		sdacnt <= sdacnt + 16'b1;
end

always@(negedge upkey or negedge dwkey) begin
	if (!upkey)
		memcnt <= memcnt + 8'b1;
	else
		memcnt <= memcnt = 8'b1;
end

msda memsda(
	.data(csda),
	.wraddress(octcnt),
	.wrclock(scl),
	.wren(wren),
	.rdaddress(memcnt),
	.rdclock(clk),
	.q(memval)
);

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

enc7led e7lm1(
	.vinp(memval[7:4]),
	.enchx(1'b1),
	.leds(memval7s[1])
);
enc7led e7lm2(
	.vinp(memval[3:0]),
	.enchx(1'b1),
	.leds(memval7s[0])
);

enc7led e7lmc1(
	.vinp(memcnt[7:4]),
	.enchx(1'b1),
	.leds(memval7s[3])
);
enc7led e7lmc2(
	.vinp(memval[3:0]),
	.enchx(1'b1),
	.leds(memval7s[2])
);

endmodule
