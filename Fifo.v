`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:03:56 10/11/2016 
// Design Name: 
// Module Name:    Fifo 
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
module Fifo #(parameter DBIT=8)(w_data, rd, wr, r_data, full, empty, clk
    );
input [DBIT-1:0] w_data;
input rd, clk;
input wr;

output reg [DBIT-1:0] r_data = 'b00111100;
output reg full = 0;
output reg empty = 1;

reg [DBIT-1:0] dato [0:2];
integer cantidad_datos = 0;

always @(posedge clk)
begin
	if (wr)
	begin
		if(!full)
		begin
			cantidad_datos = cantidad_datos + 1;
			dato [cantidad_datos - 1]= w_data;
		end
	end
	
	if (rd)
	begin
		if (!empty) //Si no esta vacia la pila, envio el dato de la pila
		begin
			r_data = dato [cantidad_datos - 1];
			cantidad_datos = cantidad_datos - 1;
		end
	end
end

always @(cantidad_datos)
begin
	if(cantidad_datos == 0)
		empty = 1;
	else
		empty = 0;

	if(cantidad_datos == 3)
		full = 1;
	else
		full = 0;
end

endmodule
