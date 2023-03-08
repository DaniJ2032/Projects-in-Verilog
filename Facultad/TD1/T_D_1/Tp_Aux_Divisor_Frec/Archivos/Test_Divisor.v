`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:09:08 11/19/2021
// Design Name:   Divisor_Frec
// Module Name:   X:/Users/DaniBrem/Desktop/ProgramasVerilog/Tp_Aux_Divisor_Frec/Test_Divisor.v
// Project Name:  Tp_Aux_Divisor_Frec
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Divisor_Frec
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_Divisor;

	// Inputs
	reg clk_intput;

	// Outputs
	wire clk_output;

	// Instantiate the Unit Under Test (UUT)
	Divisor_Frec uut (
		.clk_intput(clk_intput), 
		.clk_output(clk_output)
	);

	initial begin
	//
		forever begin 
			clk_intput = 0;
			#10;
			clk_intput = 1;
			#10;
		end

	end     
endmodule

