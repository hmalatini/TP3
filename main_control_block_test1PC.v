`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:54:43 11/01/2016
// Design Name:   main_control_block
// Module Name:   D:/TP3_BIP/main_control_block_test1PC.v
// Project Name:  TP3_BIP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main_control_block
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Control_Block_Test1PC;

	// Inputs
	reg clk;

	// Outputs
	wire [10:0] address_output;

	// Instantiate the Unit Under Test (UUT)
	Control_Block uut (
		.clk(clk), 
		.address_output(address_output)
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

