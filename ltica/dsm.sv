module dsm (
	input wire clk,
	input wire [9:0] vadd,
	output wire pulse
);

reg [10:0] vreg;

assign pulse = vreg[10];

always @(posedge clk) begin
	vreg <= vreg + {1'b0, vadd} + {vreg[10], 10'b0};
end

initial begin
	vreg = 11'b0;
end

endmodule
