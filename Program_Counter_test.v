`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:31:20 11/01/2016
// Design Name:   Program_Counter
// Module Name:   D:/TP3_BIP/Program_Counter_test.v
// Project Name:  TP3_BIP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Program_Counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Program_Counter_test;

	// Inputs
	reg clk;

	// Outputs
	wire [10:0] address_bus;

	// Instantiate the Unit Under Test (UUT)
	Program_Counter uut (
		.clk(clk), 
		.address_bus(address_bus)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
    
	always 
		begin //clock de 100 Mhz como el de la placa
			clk = 1'b0;
			#(10/2) clk = 1'b1;
			#(10/2);
		end
		
		
endmodule

