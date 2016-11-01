`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:27:18 10/31/2016
// Design Name:   Multiplexor_2in_1out
// Module Name:   C:/Xilinx/tp3_bip/Mux_2in_1out_Test.v
// Project Name:  TP3_BIP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Multiplexor_2in_1out
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Mux_2in_1out_Test;

	// Inputs
	reg [15:0] DatoA;
	reg [15:0] DatoB;
	reg Sel;

	// Outputs
	wire [15:0] Salida;

	// Instantiate the Unit Under Test (UUT)
	Multiplexor_2in_1out uut (
		.DatoA(DatoA), 
		.DatoB(DatoB), 
		.Sel(Sel), 
		.Salida(Salida)
	);

	initial begin
		// Initialize Inputs
		DatoA = 'b1100110011001100;
		DatoB = 'b1111111100000000;
		Sel = 0;
	
		// Wait 100 ns for global reset to finish
		#500;
        
		// Add stimulus here
		
		Sel = 1;
	end
      
endmodule

