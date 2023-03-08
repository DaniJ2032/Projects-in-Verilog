`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:33:20 11/18/2021 
// Design Name: 
// Module Name:    Contadores 
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
module contadores(clk_in, clk_out);
	input clk_in; //clock de entrada --> en la sasori es de 4Mhz
	output clk_out; //Salida del clock generada por un divisor

/*Declaracion de los registros*/	
reg[18:0] counter = 18'd0; 

parameter Divisor = 18'd66666; //Para clk_out --> 60HZ

	always @(posedge clk_in)
		begin
		counter <= counter + 28'd1; //incrementa el contador
		if(counter >= (Divisor-1)/*66666*/) //cuando counter sea mayor al Divisor
			counter <= 28'd0;       //reseteamos el contador
		end
		assign clk_out = (counter<Divisor/2)?1'b0:1'b1; //pregunta si el valor de counter es menor al valor de Divisor/2
endmodule															//si no lo es sigue en uno si lo es asigna un cero





