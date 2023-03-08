// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Thu Sep 22 08:58:26 2022
// Host        : daniel-lmint running 64-bit Linux Mint 20.3
// Command     : write_verilog -force -mode synth_stub
//               /home/danielito/Escritorio/Vivado_proyect/project_7_MIcroBlazer/project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ip/MicroGPIO_clk_wiz_0_0/MicroGPIO_clk_wiz_0_0_stub.v
// Design      : MicroGPIO_clk_wiz_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module MicroGPIO_clk_wiz_0_0(clk_out1, resetn, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_out1,resetn,locked,clk_in1" */;
  output clk_out1;
  input resetn;
  output locked;
  input clk_in1;
endmodule
