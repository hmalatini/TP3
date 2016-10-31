`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:01 10/31/2016 
// Design Name: 
// Module Name:    datapath 
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
module datapath(SeIA, SeIB, WrAcc, Op, Out_Data, In_Data, Addr
    );
input [1:0] SeIA;
input SeIB;
input WrAcc;
input Op;

input [15:0] Out_Data;
output reg [15:0] In_Data;
output reg [10:0] Addr;


endmodule
