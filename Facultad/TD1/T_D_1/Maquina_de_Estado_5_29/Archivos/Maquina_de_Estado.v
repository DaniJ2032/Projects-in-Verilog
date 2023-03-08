`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:47:26 11/06/2021 
// Design Name: 
// Module Name:    Maquina_de_Estado 
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
module Maquina_de_Estado(
	input x_in, clk, reset,
	output[1:0] y_out
    );
	 
//Definimos los Estados
parameter S0 = 2'b00;
parameter S1 = 2'b01;  //codificacion de los estados 
parameter S2 = 2'b10;
parameter S3 = 2'b11;

reg[1:0] estado; //en este vector de registros reg asignaremos los parametros
					  //las variables de reg deben tener el mismo ancho que los parameter

always@(posedge clk, negedge reset)

	if(reset == 0) estado <=S0; //Inicio en el estado S0

	else	
		
		case(estado)
			S0: if(x_in) estado <= S0;
				 else estado <= S1;
				 
			S1: if(x_in) estado <= S2;
				 else estado <= S3;

			S2: if(x_in) estado <= S2;
				 else estado <= S3;
				 
			S3: if(x_in) estado <= S3;
				 else estado <= S0;
			endcase
	assign y_out = estado; //Salida de los FF
		
endmodule




