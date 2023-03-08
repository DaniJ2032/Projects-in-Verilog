vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../project_7_MIcroBlazer.gen/sources_1/bd/VIO/ipshared/1b7e/hdl/verilog" "+incdir+../../../../project_7_MIcroBlazer.gen/sources_1/bd/VIO/ipshared/122e/hdl/verilog" "+incdir+../../../../project_7_MIcroBlazer.gen/sources_1/bd/VIO/ipshared/46fd/hdl" \
"../../../bd/VIO/ip/VIO_vio_0_0/sim/VIO_vio_0_0.v" \
"../../../bd/VIO/sim/VIO.v" \


vlog -work xil_defaultlib \
"glbl.v"

