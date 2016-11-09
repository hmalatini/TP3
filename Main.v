`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:39:02 11/03/2016 
// Design Name: 
// Module Name:    Main 
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
module Main(clk/*, Out_Data, In_Data, Addr_DM, Data, Addr*/);
//----------------------------------- Parametros --------------------------------//
parameter AB = 11; //Address Bus
parameter DB = 16; //Data Bus
//---------------------------------Entradas y Salidas----------------------------//
//Del bloque Control Block
input clk;
//Del bloque Datapath
//----------------------------------Conectores-----------------------------------//
wire [1:0] SelA;
wire SelB;
wire WrAcc;
wire Op;
reg Clear = 0;
wire WrRam;
wire RdRam;
/*
	LO COMENTO PORQUE VOY A PONER TODO COMO SALIDA, PARA TESTEAR O VER ALGO EN LA PLACA.
	DE PASO PARA QUE DESAPAREZCA EL WARNING:
	"Hierarchical block <> is unconnected in block <>. It will be removed from the design"*/
wire [DB-1:0] Out_Data;
wire [DB-1:0] In_Data;
wire [AB-1:0] Addr_DM;
wire [DB-1:0] Data;
wire [AB-1:0] Addr;

/*output [DB-1:0] Out_Data;
output [DB-1:0] In_Data;
output [AB-1:0] Addr_DM;
output [DB-1:0] Data;
output [AB-1:0] Addr;
*/
//-----------------------------------Bloques-------------------------------------//
Control_Block #(AB) CB (clk, Data[4:0], SelA, SelB, WrAcc, Op, WrRam, RdRam, Addr);
Datapath #(AB, DB) DP (SelA, SelB, WrAcc, Op, Clear, clk, Out_Data, In_Data, Data[15:5], Addr_DM);
Data_Memory #(AB, DB) DM (RdRam, WrRam, Addr_DM, In_Data, Out_Data);
Program_Memory #(AB, DB) PM (Addr, Data);

endmodule
