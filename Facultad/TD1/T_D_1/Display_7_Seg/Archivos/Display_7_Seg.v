`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:00:07 11/10/2021 
// Design Name: 
// Module Name:    Display_7_Seg 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Display_7_Seg(

    input [0:3] Entradas,
    input [0:1] LT_BI,
    input LE,
    output reg [0:6] Salida
    );
	 
reg [0:6] salida_dec;
reg [0:6] mux;
//reg [0:6] Display = 7'b0000000;
//
//assign Salida[0] = Display[0];
//assign Salida[1] = Display[1];
//assign Salida[2] = Display[2];
//assign Salida[3] = Display[3];
//assign Salida[4] = Display[4];
//assign Salida[5] = Display[5];
//assign Salida[6] = Display[6];


always @(Entradas)
	begin
		case(Entradas)
			4'b0000: salida_dec = 7'b0111111; //0
			4'b0001: salida_dec = 7'b0000110; //1
			4'b0010: salida_dec = 7'b1011011; //2
			4'b0011: salida_dec = 7'b1001111; //3
			4'b0100: salida_dec = 7'b1100110; //4
			4'b0101: salida_dec = 7'b1101101; //5
			4'b0110: salida_dec = 7'b1111101; //6
			4'b0111: salida_dec = 7'b0000111; //7
			4'b1000: salida_dec = 7'b1111111; //8
			4'b1001: salida_dec = 7'b1101111; //9
			default: salida_dec=0;
		endcase 
	end

always @(salida_dec,mux,LT_BI)
	begin
      	case(LT_BI)
         		2'b00: mux = 7'b1111111;
         		2'b01: mux = 7'b1111111;
         		2'b10: mux = 7'b0000000;
         		2'b11: mux = salida_dec;
      	endcase
	end
		
always @(mux,Salida,LE)
	begin
      	case(LE)
			0:Salida=mux;
			1:Salida=Salida;
		endcase
	end

endmodule

