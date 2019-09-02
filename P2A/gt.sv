////////////////////////////////////////////////////////////
//
// sw[0] controls pwm ratio sw[0] high send 1 ratio low send 0.5 ratio
// sw[1] controls power of pwm when  sw[1] is low ,this logic only supply 0 signal to pwm module
// stanby is always high
//
//
//
//
///////////////////////////////////////////////////////////

module apasm(
	input wire          clk,
	input wire  [3:0]   btn,
	input wire  [1:0]   sw,
	output wire 				ain1,
	output wire 				ain2,
	output wire 				bin1,
	output wire 				bin2,
	output wire         pwm_a,
	output wire         pwm_b,
	output wire         standby
);

	reg [12:0] pva;
	reg [12:0] pvb;

	assign standby = 1'b1;
	assign ain1 = btn[0];
	assign ain2 = btn[1];
	assign bin1 = btn[2];
	assign bin2 = btn[3];

	pwmc pwmma(
		.clk(clk),
		.vq(pva),
		.pulse(pwm_a)
	);

	pwmc pwmmb(
		.clk(clk),
		.vq(pvb),
		.pulse(pwm_b)
	);

	always@(posedge clk) begin
		if (!sw[0]) begin
			pva <= 13'b0;
			pvb <= 13'b0;
		end 
		else begin
			if (sw[1]) begin
				pva <= 13'h1FFF;
				pvb <= 13'h1FFF;
			end
			else begin
				pva <= 13'h0FFF;
				pvb <= 13'h0FFF;
			end
		end
	end
	
endmodule
