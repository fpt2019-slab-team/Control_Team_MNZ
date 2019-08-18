
all:sim

sim:
	ncverilog +access+r+w i2c_sim.sv i2c_slave.v enc7led.sv
bram:
	ncverilog +access+r+w RS232C_BRAM_sim.v RS232C_BRAM.v v_rams_14.v
clean:
	rm -rf  *.log ncverilog.* INCA_libs verilog.dump dump.txt *~ */*~ */\#*
wave:	sim.svcf
	simvision -input sim.svcf &

distclean: clean
	rm -rf result.shm
