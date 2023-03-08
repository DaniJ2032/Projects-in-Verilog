`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//TP Final DE AULA MONTACARGAS CON MEJORAS INCLUIDAS
//
//MEJORAS IMPLEMENTADAS: 
//Multiplexado de display indicando piso hacia donde
//se direige el usuario y tambien un codigo SP indicando sobrepeso en el 
//montacargas;Se agrego un sensor de sobrepeso.
//AUTORES: Juarez Daniel,Hugo Cotos 		 
//FECHA: 02/12/2021
//CURSO: 3R4
//////////////////////////////////////////////////////////////////////////////////

/*Codificacion Visual para el Display reg Vis_x[2:0];
		000 --> Display off
		001 --> Display 1
		010 --> Dsiplay 2
		011 --> Dsiplay 3
		100 --> Display S
		101 --> Display P*/
	
/*Tabla de las salidas del motor reg Motor[1:0];
		|SALIDA FUNCION|
		|	00		Quieto|
 		|	01		Sube  |
		|	10    Baja  |
//////////////////////*/
		
/*Tabla de Numeros para el Display (Catodo Comun)
		Display_x <= 7'b0000110;  --> 1
		Display_x <= 7'b1011011;  --> 2
		Display_x <= 7'b1001111;  --> 3
		Display_x <= 7'b0000000;  --> 0
		Display_x <= 7'b1101101;  --> S
		Display_x <= 7'b1110011;  --> P
		*/
		
/*Tabla para los enables de los display
	on = 2'b10 --> Display derecha prendido
	on = 2'b01 --> Display Izquierda prendido
	Nota: Se uso Display catodo comun se activan por bajo
/////////////////////////////////////////////*/		

/*Declaracion del Modulo*/		
module Monta_Carga_Prueba(
	 input clk, //4mhz dados en la placa CPLD Sasori 1
	 input clk_2, //60hz generador externo de baja frec para el mux de los display
    input reset,
	 //pulsadores de entrada
    input P1,
    input P2,
    input P3,
	 //fines de carrera y sensores
    input FC1,
    input FC2,
    input FC3,
	 input SP,
	 //salidas del motor
	 output reg [1:0] motor = 2'b00,
	 //salidas del display 
	 output reg [1:0] on, //Patas de habilitacion para el display
	 output reg[6:0] Master_Display //Slida de Display
	 );//fin

/*Declaracion de parametros de nuesta maquina de estados*/
   parameter piso1 = 	 3'b000;
   parameter sube2 = 	 3'b001;
   parameter piso2 = 	 3'b010;
   parameter baja1 = 	 3'b011;
   parameter piso3 = 	 3'b100;
   parameter sube3 = 	 3'b101;
   parameter baja2 = 	 3'b110;
	parameter sobrepeso = 3'b111;


/*Declaracion de los registros para los estados*/
	reg [2:0] state;
	reg [2:0] Vis_0; //para los Display
	reg [2:0] Vis_1;
	reg [6:0] Display_0 = 7'b0000000;
	reg [6:0] Display_1 = 7'b0000000;
	
	always@(posedge clk)
//Reset en la placa sasori posee una logica negada cuando se lo pulsa se pone en cero	
		if (!reset)begin //Reset del sistema
			state <= piso1;
			motor <= 2'b00;
			Vis_0 = 3'b001;
			Vis_1 = 3'b000;
		end	
		
		else
		case (state) //Inicio de la maquina de estado	
			/*Desde Piso 1*/
			piso1:
				begin
				if(SP) state <= sobrepeso; //Sensor de Sobre peso
				else if(P2) //para ir al piso 2
				begin
					state <= sube2;
					motor <= 2'b00; //prox estado sera el motor subiendo
					Vis_0 = 3'b001;
					Vis_1 = 3'b000;
				end
				else if(P3) //para ir al piso 3
				begin
					state <= sube3;
					motor <= 2'b00;
					Vis_0 = 3'b001;
					Vis_1 = 3'b000;
				end			
				else begin
					motor <= 2'b00;
					Vis_0 = 3'b001;
					Vis_1 = 3'b000;
				end			
			end
			
			/*Transicion al Piso 2*/
			sube2:
			begin
				if (FC2)
				begin
					state <= piso2;
					motor <= 2'b01;
					Vis_0 = 3'b000;
					Vis_1 = 3'b010; //2do Display muestra a que piso nos dirigimos	
				end				
				else begin
					motor <= 2'b01;
					Vis_0 = 3'b000;
					Vis_1 = 3'b010;	
				end	
			end		
			
			/*Desde Piso 2*/
			piso2:
				begin
				if(SP) state <= sobrepeso;
				else if(P1)
				begin
					state <=baja1;
					motor <= 2'b00; //Inidica que el motor esta bajando 
					Vis_0 = 3'b010;
					Vis_1 = 3'b000;			
				end
				else if(P3)
				begin
					state <= sube3;
					motor <= 2'b00;
					Vis_0 = 3'b010;
					Vis_1 = 3'b000;		
				end			
				else begin
					motor <= 2'b00;
					Vis_0 = 3'b010;
					Vis_1 = 3'b000;						
				end			
			end
			
			/*Transicion al piso3*/
			sube3: 
			begin
				if (FC3)
				begin
					state <= piso3;
					motor <= 2'b01;
					Vis_0 = 3'b000;
					Vis_1 = 3'b011;			
				end	
				else begin 
					motor <= 2'b01;
					Vis_0 = 3'b000;
					Vis_1 = 3'b011;		
				end	
			end
						
			/*Desde el Piso 3*/
			piso3:
				begin
				if(SP) state <= sobrepeso;
				else if(P2)
				begin
					state <= baja2;
					motor <= 2'b00; 
					Vis_0 = 3'b011;
					Vis_1 = 3'b000;			
				end
				else if(P1)
				begin
					state <= baja1;
					motor <= 2'b00;
					Vis_0 = 3'b011;
					Vis_1 = 3'b000;		
				end			
				else begin
					motor <= 2'b00;
					Vis_0 = 3'b011;
					Vis_1 = 3'b000;								
				end			
			end
			
			/*Transicion de bajada al piso2*/
			baja2: 
			begin
				if(FC2)
				begin
					state <= piso2;
					motor <= 2'b10;
					Vis_0 = 3'b000;
					Vis_1 = 3'b010;			
				end
				else begin 
					motor <= 2'b10;
					Vis_0 = 3'b000;
					Vis_1 = 3'b010;				
				end	
			end
			
			/*Transicion de bajada al piso 1*/
			baja1: 
			begin
				if(FC1)
				begin
					state <= piso1;
					motor <= 2'b10;
					Vis_0 = 3'b000;
					Vis_1 = 3'b001;	
				end		
				else begin 
					motor <= 2'b10;
					Vis_0 = 3'b000;
					Vis_1 = 3'b001;		
				end	
			end
			
			/*Transicion de Sobrepeso*/
			sobrepeso:	
			begin
				if(FC1&&SP)begin //SP en Piso 1
					motor <= 2'b00;
					Vis_0 = 3'b101; //P
					Vis_1 = 3'b100; //S
				end
				else if(FC1) state <= piso1;
				
				else if(FC2&&SP)begin //SP en Piso 2
					motor <= 2'b00;
					Vis_0 = 3'b101;
					Vis_1 = 3'b100; 
				end
				else if(FC2) state <= piso2;
				
				else if(FC3&&SP)begin //SP en Piso 3
					motor <= 2'b00;
					Vis_0 = 3'b101;
					Vis_1 = 3'b100; 
				end
				else if(FC3) state <= piso3;				
			end
			
			default: state <= piso1;
		endcase//fin de case principal
		
	      /*Sensibilidad para el Display*/
			always @(Vis_0, Vis_1)begin //Matriz de salida para el Display
			
			/*se tomo el segmento (g) como MSB y el (a) como LSB en los display*/
				case(Vis_1)
					3'b000:  Display_1 = 7'b0000000; //--> off
					3'b001:  Display_1 = 7'b0000110; //--> 1
					3'b010:  Display_1 = 7'b1011011; //--> 2 //catodo comun
					3'b011:  Display_1 = 7'b1001111; //--> 3
					3'b100:  Display_1 = 7'b1101101; //--> S
					default: Display_1 = 7'b0000000;
				endcase //fin del 1er case					
				case(Vis_0) 
					3'b000:  Display_0 = 7'b0000000; //--> off
					3'b001:  Display_0 = 7'b0000110; //--> 1
					3'b010:  Display_0 = 7'b1011011; //--> 2 //catodo comun
					3'b011:  Display_0 = 7'b1001111; //--> 3
					3'b101:  Display_0 = 7'b1110011; //--> P					
					default: Display_0 = 7'b0000000;
				endcase //fin del 2do case			
			end
			
		always @(posedge clk_2) //60HZ --> 16.6ms de barrido 
		begin
			if(on == 2'b10) //prende el display de la derecha
			begin
				on = 2'b01;
				Master_Display = Display_0; //asignamos la señal de salida 
			end									//para un diplay
				else
				begin
					on = 2'b10;
					//on = 2'b01;		//prendemos el Display de la izquierda
					Master_Display = Display_1; //Asignamos la señal a nuestro otro display
				end	
		end
		
endmodule //fin del modulo
