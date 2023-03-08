module BER(
    input               clock      ,
    input               i_reset    ,
    input               i_enable   , 
    input               i_fir      ,
    input               i_prbs     ,
    input               i_valid    ,
    output              o_Min_error
    );
    
reg [1023:0] ber             ;
reg [63  :0] contador_errores;
reg [8   :0] contador_ber511 ;
reg [10  :0] sumatoria_exor  ;
reg [9   :0] contador_ber1024;
//reg          firaux          ;
reg          led_error       ;
reg [1023:0] posicion_optima ;
wire         exor            ;

always @(posedge clock) begin
    if (i_reset) begin
      ber              <= {1024{1'b0}}  ;
      contador_ber1024 <= 10'b0000000000;
      contador_ber511  <= 9 'b000000000 ;
      //firaux           <= 1 'b0         ;
      sumatoria_exor   <= 1 'b0         ;
      led_error        <= 1 'b0         ;
      posicion_optima  <= 1 'b0         ;
      
   end else if (i_enable) begin
      sumatoria_exor <= sumatoria_exor + exor;
      if (i_valid)begin
        contador_ber511  <= contador_ber511 + 1'b1;
        ber              <= {ber[1022:0],i_prbs}  ;
        end
      if (contador_ber511 == 9'b111111110 && i_valid) begin
          contador_ber511  <= {9{1'b0}}              ;
          contador_ber1024 <= contador_ber1024 + 1'b1;
          
          if (sumatoria_exor == 0)begin
              led_error       <= 1'b1            ;
              posicion_optima <= contador_ber1024;
          end 
          else begin
              sumatoria_exor  <= 0;
          end 
      end
   end        
end 

assign o_Min_error = led_error                     ;
assign exor        = i_fir  ^ ber[contador_ber1024];
endmodule
