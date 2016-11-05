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
module Program_Memory(
    input [10:0] Addr,
    output [15:0] Data
    );

//----------------------------------Conectores-----------------------------------//
reg [15:0] Mem[0:2047]; //2048 palabras de 16 bits
integer i;
//------------------------------------Logica-------------------------------------//

//Para simulacion
initial
	begin
		for (i = 0; i < 2048; i = i + 1) 
			begin
				Mem[i] = i;
			end
		//Cargamos datos de prueba;
		Mem[0]= 'b0110000000000001;
		Mem[1]= 'b0110001100000001;
		Mem[2]= 'b0110110000000010;
		Mem[3]= 'b0110110001000011;
		Mem[4]= 'b0110110001000100;
		Mem[5]= 'b0110001100000101;
		Mem[6]= 'b0110110000000110;
		Mem[7]= 'b0110110001000111;
	end

assign Data = Mem[Addr];

endmodule
