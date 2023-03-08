-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
-- Date        : Thu Sep 22 09:04:34 2022
-- Host        : daniel-lmint running 64-bit Linux Mint 20.3
-- Command     : write_vhdl -force -mode synth_stub
--               /home/danielito/Escritorio/Vivado_proyect/project_7_MIcroBlazer/project_7_MIcroBlazer.gen/sources_1/bd/VIO/ip/VIO_vio_0_0/VIO_vio_0_0_stub.vhdl
-- Design      : VIO_vio_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35ticsg324-1L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VIO_vio_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    probe_in0 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    probe_in1 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    probe_in2 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    probe_in3 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    probe_out0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out1 : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );

end VIO_vio_0_0;

architecture stub of VIO_vio_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe_in0[2:0],probe_in1[2:0],probe_in2[2:0],probe_in3[2:0],probe_out0[0:0],probe_out1[3:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "vio,Vivado 2020.2";
begin
end;
