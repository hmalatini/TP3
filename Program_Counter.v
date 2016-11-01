`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:54:38 10/31/2016 
// Design Name: 
// Module Name:    Program_Counter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Program_Counter #(parameter bits_address=11)(clk, address_bus
    );
input clk;

output [bits_address-1:0] address_bus;

reg [bits_address-1:0] address_bus_reg = 0;
wire [bits_address-1:0] address_incremented;

reg [5:0] operando_suma = 'b100000;
reg [bits_address-1:0] increment = 1;

ALU #(bits_address) alu (address_bus, increment, operando_suma, address_incremented);
assign address_bus [bits_address-1:0] = address_bus_reg;

	always @(posedge clk)
	begin	
		address_bus_reg = address_incremented;
	end

endmodule
