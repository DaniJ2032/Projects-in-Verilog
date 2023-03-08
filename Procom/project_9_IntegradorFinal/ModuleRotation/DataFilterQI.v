/////////////////////////////////////////////////////////////////////////////////////
// AUTOR: Jose gomez Lazarte, Juarez Daniel 
// AÑO:   2023  
// NOMBRE: Modulo DataFilter encargado de entregar los datos de la salida del filtro  
//         con un error de fase 
////////////////////////////////////////////////////////////////////////////////////

module DataFilter
#
(
	parameter  NB_OUTPUT   = 8 ,	//Parte entera salida
	parameter  NBF_OUTPUT  = 6 ,	//Parte fraccionaria salida
	parameter  NB_COEFF    = 8 ,	//Parte entera de coeficientes
	parameter  NBF_COEFF   = 6    	  //Parte fraccionaria de los coeficientes
)
(
	input								clock,
	input				 				i_reset,
//	input								i_enable,
	input  signed	[NB_OUTPUT-1:0]		i_dataI,
	input  signed	[NB_OUTPUT-1:0]		i_dataQ,
	input  signed	[NB_OUTPUT-1:0]		i_dataSin,
	input  signed	[NB_OUTPUT-1:0]		i_dataCos,
	output signed	[NB_OUTPUT-1:0]		o_dataRotatedI,
	output signed	[NB_OUTPUT-1:0]		o_dataRotatedQ 	
);


//___Parametros locales___//
localparam NB_ADD     = 17; //Entrada, total de la suma --> 16 bits
localparam NBF_ADD    = 12; //Entrada, parte frac de la suma --> 12 bits																									
localparam NBI_ADD    = NB_ADD    - NBF_ADD;	//Entrada, parte entera, diferencia entre 16 y 12 --> 4 bits

localparam NBI_OUTPUT = NB_OUTPUT - NBF_OUTPUT; //Salida, se obtiene la parte entera, diferencia entre 8 y 6 --> 2 bits
localparam NB_SAT     = (NB_ADD-NBF_ADD)-(NB_OUTPUT-NBF_OUTPUT); //Salida, bits para saturacion --> 2 bits


//___Conexiones internas___//
wire signed [NB_OUTPUT+NB_COEFF-1:0] productoria  [3:0];	//Max resolucion 
wire signed [NB_OUTPUT+NB_COEFF:0] sumatoria	  [1:0];	//Max resolucion

//___Registros___//
//reg   signed [NB_ADD - 1:0] auxregI;    
//reg   signed [NB_ADD - 1:0] auxregQ; 
// (I+jQ)*(cos() + jsen())  I*cos + I jsen() + jQcos() - Qsen()  --- I*cos() - Qsen() + j I.sen() + Qcos()


//___Productos parciales___//
assign productoria[0] = i_dataI * i_dataCos; //Productioria parcial para salida I 
assign productoria[1] = i_dataQ * i_dataSin;
assign productoria[2] = i_dataI * i_dataSin; //Productoria parcial para salida Q
assign productoria[3] = i_dataQ * i_dataCos; 

//__Suma de las productorias__//
assign sumatoria [0] = productoria[0] - productoria[1];	//Salidas a S(16,12)
assign sumatoria [1] = productoria[2] + productoria[3];

//___Correccion de la coma saturacion y truncado, de S(17,12) a S(8,6)___//

assign o_dataRotatedI = (~|sumatoria[0] [NB_ADD-1 -: NB_SAT+1] || &sumatoria[0] [NB_ADD-1 -: NB_SAT+1]) ? sumatoria[0] [NB_ADD-(NBI_ADD-NBI_OUTPUT) - 1 -: NB_OUTPUT] :
                 (sumatoria[0] [NB_ADD-1]) ? {{1'b1},{NB_OUTPUT-1{1'b0}}} : {{1'b0},{NB_OUTPUT-1{1'b1}}};

assign o_dataRotatedQ = (~|sumatoria[1] [NB_ADD-1 -: NB_SAT+1] || &sumatoria[1] [NB_ADD-1 -: NB_SAT+1]) ? sumatoria[1] [NB_ADD-(NBI_ADD-NBI_OUTPUT) - 1 -: NB_OUTPUT] :
                 (sumatoria[1] [NB_ADD-1]) ? {{1'b1},{NB_OUTPUT-1{1'b0}}} : {{1'b0},{NB_OUTPUT-1{1'b1}}};

endmodule


