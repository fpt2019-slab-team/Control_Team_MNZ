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
module P2A_Top(
  input wire          clk,
  input wire  [3:0]   btn,
  input wire  [1:0]   sw,
  output wire         pwm_a,
  output wire         pwm_b,
  output wire         standby
);

  wire [12:0] pwm_ctl;
  wire        out_pulse;

  assign pwm_ctl  = select(sw[0],sw[1]); 
  assign standby = 1'b1;


  pwma pwm_left(
    .clk(clk),
    .vq(pwm_ctl),
    .pulse(pwm_a)
  );

  pwma pwm_right(
    .clk(clk),
    .vq(pwm_ctl),
    .pulse(pwm_b)
  );

  ///////////////////////////////////
  function [12:0] select(
    input  a,
    input  b
  );
    if(a ==  1'b0)begin
      select =  13'h0;
    end else  begin
      if(b == 1'b1)begin
        select = 13'h1FFF;
      end else 
        select = 13'hFFF;
    end
  endfunction
endmodule
