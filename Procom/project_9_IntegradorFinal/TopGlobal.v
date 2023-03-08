//////////////////////////////////////////////////////////////////////////////////
// NOMBRE: top.v
// FUNCION: Modulo top, es el encargado de juntar todos los top de los sub
// modulos que lo conforman, en este caso son 3.
// top_tx.v --> Es el top encargado de englobar el modulo dsp del filtro
// top_rotation --> Encargado de realizar una operatoria sobre la salida del
// filtro, para simular un error en cuadratura en la señal modulada. 
// logeo.v --> Encargado de habilitacion de lectura y escritura en el modulo
// de la RAM. 
// Las api utilizadas en esta implementacion son.
// MicroGPIO.v --> es una api encargada de poder sintetizar un micro dentro de
// la FPGA a medida del usuario, tambien se le puede mediante un programa en
// vitis IDE cargar un archivo enbebido en c
// vio --> usado para comandar la fpga a distancia 
// ila --> con el ila lo que se hace es poder visualizar la salida de los
// datos casi en tiempo real ya que el mismo permite almacenar una cantidad de
// datos en un buffer para ser analizados.
//
// AUTOR: Jose gomez Lazarte, Juarez Daniel 
// AÑO:   2023    
//////////////////////////////////////////////////////////////////////////////////

module top
( 
//Descomentar para testeo
//    input   clockdsp,
//    input   [31 : 0] gpo0,
//    output  [31 : 0] gpi0,
//    input   i_reset
    //___Comnentar para simulacion
    input           clock100,   
    input           in_reset ,
    input           in_rx_uart ,
    output          out_tx_uart      
);

  //___Parametros del TOP
  parameter NB_OUTPUT       = 8            ; //! NB of output
  parameter NBF_OUTPUT      = 6            ; //! NBF of output
  parameter NB_COEFF        = 8            ; //! NB of Coefficients
  parameter NBF_COEFF       = 6            ; //! NBF of Coefficients
  parameter NB_GPIOS        = 32           ;
  parameter RAM_WIDTH       = 32           ;            
  parameter RAM_DEPTH       = 32000        ;                  
  parameter RAM_PERFORMANCE = "LOW_LATENCY";
  parameter INIT_FILE       = ""           ;

  parameter READ_DEPTH  = 1024;             
  parameter READ_WIDTH  = 8; 

  ///////////////////////////////////////////
  // Conexiones para MicroBlazer 
  ///////////////////////////////////////////
  //___Wires___Comentar para testeo
  wire                   locked     ;
  wire                   soft_reset ;
  wire [NB_GPIOS- 1 : 0] gpo0       ;
  wire [NB_GPIOS- 1 : 0] gpi0       ;
  wire                   clockdsp   ; 
  wire                   i_reset    ; 
  
  
  ////////////////////////////////////////////
  //    Conexiones Filtro TX y RF
  ////////////////////////////////////////////
  //___Registros 
  reg          o_reset       ;
  reg  [3 : 0] reg_i_sw      ;
  reg  [63: 0] ErrorQ        ;
  reg  [63: 0] ErrorI        ;
  reg  [63: 0] BitQ          ;
  reg  [63: 0] BitI          ;
  reg  [1 : 0] logeo         ;  
  reg          read          ; 
  reg  [2 : 0] flag_E_B      ;
  reg          flag_captura  ;
  reg          captura       ;
  reg [31 : 0] direccion     ;  
  //____Wires
