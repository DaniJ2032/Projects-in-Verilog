/*Modulo shifter a la salida del FIR para seleccionar muestras en 
diferentes fases*/
module shiftFaseFir
(
input                   clock,
input                   i_reset,
input                   i_enable,
input                   i_valid,
input          [1:0]    i_fase,    //Seleccion de la fase     
input signed   [7:0]    i_os_data, //datos de entrada de 8 bits
output signed           o_data_Fase
);
    
reg signed [7:0] ShiftRegFase [3:0] ;   //registro de 4 bits con ancho de 8 bits cada uno
reg DiesmOut;
integer i;

always @(posedge clock) begin
    if(i_reset)begin

        for (i=0; i<4; i = i+1)begin
            ShiftRegFase[i] <= 8'b00000000;  
            
        end
        DiesmOut <= 0;    

    end else if (i_enable)begin

  
      ShiftRegFase[3] <= i_os_data;
      ShiftRegFase[2] <= ShiftRegFase[3];    
      ShiftRegFase[1] <= ShiftRegFase[2];
      ShiftRegFase[0] <= ShiftRegFase[1];       
    end
    if (i_valid && i_enable) DiesmOut <= ShiftRegFase[i_fase][7]; 
end //Fin de always

/*Buscamos detectar el signo ahora*/
assign o_data_Fase = DiesmOut;

endmodule