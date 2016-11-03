`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:34:19 10/31/2016
// Design Name:   Multiplexor_3in_1out
// Module Name:   C:/Xilinx/tp3_bip/Mux_3in_1out_Test.v
// Project Name:  TP3_BIP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Multiplexor_3in_1out
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Mux_3in_1out_Test;

	// Inputs
	reg [15:0] DatoA;
	reg [15:0] DatoB;
	reg [15:0] DatoC;
	reg [1:0] Sel;

	// Outputs
	wire [15:0] Salida;

	// Instantiate the Unit Under Test (UUT)
	Multiplexor_3in_1out uut (
		.DatoA(DatoA), 
		.DatoB(DatoB), 
		.DatoC(DatoC), 
		.Sel(Sel), 
		.Salida(Salida)
	);

	initial begin
		// Initialize Inputs
		DatoA = 'b1111000011110000;
		DatoB = 'b1111111100000000;
		DatoC = 'b1100000000000011;
		Sel = 0;

		// Wait 100 ns for global reset to finish
		#300;
        
		// Add stimulus here
		Sel = 1;
		#300;
		
		Sel = 2;
		#100;
		Sel = 3;
	end
      
endmodule

