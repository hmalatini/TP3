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
module Data_Memory #(parameter AB = 11, parameter DB = 16) (RdRam, WrRam, Addr, In_Data, clk, Out_Data);
//----------------------------------- Parametros --------------------------------//
//---------------------------------Entradas y Salidas----------------------------//
input RdRam;
input WrRam;
input [AB-1:0] Addr;
input [DB-1:0] In_Data;
input clk;
output reg [DB-1:0] Out_Data = 0;
//----------------------------------Conectores-----------------------------------//
reg [DB-1:0] Mem [0:100]; //2048 palabras de 16 bits
integer i;
//------------------------------------Logica-------------------------------------//

//Para simulacion
initial
	begin
		Out_Data <= 0;
		Mem[4] = 'b0011111111000000;
		Mem[0] = 'b0000000000000000;
		Mem[1] = 'b0000000000000000;
		Mem[2] = 'b0000000000000000;
		Mem[3] = 'b0000000000000000;
		Mem[5] = 'b0000000000000000;
		Mem[6] = 'b0000000000000000;
		Mem[7] = 'b0000000000000000;
		Mem[8] = 'b0000000000000000;
	end

always@(posedge clk)
	begin
		if(WrRam == 1)
			Mem[Addr] = In_Data;
		else if(RdRam == 1)
			Out_Data = Mem[Addr];
	end

endmodule
