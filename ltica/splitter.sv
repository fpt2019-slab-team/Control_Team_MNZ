module splitter (
	input wire pulse,
	input wire [5:0] arr,
	output wire [5:0] sparr
);

assign sparr = spf(arr, pulse);

function [5:0] spf([5:0] inp, swp);
begin
	if (swp) begin
		spf = inp;
	end else begin
		spf = 6'b0;
	end
end
endfunction

endmodule
