`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:54:38 10/31/2016 
// Design Name: 
// Module Name:    Program_Counter 
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
module Program_Counter #(parameter AB = 11)(clk, address_bus, WrPC, Addr);
//----------------------------------Entradas y Salidas-----------------------//
input clk;
input WrPC;
input [AB-1:0] address_bus;
output reg [AB-1:0] Addr = 0;

//TESTING

//-----------------------------------Conectores------------------------------//

//--------------------------------------Logica-------------------------------//
always @(posedge clk) //El Program Counter coloca en Addr la direccion que se leerá en el próximo clock.
	begin					
		if (WrPC == 1)
			Addr <= address_bus;
		else
			Addr <= Addr;
	end

endmodule
