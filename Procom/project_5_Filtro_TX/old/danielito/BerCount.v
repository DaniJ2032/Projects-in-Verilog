module BerCount (
    input clock,   
    input i_reset,
    input i_enable,
    input i_valid,      
    input signed i_data_prbsI,
    input signed i_data_firI,
    output  o_Ber_ok
);
    
    reg [1023:0] ShiftRegBer;    
    reg [8:0] counterBer;    //contador de 9 bits
    reg [8:0] acum_result;
    // reg aux;
    reg RegFirI ;
    integer ptr;            //para moverme en el ShiftRegBer


    always @(posedge clock) begin

        if(i_reset)begin
            counterBer  <= 9'b000000000;   
        end
        else if (i_enable && i_valid) begin

            if (counterBer < 9'b111111110) begin    //menor a 511
                counterBer <= counterBer + 9'b000000001;
            end
            else counterBer <= 9'b000000000;
        end
        else begin
            counterBer <= counterBer;
        end    
    end

    always @(posedge clock) begin
        if(i_reset)begin
            acum_result <= 0;
            ShiftRegBer <= {1023{1'b0}}; 
            ptr = 0;
            RegFirI <= 0;

        end
        else if(counterBer<9'b111111110 && i_valid && i_enable ) begin


           ShiftRegBer <= {ShiftRegBer[1022:0],i_data_prbsI};    

        //    RegFirI <= i_data_firI;
           acum_result <= i_data_firI+ {8'b00000000,(RegFirI ^ ShiftRegBer[ptr])};

        end
        else if (counterBer==9'b111111110 && i_valid && i_enable) begin
            acum_result <= 9'b000000000;
            ptr = ptr+1;
        end
        else acum_result <= acum_result;
        if (ptr == 1023 ) ptr <= 0;
    end

    assign o_Ber_ok = (counterBer==9'b111111110 && acum_result == 0) ? 1'b1 : 1'b0;

endmodule