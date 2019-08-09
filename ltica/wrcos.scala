object wrcos
{
	def main(args: Array[String])
	{
		println("	function [9:0] cos(input[9:0] inp);")
		println("	begin")
		println("		case(inp)")
	
		(0 until 1024).foreach (i =>
			printf("		10'd%4d: cos = 10'd%d;\n", i, queCos(i, 1024, 1023))) 

		println("		endcase")
		println("	end")
		println("	endfunction")
	}

	def queCos(cnt: Int, cnum: Int, vmax: Int): Int = 
		(vmax * 0.5 * (math.cos(2.0 * math.Pi * cnt / cnum) + 1.0)).toInt
}
