create_clock -period 14.000 -name CLK [get_ports CLK]

# The design has a single register stage (SINE), so all the logic sits between
# the input ports and that register. Without I/O delays Vivado leaves those
# paths unconstrained. 0 ns assumes the inputs come from a register on the same
# clock and the output goes to one.
set_input_delay  -clock CLK 0.000 [get_ports {ANGLE[*] RST}]
set_output_delay -clock CLK 0.000 [get_ports {SINE[*]}]

# No PACKAGE_PIN or IOSTANDARD yet: the project does not target a board.
# write_bitstream stops on DRC NSTD-1 and UCIO-1 until they are added.
