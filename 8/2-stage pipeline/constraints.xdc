create_clock -period 11.000 -name clk -waveform {0.000 6.000} [get_ports clk]
set_input_delay -clock [get_clocks clk] -min -add_delay 0.000 [get_ports {input1[*]}]
set_input_delay -clock [get_clocks clk] -max -add_delay 0.200 [get_ports {input1[*]}]
set_input_delay -clock [get_clocks clk] -min -add_delay 0.000 [get_ports {input2[*]}]
set_input_delay -clock [get_clocks clk] -max -add_delay 0.200 [get_ports {input2[*]}]
set_output_delay -clock [get_clocks clk] -min -add_delay -0.900 [get_ports {product[*]}]
set_output_delay -clock [get_clocks clk] -max -add_delay 1.000 [get_ports {product[*]}]