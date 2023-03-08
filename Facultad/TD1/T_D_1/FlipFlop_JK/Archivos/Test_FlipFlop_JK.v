`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:29:20 09/08/2021
// Design Name:   FlipFlopJK
// Module Name:   X:/Users/DaniBrem/Desktop/ProgramasVerilog/FlipFlop_JK/Test_FlipFlop_JK.v
// Project Name:  FlipFlop_JK
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FlipFlopJK
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_FlipFlop_JK;

	// Inputs
	reg J;
	reg K;
	reg Ck;
	reg Reset;

	// Outputs
	wire Q;
	wire Qn;

	// Instantiate the Unit Under Test (UUT)
	FlipFlopJK uut (
		.J(J), 
		.K(K), 
		.Ck(Ck), 
		.Reset(Reset), 
		.Q(Q), 
		.Qn(Qn)
	);

//	initial begin
//		// Initialize Inputs
//		J = 0;
//		K = 0;
//		Ck = 0;
//		Reset = 0;
//
//		// Wait 100 ns for global reset to finish
//		#100;
			
	initial begin
		forever begin
		Ck<=0;
		#100;
		Ck<=1;
		#100;
		end
	end		
	
	initial begin
		Reset=1; J=1; K=0;
		#100;
		Reset=0; J=0; K=0; 
		#100;
		Reset=0; J=0; K=1;
		#100;
		Reset=0; J=1; K=0;
		#100;
		Reset=0; J=1; K=1;
		#100;		
	end
      
endmodule

