//`timescale 1ns / 1ps
`timescale 1s / 1ms
//////////////////////////////////////////////////////////////////////////////////
//TP Final DE AULA MONTACARGAS CON MEJORAS
//AUTORES: Juarez Daniel,Hugo Cotos 		 
//FECHA: 02/12/2021
//CURSO: 3R4
//////////////////////////////////////////////////////////////////////////////////

module testfinal;

	// Inputs
	reg clk;
	reg clk_2;
	reg reset;
	reg P1;
	reg P2;
	reg P3;
	reg FC1;
	reg FC2;
	reg FC3;
	reg SP;

	// Outputs
	wire [1:0] motor;
	wire [1:0] on;
	wire [6:0] Master_Display;

	// Instantiate the Unit Under Test (UUT)
	Monta_Carga_Prueba uut (
		.clk(clk), 
		.clk_2(clk_2),
		.reset(reset), 
		.P1(P1), 
		.P2(P2), 
		.P3(P3), 
		.FC1(FC1), 
		.FC2(FC2), 
		.FC3(FC3), 
		.SP(SP), 
		.motor(motor), 
		.on(on), 
		.Master_Display(Master_Display)
	);
	
	initial begin //Clock principal del sistema cada 12.5ns para los 4Mhz
		forever begin
			clk <= 0;
			#0.000125;
			clk <= 1;
			#0.000125;
		end
	end
	
	initial begin //Clock secundario para los display cada 16.6ms para 60Hz
		forever begin
			clk_2 <= 1;
			#8.3;
			clk_2 <= 0;
			#8.3;
		end
	end	
	
	initial begin
		// Initialize Inputs
		clk =   0;
		reset = 0;
		P1 = 	  0;
		P2 =    0;
		P3 =    0;
		FC1 =   0;
		FC2 =   0;
		FC3 =   0;
		SP = 	  0;
		#50;
//////////////////////////


/////////Simulacion de SP en el piso 1 
		reset = 1;
		P1 = 	  0;
		P2 =    0;
		P3 =    0;
		FC1 =   1;
		FC2 =   0;
		FC3 =   0;
		SP = 	  1;
		#50;
	
		P1 = 	  0;
		P2 =    0;
		P3 =    0;
		FC1 =   1;
		FC2 =   0;
		FC3 =   0;
		SP = 	  0;
		#50;				
//////////////////////////////////////
		
/////////Desde el Piso 1 
		P1 = 	0;
		P2 = 	1;
		P3 = 	0;  //Escojo piso2
		FC1 = 0;
		FC2 = 0;
		FC3 = 0;
		SP = 	0;		
		#50;

		P1 = 	0;
		P2 = 	0;
		P3 = 	0;
		FC1 = 0;  //subiendo al piso2
		FC2 = 0;
		FC3 = 0;		  
		#50;
		
		P1 = 	0;
		P2 = 	0;
		P3 = 	0;
		FC1 = 0;  //llegamos al piso2
		FC2 = 1;
		FC3 = 0;		  
		#50;
		
		P1 = 	0;
		P2 = 	0;
		P3 = 	0;
		FC1 = 0;
		FC2 = 1;
		FC3 = 0;		  
		#50;
///////////////////////

///////Simulacion de SP en el Piso 2
		P1 = 	  0;
		P2 =    0;
		P3 =    0;
		FC1 =   0;
		FC2 =   1;
		FC3 =   0;
		SP = 	  1;
		#50;
		
		P1 = 	  0;
		P2 =    0;
		P3 =    0;
		FC1 =   0;
		FC2 =   1;
		FC3 =   0;
		SP = 	  0;
		#50;				
////////////////////////////		
		
///////Transicion al Piso 3

		P1 = 	0;
		P2 = 	0;
		P3 = 	1;  //Escojo piso3
		FC1 = 0;
		FC2 = 1;
		FC3 = 0;
		SP = 	0;		
		#50;

		P1 = 	0;
		P2 = 	0;
		P3 = 	0;
		FC1 = 0;  //subiendo al piso3
		FC2 = 0;
		FC3 = 0;		  
		#50;
		
		P1 = 	0;
		P2 = 	0;
		P3 = 	0;
		FC1 = 0;  //llegamos al piso3
		FC2 = 0;
		FC3 = 1;		  
		#50;
		
		P1 = 	0;
		P2 = 	0;
		P3 = 	0;
		FC1 = 0; 
		FC2 = 0;
		FC3 = 0;		  
		#50;
////////////////////////////	

////////////Simulacion de SP en el Piso3
		P1 = 	  0;
		P2 =    0;
		P3 =    0;
		FC1 =   0;
		FC2 =   0;
		FC3 =   1;
		SP = 	  1;
		#50;
		
		P1 = 	  0;
		P2 =    0;
		P3 =    0;
		FC1 =   0;
		FC2 =   0;
		FC3 =   1;
		SP = 	  0;
		#50;		
////////////////////////////////////////

	
////Transicion de bajada al Piso 2

		P1 = 	0;
		P2 = 	1;
		P3 = 	0;  //Escojo piso2
		FC1 = 0;
		FC2 = 0;
		FC3 = 1;	
		#50;
		
		P1 = 	0;
		P2 = 	0;
		P3 = 	0;
		FC1 = 0;  //bajando al piso2
		FC2 = 0;
		FC3 = 0;		  
		#50;
		
		P1 = 	0;
		P2 = 	0;
		P3 = 	0;
		FC1 = 0;  //llegamos al piso2
		FC2 = 1;
		FC3 = 0;		  
		#50;

		P1 = 	0;
		P2 = 	0;
		P3 = 	0;
		FC1 = 0;
		FC2 = 0;
		FC3 = 0;		  
		#50;
/////////////////////////////////


////Transicion de bajada al Piso 1

		P1 = 	1;
		P2 = 	0;
		P3 = 	0;  //Escojo piso1
		FC1 = 0;
		FC2 = 0;
		FC3 = 0;		  
		#50;
		
		P1 = 	0;
		P2 = 	0;
		P3 = 	0;
		FC1 = 0;  //bajando al piso1
		FC2 = 0;
		FC3 = 0;		  
		#50;
		
		P1 = 	0;
		P2 = 	0;
		P3 = 	0;
		FC1 = 1;  //llegamos al piso1
		FC2 = 0;
		FC3 = 0;		  
		#50;		
////////////////////////////////////

	end
      
endmodule

