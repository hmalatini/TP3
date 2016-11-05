`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:25:46 11/05/2016
// Design Name:   Data_Memory
// Module Name:   C:/Xilinx/tp3_bip/DataMemory_Test.v
// Project Name:  TP3_BIP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Data_Memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DataMemory_Test;

	// Inputs
	reg RdRam;
	reg WrRam;
	reg [10:0] Addr;
	reg [15:0] In_Data;

	// Outputs
	wire [15:0] Out_Data;

	// Instantiate the Unit Under Test (UUT)
	Data_Memory uut (
		.RdRam(RdRam), 
		.WrRam(WrRam), 
		.Addr(Addr), 
		.In_Data(In_Data), 
		.Out_Data(Out_Data)
	);

	initial begin
		// Initialize Inputs
		RdRam = 0;
		WrRam = 0;
		Addr = 0;
		In_Data = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here
		Addr = 'b11111111111;
		RdRam = 1;
		#300;
		RdRam = 0;
		
		In_Data = 'b1111111100000000;
		Addr = 'b00000000111;
		WrRam = 1;
		#300;
		WrRam = 0;
	end
      
endmodule

