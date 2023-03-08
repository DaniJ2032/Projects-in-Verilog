`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:36:39 11/18/2021
// Design Name:   contadores
// Module Name:   X:/Users/DaniBrem/Desktop/ProgramasVerilog/Aux_Contador/Test_de_Contador.v
// Project Name:  Aux_Contador
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: contadores
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_de_Contador;

	// Inputs
	reg clk_in;

	// Outputs
	wire clk_out;

	// Instantiate the Unit Under Test (UUT)
	contadores uut (
		.clk_in(clk_in), 
		.clk_out(clk_out)
	);

	initial begin
		// Initialize Inputs
		forever begin
		clk_in = 0;
		#125;
		clk_in = 1;
		#125;
		end
	end
      
endmodule

