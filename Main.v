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
module Main(clk);
//----------------------------------- Parametros --------------------------------//
//parameter bits_address = 11;
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
wire [15:0] Out_Data;
wire [15:0] In_Data;
wire [10:0] Addr_DM;
wire [15:0] Data;
wire [10:0] Addr;
//-----------------------------------Bloques-------------------------------------//
Control_Block CB (clk, Data[4:0], SelA, SelB, WrAcc, Op, WrRam, RdRam, Addr);
Datapath DP (SelA, SelB, WrAcc, Op, Clear, clk, Out_Data, In_Data, Data[15:5], Addr_DM);
Data_Memory DM (RdRam, WrRam, Addr_DM, In_Data, Out_Data);
Program_Memory PM (Addr, Data);

endmodule
