/*
Comment for multi-lines
*/

module top
#(
    parameter NB_SW      = 4 ,
    parameter NB_COUNTER = 32,
    parameter NB_LEDS    = 4
)
(
    //DESCOMENTAR SI NO SE USA VIVO
     output [NB_LEDS - 1 : 0] o_led  ,
     output [NB_LEDS - 1 : 0] o_led_b,
     output [NB_LEDS - 1 : 0] o_led_g,
     input  [NB_SW   - 1 : 0] i_sw,
     input  i_reset,
     input  clock       //EN EL USO DEL VIVO NO COMENTAR LA LINEA DEL CLOCK
     
);
    //PARA EL USO DEL VIVO. Se eliminan los puertpos fisicos de la placa
    //y se los conecta de manera virtual.
    //NOTA: Recordar modificr el constraint para evitar errores de sintesis

//    wire  [NB_LEDS - 1 : 0] o_led;
//    wire  [NB_LEDS - 1 : 0] o_led_b;
//    wire  [NB_LEDS - 1 : 0] o_led_g;
//    wire  [NB_SW   - 1 : 0] i_sw;
//    wire  i_reset;
//////////////////////

    //Vars
    wire                   connect_ctr2sr_valid;
    wire [NB_LEDS - 1 : 0] connect_oleds_to_mux;

    count
    #(
        .NB_SW      (NB_SW-1   ),
        .NB_COUNTER (NB_COUNTER)
    )
        u_count
        (
            .o_valid(connect_ctr2sr_valid),
            .i_sw   (i_sw[NB_SW-2:0]     ),
            .i_reset(~i_reset            ),
            .clock  (clock               )
        );

    shiftreg
    #(
        .NB_LEDS (NB_LEDS)
    )
        u_shiftreg
        (
            .o_led  (connect_oleds_to_mux),
            .i_valid(connect_ctr2sr_valid),
            .i_reset(~i_reset             ),
            .clock  (clock               )
        );

    //Output
    assign o_led   = connect_oleds_to_mux;
    assign o_led_g = (i_sw[3]==1'b0) ? connect_oleds_to_mux : 4'b0000;
    assign o_led_b = (i_sw[3]==1'b1) ? connect_oleds_to_mux : 4'b0000;

//    //Instanciacion del modulo virtual VIVO
//    vivo
//    u_vivo
//        (
//        .clk_0       (clock),
//        .probe_in0_0 (o_led),
//        .probe_in1_0 (o_led_g),
//        .probe_in2_0 (o_led_b),
        
//        .probe_out0_0(i_reset),
//        .probe_out1_0(i_sw) 
//        );
        
endmodule