`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:39:59 11/06/2021
// Design Name:   Maquina_de_Estado
// Module Name:   X:/Users/DaniBrem/Desktop/ProgramasVerilog/Maquina_de_Estado_5_29/Test_Maquina.v
// Project Name:  Maquina_de_Estado_5_29
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Maquina_de_Estado
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_Maquina;

	// Inputs
	reg x_in;
	reg clk;
	reg reset;

	// Outputs
	wire [1:0] y_out;

	// Instantiate the Unit Under Test (UUT)
	Maquina_de_Estado uut (
		.x_in(x_in), 
		.clk(clk), 
		.reset(reset), 
		.y_out(y_out)
	);

	initial begin
		// Initialize Inputs
		x_in = 0;
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

