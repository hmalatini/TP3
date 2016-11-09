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
module Program_Counter #(parameter AB = 11)(clk, address_bus, WrPC, Addr, start_bip);
//----------------------------------Entradas y Salidas-----------------------//
input clk;
input WrPC;
input [AB-1:0] address_bus;
input start_bip;
output reg [AB-1:0] Addr = 0;
//-----------------------------------Conectores------------------------------//
reg start = 1;
//--------------------------------------Logica-------------------------------//
always @(posedge clk)
	begin
		if (WrPC == 1)
			Addr = address_bus;
		if (start_bip == 1 & start == 1)
			begin
				Addr = Addr + 1;
				start = 0;
			end
	end

endmodule
