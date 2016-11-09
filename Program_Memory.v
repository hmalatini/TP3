`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:06:22 11/05/2016 
// Design Name: 
// Module Name:    Program_Memory 
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
module Program_Memory #(parameter AB = 11, parameter DB = 16)(
    input [AB-1:0] Addr,
	 input clk,
    output reg [DB-1:0] Data
    );

//----------------------------------Conectores-----------------------------------//
reg [DB-1:0] Mem[0:2047]; //2048 palabras de 16 bits
integer i;
//------------------------------------Logica-------------------------------------//

//Para simulacion
initial
	begin
		/*for (i = 0; i < 2048; i = i + 1) 
			begin
				Mem[i] = i;
			end*/
		//Cargamos datos de prueba;
		Mem[0]= 'b0000001100000000;
		Mem[1]= 'b0000101100011000;
		Mem[2]= 'b0001001101100000;
		Mem[3]= 'b0001101101100010;
		Mem[4]= 'b0010001101100010;
		Mem[5]= 'b0010101100011000;
		Mem[6]= 'b0011001101100000;
		Mem[7]= 'b0011101101100010;
		Mem[8]= 'b0000001100000000;
	end

always @(posedge clk)
begin
	Data = Mem[Addr];
end
endmodule
