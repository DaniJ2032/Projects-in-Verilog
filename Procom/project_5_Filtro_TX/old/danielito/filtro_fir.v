module filtro_fir
  #(
    parameter NB_OUTPUT  = 8, //! NB of output
    parameter NBF_OUTPUT = 6, //! NBF of output
    parameter NB_COEFF   = 8, //! NB of Coefficients
    parameter NBF_COEFF  = 6, //! NBF of Coefficients
    parameter NBAUDS     = 6  //! Baudios del filtro 
  ) 
  (
    input                         clock,   //! Clock
    input                         i_reset,//! Reset
    input                         i_enable, //! Enable
    input                         i_valid,
    input                         i_dataPrbs, //! Input Sample
    input [2:0]                   i_counterMux,

    output signed [NB_OUTPUT-1:0] o_out_fir //! Output Sample
  );

  //Parametros Locales
  localparam NB_ADD     = NB_COEFF  + 3; //3 bits para las 6 sumas
  localparam NBF_ADD    = NBF_COEFF;
  localparam NBI_ADD    = NB_ADD    - NBF_ADD;
  localparam NBI_OUTPUT = NB_OUTPUT - NBF_OUTPUT;
  localparam NB_SAT     = (NB_ADD-NBF_ADD)-(NB_OUTPUT-NBF_OUTPUT);

  // Registros
  reg  [5:0] register;

  // Conexiones
  wire  signed [NB_COEFF-1:0] Coeficientes            [0:23]; //! Matrir for Coefficients
  wire  signed [NB_COEFF-1:0] mux_signo_de_coeficiente[5:0 ];
  wire  signed [NB_COEFF-1:0] out_mux                 [5:0 ];
  // wire  signed [NB_ADD - 1:0] sum;
    
  // Coeficientes
  assign Coeficientes[0]  = 8'b0000_0000; 
  assign Coeficientes[1]  = 8'b0000_0001; 
  assign Coeficientes[2]  = 8'b0000_0001; 
  assign Coeficientes[3]  = 8'b0000_0000; 
  assign Coeficientes[4]  = 8'b1111_1100; 
  assign Coeficientes[5]  = 8'b1111_1000; 
  assign Coeficientes[6]  = 8'b1111_1000; 
  assign Coeficientes[7]  = 8'b0000_0000; 
  assign Coeficientes[8]  = 8'b0001_0001; 
  assign Coeficientes[9]  = 8'b0010_0110; 
  assign Coeficientes[10] = 8'b0011_1001; 
  assign Coeficientes[11] = 8'b0100_0000; 
  assign Coeficientes[12] = 8'b0011_1001; 
  assign Coeficientes[13] = 8'b0010_0110; 
  assign Coeficientes[14] = 8'b0001_0001; 
  assign Coeficientes[15] = 8'b0000_0000; 
  assign Coeficientes[16] = 8'b1111_1000; 
  assign Coeficientes[17] = 8'b1111_1000; 
  assign Coeficientes[18] = 8'b1111_1100; 
  assign Coeficientes[19] = 8'b0000_0000; 
  assign Coeficientes[20] = 8'b0000_0001; 
  assign Coeficientes[21] = 8'b0000_0001; 
  assign Coeficientes[22] = 8'b0000_0000; 
  assign Coeficientes[23] = 8'b0000_0000; 
  

  always @(posedge clock) begin:shiftRegister
    if (i_reset) begin
      register <= {5{1'b0}};

   end else if (i_enable && i_counterMux == 2'b01) begin
       register[5] <= i_dataPrbs;
       register[4] <= register[5];
       register[3] <= register[4];
       register[2] <= register[3];
       register[1] <= register[2];
       register[0] <= register[1];
    end        
  end  

  assign out_mux[0] = (i_counterMux == 2'b10) ? Coeficientes[20] : (i_counterMux == 2'b11) ? Coeficientes[21] : (i_counterMux == 2'b00) ? Coeficientes[22] :  Coeficientes[23];
  assign out_mux[1] = (i_counterMux == 2'b10) ? Coeficientes[16] : (i_counterMux == 2'b11) ? Coeficientes[17] : (i_counterMux == 2'b00) ? Coeficientes[18] :  Coeficientes[19];
  assign out_mux[2] = (i_counterMux == 2'b10) ? Coeficientes[12] : (i_counterMux == 2'b11) ? Coeficientes[13] : (i_counterMux == 2'b00) ? Coeficientes[14] :  Coeficientes[15];
  assign out_mux[3] = (i_counterMux == 2'b10) ? Coeficientes[8 ] : (i_counterMux == 2'b11) ? Coeficientes[9 ] : (i_counterMux == 2'b00) ? Coeficientes[10] :  Coeficientes[11];
  assign out_mux[4] = (i_counterMux == 2'b10) ? Coeficientes[4 ] : (i_counterMux == 2'b11) ? Coeficientes[5 ] : (i_counterMux == 2'b0)  ? Coeficientes[6 ] :  Coeficientes[7] ;
  assign out_mux[5] = (i_counterMux == 2'b10) ? Coeficientes[0 ] : (i_counterMux == 2'b11) ? Coeficientes[1 ] : (i_counterMux == 2'b00) ? Coeficientes[2 ] :  Coeficientes[3] ;
      
  generate
    genvar ptr;
      for(ptr=0;ptr<6;ptr=ptr+1) begin
        assign mux_signo_de_coeficiente[ptr] = (register[ptr] == 0) ? out_mux[ptr]  : (-out_mux[ptr]);
      end
  endgenerate


  integer i;
  reg signed [NB_ADD-1:0] sum;

  always @(*) begin
    sum = {NB_ADD{1'b0}};
    for(i=0;i<6;i=i+1) begin
      sum = sum + mux_signo_de_coeficiente[i];
    end
  end

  //Output fir I
  assign o_out_fir = ( ~|sum[NB_ADD-1 -: NB_SAT+1] || &sum[NB_ADD-1 -: NB_SAT+1]) ? sum[NB_ADD-(NBI_ADD-NBI_OUTPUT) - 1 -: NB_OUTPUT] :
                (sum[NB_ADD-1]) ? {{1'b1},{NB_OUTPUT-1{1'b0}}} : {{1'b0},{NB_OUTPUT-1{1'b1}}};

  
endmodule
