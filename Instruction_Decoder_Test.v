`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:22:24 11/03/2016
// Design Name:   Instruction_Decoder
// Module Name:   C:/Xilinx/tp3_bip/Instruction_Decoder_Test.v
// Project Name:  TP3_BIP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Instruction_Decoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Instruction_Decoder_Test;

	// Inputs
	reg [4:0] OpCode;

	// Outputs
	wire WrPC;
	wire [1:0] SelA;
	wire SelB;
	wire WrAcc;
	wire Op;
	wire WrRam;
	wire RdRam;

	// Instantiate the Unit Under Test (UUT)
	Instruction_Decoder uut (
		.OpCode(OpCode), 
		.WrPC(WrPC), 
		.SelA(SelA), 
		.SelB(SelB), 
		.WrAcc(WrAcc), 
		.Op(Op), 
		.WrRam(WrRam), 
		.RdRam(RdRam)
	);

	initial begin
		// Initialize Inputs
		OpCode = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		OpCode = 'b00001;
		#100;
		OpCode = 'b00010;
		#100;
		OpCode = 'b00011;
		#100;
		OpCode = 'b00100;
		#100;
		OpCode = 'b00101;
		#100;
		OpCode = 'b00111;
		#100;
		OpCode = 'b00001;
		#100;
	end
endmodule

