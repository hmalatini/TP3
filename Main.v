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
module Main(clk, Addr, Data, WrRam, RdRam, Addr_DM, In_Data, Out_Data);
//----------------------------------- Parametros --------------------------------//
//parameter bits_address = 11;
//---------------------------------Entradas y Salidas----------------------------//
//Del bloque Control Block
input clk;
input [15:0] Data;
output [10:0] Addr;
output WrRam;
output RdRam;
//Del bloque Datapath
input [15:0] Out_Data;
output [15:0] In_Data;
output [10:0] Addr_DM;
//----------------------------------Conectores-----------------------------------//
wire [1:0] SelA;
wire SelB;
wire WrAcc;
wire Op;
reg Clear = 0;
//-----------------------------------Bloques-------------------------------------//
Control_Block CB (clk, Data[4:0], SelA, SelB, WrAcc, Op, WrRam, RdRam, Addr);
Datapath DP (SelA, SelB, WrAcc, Op, Clear, clk, Out_Data, In_Data, Data[15:5], Addr_DM);

endmodule
