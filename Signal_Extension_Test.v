`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:07:10 10/31/2016
// Design Name:   Signal_Extension
// Module Name:   C:/Xilinx/tp3_bip/Signal_Extension_Test.v
// Project Name:  TP3_BIP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Signal_Extension
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Signal_Extension_Test;

	// Inputs
	reg [10:0] Addr;

	// Outputs
	wire [15:0] Salida;

	// Instantiate the Unit Under Test (UUT)
	Signal_Extension uut (
		.Addr(Addr), 
		.Salida(Salida)
	);

	initial begin
		// Initialize Inputs
		Addr = 'b1000100010;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		Addr = 'b0111100010;
	end
      
endmodule

