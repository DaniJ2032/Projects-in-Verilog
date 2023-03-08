`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:39:32 06/02/2021
// Design Name:   Inicial
// Module Name:   Y:/Users/Juarez/Desktop/ProgramasVerilog/VerilogInicial/Test_de_Inicial.v
// Project Name:  VerilogInicial
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Inicial
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_de_Inicial;

	// Inputs
	reg A;
	reg B;
	reg C;

	// Outputs
	wire D;
	wire E;

	// Instantiate the Unit Under Test (UUT)
	Inicial uut (
		.A(A), 
		.B(B), 
		.C(C), 
		.D(D), 
		.E(E)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		C = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		A = 0;
		B = 0;
		C = 1;
		#100;
		
		A = 0;
		B = 1;
		C = 0;
		#100;
		
		A = 0;
		B = 1;
		C = 1;
		#100;
		
		A = 1;
		B = 0;
		C = 0;
		#100;
		
		A = 1;
		B = 0;
		C = 1;
		#100;
		
		A = 1;
		B = 1;
		C = 0;
		#100;
		
		A = 1;
		B = 1;
		C = 1;
		#100;		
	end
      
endmodule

