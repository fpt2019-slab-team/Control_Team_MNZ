module i2c_slave (
	inout	wire sda,
	input	wire scl,
	output wire [7:0] led
);

reg [3:0] state;
reg [6:0] address;
reg [3:0] clkcnt;
reg rw;
reg [6:0] myAddress;
reg ack;
wire compAddress;

assign sda = ack;
assign compAddress = (myAddress == address);

initial begin
	state <= 4'b0;
	address <=7'h1c;
	clkcnt <= 4'b0;
	rw <= 1'b0;
	ack <= 1'b1;
end

always@(posedge scl) begin
	clkcnt <= clkcnt + 4'b1;

	if (state == 4'd0) begin
	end

	else if (state == 4'd1) begin
		case (clkcnt)
			4'd0: address[0] <= sda;
			4'd1: address[1] <= sda;
			4'd2: address[2] <= sda;
			4'd3: address[3] <= sda;
			4'd4: address[4] <= sda;
			4'd5: address[5] <= sda;
			4'd6: address[6] <= sda;
			4'd7: 
				rw <= sda;
				if (compAddress)
					ack <= 1'b0;
			default:
				clkcnt <= 4'b0;
				ack <= 1'b1;
				if (compAddress)
					state <= 4'd2;
		endcase
	end			

end

always@(negedge sda) begin
//Start Condition
	if (scl && state == 4'd0) 
		state <= 4'd1;
end

endmodule
