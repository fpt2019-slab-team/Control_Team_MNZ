module ltable(
	input  wire [2:0] nowCount,
	output logic [5:0] tvalue
);

always_comb begin
	if (nowCount == 3'd0) begin
		tvalue = 6'b000001;
	end else if (nowCount == 3'd1) begin
		tvalue = 6'b000010;
	end else if (nowCount == 3'd2) begin
		tvalue = 6'b000100;
	end else if (nowCount == 3'd3) begin
		tvalue = 6'b001000;
	end else if (nowCount == 3'd4) begin
		tvalue = 6'b010000;
	end else if (nowCount == 3'd5) begin
		tvalue = 6'b100000;
	end else begin
		tvalue = 6'b111111;
	end
end

endmodule
