# Runs a behavioural simulation and saves the waveform configuration.
#   vivado -mode batch -source scripts/vivado_simulate.tcl [-tclargs TB_NAME]
# The default testbench is TB_SINE. The wave config goes to sim/waves/<TB>.wcfg.
# Creates the project first if it does not exist.

set repo_dir [file normalize [file join [file dirname [info script]] ..]]
set xpr      [file join $repo_dir vivado_project FIXEDPOINTSIN_.xpr]
set tb       [expr {$argc > 0 ? [lindex $argv 0] : "TB_SINE"}]
set wcfg     [file join $repo_dir sim waves ${tb}.wcfg]

if {![file exists $xpr]} {
    source [file join $repo_dir scripts vivado_create_project.tcl]
} else {
    open_project $xpr
}
file mkdir [file dirname $wcfg]

set_property top $tb [get_filesets sim_1]
update_compile_order -fileset sim_1

launch_simulation
create_wave_config $tb
add_wave -recursive /$tb/*
run all
save_wave_config $wcfg
close_sim
