`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:51:10 10/31/2016 
// Design Name: 
// Module Name:    main_control_block 
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
module Control_Block(clk, OpCode, SelA, SelB, WrAcc, Op, WrRam, RdRam, address_output);
//----------------------------------- Parametros --------------------------------//
parameter bits_address = 11;
//---------------------------------Entradas y Salidas----------------------------//
//Del bloque Program Counter
input clk;
output [bits_address-1:0] address_output;
//Del bloque Instruction Decoder
input [4:0] OpCode;
output [1:0] SelA;
output SelB;
output WrAcc;
output Op;
output WrRam;
output RdRam;
//----------------------------------Conectores-----------------------------------//
wire WrPC;
//-----------------------------------Bloques-------------------------------------//
Program_Counter #(bits_address) PC (clk, address_output, WrPC);
Instruction_Decoder ID (OpCode, WrPC, SelA, SelB, WrAcc, Op, WrRam, RdRam);

endmodule
