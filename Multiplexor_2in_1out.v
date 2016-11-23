`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:29:19 10/31/2016 
// Design Name: 
// Module Name:    Multiplexor_2in_1out 
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
module Multiplexor_2in_1out #(parameter DB = 16)(DatoA, DatoB, Sel, Salida
    );

    input [DB-1:0] DatoA;
    input [DB-1:0] DatoB;
    input Sel;
    output reg [DB-1:0] Salida = 0;

//PARA TESTING

always @(*)
begin
	if(Sel == 1)
		begin
			Salida = DatoA;
		end
	else
		begin
			Salida = DatoB;
		end
end

endmodule
