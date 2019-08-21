set_global_assignment -entity "zynqclk" -library "lib_zynqclk" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "zynqclk" -library "lib_zynqclk" -name IP_TOOL_VERSION "18.0"
set_global_assignment -entity "zynqclk" -library "lib_zynqclk" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_zynqclk" -name SPD_FILE [file join $::quartus(sip_path) "zynqclk.spd"]

set_global_assignment -library "lib_zynqclk" -name MISC_FILE [file join $::quartus(sip_path) "zynqclk_sim/zynqclk.vo"]
