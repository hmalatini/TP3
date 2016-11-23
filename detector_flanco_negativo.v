`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:54:29 11/23/2016 
// Design Name: 
// Module Name:    detector_flanco_negativo 
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
module detector_flanco_negativo(clk, boton
    );
input clk;
input boton;

output reg salida = 0;

reg flipflopA = 0;
reg flipflopB = 0;
reg flipflopC = 0;
reg flipflopD = 0;

always @(posedge clk)
begin
		flipflopD = flipflopC;
		flipflopC = flipflopB;
		flipflopB = flipflopA;
		flipflopA = boton;
		
		if(flipflopA == 0 && flipflopB == 1 && flipflopC == 1 && flipflopD == 1)
			salida = 0;
end

endmodule
