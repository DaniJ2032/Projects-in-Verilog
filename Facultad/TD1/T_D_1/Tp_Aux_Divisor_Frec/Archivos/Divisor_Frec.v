`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:52:18 11/18/2021 
// Design Name: 
// Module Name:    Divisor_Frec 
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
module Divisor_Frec(
    input clk_intput,
    output reg clk_output
    );
	 
parameter frec_in = 50000000; //50Mhz de entrada
//parameter frec_out = 25000000; 
parameter DIVISOR = 26'd2;
parameter max_cont = frec_in/2; //maximo valor del contador



reg[26:0] count; //contador de flancos

	initial begin
		count = 26'd0;
		clk_output = 0;
	end	

	always@(posedge clk_intput) begin
	
		if(count == (max_cont))begin //comparamos con el valor maximo
	
			clk_output = ~clk_output; //cambia el estado del reloj de salida 
			count = 26'd0; //se resetea el contador	
		end
		else count = count+1;
		
	end	
endmodule
