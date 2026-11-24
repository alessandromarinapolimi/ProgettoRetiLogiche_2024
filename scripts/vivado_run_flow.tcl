# Runs synthesis and implementation and writes the reports to reports/.
#   vivado -mode batch -source scripts/vivado_run_flow.tcl
# Creates the project first if it does not exist.

set repo_dir [file normalize [file join [file dirname [info script]] ..]]
set xpr      [file join $repo_dir vivado_project FIXEDPOINTSIN_.xpr]
set rpt_dir  [file join $repo_dir reports]
set top      SINE_CALCULATOR

if {![file exists $xpr]} {
    source [file join $repo_dir scripts vivado_create_project.tcl]
} else {
    open_project $xpr
}
file mkdir $rpt_dir

reset_run synth_1
launch_runs synth_1 -jobs 4
wait_on_run synth_1
if {[get_property PROGRESS [get_runs synth_1]] != "100%"} { error "Synthesis failed" }

open_run synth_1 -name synth_1
report_utilization    -file [file join $rpt_dir ${top}_utilization_synth.rpt]
report_timing_summary -file [file join $rpt_dir ${top}_timing_synth.rpt]

reset_run impl_1
launch_runs impl_1 -jobs 4
wait_on_run impl_1
if {[get_property PROGRESS [get_runs impl_1]] != "100%"} { error "Implementation failed" }

open_run impl_1
report_utilization    -file [file join $rpt_dir ${top}_utilization_placed.rpt]
report_timing_summary -file [file join $rpt_dir ${top}_timing_summary_routed.rpt]
report_power          -file [file join $rpt_dir ${top}_power_routed.rpt]
report_drc            -file [file join $rpt_dir ${top}_drc_routed.rpt]
