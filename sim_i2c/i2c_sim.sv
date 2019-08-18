`default_nettype none
`timescale 1ns/1ps

module i2c_sim();

   localparam  integer CLOCK_FREQ_9600HZ = 9.6 * (10 ** 3);
   localparam  integer CLOCK_PERIOD_NS_9600HZ = 1.0 * (10 ** 9) / CLOCK_FREQ_9600HZ;

   localparam  integer CLOCK_FREQ_38400HZ = 4 * 9.6 * (10 ** 3);
   localparam  integer CLOCK_PERIOD_NS_38400HZ = 1.0 * (10 ** 9) / CLOCK_FREQ_38400HZ;

   localparam  integer CLOCK_FREQ_50MHZ = 50 * (10 ** 6);
   localparam  integer CLOCK_PERIOD_NS_50MHZ = 1.0 * (10 ** 9) / CLOCK_FREQ_50MHZ;

   //reg 		       n_rst;
   reg 		       scl;
   //reg [3:0] 	       vinp;
   
   
   wire [6:0] 	       leds;;   
   
    i2c_slave a0(
    	       .scl(scl),
    	       .led(leds)
    	       );
   
   
  // enc7led led0(
	//	.vinp(vinp),
	//	.enchx(1'b1),
	//	.leds(leds)
	//	);

   
   //initial begin
   //   n_rst <= 1'b0;
   //   #(CLOCK_PERIOD_NS_50MHZ)
   //   n_rst <= 1'b1;
   //end

   
   initial begin
      scl <= 1'b0;
      forever begin
	 #(CLOCK_PERIOD_NS_50MHZ / 2.0)
	 scl <= ~scl;
      end
   end

   //always_ff @(posedge scl or negedge n_rst) begin
   //   if (!n_rst) begin
	 //vinp <= 4'd0;
   //   end else begin
	 //vinp <= vinp + 4'd1;
   //   end
   //end
   
   initial begin 
      #10000 $finish;
   end

   initial begin

      $shm_open("result.shm");
      $shm_probe(i2c_sim, "ACM");
      //$monitor($time,,,"scl = %d, vinp = %d, led = %x", scl, vinp, leds);
      $monitor($time,,,"scl = %d, led = %x", scl, leds);
   end

endmodule 
`default_nettype wire
