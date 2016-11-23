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
module Fifo #(parameter DBIT=8)(data_high, data_low, rd, wr, r_data, empty, clk
    );
//input [DBIT-1:0] w_data;
input [DBIT-1:0] data_high;
input [DBIT-1:0] data_low;
input rd, clk;
input wr;

output reg [DBIT-1:0] r_data = 'b00000000;
reg full = 0;
output reg empty = 1;

reg [DBIT-1:0] dato [0:1];
integer cantidad_datos = 0;

//TESTING

always @(posedge clk)
begin
	if (wr)
	begin
		if(!full)
		begin
			dato [0] = data_low;
			dato [1] = data_high;
			cantidad_datos = cantidad_datos + 2;
			//dato [cantidad_datos - 1]= w_data;
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
	
	if(cantidad_datos == 0)
		begin
			empty = 1;
		end	
	else if(cantidad_datos == 2)
		begin
			full = 1;
			empty = 0; //Bandera para comenzar a transmitir una vez que se hayan cargado los dos valores
		end
	else
		begin
			full = 0;
		end
end

endmodule
