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
module Control_Block(clk, OpCode, SelA, SelB, WrAcc, Op, WrRam, RdRam, Addr);
//----------------------------------- Parametros --------------------------------//
parameter bits_address = 10;
//---------------------------------Entradas y Salidas----------------------------//
//Del bloque Program Counter
input clk;
output [10:0] Addr;
//Del bloque Instruction Decoder
input [4:0] OpCode;
output [1:0] SelA;
output SelB;
output WrAcc;
output Op;
output WrRam;
output RdRam;
//Del bloque ALU
reg [10:0] increment = 1;
reg [5:0] operando_suma = 'b100000;
//----------------------------------Conectores-----------------------------------//
wire WrPC;
wire [10:0] address_output;
//-----------------------------------Bloques-------------------------------------//
ALU #(bits_address) alu_pc (Addr, increment, operando_suma, address_output);
Program_Counter #(bits_address) PC (clk, address_output, WrPC, Addr);
Instruction_Decoder ID (OpCode, WrPC, SelA, SelB, WrAcc, Op, WrRam, RdRam);

endmodule
