`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:27:28 10/31/2016 
// Design Name: 
// Module Name:    Signal_Extension 
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
module Signal_Extension #(parameter AB = 11, parameter DB = 16) (Addr, Salida
    );

    input [AB-1:0] Addr;
    output [DB-1:0] Salida;

assign Salida = {{DB-AB{Addr[AB-1]}}, Addr};
/*always@(*)
	begin
		Salida = Addr;
	end*/
	
endmodule
