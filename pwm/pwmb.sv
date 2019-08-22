module pwm_b (
	input wire clk,
	input wire [9:0] vq,
	output wire pulse
);

reg [9:0] cnt;
reg pf;

assign pulse = qc[10];

always @(posedge clk) begin
	cnt <= cnt + 10'b1;

	if (cnt < {1'b0, q[9:1]}) begin
		pf <= 1'b1;
	end 
	else if (10'h3FF - {1'b0, vq[9:1]} < cnt) begin
		pf <= 1'b1;
	end 
	else begin
		pf <= 1'b0;
	end

end

endmodule
