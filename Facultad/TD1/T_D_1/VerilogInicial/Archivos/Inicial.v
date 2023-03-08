`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:18:58 06/02/2021 
// Design Name: 
// Module Name:    Inicial 
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
module Inicial(
    input A,
    input B,
    input C,
    output D,
    output E
    );

	wire wl = A&B;
	assign D=wl|~C;
	assign E=~C;
	
endmodule
