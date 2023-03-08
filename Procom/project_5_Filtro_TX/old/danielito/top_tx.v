module top_tx
#(
  parameter NB_OUTPUT  = 8, //! NB of output
  parameter NBF_OUTPUT = 6, //! NBF of output
  parameter NB_COEFF   = 8, //! NB of Coefficients
  parameter NBF_COEFF  = 6, //! NBF of Coefficients
  parameter NBAUDS     = 6 //! Baudios del filtro 
)
(
    input   clock,
    input   i_reset
);

  wire out_prbsI_to_fir;
  wire signed [NB_OUTPUT-1:0] out_data_fir;
  wire [2:0] counter_to_mux;
  wire valid_to_Prbs;

  wire out_data_shift_fase;
  wire out_ber_I_ok;

  counter
    u_counter
      (
        .clock    (clock),
        .i_reset  (~i_reset),
        .i_enable (1'b1),

        .o_counter_mux (counter_to_mux),  //Contador para el mux del FIR
        .o_validPrbs (valid_to_Prbs)      //Clock para PRBS y FIR
      );

  prbsQI
  u_prbsQI
    (
      .clock    (clock),
      .i_reset  (~i_reset),
      .i_enable (1'b1),
      .i_valid  (valid_to_Prbs),

      .o_PrbsI  (out_prbsI_to_fir)
    );

   filtro_fir
     #(
       .NB_OUTPUT  (NB_OUTPUT), //! NB of output
       .NBF_OUTPUT (NBF_OUTPUT), //! NBF of output
       .NB_COEFF   (NB_COEFF), //! NB of Coefficients
       .NBF_COEFF  (NBF_COEFF),  //! NBF of Coefficients
       .NBAUDS     (NBAUDS)
     )
     u_filtro_fir 
       (
         .clock        (clock),          //! Clock
         .i_reset      (~i_reset),      //! Reset
         .i_enable     (1'b1),          //! Enable
         .i_valid      (valid_to_Prbs),       
         .i_dataPrbs   (out_prbsI_to_fir), //! Input Sample
         .i_counterMux (counter_to_mux),

         .o_out_fir    (out_data_fir)      //! Output Sample
       );

    shiftFaseFir
      u_shiftFaseFir    
        (
          .clock        (clock),
          .i_reset      (~i_reset),
          .i_enable     (1'b1),
          .i_valid      (valid_to_Prbs),
          .i_fase       (2'b10),
          .i_os_data    (out_data_fir),

          .o_data_Fase  (out_data_shift_fase)
        );    

  BerCount 
    u_BerCount
    (
      .clock        (clock),   
      .i_reset      (~i_reset),
      .i_enable     (1'b1),
      .i_valid      (valid_to_Prbs),      
      .i_data_prbsI (out_prbsI_to_fir),
      .i_data_firI  (out_data_shift_fase),

      .o_Ber_ok     (out_ber_I_ok)
    );
    
endmodule
