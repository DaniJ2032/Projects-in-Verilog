//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
//Date        : Thu Sep 22 09:04:03 2022
//Host        : daniel-lmint running 64-bit Linux Mint 20.3
//Command     : generate_target VIO.bd
//Design      : VIO
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "VIO,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=VIO,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "VIO.hwdef" *) 
module VIO
   (clk_0,
    probe_in0_0,
    probe_in1_0,
    probe_in2_0,
    probe_in3_0,
    probe_out0_0,
    probe_out1_0);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_0, CLK_DOMAIN VIO_clk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input clk_0;
  input [2:0]probe_in0_0;
  input [2:0]probe_in1_0;
  input [2:0]probe_in2_0;
  input [2:0]probe_in3_0;
  output [0:0]probe_out0_0;
  output [3:0]probe_out1_0;

  wire clk_0_1;
  wire [2:0]probe_in0_0_1;
  wire [2:0]probe_in1_0_1;
  wire [2:0]probe_in2_0_1;
  wire [2:0]probe_in3_0_1;
  wire [0:0]vio_0_probe_out0;
  wire [3:0]vio_0_probe_out1;

  assign clk_0_1 = clk_0;
  assign probe_in0_0_1 = probe_in0_0[2:0];
  assign probe_in1_0_1 = probe_in1_0[2:0];
  assign probe_in2_0_1 = probe_in2_0[2:0];
  assign probe_in3_0_1 = probe_in3_0[2:0];
  assign probe_out0_0[0] = vio_0_probe_out0;
  assign probe_out1_0[3:0] = vio_0_probe_out1;
  VIO_vio_0_0 vio_0
       (.clk(clk_0_1),
        .probe_in0(probe_in0_0_1),
        .probe_in1(probe_in1_0_1),
        .probe_in2(probe_in2_0_1),
        .probe_in3(probe_in3_0_1),
        .probe_out0(vio_0_probe_out0),
        .probe_out1(vio_0_probe_out1));
endmodule
