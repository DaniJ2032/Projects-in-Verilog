/*____________EMULACION DEL COMPORTAMIENTO DEL SISTEMA_____________*/

`timescale 1ns/100ps

module tb_top ();

    //Parameters
    parameter NB_SW      = 4;
    parameter NB_COUNTER = 32;
    parameter NB_LEDS    = 4;

    //Vars
    wire [NB_LEDS-1 : 0] o_led;  //en la creacion de estimulos a diferencia de
    wire [NB_LEDS-1 : 0] o_led_b;//la instancia del modulo los write van a la salida   
    wire [NB_LEDS-1 : 0] o_led_g;//y los reg los conectamos a las entradas para dar los estimulos
    
    reg [NB_LEDS-1 : 0] i_sw;
    reg i_reset;    
    reg clock;        

    //Initial 
    initial begin
        clock       =   1'b0;
        i_reset     =   1'b0;
        i_sw        =   4'b0000;
        #40 i_reset =   1'b1;

        #10000000 i_sw    =   4'b0001;
        #10000000 i_sw    =   4'b0011;
        #10000000 i_sw    =   4'b0101;
        #10000000 i_sw    =   4'b0111;
        #10000000 i_sw    =   4'b1001;
        #40000000 $finish;            //Fin de finalizacion       
    end
    //Clock
    always #5 clock = ~clock;    

    top
    #(
        .NB_SW      (NB_SW),
        .NB_COUNTER (NB_COUNTER),
        .NB_LEDS    (NB_LEDS)
    )

    u_top
    (
        .o_led   (o_led),
        .o_led_b (o_led_b),
        .o_led_g (o_led_g),     //Realizo las conexiones
        .i_sw    (i_sw),
        .i_reset (i_reset),
        .clock   (clock)
    );

endmodule