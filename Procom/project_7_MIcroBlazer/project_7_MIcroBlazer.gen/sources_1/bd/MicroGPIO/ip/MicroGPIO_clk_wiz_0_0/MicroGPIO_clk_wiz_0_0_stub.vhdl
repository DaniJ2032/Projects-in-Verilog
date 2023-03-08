-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
-- Date        : Thu Sep 22 08:58:26 2022
-- Host        : daniel-lmint running 64-bit Linux Mint 20.3
-- Command     : write_vhdl -force -mode synth_stub
--               /home/danielito/Escritorio/Vivado_proyect/project_7_MIcroBlazer/project_7_MIcroBlazer.gen/sources_1/bd/MicroGPIO/ip/MicroGPIO_clk_wiz_0_0/MicroGPIO_clk_wiz_0_0_stub.vhdl
-- Design      : MicroGPIO_clk_wiz_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35ticsg324-1L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MicroGPIO_clk_wiz_0_0 is
  Port ( 
    clk_out1 : out STD_LOGIC;
    resetn : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end MicroGPIO_clk_wiz_0_0;

architecture stub of MicroGPIO_clk_wiz_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1,resetn,locked,clk_in1";
begin
end;
