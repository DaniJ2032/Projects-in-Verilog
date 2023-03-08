//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
//Date        : Thu Sep 22 09:04:03 2022
//Host        : daniel-lmint running 64-bit Linux Mint 20.3
//Command     : generate_target VIO_wrapper.bd
//Design      : VIO_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module VIO_wrapper
   (clk_0,
    probe_in0_0,
    probe_in1_0,
    probe_in2_0,
    probe_in3_0,
    probe_out0_0,
    probe_out1_0);
  input clk_0;
  input [2:0]probe_in0_0;
  input [2:0]probe_in1_0;
  input [2:0]probe_in2_0;
  input [2:0]probe_in3_0;
  output [0:0]probe_out0_0;
  output [3:0]probe_out1_0;

  wire clk_0;
  wire [2:0]probe_in0_0;
  wire [2:0]probe_in1_0;
  wire [2:0]probe_in2_0;
  wire [2:0]probe_in3_0;
  wire [0:0]probe_out0_0;
  wire [3:0]probe_out1_0;

  VIO VIO_i
       (.clk_0(clk_0),
        .probe_in0_0(probe_in0_0),
        .probe_in1_0(probe_in1_0),
        .probe_in2_0(probe_in2_0),
        .probe_in3_0(probe_in3_0),
        .probe_out0_0(probe_out0_0),
        .probe_out1_0(probe_out1_0));
endmodule
