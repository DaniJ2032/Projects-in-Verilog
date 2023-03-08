`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//TP4 DE AULA MONTACARGAS
//DESCRIPCION DE UNA MAQUINA DE ESTADO DEL FUNCIONAMIENTO DE UN MONTACARGA DE 3 PISOS
//AUTORES: Juarez Daniel,Hugo Cotos 		 
//FECHA: 17/11/2021
//////////////////////////////////////////////////////////////////////////////////

/*Codificacion Visual para el Display reg Visual[2:0];
		00 --> Display off
		01 --> Display 1
		10 --> Dsiplay 2
		11 --> Dsiplay 3*/
	
/*Tabla de las salidas del motor reg Motor[1:0];
		|SALIDA FUNCION|
		|	00		Quieto|
 		|	01		Sube  |
		|	10    Baja  |
		////////////////*/
		
/*Tabla de Numeros para el Display
		Display <= 7'b0000110;  --> 1
		Display <= 7'b1011011;  --> 2
		Display <= 7'b1001111;  --> 3
		Display <= 7'b0000000;  --> 0*/


module Monta_Carga_Prueba(
    input clk, //4MHZ en la pata P43 de la Sasori
    input reset,
	 //pulsadores de entrada
    input P1,
    input P2,
    input P3,
	 //fines de carrera
    input FC1,
    input FC2,
    input FC3,
	 //salidas del motor
    output S0,
    output S1,
	 //salidas del display
	 output enable, // pata enable para el display   
	 output reg[6:0] Display //Slida de Display
    );

   parameter piso1 = 3'b000;
   parameter sube2 = 3'b001;
   parameter piso2 = 3'b010;
   parameter baja1 = 3'b011;
   parameter piso3 = 3'b100;
   parameter sube3 = 3'b101;
   parameter baja2 = 3'b110;

	//Declaracion de los registros de estados
	reg [2:0] state;
	reg [1:0] motor = 2'b00;
	reg [1:0] Visual = 2'b00;
	reg [0:0] On = 1'b0;

//Asignacion de la salida en funcion del estado		
	assign S0 = motor[0];
	assign S1 = motor[1];
	assign enable = On[0];
	
	always@(posedge clk, negedge reset)
	
		if (!reset) begin
			state <= piso1;
			motor <= 2'b00;	
			Visual = 2'b01; //inicio indicando que estoy en piso 1
			On <= 1'b0;
		end
      else	
		case (state) //Inicio de la maquina de estado	
			/*Desde PISO1*/
			piso1:
				begin
				
				if(P2)
				begin
					state <= sube2;
					motor <= 2'b01;
					Visual = 2'b01;
					On <= 1'b1;	
				end
				else if(P3)
				begin
					state <= sube3;
					motor <= 2'b01;
					Visual = 2'b01;
					On <= 1'b1;
				end			
				else begin
					motor <= 2'b00;
					Visual = 2'b01;
					On <= 1'b1;					
				end			
			end
			
			/*Transicion al Piso 2*/
			sube2:
			begin
				if (FC2)
				begin
					state <= piso2;
					motor <= 2'b00;
					Visual = 2'b00;
					On <= 1'b0;
				end				
				else begin
					motor <= 2'b01;
					Visual = 2'b00;
					On <= 1'b0;	
				end	
			end		
			
			/*Desde Piso 2*/
			piso2: 
			begin
				if(P3)
				begin
					state <= sube3;
					motor <= 2'b01;
					Visual = 2'b10;
					On <= 1'b1;	
				end
				else if(P1)
				begin
					state <= baja1;
					motor <= 2'b10;
					Visual = 2'b10;
					On <= 1'b1;
				end	
				else begin 
					motor <= 2'b00;	
					Visual = 2'b10;
					On <= 1'b1;
				end				
			end	
			
			/*Transicion de bajada a piso1*/
			baja1: 
			begin
				if(FC1)
				begin
					state <= piso1;
					motor <= 2'b00;
					Visual = 2'b00;
					On <= 1'b0;
				end		
				else begin 
					motor <= 2'b10;
					Visual = 2'b00;
					On <= 1'b0;
				end	
			end	
			
			/*Desde el Piso 3*/
			piso3: 
			begin
				if(P2)
				begin
					state <= baja2;
					motor <= 2'b10;
					Visual = 2'b11;
					On <= 1'b1;
				end	
				else if(P1)
				begin
					state <= baja1;
					motor <= 2'b10;
					Visual = 2'b11;
					On <= 1'b1;
				end	
				else begin 
					motor <= 2'b00;
					Visual = 2'b11;
					On <= 1'b1;
				end	
			end	
			
			/*Transicion de subida al piso3*/
			sube3: 
			begin
				if (FC3)
				begin
					state <= piso3;
					motor <= 2'b00;
					Visual = 2'b00;
					On <= 1'b0;
				end	
				else begin 
					motor <= 2'b01;
					Visual = 2'b00;
					On <= 1'b0;
				end	
			end			
			/*Transicion de bajada al piso2*/
			baja2: 
			begin
				if(FC2)
				begin
					state <= piso2;
					motor <= 2'b00;
					Visual = 2'b00;
					On <= 1'b0;
				end
				else begin 
					motor <= 2'b10;
					Visual = 2'b00;
					On <= 1'b0;
				end	
			end			
			default: state <= piso1;
		endcase
		
	      /*Sencibilidad para el Display*/
			always @(Visual) //Matriz de salida para el Display
		begin
			case(Visual)
				2'b00: Display = 7'b0000000; //--> off
				2'b01: Display = 7'b0000110; //--> 1
				2'b10: Display = 7'b1011011; //--> 2 //catodo comun
				2'b11: Display = 7'b1001111; //--> 3
				
			endcase //fin del case
		end	
endmodule //fin del modulo
