# Control_Team_MNZ
## TASK
  - KAKIZAKI  
    Make I2C modulr simulation by 8/18
    do
    I little changed enc7led.sv module 

  ```enc7led.sv
      reg [6:0] outout;     //I added this reg 
      assign leds = outout;
      always @* begin
        if (vinp < 4'd10) begin
      case (vinp)
        4'd0: outout = 7'b1000000;
        4'd1: outout = 7'b1111001;
        4'd2: outout = 7'b0100100;
        4'd3: outout = 7'b0110000;
        4'd4: outout = 7'b0011001;
        4'd5: outout = 7'b0010010;
        4'd6: outout = 7'b0000010;
        4'd7: outout = 7'b1011000;
        4'd9: outout = 7'b0010000;
        default: outout = 7'b0000000;
        endcase
  ```

## Tool
## Purpose
