`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:30:42 10/31/2016 
// Design Name: 
// Module Name:    Multiplexor_3in_1out 
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
module Multiplexor_3in_1out #(parameter DB = 16)(
    input [DB-1:0] DatoA,
    input [DB-1:0] DatoB,
    input [DB-1:0] DatoC,
    input [1:0] Sel,
    output reg [DB-1:0] Salida
    );

always @(*)
begin
	if(Sel == 2)
		Salida = DatoA;
	else if(Sel == 1)
		Salida = DatoB;
	else if(Sel == 0)
		Salida = DatoC;
end

endmodule
