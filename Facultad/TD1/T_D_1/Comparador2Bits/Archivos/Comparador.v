`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:46:58 06/27/2021 
// Design Name: 
// Module Name:    Comparador 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Comparador(
    input A, //A0
    input B, //A1
    input C, //B0
    input D, //B1
    output F1, //A<B
    output F2, //A=B
    output F3 //A>B
    );
	
///////Salida para A<B	
	wire wl_and1 = ~B&D;
	wire wl_or1 = ~A|C;
	wire wl_and2 = ~A|C;
	wire wl_and3 = wl_and1&wl_or1;
	wire wl_or2 = wl_and3|wl_and2;
	assign F1 = wl_or2;
/////////////////////

//////Salida para A = B 
	wire wl_xnor1 = ~A^~C;
	wire wl_xnor2 = ~B^~D;
	wire wl_and4 = wl_xnor1&wl_xnor2;
	assign F2 = wl_and4;
/////////////////////////

/////////////Salida A>B
	assign F3 = ~wl_or2|~wl_and4;
///////////////////////

endmodule
