`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:48:26 06/27/2021
// Design Name:   Comparador
// Module Name:   Y:/Users/Juarez/Desktop/ProgramasVerilog/Comparador2Bits/PruebadeComparador.v
// Project Name:  Comparador2Bits
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Comparador
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PruebadeComparador;

	// Inputs
	reg A;
	reg B;
	reg C;
	reg D;

	// Outputs
	wire F1;
	wire F2;
	wire F3;

	// Instantiate the Unit Under Test (UUT)
	Comparador uut (
		.A(A), 
		.B(B), 
		.C(C), 
		.D(D), 
		.F1(F1), 
		.F2(F2), 
		.F3(F3)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		C = 0;
		D = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		A = 0;
		B = 0;
		C = 0;
		D = 1;		
		 #100;

		A = 0;
		B = 0;
		C = 1;
		D = 0;		
		 #100;

		A = 0;
		B = 0;
		C = 1;
		D = 1;		
		 #100;

		A = 0;
		B = 1;
		C = 0;
		D = 0;		
		 #100;		 

		A = 0;
		B = 1;
		C = 0;
		D = 1;		
		 #100;

		A = 0;
		B = 1;
		C = 1;
		D = 0;		
		 #100;

		A = 0;
		B = 1;
		C = 1;
		D = 1;		
		 #100;

		A = 1;
		B = 0;
		C = 0;
		D = 0;		
		 #100;
		 
		A = 1;
		B = 0;
		C = 0;
		D = 1;		
		 #100;

		A = 1;
		B = 0;
		C = 1;
		D = 0;		
		 #100;

		A = 1;
		B = 0;
		C = 1;
		D = 1;		
		 #100;

		A = 1;
		B = 1;
		C = 0;
		D = 0;		
		 #100;		 

		A = 1;
		B = 1;
		C = 0;
		D = 1;		
		 #100;

		A = 1;
		B = 1;
		C = 1;
		D = 0;		
		 #100;

		A = 1;
		B = 1;
		C = 1;
		D = 1;		
		 #100;
		 
	end
      
endmodule

