onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /testbench/u_output_memory/w_addr
add wave -noupdate -radix hexadecimal /testbench/u_output_memory/w_be
add wave -noupdate -radix hexadecimal /testbench/u_output_memory/w_data
add wave -noupdate -radix hexadecimal /testbench/u_output_memory/w_wren
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/IADDR
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/IDBUS
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg02
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg03
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg05
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg08
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg09
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg10
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg29
add wave -noupdate /testbench/m1_dc_wren
add wave -noupdate /testbench/m2_dc_wren
add wave -noupdate /testbench/m3_dc_wren
add wave -noupdate /testbench/m4_dc_rden
add wave -noupdate /testbench/u_cpu_top/DWRITE
add wave -noupdate /testbench/dc_wren
add wave -noupdate -radix hexadecimal /testbench/dc_addr
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_forward_a
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_forward_b
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_branch_taken
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_branch_ctrl
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/iid_rs_data
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_rt_data
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/wb_write_bus
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/istall_n
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_branch_ctrl
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {26600000 ps} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 117
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {602946750 ps}
