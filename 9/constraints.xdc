# Clock signal
#Bank = 34, Pin name = ,					Sch name = CLK100MHZ
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk]

# LEDs
set_property PACKAGE_PIN U16 [get_ports {dout[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dout[0]}]
set_property PACKAGE_PIN E19 [get_ports {dout[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dout[1]}]
set_property PACKAGE_PIN U19 [get_ports {dout[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dout[2]}]
set_property PACKAGE_PIN V19 [get_ports {dout[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dout[3]}]
set_property PACKAGE_PIN W18 [get_ports {dout[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dout[4]}]
set_property PACKAGE_PIN U15 [get_ports {dout[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dout[5]}]
set_property PACKAGE_PIN U14 [get_ports {dout[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dout[6]}]
set_property PACKAGE_PIN V14 [get_ports {dout[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dout[7]}]

set_property PACKAGE_PIN V3 [get_ports {count_odd}]
set_property IOSTANDARD LVCMOS33 [get_ports {count_odd}]
set_property PACKAGE_PIN W3 [get_ports {read_index_odd}]
set_property IOSTANDARD LVCMOS33 [get_ports {read_index_odd}]

set_property PACKAGE_PIN U3 [get_ports {srst_led}]
set_property IOSTANDARD LVCMOS33 [get_ports {srst_led}]
set_property PACKAGE_PIN P3 [get_ports {write_led}]
set_property IOSTANDARD LVCMOS33 [get_ports {write_led}]
set_property PACKAGE_PIN N3 [get_ports {read_led}]
set_property IOSTANDARD LVCMOS33 [get_ports {read_led}]
set_property PACKAGE_PIN P1 [get_ports {empty}]
set_property IOSTANDARD LVCMOS33 [get_ports {empty}]
set_property PACKAGE_PIN L1 [get_ports {full}]
set_property IOSTANDARD LVCMOS33 [get_ports {full}]

#Buttons
#Bank = 14,				Sch name = BTNC
set_property PACKAGE_PIN U18 [get_ports {srst_key}]
set_property IOSTANDARD LVCMOS33 [get_ports {srst_key}]
#Bank = 14, 			Sch name = BTNU
set_property PACKAGE_PIN T18 [get_ports {write_key}]
set_property IOSTANDARD LVCMOS33 [get_ports {write_key}]
#Bank = 14, 			Sch name = BTND
set_property PACKAGE_PIN U17 [get_ports {read_key}]
set_property IOSTANDARD LVCMOS33 [get_ports {read_key}]

