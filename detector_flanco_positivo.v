`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:21:20 10/14/2016 
// Design Name: 
// Module Name:    detector_flanco_positivo 
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
module detector_flanco_positivo(clk, boton, salida
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
		
		if(flipflopA == 1 && flipflopB == 0 && flipflopC == 0 && flipflopD == 0)
			salida = 1;
		else if (flipflopA == 0 && flipflopB == 1 && flipflopC == 1 && flipflopD == 1)
			salida = 0;
end

endmodule
