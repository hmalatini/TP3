`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:27:28 10/31/2016 
// Design Name: 
// Module Name:    Signal_Extension 
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
module Signal_Extension(
    input [10:0] Addr,
    output [15:0] Salida
    );
/*
input [15:0] a;  // 16-bit input
output [31:0] result; // 32-bit output
assign result = {{16{a[15]}}, {a[15:0]}};

The curly braces ('{' or '}') mean concatenation, from most significant bit (MSB) on the left down to 
the least significant bit (LSB) on the right. You are creating a 32-bit bus (result) whose 16 most 
significant bits consist of 16 copies of bit 15 (the MSB) of the a bus, and whose 16 least significant 
bits consist of just the a bus (this particular construction is known as sign extension, which is needed 
e.g. to right-shift a negative number in two's complement form and keep it negative rather than introduce 
zeros into the MSBits)
*/

assign Salida = {{5{Addr[10]}}, Addr};

endmodule
