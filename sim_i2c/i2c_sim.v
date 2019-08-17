`default_nettype none
`timescale 1ns/1ps

module i2c_sim();

  localparam  integer CLOCK_FREQ_9600HZ = 9.6 * (10 ** 3);
  localparam  integer CLOCK_PERIOD_NS_9600HZ = 1.0 * (10 ** 9) / CLOCK_FREQ_9600HZ;

  localparam  integer CLOCK_FREQ_38400HZ = 4 * 9.6 * (10 ** 3);
  localparam  integer CLOCK_PERIOD_NS_38400HZ = 1.0 * (10 ** 9) / CLOCK_FREQ_38400HZ;

  localparam  integer CLOCK_FREQ_50MHZ = 50 * (10 ** 6);
  localparam  integer CLOCK_PERIOD_NS_50MHZ = 1.0 * (10 ** 9) / CLOCK_FREQ_50MHZ;

  reg 		 scl;
  wire    [7:0] led;   

  i2c_slave a0(
    .scl(scl),
    .led(led)
  );

  initial begin
    scl <= 1'b0;
    forever begin
      #(CLOCK_PERIOD_NS_50MHZ / 2.0)
      scl <= ~scl;
    end
  end
  
  initial begin
    
   #10000 $finish;
  end

  initial begin

    $shm_open("result.shm");
    $shm_probe(i2c_sim, "ACM");
    $monitor($time,,,"scl = %d ",scl);
  end

endmodule 
`default_nettype wire
