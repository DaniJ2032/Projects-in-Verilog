`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:06:04 09/08/2021 
// Design Name: 
// Module Name:    FlipFlopJK 
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
module FlipFlopJK(
    input J,
    input K,
    input Ck,
    input Reset,
    output Q,
    output Qn
    );
	 
	reg Qint;
	always @(posedge Ck, posedge Reset) //Reset modo asincrono, Flanco ascendente del clock
	begin
		if(Reset == 1)
			Qint <= 1'b0; //con inj fi else sintetizamos un flip flop
		else   			  //partiendo de un tipo D asociando una logica convinacional	
			Qint <= ((J & (~Qint)) || ((~K) & Qint)); //Logica del Flip Flop
		end	
		assign Q = Qint;
		assign Qn = ~Qint;  

endmodule
