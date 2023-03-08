//////////////////////////////////////////////////////////////////////////////////
// AUTOR: Jose gomez Lazarte, Juarez Daniel 
// AÑO:   2023  
// NOMBRE: Modulo top_rotation abarca el bloque de rotacion de valores del filtro   
//         
//////////////////////////////////////////////////////////////////////////////////

module top_rotation
#(
    parameter READ_DEPTH  = 1024,             
    parameter READ_WIDTH  = 8,       
//___Parametros para los coeficientes___//
	parameter NB_OUTPUT  = 8, //Bits output
	parameter NBF_OUTPUT = 6, //Fractional bits output
	parameter NB_COEFF   = 8, //Bits coef
	parameter NBF_COEFF  = 6 //Fractional bits coef
)
(
    input 							clock,
    input 							i_reset,
	input							i_enable,
    input   signed [NB_OUTPUT-1:0] 	i_dataI,
    input   signed [NB_OUTPUT-1:0] 	i_dataQ,    
	input 		   [3:0]			i_pasoWave,
	output signed  [NB_OUTPUT-1:0]  o_WaveCos,   
	output signed  [NB_OUTPUT-1:0]  o_WaveSin,	
	output signed  [NB_OUTPUT-1:0]  o_RotatedI,
	output signed  [NB_OUTPUT-1:0]  o_RotatedQ 
);

//___Parametros locales___//

         
		
//___conexiones___//	
wire signed [READ_WIDTH-1:0 ] datos_out_Sin;
wire signed [READ_WIDTH-1:0 ] datos_out_Cos;

wire signed [NB_OUTPUT-1:0 ] datos_out_rotated_I;
wire signed [NB_OUTPUT-1:0 ] datos_out_rotated_Q;




///////////////////////////////////////////
//  Modulo WaveSinAndCos
//////////////////////////////////////////
WaveSinAndCos
	#
	(
        .READ_WIDTH     (READ_WIDTH ),     
        .READ_DEPTH     (READ_DEPTH )	
	)
	u_WaveSinAndCos
		(
		.clock     (clock),
		.i_reset   (~i_reset),
		.i_enable  (i_enable),
		.i_paso    (i_pasoWave),
		.o_dataSin (datos_out_Sin),   
		.o_dataCos (datos_out_Cos)         		
	);

/////////////////////////////////////////////
//  Modulo Datafilter
////////////////////////////////////////////

DataFilter
	#
	(
 		.NB_OUTPUT 	 (NB_OUTPUT	 ), 
 		.NBF_OUTPUT	 (NBF_OUTPUT ), 
 		.NB_COEFF  	 (NB_COEFF	 ), 
 		.NBF_COEFF   (NBF_COEFF	 ) 
	)
	u_DataFilter
		( 
			.clock    		(clock),
			.i_reset    	(~i_reset),
//			.i_enable  		(i_enable),
			.i_dataI		(i_dataI),
			.i_dataQ		(i_dataQ),
			.i_dataSin   	(datos_out_Sin),
			.i_dataCos   	(datos_out_Cos),
			.o_dataRotatedI     (datos_out_rotated_I),
			.o_dataRotatedQ     (datos_out_rotated_Q)
		);

assign o_RotatedI = datos_out_rotated_I;
assign o_RotatedQ = datos_out_rotated_Q;
assign o_WaveCos  = datos_out_Cos; 
assign o_WaveSin  = datos_out_Sin;


endmodule






