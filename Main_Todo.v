`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:32:26 11/05/2016
// Design Name:   Main
// Module Name:   C:/Xilinx/tp3_bip/Main_Todo.v
// Project Name:  tp3_bip
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Main_Todo;

	// Inputs
	reg clk;

	// Instantiate the Unit Under Test (UUT)
	Main uut (
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		//#100;
        
		// Add stimulus here

	end
	
	always 
		begin //clock de 100 Mhz como el de la placa
			clk = 1'b0;
			#(50/2) clk = 1'b1;
			#(50/2);
		end
      
endmodule

