# Simulation with GHDL (open source, any OS). Usage: make [all|test|sim-<TB>|clean]
# Testbenches use std.env.finish/stop, so VHDL-2008 is required.

GHDL   ?= ghdl
STD    ?= 08
BUILD  ?= build
GFLAGS := --std=$(STD) --workdir=$(BUILD)

# Compile order matters: dependencies first.
SRC := src/FA.vhd src/RCA.vhd src/SUB.vhd src/COMPARATOR.vhd \
       src/INTERPOLATOR.vhd src/ANGLE_SINE_MAPPER.vhd src/SINE_CALCULATOR.vhd

# TB_INTERP and TB_LUT target entities (INTERP, LUT) that no longer exist
# in src/, so they are not part of the default run.
TBS := TB_FA TB_RCA TB_SUB TB_SINE

.PHONY: all test clean $(addprefix sim-,$(TBS))
all test: $(addprefix sim-,$(TBS))

$(BUILD)/.analyzed: $(SRC)
	@mkdir -p $(BUILD)
	$(GHDL) -a $(GFLAGS) $(SRC)
	@touch $@

$(addprefix sim-,$(TBS)): sim-%: $(BUILD)/.analyzed
	$(GHDL) -a $(GFLAGS) sim/$*.vhd
	$(GHDL) -e $(GFLAGS) $*
	$(GHDL) -r $(GFLAGS) $* --stop-time=100ms --wave=$(BUILD)/$*.ghw

clean:
	rm -rf $(BUILD)
