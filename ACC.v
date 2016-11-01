`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:32:04 10/31/2016 
// Design Name: 
// Module Name:    ACC 
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
module ACC(Entrada, clk, WrAcc, Clear, Salida);

input [15:0] Entrada;
input clk;
input WrAcc;
input Clear;
output reg [15:0] Salida = 0;

always @(posedge clk)
begin
	if(Clear == 1)
		begin
			Salida <= 16'b0;
		end
	if (WrAcc == 1)
		begin
			Salida <= Salida + Entrada;
		end
end

endmodule
