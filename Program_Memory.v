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
    output [DB-1:0] Data
    );

//----------------------------------Conectores-----------------------------------//
reg [DB-1:0] Mem[0:100]; //2048 palabras de 16 bits
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
		Mem[1]= 'b0000100000000001;
		Mem[2]= 'b0001000000000010;
		Mem[3]= 'b0001100000000011;
		Mem[4]= 'b0010000000000100;
		Mem[5]= 'b0010100000000101;
		Mem[6]= 'b0011000000000110;
		Mem[7]= 'b0011100000000111;
		Mem[8]= 'b0000001100000000;
		Mem[9]= 'b0000100000000001;
	end

//always @(posedge clk)
//begin
	assign Data [DB-1:0] = Mem[Addr];
//end
endmodule
