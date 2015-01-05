onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/exe_cycle
add wave -noupdate /testbench/u_cpu_top/CLK
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuif/if_pc
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuif/if_ins
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_ins
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuif/stall_n
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg01
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg02
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_branch
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_branch_taken
add wave -noupdate -divider JALR_DEBUG
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/wb_regwrite
add wave -noupdate -radix unsigned /testbench/u_cpu_top/u_cpu_core/u_cpumem/wb_write_num
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuwb/wb_write_bus
add wave -noupdate -divider HDU
add wave -noupdate -radix unsigned /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_hdu/id_ins_rs
add wave -noupdate -radix unsigned /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_hdu/id_ins_rt
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_hdu/ex_regwrite
add wave -noupdate -radix unsigned /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_hdu/ex_write_num
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_hdu/ex_memread
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_hdu/cs_mul_check
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_hdu/mul_stall
add wave -noupdate -divider BranchUnit
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_bu/sel
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_bu/rs
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_bu/rs_neg
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_bu/rs_neg_n
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_bu/rs_pos
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_bu/rs_pos_n
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_bu/rs_rt_equ
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_bu/rs_rt_equ_n
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_bu/rs_zero
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_bu/rs_zero_n
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_bu/rt
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_bu/taken
add wave -noupdate -divider ForwardingUnit
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_forward_a
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_a_bus
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/m_result_bus
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/wb_write_bus
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/iid_rs_data
add wave -noupdate -divider TOP
add wave -noupdate /testbench/u_cpu_top/CLK
add wave -noupdate /testbench/u_cpu_top/IREQ
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/IADDR
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/IDBUS
add wave -noupdate /testbench/u_cpu_top/DREQ
add wave -noupdate /testbench/u_cpu_top/DWRITE
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/DADDR
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/DRDBUS
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/DWDBUS
add wave -noupdate /testbench/u_cpu_top/DBE
add wave -noupdate -divider IF
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuif/clk
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuif/if_pc
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuif/if_ins
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuif/BS_FIRST
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuif/BS_NORMAL
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuif/BS_OFF
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuif/BS_SECOND
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuif/bs_state
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuif/id_add_out
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuif/id_ins
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuif/id_jump_pc
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuif/id_pc_src
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuif/id_pca4
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuif/id_rs_data
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuif/if2id_r_en
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuif/if_npc
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuif/if_pca4
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuif/imem_addr
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuif/imem_databus
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuif/imem_read
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuif/rst_n
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuif/stall_n
add wave -noupdate -divider REGBANK
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg00
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg01
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg02
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg03
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg04
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg05
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg06
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg07
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg08
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg09
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg10
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg11
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg12
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg13
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg14
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg15
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg16
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg17
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg18
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg19
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg20
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg21
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg22
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg23
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg24
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg25
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg26
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg27
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg28
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg29
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg30
add wave -noupdate -radix hexadecimal /testbench/u_cpu_top/u_cpu_core/u_cpuid/u_regbank/reg31
add wave -noupdate -divider ID
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/clk
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_align_op
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_alu_move_cond
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_alu_op
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_alu_src
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_branch
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_branch_ctrl
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_cprrsel
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_cpwren
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_jr
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_jump
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_memread
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_memwrite
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_mhi_en
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_mlo_en
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_mul_check
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_mul_regen
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_mul_sign
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_mul_start
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_mul_type
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_mulreg_sel
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_reg2sn
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_reg_dst
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_regwrite
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_result_sel
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_shd
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_shp
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_sht
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_stall_check
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_store_op
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_wbdata_sel
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/cs_zero_ext
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/ex_a_bus
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/ex_align_op
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/ex_alu_move_cond
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/ex_alu_op
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/ex_alu_src
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/ex_b_bus
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/ex_cprrsel
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/ex_cpwren
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/ex_extend_bus
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/ex_ins_rd
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/ex_ins_rs
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/ex_ins_rt
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/ex_ins_sa
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/ex_memread
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/ex_memwrite
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/ex_mhi_en
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/ex_mlo_en
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/ex_mulreg_sel
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/ex_pca4
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/ex_reg2sn
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/ex_reg_dst
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/ex_regwrite
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/ex_result_sel
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/ex_shd
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/ex_shp
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/ex_sht
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/ex_store_op
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/ex_wbdata_sel
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/ex_write_num
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_a_bus
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_add_bin
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_add_out
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_align_op
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_alu_move_cond
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_alu_op
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_alu_src
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_b_bus
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_branch
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_branch_ctrl
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_branch_taken
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_cprrsel
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_cpwren
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_extend_bus
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_forward_a
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_forward_b
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_ins
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_ins_rd
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_ins_rs
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_ins_rt
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_ins_sa
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_jump_pc
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_memread
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_memwrite
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_mhi_en
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_mlo_en
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_mul_regen
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_mul_sign
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_mul_start
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_mul_type
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_mulreg_sel
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_pc_src
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_pca4
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_reg2sn
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_reg_dst
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_regwrite
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_result_sel
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_rs_data
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_rt_data
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_shd
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_shp
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_sht
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_store_op
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_wbdata_sel
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/id_zero_ext
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/iex_memread
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/iex_regwrite
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/iid_rs_data
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/istall_n
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/logic0
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/m_regwrite
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/m_result_bus
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/m_write_num
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/mul_a
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/mul_ain
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/mul_b
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/mul_bin
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/mul_forward_a
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/mul_forward_b
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/mul_regen
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/mul_regen_a
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/mul_regen_b
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/mul_rs
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/mul_rt
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/mul_sign
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/mul_stall
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/mul_start
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/mul_type
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/mul_update_a
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/mul_update_b
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/rst_n
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/stall_n
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/wb_regwrite
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/wb_write_bus
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/wb_write_mask
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuid/wb_write_num
add wave -noupdate -divider EX
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/CPRDBUS
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/CPRRNUM
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/CPRRSEL
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/CPWDBUS
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/CPWREN
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/CPWRNUM
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/clk
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_a_bus
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_align_op
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_alu_carry
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_alu_move_check
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_alu_move_cond
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_alu_op
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_alu_out
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_alu_overflow
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_alu_src
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_alu_zero
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_b_bus
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_cprrsel
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_cpwren
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_extend_bus
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_forward_a
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_forward_b
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_forward_bus_a
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_forward_bus_b
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_fun_bus_b
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_ins_rd
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_ins_rs
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_ins_rt
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_ins_sa
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_memread
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_memwrite
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_mhi_en
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_mlo_en
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_mulreg_sel
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_pca4
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_pca8
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_reg2sn
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_reg_dst
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_regwrite
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_regwrite2
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_result_bus
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_result_sel
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_shamt
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_shd
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_shifter_out
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_shp
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_sht
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_store_op
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_wbdata_sel
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/ex_write_num
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/iex_write_num
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/im_regwrite
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/im_result_bus
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/im_write_num
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/imul_forward_a
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/imul_forward_b
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/m_align_op
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/m_b_bus
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/m_memread
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/m_memwrite
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/m_mhi_en
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/m_mlo_en
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/m_mulreg_sel
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/m_regwrite
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/m_result_bus
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/m_store_op
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/m_wbdata_sel
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/m_write_num
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/mul_a
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/mul_ain
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/mul_b
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/mul_bin
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/mul_forward_a
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/mul_forward_b
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/mul_hi
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/mul_lo
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/mul_out
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/mul_rs
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/mul_rt
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/mul_sign
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/mul_stall
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/mul_start
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/mul_type
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/mul_update_a
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/mul_update_b
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/rst_n
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/wb_regwrite
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/wb_write_bus
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuex/wb_write_num
add wave -noupdate -divider MEM
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/big_endian
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/clk
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/dmem_addr
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/dmem_be
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/dmem_rdatabus
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/dmem_request
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/dmem_wdatabus
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/dmem_write
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/m_align_op
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/m_b_bus
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/m_dmem_offset
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/m_memread
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/m_memwrite
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/m_mhi_en
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/m_mlo_en
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/m_mulreg_sel
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/m_rdata_bus
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/m_regwrite
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/m_result_bus
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/m_store_op
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/m_wbdata_sel
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/m_write_num
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/mul_hi
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/mul_lo
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/rst_n
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/wb_align_op
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/wb_dmem_offset
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/wb_mul_hi
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/wb_mul_lo
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/wb_mulreg_sel
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/wb_rdata_bus
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/wb_regwrite
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/wb_result_bus
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/wb_wbdata_sel
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpumem/wb_write_num
add wave -noupdate -divider WB
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuwb/big_endian
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuwb/i_mul_hi
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuwb/i_mul_lo
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuwb/i_wb_rdata_bus
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuwb/m_mul_hi
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuwb/m_mul_lo
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuwb/wb_align_op
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuwb/wb_dmem_offset
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuwb/wb_mul_hi
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuwb/wb_mul_lo
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuwb/wb_mulreg_sel
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuwb/wb_rdata_bus
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuwb/wb_result_bus
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuwb/wb_wbdata_sel
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuwb/wb_write_bus
add wave -noupdate /testbench/u_cpu_top/u_cpu_core/u_cpuwb/wb_write_mask
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {92757 ps} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {66977 ps} {133095 ps}
