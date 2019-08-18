//Target DE1-SoC

module i2c_slave (
	input wire sysclk,
	inout	wire sda, // GPIO 1
	input	wire scl, // GPIO 0
	input wire rst,
	output wire gnd,
	output wire [7:0] led,
	output wire [6:0] hxled [3:0]
);

// Before sda, scl
reg bsda, bscl;

reg [3:0] state;
reg [4'd6:4'd0] address;
reg [3:0] clkcnt;
reg rw;
reg [6:0] myAddress;
reg ack;
wire compAddress;
wire startSection;

assign sda = ack ? 1'bz: 1'b0;
assign compAddress = (myAddress == address);
assign gnt = 1'b0;

enc7led ad0(
	.vinp(address[3:0]),
	.enchx(1'b1),
	.leds(hxled[0])	
);
enc7led ad1(
	.vinp({1'b0, address[6:4]}),
	.enchx(1'b1),
	.leds(hxled[1])	
);


enc7led lst(
	.vinp(state),
	.enchx(1'b1),
	.leds(hxled[2])	
);

enc7led cc0(
	.vinp(clkcnt),
	.enchx(1'b1),
	.leds(hxled[3])	
);


initial begin
	state <= 4'b0;
	address <=7'h00;
	myAddress <=7'h42;
	clkcnt <= 4'b0;
	rw <= 1'b0;
	ack <= 1'b1;
end

always@ (posedge sysclk) begin
	bsda <= sda;
	bscl <= scl;
	
	if (!rst) begin
		state <= 4'hF;
	end
	else begin

	// negedge sda
	if (bsda &&	!sda) begin
		// START
		if (state != 4'd2) begin
		if (scl) begin
			state <= 4'b1;

			address <= 7'b0;
			clkcnt <= 4'b0;

		end
	end
	end

	// posedge sda
	if (!bsda && sda) begin
		// STOP
		if (scl) begin
		if (state != 4'd2)
			state <= 4'hF;
		end
	end

	// posedge scl
	if (!bscl && scl) begin
		
		// COUNT 8

	if (state == 4'd1) begin
	
		if (clkcnt == 4'd8) begin
				clkcnt <= 4'b0;
				ack <= 1'b1;
			if (compAddress) begin
				state <= 4'd2;
			end
		end
		
		// COUNT 0 - 7
		
		else begin
			clkcnt <= clkcnt + 4'b1;

			// CATCH ADDRESS
				if (clkcnt < 4'd7) begin
					address[clkcnt] <= sda;
				end
				else if (clkcnt == 4'd7) begin
					rw <= sda;
					if (compAddress) begin
						ack <= 1'b0;
					end
				end
			end
end

		end
	end

end

endmodule