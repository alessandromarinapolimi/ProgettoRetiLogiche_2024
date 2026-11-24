# GHDL simulation. Usage: make [all|test|sim-<TB>|clean]
# The testbenches need VHDL-2008 (std.env.finish, to_string).

GHDL   ?= ghdl
STD    ?= 08
BUILD  ?= build
GFLAGS := --std=$(STD) --workdir=$(BUILD)

# Dependencies first.
SRC := src/FA.vhd src/RCA.vhd src/SUB.vhd src/COMPARATOR.vhd \
       src/INTERPOLATOR.vhd src/ANGLE_SINE_MAPPER.vhd src/SINE_CALCULATOR.vhd

TBS := TB_FA TB_RCA TB_SUB TB_INTERP TB_LUT TB_SINE

.PHONY: all test clean $(addprefix sim-,$(TBS))
all test: $(addprefix sim-,$(TBS))

$(BUILD)/.analyzed: $(SRC)
	@mkdir -p $(BUILD)
	$(GHDL) -a $(GFLAGS) $(SRC)
	@touch $@

# A testbench reports a mismatch with severity failure, which makes ghdl -r
# exit non-zero and stops make.
$(addprefix sim-,$(TBS)): sim-%: $(BUILD)/.analyzed
	$(GHDL) -a $(GFLAGS) sim/$*.vhd
	$(GHDL) -e $(GFLAGS) $*
	$(GHDL) -r $(GFLAGS) $* --stop-time=100ms --wave=$(BUILD)/$*.ghw

clean:
	rm -rf $(BUILD)
