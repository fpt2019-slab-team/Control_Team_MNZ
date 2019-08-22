#============================================================
# DEVICE 
#============================================================
set_global_assignment -name FAMILY "Cyclone IV E"
set_global_assignment -name DEVICE EP4CE115F29C7

#============================================================
# CLOCK
#============================================================
set_location_assignment PIN_Y2 -to clk
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to clk

#============================================================
# KEY
#============================================================
set_location_assignment PIN_M23 -to KEY[0]
#set_instance_assignment -name IO_STANDARD "2.5 V" -to KEY[0]
set_location_assignment PIN_M21 -to KEY[1]
#set_instance_assignment -name IO_STANDARD "2.5 V" -to KEY[1]
set_location_assignment PIN_N21 -to KEY[2]
#set_instance_assignment -name IO_STANDARD "2.5 V" -to KEY[2]
set_location_assignment PIN_R24 -to KEY[3]
#set_instance_assignment -name IO_STANDARD "2.5 V" -to KEY[3]

#============================================================
# 7 SEGMENT 
#============================================================
set_location_assignment PIN_G18  -to hex4[0]
set_location_assignment PIN_F22  -to hex4[1]
set_location_assignment PIN_E17  -to hex4[2]
set_location_assignment PIN_L26  -to hex4[3]
set_location_assignment PIN_L25  -to hex4[4]
set_location_assignment PIN_J22  -to hex4[5]
set_location_assignment PIN_H22  -to hex4[6]
set_location_assignment PIN_M24  -to hex3[0]
set_location_assignment PIN_Y22  -to hex3[1]
set_location_assignment PIN_W21  -to hex3[2]
set_location_assignment PIN_W22  -to hex3[3]
set_location_assignment PIN_W25  -to hex3[4]
set_location_assignment PIN_U23  -to hex3[5]
set_location_assignment PIN_U24  -to hex3[6]
set_location_assignment PIN_AA25 -to hex2[0]
set_location_assignment PIN_AA26 -to hex2[1]
set_location_assignment PIN_Y25  -to hex2[2]
set_location_assignment PIN_W26  -to hex2[3]
set_location_assignment PIN_Y26  -to hex2[4]
set_location_assignment PIN_W27  -to hex2[5]
set_location_assignment PIN_W28  -to hex2[6]
set_location_assignment PIN_V21  -to hex1[0]
set_location_assignment PIN_U21  -to hex1[1]
set_location_assignment PIN_AB20 -to hex1[2]
set_location_assignment PIN_AA21 -to hex1[3]
set_location_assignment PIN_AD24 -to hex1[4]
set_location_assignment PIN_AF23 -to hex1[5]
set_location_assignment PIN_Y19  -to hex1[6]

# set_instance_assignment -name IO_STANDARD "2.5 V" -to hex4[0] 
# set_instance_assignment -name IO_STANDARD "2.5 V" -to hex4[1] 
# set_instance_assignment -name IO_STANDARD "2.5 V" -to hex4[2] 
# set_instance_assignment -name IO_STANDARD "2.5 V" -to hex4[3] 
# set_instance_assignment -name IO_STANDARD "2.5 V" -to hex4[4] 
# set_instance_assignment -name IO_STANDARD "2.5 V" -to hex4[5] 
# set_instance_assignment -name IO_STANDARD "2.5 V" -to hex4[6] 
# set_instance_assignment -name IO_STANDARD "2.5 V" -to hex3[0] 
# set_instance_assignment -name IO_STANDARD "2.5 V" -to hex3[1] 
# set_instance_assignment -name IO_STANDARD "2.5 V" -to hex3[2] 
# set_instance_assignment -name IO_STANDARD "2.5 V" -to hex3[3] 
# set_instance_assignment -name IO_STANDARD "2.5 V" -to hex3[4] 
# set_instance_assignment -name IO_STANDARD "2.5 V" -to hex3[5] 
# set_instance_assignment -name IO_STANDARD "2.5 V" -to hex3[6] 
# set_instance_assignment -name IO_STANDARD "2.5 V" -to hex2[0] 
# set_instance_assignment -name IO_STANDARD "2.5 V" -to hex2[1] 
# set_instance_assignment -name IO_STANDARD "2.5 V" -to hex2[2] 
# set_instance_assignment -name IO_STANDARD "2.5 V" -to hex2[3] 
# set_instance_assignment -name IO_STANDARD "2.5 V" -to hex2[4] 
# set_instance_assignment -name IO_STANDARD "2.5 V" -to hex2[5] 
# set_instance_assignment -name IO_STANDARD "2.5 V" -to hex2[6] 
# set_instance_assignment -name IO_STANDARD "2.5 V" -to hex1[0] 
# set_instance_assignment -name IO_STANDARD "2.5 V" -to hex1[1] 
# set_instance_assignment -name IO_STANDARD "2.5 V" -to hex1[2] 
# set_instance_assignment -name IO_STANDARD "2.5 V" -to hex1[3] 
# set_instance_assignment -name IO_STANDARD "2.5 V" -to hex1[4] 
# set_instance_assignment -name IO_STANDARD "2.5 V" -to hex1[5] 
# set_instance_assignment -name IO_STANDARD "2.5 V" -to hex1[6] 
#============================================================
# SW
#============================================================

set_location_assignment PIN_AB28 -to sw[0]
#set_instance_assignment -name IO_STANDARD "2.5 V" -to sw[0]
set_location_assignment PIN_AC28 -to sw[1]
#set_instance_assignment -name IO_STANDARD "2.5 V" -to sw[1]
set_location_assignment PIN_AC27 -to sw[2]
#set_instance_assignment -name IO_STANDARD "2.5 V" -to sw[2]
