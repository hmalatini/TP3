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
module Main(clk, rx, reset, tx, rx_empty, tx_full);
//----------------------------------- Parametros --------------------------------//
parameter AB = 11; //Address Bus
parameter DB = 16; //Data Bus
//---------------------------------Entradas y Salidas----------------------------//
//Del bloque Control Block
input clk;
//Del bloque Datapath
//Para debugger con UART
input rx;
input reset; 
output tx;
output rx_empty;
output tx_full;
//----------------------------------Conectores-----------------------------------//
wire [1:0] SelA;
wire SelB;
wire WrAcc;
wire Op;
reg Clear = 0;
wire WrRam;
wire RdRam;
wire [DB-1:0] Out_Data;
wire [DB-1:0] In_Data;
wire [AB-1:0] Addr_DM;
wire [DB-1:0] Data;
wire [AB-1:0] Addr;
//Para debugger con UART
wire wr_uart;
wire start_bip;
//-----------------------------------Bloques-------------------------------------//
Control_Block #(AB) CB (clk, Data[15:11], SelA, SelB, WrAcc, Op, WrRam, RdRam, Addr, start_bip, wr_uart);
Datapath #(AB, DB) DP (SelA, SelB, WrAcc, Op, Clear, clk, Out_Data, In_Data, Data[10:0], Addr_DM);
Data_Memory #(AB, DB) DM (RdRam, WrRam, Addr_DM, In_Data, clk, Out_Data);
Program_Memory #(AB, DB) PM (Addr, clk, Data);
//Para debuggear
UART Uart (rx, clk, reset, tx, rx_empty, tx_full, In_Data, wr_uart, start_bip);

endmodule
