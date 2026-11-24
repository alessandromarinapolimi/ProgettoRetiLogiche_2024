# Recreate the Vivado project from the sources in this repository.
# From the repository root:  vivado -mode batch -source scripts/vivado_create_project.tcl
# Then open vivado_project/FIXEDPOINTSIN_.xpr in the GUI.

set repo [file normalize [file join [file dirname [info script]] ..]]
set proj FIXEDPOINTSIN_

create_project $proj [file join $repo vivado_project] -part xc7a200tsbg484-1 -force
set_property target_language VHDL [current_project]

add_files -fileset sources_1 [glob -directory [file join $repo src] *.vhd]
add_files -fileset constrs_1 [file join $repo constraints SINE_CONSTRAINT.xdc]
add_files -fileset sim_1     [glob -directory [file join $repo sim] *.vhd]

set_property file_type {VHDL 2008} [get_files *.vhd]
set_property top SINE_CALCULATOR [get_filesets sources_1]
set_property top TB_SINE         [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
