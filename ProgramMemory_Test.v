`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:12:41 11/05/2016
// Design Name:   Program_Memory
// Module Name:   C:/Xilinx/tp3_bip/ProgramMemory_Test.v
// Project Name:  TP3_BIP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Program_Memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ProgramMemory_Test;

	// Inputs
	reg [10:0] Addr;

	// Outputs
	wire [15:0] Data;

	// Instantiate the Unit Under Test (UUT)
	Program_Memory uut (
		.Addr(Addr), 
		.Data(Data)
	);

	initial begin
		// Initialize Inputs
		Addr = 0;

		// Wait 100 ns for global reset to finish
		#225;
        
		// Add stimulus here
		Addr = 1;
		#225;
		Addr = 2;
		#225;
		Addr = 3;
		#225;
	end
      
endmodule

