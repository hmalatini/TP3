`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:07:29 11/05/2016 
// Design Name: 
// Module Name:    Data_Memory 
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
module Data_Memory #(parameter AB = 11, parameter DB = 16) (RdRam, WrRam, Addr, In_Data, Out_Data);
//----------------------------------- Parametros --------------------------------//
//---------------------------------Entradas y Salidas----------------------------//
input RdRam;
input WrRam;
input [AB-1:0] Addr;
input [DB-1:0] In_Data;
output reg [DB-1:0] Out_Data;
//----------------------------------Conectores-----------------------------------//
reg [DB-1:0] Mem [0:2047]; //2048 palabras de 16 bits
integer i;
//------------------------------------Logica-------------------------------------//

//Para simulacion
initial
	begin
		Out_Data <= 0;
		for (i = 0; i < 2048; i = i + 1) 
			begin
				Mem[i] = i;
			end
	end

always@(RdRam, WrRam, Mem, In_Data, Addr)
	begin
		if(WrRam == 1)
			Mem[Addr] <= In_Data;
		else if(RdRam == 1)
			Out_Data <= Mem[Addr];
	end

endmodule
