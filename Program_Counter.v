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
module Program_Counter #(parameter bits_address=10)(clk, address_bus, WrPC, Addr);
//----------------------------------Entradas y Salidas-----------------------//
input clk;
input WrPC;
input [10:0] address_bus;
output reg [10:0] Addr = 0;
//-------------------------------------Conectores----------------------------//
/*reg [10:0] address_bus_reg = 0;
reg [10:0] address_incremented = 0;
reg [5:0] operando_suma = 'b100000;
reg [10:0] increment = 1;*/
//--------------------------------------Bloques------------------------------//
//ALU #(bits_address) alu (address_bus, increment, operando_suma, address_incremented);

//--------------------------------------Logica-------------------------------//
//assign address_bus = address_bus_reg;

	always @(posedge clk)
	begin
		if (WrPC == 1)
			Addr = address_bus;
	end

endmodule
