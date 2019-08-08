module ltica(
  input  wire clk,
  output wire led,
  output wire [6:0] jb
);
  reg [31:0] cnt;

  always@(posedge clk)begin
    cnt <= cnt + 1;
  end

	ltable lt (
		.nowCount(cnt[25:23]),
		.tvalue(jb)
	);

  assign led = cnt[23];
endmodule
