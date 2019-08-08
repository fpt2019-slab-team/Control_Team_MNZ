module ltica(
  input  wire clk,
  output wire led,
  output wire [5:0] jb
);
  
reg [31:0] cnt;
reg [9:0] cnt1k;
reg [2:0] ccnt;

reg clk1k; //1024Hz

wire [9:0] cosValue;
wire [5:0] jbc;
wire dsp;

assign led = cnt1k[9];

always@(posedge clk) begin
	if (cnt == 32'd61_034) begin
		cnt <= 32'b0;
		clk1k <= !clk1k;
	end else begin
    cnt <= cnt + 32'b1;
  end
end

always@(posedge clk1k) begin
	cnt1k <= cnt1k + 10'b1;
end

always@(posedge cnt1k[6]) begin
	if (ccnt == 3'd5) begin
		ccnt <= 3'b0;
	end else begin
		ccnt <= ccnt + 3'b1;
	end
end

ltable lt (
	.nowCount(ccnt),
	.tvalue(jbc)
);

costable ct (
	.cnt(cnt1k),
	.cv(cosValue)
);

dsm dsmod (
	.clk(clk),
	.vadd(cosValue),
	.pulse(dsp)
);

splitter spm (
	.pulse(dsp),
	.arr(jbc),
	.sparr(jb)
);

endmodule
