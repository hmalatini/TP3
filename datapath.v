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
module datapath(SelA, SelB, WrAcc, Op, Clear, clk, Out_Data, In_Data, Addr
    );
//---------------------------Entradas y Salidas---------------------------------//
input [1:0] SelA;
input SelB;
input WrAcc;
input Op;
input Clear;
input clk;

input [15:0] Out_Data;
input [10:0] Addr;
output reg [15:0] In_Data;
//------------------------------- Conectores ----------------------------------//
wire salida_signalextension;
wire salida_ALU;
wire salida_mux1;
wire salida_mux2;
wire salida_acc;

reg operacion;
//--------------------------------Parametros------------------------------------//
parameter N=15;
//-------------------------------Uso de modulos---------------------------------//
Signal_Extension signalextension (Addr, salida_signalextension);
Multiplexor_3in_1out mux1 (salida_ALU, salida_signalextension, Out_Data, SelA, salida_mux1);
Multiplexor_2in_1out mux2 (salida_signalextension, Out_Data, SelB, salida_mux2);
ACC acumulador (salida_mux1, clk, WrAcc, Clear, salida_acc);
ALU #(N) alu (salida_acc, salida_mux2, operacion, salida_ALU);

//Para saber opearcion de ALU, si es suma o resta
always @(Op)
begin
	if (Op == 1)
		operacion <= 'b100000;
	else
		operacion <= 'b100010;
end

endmodule