//i_sw[0] para PRBS y FIR, i_sw[1] para BER, i_sw[3:2] selec de fase
  wire        [3          :0] o_led          ; 
  wire signed [NB_OUTPUT-1:0] o_FIRQ         ; 
  wire signed [NB_OUTPUT-1:0] o_FIRI         ; 
  wire        [63         :0] o_ErrorQ       ;
  wire        [63         :0] o_ErrorI       ;
  wire        [63         :0] o_BitQ         ;
  wire        [63         :0] o_BitI         ;
  wire        [31         :0] o_mux_ErrorBits;
  wire                        salida_captura ;

  ///////////////////////////////////////////
  //    Conexiones RAM
  //////////////////////////////////////////
  //___Wires                                                                        
  wire [RAM_WIDTH - 1 :0] Dato_input  ;
  wire [RAM_WIDTH - 1 :0] Dato_output ;
  
  //////////////////////////////////////////
  //    conexiones Module Rotation
  /////////////////////////////////////////  
  //___Registros
  reg  [3:0] 		   paso_wave ;
  //___Wires 
  wire signed [NB_OUTPUT-1:0] o_data_rotated_I;
  wire signed [NB_OUTPUT-1:0] o_data_rotated_Q;
  wire signed [NB_OUTPUT-1:0] o_data_wave_Cos;
  wire signed [NB_OUTPUT-1:0] o_data_wave_Sin;   


  ///////////////////////////////////////////
  // Bloque DSP
  ///////////////////////////////////////////

	top_tx
   #(
       .NB_OUTPUT  (NB_OUTPUT ),//! NB of output
       .NBF_OUTPUT (NBF_OUTPUT),//! NBF of output
       .NB_COEFF   (NB_COEFF  ),//! NB of Coefficients
       .NBF_COEFF  (NBF_COEFF ) //! NBF of Coefficients   
    )
    	u_top_tx
    		(
          .clock     (clockdsp),
          .i_reset   (o_reset ),
          .i_sw      (reg_i_sw),
          .o_led     (o_led   ),
          .o_firI    (o_FIRI  ),
          .o_firQ    (o_FIRQ  ),
          .o_Error_I (o_ErrorI),
          .o_Error_Q (o_ErrorQ),
          .o_bits_I  (o_BitI  ),
          .o_bits_Q  (o_BitQ  ) 
        );


	///////////////////////////////////////////////
	// top rotation
	/////////////////////////////////////////////// 

	top_rotation 
	#(
        .READ_DEPTH     (READ_DEPTH),
        .READ_WIDTH     (READ_WIDTH),
        .NB_OUTPUT  	(NB_OUTPUT	), 	//Bits output
        .NBF_OUTPUT 	(NBF_OUTPUT	), 	//Fractional bits output
        .NB_COEFF   	(NB_COEFF	), 	//Bits coef
        .NBF_COEFF  	(NBF_COEFF	) 	//Fractional bits coef
	)
		u_top_rotation
		(
		  .clock  	   (clockdsp), //Cambiar clock100 por clockdsp para simulacion//clockdsp
  		  .i_reset     (o_reset	),
	      .i_enable	   (reg_i_sw[0]),
  		  .i_dataI	   (o_FIRI		),
 		  .i_dataQ     (o_FIRQ		),
		  .i_pasoWave  (paso_wave	),	
		  .o_WaveCos   (o_data_wave_Cos),   
		  .o_WaveSin   (o_data_wave_Sin),  
		  .o_RotatedI  (o_data_rotated_I ), 
		  .o_RotatedQ  (o_data_rotated_Q )  
		  
		);

  ///////////////////////////////////////////
  // FSM RAM
  ///////////////////////////////////////////  
	
  logeo
    u_logeo
     (
      .clock      (clockdsp), //Cambiar clock100 por clockdsp para simulacion
      .En_logeo   (logeo[0]),
      .i_adress   (direccion),
      .En_read    (read),
      .datos_input(Dato_input),
      .i_reset    (i_reset),
      .o_dato     (Dato_output)
      );

  ///////////////////////////////////////////
  // MicroBlaze
  ///////////////////////////////////////////
	
  MicroGPIO
     u_MicroGPIO
     (
        .clock100         (clockdsp    ),  // Clock aplicacion
        .gpio_rtl_tri_i   (gpi0        ),  // GPIO
        .gpio_rtl_tri_o   (gpo0        ),  // GPIO
        .o_lock_clock     (locked      ),  // Senal Lock Clock        
        .reset            (in_reset    ),  // Hard Reset
        .sys_clock        (clock100    ),  // Clock de FPGA
        .usb_uart_rxd     (in_rx_uart  ),  // UART
        .usb_uart_txd     (out_tx_uart )   // UART
      );

  ///////////////////////////////////////////
  // VIO e ILA
  ///////////////////////////////////////////    

  VIO
    u_VIO
    (
     .clk_0         (clock100 ),
     .probe_out0_0  (i_reset  )
     );

  ila
   u_ila
    (
     .clk_0    (clock100), 
     .probe0_0 (o_FIRI),     
     .probe1_0 (o_FIRQ),
     .probe2_0 (o_data_rotated_I),     
     .probe3_0 (o_data_rotated_Q), 
     .probe4_0 (o_data_wave_Sin),     
     .probe5_0 (o_data_wave_Cos)                 
     );

  ///////////////////////////////////////////
  // RegisterFILE
  ///////////////////////////////////////////

  always @(posedge clock100) begin //Cambiar clock100 por clockdsp para simulacion
     if(i_reset == 1'b1) begin
        o_reset      <= 1'b1   ;
        reg_i_sw     <= 4'b0000;
        logeo        <= 2'b0   ;
        read         <= 1'b0   ;
        ErrorQ       <= 64'b0  ;
        ErrorI       <= 64'b0  ;
        BitQ         <= 64'b0  ;
        BitI         <= 64'b0  ;
        flag_E_B     <= 3 'b0  ;
        captura      <= 1'b0   ;
        flag_captura <= 1'b0   ;
        direccion    <= 32'b0  ;
        paso_wave    <= 4'b0   ;       
     end
     else begin   
        if(gpo0[23] == 1'b1)begin
            case (gpo0[31:24])
                8'b00000000: o_reset        <= gpo0[0]  ; // 0 Reset  
                8'b00000001: reg_i_sw[1:0]  <= gpo0[1:0]; // 1 enable filter TX y rotation
                8'b00000010: reg_i_sw[3:2]  <= gpo0[1:0]; // 2 selec fase 
                8'b00000011: begin
                             logeo          <= gpo0[1:0]; // 3 enable logueo
						     paso_wave      <= gpo0[11:8];   					// Seleccion de la frecuencia para rotacion
						     end								 
                8'b00000100: begin                          // 4 lectura de datos logeados 
                             read            <= gpo0[16];      
                             direccion[15:0] <= gpo0[15:0]; // Direcciones para avanzar en la RAM 
                             end
                8'b00000101: begin                           // 5 toma de datos de bits y filtros    
                             captura      <= gpo0[0]  ;
                             flag_captura <= captura  ;
                             end
                8'b00000110: flag_E_B      <= gpo0[2:0];     // 6 Lectura de los bits y los errores
           endcase


            if (salida_captura) begin
                ErrorQ <= o_ErrorQ;
                ErrorI <= o_ErrorI;
                BitQ   <= o_BitQ  ;
                BitI   <= o_BitI  ;
            end 
            
        end //Fin de if(gpo0[23] == 1'b1)
     end //Fin de else begin    
  end //Fin de always

//___Asignacion de las salidas___//

assign Dato_input      = (logeo == 2'b01) ? {8'b0, o_FIRQ, 8'b0, o_FIRI} : {8'b0, o_data_rotated_Q, 8'b0, o_data_rotated_I};    //VOLVER A LA NORMALIDAD                     
                           
assign gpi0            = (read == 1'b1) ? Dato_output : o_mux_ErrorBits; //Eleccion de la salida de datos
assign o_mux_ErrorBits = (flag_E_B == 3'b000) ? ErrorI[31:0] : (flag_E_B == 3'b001) ? ErrorI[63:32] :
                         (flag_E_B == 3'b010) ? BitI  [31:0] : (flag_E_B == 3'b011) ? BitI  [63:32] : //Bits y errores transmitidos
                         (flag_E_B == 3'b100) ? ErrorQ[31:0] : (flag_E_B == 3'b101) ? ErrorQ[63:32] :
                         (flag_E_B == 3'b110) ? BitQ  [31:0] :  BitQ  [63:32];

assign salida_captura  = ~flag_captura & captura; 
endmodule

//Register File Diagram
//|   0   | ||Reset||
//|   1   | ||Bit 0 Enable PRBS Enable FIR -- Bit 1 Enable Ber||
//|   2   | ||BIT 0 Y 1 FASE||
//|   3   | ||Enable de Logeo data filter or data rotate filter and pasos para rotation||
//|   4   | ||Enable de Lectura de Logeo|| 
//|   5   | ||bit 0 Enable Captura Error y Bits|| 
//|   6   | ||seleccion Error y Bits||

