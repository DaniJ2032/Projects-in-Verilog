vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../project_7_MIcroBlazer.gen/sources_1/bd/VIO/ipshared/1b7e/hdl/verilog" "+incdir+../../../../project_7_MIcroBlazer.gen/sources_1/bd/VIO/ipshared/122e/hdl/verilog" "+incdir+../../../../project_7_MIcroBlazer.gen/sources_1/bd/VIO/ipshared/46fd/hdl" \
"../../../bd/VIO/ip/VIO_vio_0_0/sim/VIO_vio_0_0.v" \
"../../../bd/VIO/sim/VIO.v" \


vlog -work xil_defaultlib \
"glbl.v"

