`timescale 1ns / 1ps
module tb_prueba();

reg           clock;
reg           reset;
reg  [31 : 0] gpo0;
wire [31 : 0] gpi0;
integer i;


//Initial 
    initial begin
        clock       =   1'b0   ;
        reset       =   1'b1   ;
        #1000;                  //1us
        reset       =   1'b0   ;  


//logeo[1:0] -->	logeo = 2'b01 datos de filtro
//					logeo = 2'b11 datos rotados
//					logeo = 2'b11 revisar gpo0[7:4] donde vendra el paso a dar para las ondas de sin y cos 
//                                donde el paso va desde 0x0 hasta 0xA    
//Tramas
        gpo0    =   32'h00800000;   //reset  #PROBAR EN EL CAMBIO DE PASOS
        #1000;                 
        gpo0    =   32'h00800001;   //fin de reset  
        #1000;  
                   
        gpo0    =   32'h01800003;  //prende el filtro por completo
        #4000;
                   
                          
        gpo0    =   32'h03800A00;   //Set pasos
        #5000 
        gpo0    =   32'h00800000;   //reset  
        #1000;                 
        gpo0    =   32'h00800001;   //fin de reset 
        #1000; 
        
        gpo0    =   32'h03800A03;   //Set pasos
        #100000;
              
        gpo0    =   32'h03800A00; //Logueo para la RAM Datos rotados  y paso 0   
        #30000;
            
 
      for (i=0; i<32000; i=i+1) begin   //Lectura de RAM
        gpo0 = 32'h04800003;
        #10000;
        gpo0 = 32'h04800002;
        #10000;               
       end 
                                      
    end

    //Clock
    always #5 clock = ~clock;    
 
top
   u_top
    (
        .clockdsp (clock),     
        .gpo0     (gpo0),  
        .gpi0     (gpi0),   
        .i_reset  (reset)       
    );

endmodule
