vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/microblaze_v11_0_4
vlib modelsim_lib/msim/lmb_v10_v3_0_11
vlib modelsim_lib/msim/lmb_bram_if_cntlr_v4_0_19
vlib modelsim_lib/msim/blk_mem_gen_v8_4_4
vlib modelsim_lib/msim/axi_lite_ipif_v3_0_4
vlib modelsim_lib/msim/mdm_v3_2_19
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/proc_sys_reset_v5_0_13
vlib modelsim_lib/msim/lib_pkg_v1_0_2
vlib modelsim_lib/msim/lib_srl_fifo_v1_0_2
vlib modelsim_lib/msim/axi_uartlite_v2_0_26
vlib modelsim_lib/msim/generic_baseblocks_v2_1_0
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_register_slice_v2_1_22
vlib modelsim_lib/msim/fifo_generator_v13_2_5
vlib modelsim_lib/msim/axi_data_fifo_v2_1_21
vlib modelsim_lib/msim/axi_crossbar_v2_1_23
vlib modelsim_lib/msim/interrupt_control_v3_1_4
vlib modelsim_lib/msim/axi_gpio_v2_0_24

vmap xpm modelsim_lib/msim/xpm
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap microblaze_v11_0_4 modelsim_lib/msim/microblaze_v11_0_4
vmap lmb_v10_v3_0_11 modelsim_lib/msim/lmb_v10_v3_0_11
vmap lmb_bram_if_cntlr_v4_0_19 modelsim_lib/msim/lmb_bram_if_cntlr_v4_0_19
vmap blk_mem_gen_v8_4_4 modelsim_lib/msim/blk_mem_gen_v8_4_4
vmap axi_lite_ipif_v3_0_4 modelsim_lib/msim/axi_lite_ipif_v3_0_4
vmap mdm_v3_2_19 modelsim_lib/msim/mdm_v3_2_19
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 modelsim_lib/msim/proc_sys_reset_v5_0_13
vmap lib_pkg_v1_0_2 modelsim_lib/msim/lib_pkg_v1_0_2
vmap lib_srl_fifo_v1_0_2 modelsim_lib/msim/lib_srl_fifo_v1_0_2
vmap axi_uartlite_v2_0_26 modelsim_lib/msim/axi_uartlite_v2_0_26
vmap generic_baseblocks_v2_1_0 modelsim_lib/msim/generic_baseblocks_v2_1_0
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_22 modelsim_lib/msim/axi_register_slice_v2_1_22
vmap fifo_generator_v13_2_5 modelsim_lib/msim/fifo_generator_v13_2_5
vmap axi_data_fifo_v2_1_21 modelsim_lib/msim/axi_data_fifo_v2_1_21
vmap axi_crossbar_v2_1_23 modelsim_lib/msim/axi_crossbar_v2_1_23
vmap interrupt_control_v3_1_4 modelsim_lib/msim/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_24 modelsim_lib/msim/axi_gpio_v2_0_24

vlog -work xpm -64 -incr -sv "+incdir+../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/d0f7" "+incdir+../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/ec67/hdl" \
"/tools/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/tools/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/tools/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/d0f7" "+incdir+../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/ec67/hdl" \
"../../../bd/MicroGPIO/ip/MicroGPIO_clk_wiz_0_0/MicroGPIO_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/MicroGPIO/ip/MicroGPIO_clk_wiz_0_0/MicroGPIO_clk_wiz_0_0.v" \
"../../../bd/MicroGPIO/sim/MicroGPIO.v" \

vcom -work microblaze_v11_0_4 -64 -93 \
"../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/9285/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/MicroGPIO/ip/MicroGPIO_microblaze_0_1/sim/MicroGPIO_microblaze_0_1.vhd" \

vcom -work lmb_v10_v3_0_11 -64 -93 \
"../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/c2ed/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/MicroGPIO/ip/MicroGPIO_dlmb_v10_1/sim/MicroGPIO_dlmb_v10_1.vhd" \
"../../../bd/MicroGPIO/ip/MicroGPIO_ilmb_v10_1/sim/MicroGPIO_ilmb_v10_1.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_19 -64 -93 \
"../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/0b98/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/MicroGPIO/ip/MicroGPIO_dlmb_bram_if_cntlr_1/sim/MicroGPIO_dlmb_bram_if_cntlr_1.vhd" \
"../../../bd/MicroGPIO/ip/MicroGPIO_ilmb_bram_if_cntlr_1/sim/MicroGPIO_ilmb_bram_if_cntlr_1.vhd" \

vlog -work blk_mem_gen_v8_4_4 -64 -incr "+incdir+../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/d0f7" "+incdir+../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/ec67/hdl" \
"../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/d0f7" "+incdir+../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/ec67/hdl" \
"../../../bd/MicroGPIO/ip/MicroGPIO_lmb_bram_1/sim/MicroGPIO_lmb_bram_1.v" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work mdm_v3_2_19 -64 -93 \
"../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/8715/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/MicroGPIO/ip/MicroGPIO_mdm_1_1/sim/MicroGPIO_mdm_1_1.vhd" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -64 -93 \
"../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/MicroGPIO/ip/MicroGPIO_rst_clk_wiz_0_100M_1/sim/MicroGPIO_rst_clk_wiz_0_100M_1.vhd" \

vcom -work lib_pkg_v1_0_2 -64 -93 \
"../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -64 -93 \
"../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_uartlite_v2_0_26 -64 -93 \
"../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/5edb/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/MicroGPIO/ip/MicroGPIO_axi_uartlite_0_3/sim/MicroGPIO_axi_uartlite_0_3.vhd" \

vlog -work generic_baseblocks_v2_1_0 -64 -incr "+incdir+../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/d0f7" "+incdir+../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/ec67/hdl" \
"../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr "+incdir+../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/d0f7" "+incdir+../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/ec67/hdl" \
"../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_22 -64 -incr "+incdir+../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/d0f7" "+incdir+../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/ec67/hdl" \
"../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/af2c/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5 -64 -incr "+incdir+../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/d0f7" "+incdir+../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/ec67/hdl" \
"../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -64 -93 \
"../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5 -64 -incr "+incdir+../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/d0f7" "+incdir+../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/ec67/hdl" \
"../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_21 -64 -incr "+incdir+../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/d0f7" "+incdir+../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/ec67/hdl" \
"../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/54c0/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_23 -64 -incr "+incdir+../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/d0f7" "+incdir+../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/ec67/hdl" \
"../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/bc0a/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/d0f7" "+incdir+../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/ec67/hdl" \
"../../../bd/MicroGPIO/ip/MicroGPIO_xbar_1/sim/MicroGPIO_xbar_1.v" \

vcom -work interrupt_control_v3_1_4 -64 -93 \
"../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_24 -64 -93 \
"../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/4318/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/MicroGPIO/ip/MicroGPIO_axi_gpio_0_3/sim/MicroGPIO_axi_gpio_0_3.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

