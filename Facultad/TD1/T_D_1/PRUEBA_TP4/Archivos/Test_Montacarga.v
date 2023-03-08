`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:29:09 11/17/2021
// Design Name:   Monta_Carga_Prueba
// Module Name:   X:/Users/DaniBrem/Desktop/ProgramasVerilog/PRUEBA_TP4/Test_Montacarga.v
// Project Name:  PRUEBA_TP4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Monta_Carga_Prueba
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_Montacarga;

	// Inputs
	reg clk;
	reg reset;
	reg P1;
	reg P2;
	reg P3;
	reg FC1;
	reg FC2;
	reg FC3;

	// Outputs
	wire S0;
	wire S1;
	wire [6:0] Display;
	wire enable;

	// Instantiate the Unit Under Test (UUT)
	Monta_Carga_Prueba uut (
		.clk(clk), 
		.reset(reset), 
		.P1(P1), 
		.P2(P2), 
		.P3(P3), 
		.FC1(FC1), 
		.FC2(FC2), 
		.FC3(FC3), 
		.S0(S0), 
		.S1(S1), 
		.Display(Display),
		.enable(enable)
	);
	
initial begin
		forever begin
		clk <=0;
		#20;
		clk <=1;
		#20;
		end
	end	

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		P1 = 0;
		P2 = 0;
		P3 = 0;
		FC1 = 0;
		FC2 = 0;
		FC3 = 0;
		#100;
  
/////Transicion del piso 2

		reset = 0;
		P1 = 	0;
		P2 = 	1;
		P3 = 	0;  //Escojo piso2
		FC1 = 0;
		FC2 = 0;
		FC3 = 0;		  
		#100;

		P1 = 	0;
		P2 = 	0;
		P3 = 	0;
		FC1 = 0;  //subiendo al piso2
		FC2 = 0;
		FC3 = 0;		  
		#100;
		
		P1 = 	0;
		P2 = 	0;
		P3 = 	0;
		FC1 = 0;  //llegamos al piso2
		FC2 = 1;
		FC3 = 0;		  
		#100;
///////////////////////

///////Transicion al Piso 3

		P1 = 	0;
		P2 = 	0;
		P3 = 	1;  //Escojo piso3
		FC1 = 0;
		FC2 = 0;
		FC3 = 0;		  
		#100;

		P1 = 	0;
		P2 = 	0;
		P3 = 	0;
		FC1 = 0;  //subiendo al piso3
		FC2 = 0;
		FC3 = 0;		  
		#100;
		
		P1 = 	0;
		P2 = 	0;
		P3 = 	0;
		FC1 = 0;  //llegamos al piso3
		FC2 = 0;
		FC3 = 1;		  
		#100;
///////////////////////////////////

////Transicion de bajada al Piso 2

		P1 = 	0;
		P2 = 	1;
		P3 = 	0;  //Escojo piso2
		FC1 = 0;
		FC2 = 0;
		FC3 = 0;		  
		#100;
		
		P1 = 	0;
		P2 = 	0;
		P3 = 	0;
		FC1 = 0;  //bajando al piso2
		FC2 = 0;
		FC3 = 0;		  
		#100;
		
		P1 = 	0;
		P2 = 	0;
		P3 = 	0;
		FC1 = 0;  //llegamos al piso2
		FC2 = 1;
		FC3 = 0;		  
		#100;

////Transicion de bajada al Piso 1

		P1 = 	1;
		P2 = 	0;
		P3 = 	0;  //Escojo piso1
		FC1 = 0;
		FC2 = 0;
		FC3 = 0;		  
		#100;
		
		P1 = 	0;
		P2 = 	0;
		P3 = 	0;
		FC1 = 0;  //bajando al piso1
		FC2 = 0;
		FC3 = 0;		  
		#100;
		
		P1 = 	0;
		P2 = 	0;
		P3 = 	0;
		FC1 = 1;  //llegamos al piso1
		FC2 = 0;
		FC3 = 0;		  
		#100;

	end    
endmodule



