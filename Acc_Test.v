`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:29:41 11/01/2016
// Design Name:   ACC
// Module Name:   C:/Xilinx/tp3_bip/Acc_Test.v
// Project Name:  TP3_BIP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ACC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Acc_Test;

	// Inputs
	reg [15:0] Entrada;
	reg clk;
	reg WrAcc;
	reg Clear;

	// Outputs
	wire [15:0] Salida;

	// Instantiate the Unit Under Test (UUT)
	ACC uut (
		.Entrada(Entrada), 
		.clk(clk), 
		.WrAcc(WrAcc), 
		.Clear(Clear), 
		.Salida(Salida)
	);

	initial begin
		// Initialize Inputs
		Entrada = 0;
		clk = 0;
		WrAcc = 0;
		Clear = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		Clear = 0;
		WrAcc = 1;
		Entrada = 'b1100001100111111;
		
		clk = 1;
		#100;
		clk = 0;
		#100;
		
		Entrada = 'b0001001100100000;
		
		clk = 1;
		#100;
		clk = 0;
		#100;
		
		Entrada = 'b0001011100100110;
		
		clk = 1;
		#100;
		clk = 0;
		#100;
		
		Entrada = 'b0000000000000111;
		
		clk = 1;
		#100;
		clk = 0;
		#100;
		
		Clear = 1;
		
		clk = 1;
		#100;
		clk = 0;
		#100;
	end
     
endmodule

