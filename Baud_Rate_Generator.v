`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:14:47 10/10/2016 
// Design Name: 
// Module Name:    Baud_Rate_Generator 
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
module Baud_Rate_Generator #(parameter clk_Mhz=100, parameter baudrate=19200)(clk, tick
    );
	input clk;
	output reg tick = 0;

	integer ciclos_tick = (clk_Mhz*1000000)/(baudrate*16);
	integer contador = 0;
	
	always @(posedge clk)
		begin

			if (contador == ciclos_tick)
				contador = 0;
			
			if (contador == 0)
				tick = 1;
			else
				tick = 0;
			
			contador = contador + 1;
		end
		
endmodule
