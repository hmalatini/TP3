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
module ACC #(parameter DB = 16)(Entrada, clk, WrAcc, Clear, Salida);

input [DB-1:0] Entrada;
input clk;
input WrAcc;
input Clear;
output reg [DB-1:0] Salida = 0;

reg dos_clock = 1;

always @(posedge clk)
begin
	if(Clear == 1)
		begin
			Salida <= 16'b0;
		end
	if (WrAcc == 1)
		begin
			if (dos_clock == 1)
				begin
					Salida <= Entrada;
					dos_clock = 0;
				end
			else
				dos_clock = 1;
		end
end

endmodule
