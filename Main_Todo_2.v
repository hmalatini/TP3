`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:48:48 11/09/2016
// Design Name:   Main
// Module Name:   C:/Xilinx/tp3_bip/Main_Todo_2.v
// Project Name:  TP3_BIP
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

module Main_Todo_2;

	// Inputs
	reg clk;
	reg rx;
	reg reset;

	// Outputs
	wire tx;
	wire rx_empty;
	wire tx_full;

	// Instantiate the Unit Under Test (UUT)
	Main uut (
		.clk(clk), 
		.rx(rx), 
		.reset(reset), 
		.tx(tx), 
		.rx_empty(rx_empty), 
		.tx_full(tx_full)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rx = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		rx = 1;
		#52083.34;
		rx = 0;//start bit
		#52083.34;
		rx = 1;
		#52083.34;
		rx = 0;
		#52083.34;
		rx = 0;
		#52083.34;
		rx = 0;
		#52083.34;
		rx = 0;
		#52083.34;
		rx = 0;
		#52083.34;
		rx = 0;
		#52083.34;
		rx = 0;
		#52083.34;
		rx = 1;//stop bit
		#52083.34;
		
	end
	
	always 
		begin 
			clk = 1'b0;
			#(10/2) clk = 1'b1;
			#(10/2);
		end
      
endmodule

