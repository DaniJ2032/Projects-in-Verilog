-makelib ies_lib/xpm -sv \
  "/tools/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/tools/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "/tools/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/MicroGPIO/ip/MicroGPIO_clk_wiz_0_0/MicroGPIO_clk_wiz_0_0_clk_wiz.v" \
  "../../../bd/MicroGPIO/ip/MicroGPIO_clk_wiz_0_0/MicroGPIO_clk_wiz_0_0.v" \
  "../../../bd/MicroGPIO/sim/MicroGPIO.v" \
-endlib
-makelib ies_lib/microblaze_v11_0_4 \
  "../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/9285/hdl/microblaze_v11_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/MicroGPIO/ip/MicroGPIO_microblaze_0_1/sim/MicroGPIO_microblaze_0_1.vhd" \
-endlib
-makelib ies_lib/lmb_v10_v3_0_11 \
  "../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/c2ed/hdl/lmb_v10_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/MicroGPIO/ip/MicroGPIO_dlmb_v10_1/sim/MicroGPIO_dlmb_v10_1.vhd" \
  "../../../bd/MicroGPIO/ip/MicroGPIO_ilmb_v10_1/sim/MicroGPIO_ilmb_v10_1.vhd" \
-endlib
-makelib ies_lib/lmb_bram_if_cntlr_v4_0_19 \
  "../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/0b98/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/MicroGPIO/ip/MicroGPIO_dlmb_bram_if_cntlr_1/sim/MicroGPIO_dlmb_bram_if_cntlr_1.vhd" \
  "../../../bd/MicroGPIO/ip/MicroGPIO_ilmb_bram_if_cntlr_1/sim/MicroGPIO_ilmb_bram_if_cntlr_1.vhd" \
-endlib
-makelib ies_lib/blk_mem_gen_v8_4_4 \
  "../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/MicroGPIO/ip/MicroGPIO_lmb_bram_1/sim/MicroGPIO_lmb_bram_1.v" \
-endlib
-makelib ies_lib/axi_lite_ipif_v3_0_4 \
  "../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/mdm_v3_2_19 \
  "../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/8715/hdl/mdm_v3_2_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/MicroGPIO/ip/MicroGPIO_mdm_1_1/sim/MicroGPIO_mdm_1_1.vhd" \
-endlib
-makelib ies_lib/lib_cdc_v1_0_2 \
  "../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib ies_lib/proc_sys_reset_v5_0_13 \
  "../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/MicroGPIO/ip/MicroGPIO_rst_clk_wiz_0_100M_1/sim/MicroGPIO_rst_clk_wiz_0_100M_1.vhd" \
-endlib
-makelib ies_lib/lib_pkg_v1_0_2 \
  "../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \
-endlib
-makelib ies_lib/lib_srl_fifo_v1_0_2 \
  "../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \
-endlib
-makelib ies_lib/axi_uartlite_v2_0_26 \
  "../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/5edb/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/MicroGPIO/ip/MicroGPIO_axi_uartlite_0_3/sim/MicroGPIO_axi_uartlite_0_3.vhd" \
-endlib
-makelib ies_lib/generic_baseblocks_v2_1_0 \
  "../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_infrastructure_v1_1_0 \
  "../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_register_slice_v2_1_22 \
  "../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/af2c/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_5 \
  "../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_5 \
  "../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_5 \
  "../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib ies_lib/axi_data_fifo_v2_1_21 \
  "../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/54c0/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_crossbar_v2_1_23 \
  "../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/bc0a/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/MicroGPIO/ip/MicroGPIO_xbar_1/sim/MicroGPIO_xbar_1.v" \
-endlib
-makelib ies_lib/interrupt_control_v3_1_4 \
  "../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \
-endlib
-makelib ies_lib/axi_gpio_v2_0_24 \
  "../../../../project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ipshared/4318/hdl/axi_gpio_v2_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/MicroGPIO/ip/MicroGPIO_axi_gpio_0_3/sim/MicroGPIO_axi_gpio_0_3.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

