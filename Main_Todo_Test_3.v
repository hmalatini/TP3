`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:14:32 11/23/2016
// Design Name:   Main
// Module Name:   D:/TP3_BIP_MOD/Main_Todo_Test_3.v
// Project Name:  TP3_BIP_MOD
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

module Main_Todo_Test_3;

	// Inputs
	reg clk;
	reg rx;
	reg reset;
	reg enable;

	// Outputs
	wire tx;
	wire led;
	wire led2;
	wire led3;
	wire led4;
	wire led5;
	wire led6;

	// Instantiate the Unit Under Test (UUT)
	Main uut (
		.clk(clk), 
		.rx(rx), 
		.reset(reset), 
		.tx(tx), 
		.led(led), 
		.led2(led2), 
		.led3(led3), 
		.led4(led4), 
		.led5(led5), 
		.enable(enable), 
		.led6(led6)
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
		#999999;
		
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
		
		#800000;
		
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
		
		#800000;
		
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
		
		#800000;
		
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
		
		#800000;
		
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
		
		#800000;
		
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
		
		#800000;
		
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
		
		#800000;
		
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
		
		#800000;
		
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
			clk = 1'b1;
			#(10/2) clk = 1'b0;
			#(10/2);
		end
      
endmodule