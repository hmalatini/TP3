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
module Program_Counter #(parameter AB = 11)(clk, address_bus, WrPC, Addr, start_bip, led2);
//----------------------------------Entradas y Salidas-----------------------//
input clk;
input WrPC;
input [AB-1:0] address_bus;
input start_bip;
output reg [AB-1:0] Addr = 0;
//-----------------------------------Conectores------------------------------//
reg start = 1;

//PARA TESTING EN PLACA
output reg led2 = 0;
//--------------------------------------Logica-------------------------------//
always @(posedge clk) //El Program Counter coloca en Addr la direccion que se leerá en el próximo clock.
	begin					
		if (WrPC == 1)
			Addr = address_bus;
		else				//Entonces debemos anular los ultimos dos incrementos si la ultima instrucción ha sido un HLT(WrPC = 0)
			if (address_bus >= 2)
				Addr = address_bus - 1; //Listo!. El program memory no debia ir con CLOCK!, ese era el problema y con esto se soluciona.
		if (start_bip == 1 & start == 1)
			begin
				Addr = Addr + 1;
				start = 0;
				led2 = 1;
			end
	end

endmodule
