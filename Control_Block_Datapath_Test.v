`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:41:05 11/04/2016
// Design Name:   Main
// Module Name:   C:/Xilinx/tp3_bip/Control_Block_Datapath_Test.v
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

module Control_Block_Datapath_Test;

	// Inputs
	reg clk;
	reg [15:0] Data;
	reg [15:0] Out_Data;

	// Outputs
	wire [10:0] Addr;
	wire WrRam;
	wire RdRam;
	wire [10:0] Addr_DM;
	wire [15:0] In_Data;

	// Instantiate the Unit Under Test (UUT)
	Main uut (
		.clk(clk), 
		.Addr(Addr), 
		.Data(Data), 
		.WrRam(WrRam), 
		.RdRam(RdRam), 
		.Addr_DM(Addr_DM), 
		.In_Data(In_Data), 
		.Out_Data(Out_Data)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		Data = 0;
		Out_Data = 'b0000111100001111;

		// Wait 100 ns for global reset to finish
		#100;
      Out_Data = 16'b1;
		// Add stimulus here
		Data = 'b0001111110100000; //HLT
		#100;
		Data = 'b0001111110100001; //STR
		#100;
		Data = 'b0001111110100010; //LD
		#100;
		Data = 'b0001111110100001; //STR
		#100;
		/*Data = 'b0001111110100011; //LDI
		#100;
		Data = 'b0001111110100100; //ADD
		#100;
		Data = 'b0001111110100101; //ADDI
		#100;
		Data = 'b0001111110100001; //STR
		#100;
		Data = 'b0001111110100110; //SUB
		#100;
		Data = 'b0001111110100111; //SUBI*/

	end
	
	always 
		begin //clock de 100 Mhz como el de la placa
			clk = 1'b0;
			#(10/2) clk = 1'b1;
			#(10/2);
		end
      
endmodule

