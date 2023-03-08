`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:09:58 11/10/2021
// Design Name:   Display_7_Seg
// Module Name:   X:/Users/DaniBrem/Desktop/ProgramasVerilog/Display_7_Seg/Test_Display.v
// Project Name:  Display_7_Seg
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Display_7_Seg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_Display;

	// Inputs
	reg [0:3] Entradas;
	reg [0:1] LT_BI;
	reg LE;

	// Outputs
	wire [0:6] Salida;

	// Instantiate the Unit Under Test (UUT)
	Display_7_Seg uut (
		.Entradas(Entradas), 
		.LT_BI(LT_BI), 
		.LE(LE), 
		.Salida(Salida)
	);

	initial begin
		// Initialize Inputs
		Entradas = 0;
		LT_BI = 0;
		LE = 0;

		// Wait 100 ns for global reset to finish
			#50;
      	Entradas = 4'b0000;
			LT_BI = 2'b00;
			LE = 0;
			#50;
      	Entradas = 4'b0000;
			LT_BI = 2'b10;
			LE = 0;
			#50;
      	Entradas = 4'b0000;
			LT_BI = 2'b11;
			LE = 0;
			#50;
      	Entradas = 4'b0001;
			LT_BI = 2'b11;
			LE = 0;
			#50;
      	Entradas = 4'b0010;
			LT_BI = 2'b11;
			LE = 0;
			#50;
      	Entradas = 4'b0011;
			LT_BI = 2'b11;
			LE = 0;
			#50;
			
     		Entradas = 4'b0100;
			LT_BI = 2'b11;
			LE = 0;
			#50;
      	Entradas = 4'b0101;
			LT_BI = 2'b11;
			LE = 0;
			#50;
      	Entradas = 4'b0110;
			LT_BI = 2'b11;
			LE = 0;
			#50;
      	Entradas = 4'b0111;
			LT_BI = 2'b11;
			LE = 0;
			#50;
     		Entradas = 4'b1000;
			LT_BI = 2'b11;
			LE = 0;
			#50;
      	Entradas = 4'b1001;
			LT_BI = 2'b11;
			LE = 0;
			#50;
		end
      
endmodule


