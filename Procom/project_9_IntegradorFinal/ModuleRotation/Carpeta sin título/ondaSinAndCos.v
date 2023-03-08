//////////////////////////////////////////////////////////////////////////////////
// AUTOR: Jose gomez Lazarte, Juarez Daniel 
// AÑO:   2023  
// NOMBRE: Modulo WaveSinAndCos encargada de crear las ondas utilizadas para la   
//         operatorio del rotado de los datos 
//////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////
// paso minimo 0, paso maximo 10 dependiendo el paso es por cuanto 
// se va a dividir los pasos y fijar los limites de para la construccion de la onda
// donde una onda de 24kHz es la mas lenta con un paso 0 y una onda de 25MHz es la 
// mas rapida con un paso de 10
////////////////////////////////////////////////////////////////////////////////////

module WaveSinAndCos
#
(
	parameter READ_WIDTH    = 8    ,     
	parameter READ_DEPTH    = 1024 		
)
(
	input 							clock  ,
	input 							i_reset  ,
	input						    i_enable  ,
	input	 	   [3:0]			i_paso	  ,
	input			 [READ_WIDTH-1:0]	i_dataI,
	input			 [READ_WIDTH-1:0]	i_dataQ,
	output signed  [READ_WIDTH-1:0]	o_dataSin, //Datos de la onda Sin de entrada
	output signed  [READ_WIDTH-1:0]	o_dataCos,	 //Datos de la onda Cos de entrada
	output signed  [READ_WIDTH-1:0]	o_dataRotatedI,
	output signed  [READ_WIDTH-1:0]	o_dataRotatedQ,
	output         [11:0]           o_count    
);

localparam INIT_FILE_SIN    = "/home/danielito/Escritorio/CuartoSin.dat";     
localparam INIT_FILE_COS    = "/home/danielito/Escritorio/CuartoCos.dat";

//REVISAR!!!!!!
//___Registros___//
reg signed [READ_WIDTH-1:0] read_vector_Sin [READ_DEPTH-1:0];
reg signed [READ_WIDTH-1:0] read_vector_Cos [READ_DEPTH-1:0];
reg signed [READ_WIDTH-1:0] RegdatosSin ;
reg signed [READ_WIDTH-1:0] RegdatosCos ;
reg signed [READ_WIDTH-1:0] RegDatosRotI ;
reg signed [READ_WIDTH-1:0] RegDatosRotQ ;
reg		   [11:0]	  	    Regcount    ; 
reg 	   [9:0]		    RegPtr	    ;

wire [11:0] limite1; //valor del limite1: 1024
wire [11:0] limite2; //valor del limite2: 1023
wire [11:0] limite3; //valor del limite3: 2048
wire [11:0] limite4; //valor del limite4: 2047
wire [11:0] limite5; //valor del limite5: 3072
wire [11:0] limite6; //valor del limite6: 3071
wire [12:0] limite7; //valor del limite7: 4096

// Se llena las matrices con los valores de los archivos .dat
generate
	initial
        $readmemh (INIT_FILE_SIN, read_vector_Sin, 0, READ_DEPTH-1);    
endgenerate

generate
	initial
	    $readmemh (INIT_FILE_COS, read_vector_Cos, 0, READ_DEPTH-1);	
endgenerate


//SEGUIR MAÑANA

always @(posedge clock) begin 

		if (i_reset)begin					
		Regcount  	 <= 12'b0 ;
		RegPtr       <= 10'b0 ;
		RegdatosSin  <= 8'b0  ;
		RegdatosCos  <= 8'b0  ;
		RegDatosRotI <= 
		RegDatosRotQ <=


	end
	else if(i_enable == 1'b1) begin
	       
        if (Regcount < limite1) begin
            RegdatosSin	<=  read_vector_Sin[RegPtr];     //Se toma el primer 1/4 de onnda 
			RegdatosCos	<=	read_vector_Cos[RegPtr];                  
			if (((1'b1 << i_paso)- 1'b1) != 1'b0) RegPtr <= RegPtr + ((1'b1 << i_paso)-1'b1);
			else RegPtr <= RegPtr + ((1'd1 << i_paso));
		end 
		 
		else if (Regcount > limite2 && Regcount <limite3) begin
		 	RegdatosSin	<=	read_vector_Sin[RegPtr];     //Se toma el 2do 1/4
            RegdatosCos <=	~ read_vector_Cos[RegPtr];
			if (((1'b1 << i_paso)- 1'b1) != 1'b0) RegPtr <= RegPtr - ((1'b1 << i_paso)-1'b1);
			else RegPtr <= RegPtr - ((1'b1 << i_paso));				
		end

		else if (Regcount >limite4 && Regcount <limite5) begin
            RegdatosSin	<=	~ read_vector_Sin[RegPtr];	//Se toma el 3er 1/4
			RegdatosCos	<=	~ read_vector_Cos[RegPtr];
			if (((1'b1 << i_paso)- 1'b1) != 1'b0) RegPtr <= RegPtr + ((1'b1 << i_paso)-1'b1);
			else RegPtr <= RegPtr + ((1'b1 << i_paso));
	    end

        else if (Regcount >limite6 && Regcount <limite7) begin 
            RegdatosSin	<=	~ read_vector_Sin[RegPtr]; //Se toma el 4to 1/4  
			RegdatosCos	<=	read_vector_Cos[RegPtr];		
            if (((1'b1 << i_paso)- 1'b1) != 1'b0) RegPtr <= RegPtr - ((1'b1 << i_paso)-1'b1);
			else RegPtr <= RegPtr - ((1'b1 << i_paso)); 		
        end

        else RegPtr <=  RegPtr;         
        if(Regcount < (13'd4095 >> i_paso)) begin
		   Regcount	<=	Regcount + 1'b1;
				
		end else if(Regcount == (13'd4095 >> i_paso) || i_paso == 4'hB) begin //REVISAR 
		  	Regcount   <= 0;
		   	RegPtr	   <= 0;
		end
      
    end //Fin de else if begin 	
end //Fin de always


//___Asignacion de los limites dependiendo del paso___//
assign	limite1 = (i_paso == 4'd0) ? (12'd1023 >> i_paso)  : ( 12'd1024  >> i_paso      );
assign	limite2 = (i_paso == 4'd0) ? (12'd1023 >> i_paso)  : ((12'd1024  >> i_paso)-1'b1);
assign 	limite3 = (i_paso == 4'd0) ? (12'd2047 >> i_paso)  : ((12'd2048  >> i_paso)     );
assign  limite4 = (i_paso == 4'd0) ? (12'd2047 >> i_paso)  : ((12'd2048  >> i_paso)-1'b1);
assign 	limite5 = (i_paso == 4'd0) ? (12'd3071 >> i_paso)  : ((12'd3072  >> i_paso)     );
assign 	limite6 = (i_paso == 4'd0) ? (12'd3071 >> i_paso)  : ((12'd3072  >> i_paso)-1'b1);
assign  limite7 = (i_paso == 4'd0) ? (13'd4095 >> i_paso)  : ( 13'd4096  >> i_paso      );

//___Asignacion de las salidas___//
assign	o_dataSin = RegdatosSin;
assign	o_dataCos = RegdatosCos;
assign	o_count   = Regcount;

endmodule

