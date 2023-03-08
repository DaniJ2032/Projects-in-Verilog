`timescale 1ns / 1ps

/*Codificacion Disual para el Display reg Disual[2:0];
		00 --> Display off
		01 --> Display 1
		10 --> Dsiplay 2
		11 --> Dsiplay 3*/
	
/*Tabla de las salidas del motores reg motores[1:0];
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


module Montacargas(
	 input clk,
	 //input clk_out,
    input reset,
	 //pulsadores de entrada
    input P1,
    input P2,
    input P3,
	 input P4,
	 //fines de carrera
    input FC1,
    input FC2,
    input FC3,
	 input FC4,
	 input SP,
	 //salidas del motores
    //output S0,
    //output S1,
	 output reg [1:0] motores = 2'b00,
	 //salidas del display
	 //output enable, // pata enable para el display   
	 output reg [3:0] on,
	 output reg[6:0] Super_Display //Slida de Display
	 );

   parameter piso1 = 4'b0000;
   parameter sube2 = 4'b0001;
   parameter piso2 = 4'b0010;
   parameter baja1 = 4'b0011;
   parameter piso3 = 4'b0100;
   parameter sube3 = 4'b0101;
   parameter baja2 = 4'b0110;
	parameter piso4 = 4'b0111;
	parameter baja4 = 4'b1000;
	parameter sobrepeso  = 4'b1001;


	//Declaracion de los registros de estados
	reg [2:0] estado;
	reg [2:0] Dis_0;
	reg [2:0] Dis_1;
	reg [2:0] Dis_2;
	reg [2:0] Dis_3;
	reg [6:0] Display_0 = 7'b0000000;
	reg [6:0] Display_1 = 7'b0000000;
	reg [6:0] Display_2 = 7'b0000000;
	reg [6:0] Display_3 = 7'b0000000;

	
	reg[27:0] contador = 28'd0;
	parameter Divisor = 28'd133400;
	
	
	always@(posedge clk)
		if (!reset)
		begin
			estado <= piso1;
		end
      else
		case (estado) //Inicio de la maquina de estado	
			/*Desde PISO1*/
			piso1:
				begin
				if(SP)
				begin
					estado <= sobrepeso;
					Dis_0 = 3'b101; //S
					Dis_1 = 3'b110; //P
					Dis_2 = 3'b101; //S
					Dis_3 = 3'b110; //P					
					motores <= 2'b00;
				end
				else if(P2)
				begin
					estado <= sube2;
					motores <= 2'b00;
					Dis_0 = 3'b000; //0
					Dis_1 = 3'b001; //1
					Dis_2 = 3'b000; //off
					Dis_3 = 3'b000; //off	
				end
				else if(P3)
				begin
					estado <= sube3;
					motores <= 2'b00;
					Dis_0 = 3'b001;
					Dis_1 = 3'b000;
				end			
				else begin
					motores <= 2'b00;
					Dis_0 = 3'b001;
					Dis_1 = 3'b000;
				end			
			end
			
			/*Transicion al Piso 2*/
			sube2:
			begin
				if (FC2)
				begin
					estado <= piso2;
					motores <= 2'b01;
					Dis_0 = 3'b000;
					Dis_1 = 3'b010;
					
				end				
				else begin
					motores <= 2'b01;
					Dis_0 = 3'b000;
					Dis_1 = 3'b010;
					
				end	
			end		
			
			/*Desde Piso 2*/

			piso2:
				begin
				if(SP)
				begin
					estado <= piso2;
					Dis_0 = 3'b101; //S
					Dis_1 = 3'b110; //P
					motores <= 2'b00;
				end
				else if(P1)
				begin
					estado <=baja1;
					motores <= 2'b00;
					Dis_0 = 3'b010;
					Dis_1 = 3'b000;
						
				end
				else if(P3)
				begin
					estado <= sube3;
					motores <= 2'b00;
					Dis_0 = 3'b010;
					Dis_1 = 3'b000;
					
				end			
				else begin
					motores <= 2'b00;
					Dis_0 = 3'b010;
					Dis_1 = 3'b000;
										
				end			
			end
			

			/*Desde el Piso 3*/
			piso3:
				begin
				if(SP)
				begin
					estado <= piso3;
					Dis_0 = 3'b101; //S
					Dis_1 = 3'b110; //P
					motores <= 2'b00;
				end
				else if(P2)
				begin
					estado <= baja2;
					motores <= 2'b00;
					Dis_0 = 3'b011;
					Dis_1 = 3'b000;
						
				end
				else if(P1)
				begin
					estado <= baja1;
					motores <= 2'b00;
					Dis_0 = 3'b011;
					Dis_1 = 3'b000;
					
				end			
				else begin
					motores <= 2'b00;
					Dis_0 = 3'b011;
					Dis_1 = 3'b000;
										
				end			
			end
			
			/*Transicion de bajada al piso2*/
			baja2: 
			begin
				if(FC2)
				begin
					estado <= piso2;
					motores <= 2'b00;
					Dis_0 = 3'b000;
					Dis_1 = 3'b010;
					
				end
				else begin 
					motores <= 2'b10;
					Dis_0 = 3'b000;
					Dis_1 = 3'b010;
					
				end	
			end
			
			baja1: 
			begin
				if(FC1)
				begin
					estado <= piso1;
					motores <= 2'b10;
					Dis_0 = 3'b000;
					Dis_1 = 3'b001;
					
				end		
				else begin 
					motores <= 2'b10;
					Dis_0 = 3'b000;
					Dis_1 = 3'b001;
					
				end	
			end
			
			/*Transicion de subida al piso3*/
			sube3: 
			begin
				if (FC3)
				begin
					estado <= piso3;
					motores <= 2'b01;
					Dis_0 = 3'b000;
					Dis_1 = 3'b011;
					
				end	
				else begin 
					motores <= 2'b01;
					Dis_0 = 3'b000;
					Dis_1 = 3'b011;
					
				end	
			end		
			default: estado <= piso1;
		endcase
		
	      /*Sensibilidad para el Display*/
			always @(Dis_0) //Matriz de salida para el Display
			begin
			case(Dis_0)
				3'b000: Display_0 = 7'b0000000; //--> off
				3'b001: Display_0 = 7'b0000110; //--> 1
				3'b010: Display_0 = 7'b1011011; //--> 2 //catodo comun
				3'b011: Display_0 = 7'b1001111; //--> 3
				3'b100: Display_0 = 7'b1100110; //--> 4				
				3'b101: Display_0 = 7'b1101101; //--> S
				3'b110: Display_1 = 7'b1110011; //--> P				
				default Display_0 = 7'b0000110;
			endcase //fin del case
			end
			
			always @(Dis_1)
			begin
			case(Dis_1)
				3'b000: Display_1 = 7'b0000000; //--> off
				3'b001: Display_1 = 7'b0000110; //--> 1
				3'b010: Display_1 = 7'b1011011; //--> 2 //catodo comun
				3'b011: Display_1 = 7'b1001111; //--> 3
				3'b100: Display_0 = 7'b1100110; //--> 4
				3'b101: Display_0 = 7'b1101101; //--> S				
				3'b110: Display_1 = 7'b1110011; //--> P
			   default Display_1 = 7'b0000000;
			endcase	
			end
			
			always @(Dis_2)
			begin
			case(Dis_1)
				3'b000: Display_1 = 7'b0000000; //--> off
				3'b001: Display_1 = 7'b0000110; //--> 1
				3'b010: Display_1 = 7'b1011011; //--> 2 //catodo comun
				3'b011: Display_1 = 7'b1001111; //--> 3
				3'b100: Display_0 = 7'b1100110; //--> 4
				3'b101: Display_0 = 7'b1101101; //--> S				
				3'b110: Display_1 = 7'b1110011; //--> P
			   default Display_1 = 7'b0000000;
			endcase	
			end

			always @(Dis_3)
			begin
			case(Dis_1)
				3'b000: Display_1 = 7'b0000000; //--> off
				3'b001: Display_1 = 7'b0000110; //--> 1
				3'b010: Display_1 = 7'b1011011; //--> 2 //catodo comun
				3'b011: Display_1 = 7'b1001111; //--> 3
				3'b100: Display_0 = 7'b1100110; //--> 4
				3'b101: Display_0 = 7'b1101101; //--> S				
				3'b110: Display_1 = 7'b1110011; //--> P
			   default Display_1 = 7'b0000000;
			endcase	
			end


always @(posedge clk)
	begin
		counter <= counter + 28'd1;
		if (counter >= (Divisor-1))
		counter <= 28'd0;
		else begin
			if(counter >= (Divisor/2))
			begin
				Master_Display = Display_1;
				on = 2'b01;
			end
			else 
			begin
				Master_Display = Display_0;
				on = 2'b10;
			end
		end
	end
	
endmodule //fin del modulo

