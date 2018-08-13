# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_msg_config -id {Common 17-41} -limit 10000000
create_project -in_memory -part xc7a15tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/GSOC/Integrated-Bit-Error-Ratio-Tester-master/Combined Module/Combined/mine/mine.cache/wt} [current_project]
set_property parent.project_path {C:/GSOC/Integrated-Bit-Error-Ratio-Tester-master/Combined Module/Combined/mine/mine.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:cmod_a7-15t:part0:1.1 [current_project]
set_property ip_output_repo {c:/GSOC/Integrated-Bit-Error-Ratio-Tester-master/Combined Module/Combined/mine/mine.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  {C:/GSOC/Integrated-Bit-Error-Ratio-Tester-master/Combined Module/DCW.v}
  {C:/GSOC/Integrated-Bit-Error-Ratio-Tester-master/Combined Module/DFF.v}
  {C:/GSOC/Integrated-Bit-Error-Ratio-Tester-master/Combined Module/choose.v}
  {C:/GSOC/Integrated-Bit-Error-Ratio-Tester-master/Combined Module/comp.v}
  {C:/GSOC/Integrated-Bit-Error-Ratio-Tester-master/Combined Module/error.v}
  {C:/GSOC/Integrated-Bit-Error-Ratio-Tester-master/Combined Module/mux.v}
  {C:/GSOC/Integrated-Bit-Error-Ratio-Tester-master/Combined Module/preemph.v}
  {C:/GSOC/Integrated-Bit-Error-Ratio-Tester-master/Combined Module/seven.v}
  {C:/GSOC/Integrated-Bit-Error-Ratio-Tester-master/Combined Module/test_control.v}
  {C:/GSOC/Integrated-Bit-Error-Ratio-Tester-master/Combined Module/thirteen.v}
  {C:/GSOC/Integrated-Bit-Error-Ratio-Tester-master/Combined Module/transmit.v}
  {C:/GSOC/Integrated-Bit-Error-Ratio-Tester-master/Combined Module/combined.v}
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/GSOC/Integrated-Bit-Error-Ratio-Tester-master/Combined Module/Combined/mine/mine.srcs/ibert/new/ibert.xdc}}
set_property used_in_implementation false [get_files {{C:/GSOC/Integrated-Bit-Error-Ratio-Tester-master/Combined Module/Combined/mine/mine.srcs/ibert/new/ibert.xdc}}]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top combined -part xc7a15tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef combined.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file combined_utilization_synth.rpt -pb combined_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]