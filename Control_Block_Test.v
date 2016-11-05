`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:55:45 11/03/2016
// Design Name:   Control_Block
// Module Name:   C:/Xilinx/tp3_bip/Control_Block_Test.v
// Project Name:  TP3_BIP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control_Block
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Control_Block_Test;

	// Inputs
	reg clk;
	reg [4:0] OpCode;

	// Outputs
	wire [1:0] SelA;
	wire SelB;
	wire WrAcc;
	wire Op;
	wire WrRam;
	wire RdRam;
	wire [10:0] Addr;

	// Instantiate the Unit Under Test (UUT)
	Control_Block uut (
		.clk(clk), 
		.OpCode(OpCode), 
		.SelA(SelA), 
		.SelB(SelB), 
		.WrAcc(WrAcc), 
		.Op(Op), 
		.WrRam(WrRam), 
		.RdRam(RdRam), 
		.Addr(Addr)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
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
	
	always 
		begin //clock de 100 Mhz como el de la placa
			clk = 1'b0;
			#(10/2) clk = 1'b1;
			#(10/2);
		end
      
endmodule

