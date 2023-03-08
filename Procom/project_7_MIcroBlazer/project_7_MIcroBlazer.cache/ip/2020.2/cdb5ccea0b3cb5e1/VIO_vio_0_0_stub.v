// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Thu Sep 22 09:04:33 2022
// Host        : daniel-lmint running 64-bit Linux Mint 20.3
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ VIO_vio_0_0_stub.v
// Design      : VIO_vio_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "vio,Vivado 2020.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, probe_in0, probe_in1, probe_in2, probe_in3, 
  probe_out0, probe_out1)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_in0[2:0],probe_in1[2:0],probe_in2[2:0],probe_in3[2:0],probe_out0[0:0],probe_out1[3:0]" */;
  input clk;
  input [2:0]probe_in0;
  input [2:0]probe_in1;
  input [2:0]probe_in2;
  input [2:0]probe_in3;
  output [0:0]probe_out0;
  output [3:0]probe_out1;
endmodule
