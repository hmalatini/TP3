`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:01 10/31/2016 
// Design Name: 
// Module Name:    datapath 
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
module Datapath #(parameter AB = 11, parameter DB = 16) (SelA, SelB, WrAcc, Op, Clear, clk, Out_Data, In_Data, Addr, Addr_DM);
//--------------------------------Parametros------------------------------------//
//---------------------------Entradas y Salidas---------------------------------//
input [1:0] SelA;
input SelB;
input WrAcc;
input Op;
input Clear;
input clk;
input [DB-1:0] Out_Data;
input [AB-1:0] Addr;
output reg [DB-1:0] In_Data = 3;
output reg [AB-1:0] Addr_DM;
//------------------------------- Conectores ----------------------------------//
wire [DB-1:0] salida_signalextension;
wire [DB-1:0] salida_ALU;
wire [DB-1:0] salida_mux1;
wire [DB-1:0] salida_mux2;
wire [DB-1:0] salida_acc;
reg [5:0] operacion;

//PARA TESTING

//-------------------------------Uso de modulos---------------------------------//
Signal_Extension #(AB, DB) signalextension (Addr, salida_signalextension);
Multiplexor_3in_1out #(DB) mux1 (salida_ALU, salida_signalextension, Out_Data, SelA, salida_mux1);
Multiplexor_2in_1out #(DB) mux2 (salida_signalextension, Out_Data, SelB, salida_mux2);
ACC #(DB) acumulador (salida_mux1, clk, WrAcc, Clear, salida_acc);
ALU #(DB) alu (salida_acc, salida_mux2, operacion, salida_ALU);
//-----------------------------------Logica-------------------------------------//

//Para saber opearcion de ALU, si es suma o resta
always @(Op)
begin
	if (Op == 1)
		operacion <= 'b100000;
	else
		operacion <= 'b100010;
end

always @(Addr)
begin
	Addr_DM = Addr;
end

always @(salida_acc)
begin
	In_Data = salida_acc;
end

endmodule
