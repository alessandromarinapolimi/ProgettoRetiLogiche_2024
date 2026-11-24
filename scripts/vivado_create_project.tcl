# Recreates the Vivado project from this repository. From the repository root:
#   vivado -mode batch -source scripts/vivado_create_project.tcl
# then open vivado_project/FIXEDPOINTSIN_.xpr. Paths are resolved from this
# script's location, so the current directory only affects where Vivado
# writes its .jou and .log files.

set repo_dir [file normalize [file join [file dirname [info script]] ..]]
set proj_name FIXEDPOINTSIN_
set proj_dir  [file join $repo_dir vivado_project]
set part      xc7a200tsbg484-1

create_project $proj_name $proj_dir -part $part -force
set_property target_language VHDL [current_project]

set src_files [glob -nocomplain -directory [file join $repo_dir src] *.vhd]
set sim_files [glob -nocomplain -directory [file join $repo_dir sim] *.vhd]
set xdc_file  [file join $repo_dir constraints SINE_CONSTRAINT.xdc]
if {[llength $src_files] == 0 || [llength $sim_files] == 0 || ![file exists $xdc_file]} {
    error "Sources not found under $repo_dir"
}

add_files -norecurse -fileset sources_1 $src_files
add_files -norecurse -fileset constrs_1 $xdc_file
add_files -norecurse -fileset sim_1     $sim_files

# The testbenches use std.env.finish and to_string.
set_property file_type {VHDL 2008} [get_files *.vhd]

set_property top SINE_CALCULATOR [get_filesets sources_1]
set_property top TB_SINE         [get_filesets sim_1]

# Run each testbench until it calls std.env.finish (TB_SINE needs about 5.2 us,
# longer than the default 1000 ns).
set_property -name xsim.simulate.runtime -value -all -objects [get_filesets sim_1]

# Reuse a saved waveform layout for the default testbench, if there is one.
set wcfg_file [file join $repo_dir sim waves TB_SINE.wcfg]
if {[file exists $wcfg_file]} {
    add_files -norecurse -fileset sim_1 $wcfg_file
    set_property xsim.view $wcfg_file [get_filesets sim_1]
}

update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
