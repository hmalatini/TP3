`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:05:32 11/01/2016
// Design Name:   datapath
// Module Name:   C:/Xilinx/tp3_bip/datapath_Test.v
// Project Name:  TP3_BIP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: datapath
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module datapath_Test;

	// Inputs
	reg [1:0] SelA;
	reg SelB;
	reg WrAcc;
	reg Op;
	reg Clear;
	reg clk;
	reg [15:0] Out_Data;
	reg [10:0] Addr;

	// Outputs
	wire [15:0] In_Data;

	// Instantiate the Unit Under Test (UUT)
	datapath uut (
		.SelA(SelA), 
		.SelB(SelB), 
		.WrAcc(WrAcc), 
		.Op(Op), 
		.Clear(Clear), 
		.clk(clk), 
		.Out_Data(Out_Data), 
		.In_Data(In_Data), 
		.Addr(Addr)
	);

	initial begin
		// Initialize Inputs
		SelA = 0;
		SelB = 0;
		WrAcc = 0;
		Op = 0;
		Clear = 0;
		clk = 0;
		Out_Data = 0;
		Addr = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		//Primero testeamos que funcione el signal extension:
		Addr = 'b1010000011;
		#100;
		
		//Testeamos el multiplexor 3 in 1 out
		Out_Data = 'b0000000000001111;
		SelA = 1;
		#100;
		SelA = 2;
		#100;
		
		//Testeamos el multiplexor 2 in 1 out
		SelB = 1;
		#100;
		
		//Testeamos el acumulador
		WrAcc = 1;
		#300;
		WrAcc = 0;
		Clear = 1;
		#100;
		Clear = 0;
		#100;
		WrAcc = 1;
		#300;
		WrAcc = 0;

		
		//Testeamos la ALU
		Op = 1;
		#300;
		Op = 0;
		#300;
	end
	
	always 
		begin //clock de 100 Mhz como el de la placa
			clk = 1'b0;
			#(100/2) clk = 1'b1;
			#(100/2);
		end
      
endmodule

