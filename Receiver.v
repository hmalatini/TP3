`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:15:24 10/10/2016 
// Design Name: 
// Module Name:    Receiver 
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
module Receiver #(parameter DBIT=8, parameter SB_TICK=16)(s_tick, rx, dout, rx_done_tick, reset, clk
    );

	input s_tick, rx, reset, clk;
	output reg rx_done_tick;
	output reg [(DBIT-1):0] dout = 'b00000000;
	
	reg [3:0] s_reg = 'b0000; //Contador de los "s_tick" de entrada (que provienen del Baud_Rate_Generator)
	reg [3:0] s_next = 'b0000;
	reg [2:0] n_reg = 'b000; //Contador de la cantidad de datos que se recibieron hasta el momento
	reg [2:0] n_next = 'b000;
	/*s_next y n_next son utilizados para hacer mas entendible la máquina de estado, actualizando las variables 
	al inicio de cada clock en el always */
	
	reg [7:0] b_reg = 0; //Donde se irá almacenando los datos que se van recibiendo en el orden correspondiente (con shifts)
	reg [7:0] b_next = 0; 

//POR CUESTIONES DE TETING LO PONEMOS COMO OUTPUT. (SACAR "output" y el parametro en el modulo cuando ya no es lo use)	
	reg [3:0] state;
	reg [3:0] nextState; //Tendremos 4 estados y utilizaremos 4 bits para usar la lógica "One Hot - One Cold".
	
			//Declaramos los 4 estados que tendremos
			parameter idle = 4'b0001;
			parameter start = 4'b0010;
			parameter data = 4'b0100;
			parameter stop = 4'b1000;
	
	//Bandera que me indica que estamos en el bit de stop
	reg stop_bit = 0;
	
// Asignación del siguiente estado
   always @(posedge clk)
	begin
/*		if(dout != 0)//Agregado para que la salida de lo recibido dure solo un clock
			dout = 0;*/
	
		rx_done_tick = 0;
		if (s_tick == 1)
		begin
	//-------------------------------------------------------------
	//Asignación síncrona: Actualización del estado y las variables		
			if(reset == 1) 
				state = idle;
			else 
				begin
					n_reg = n_next;
					s_reg = s_next;
					b_reg = b_next;
					state = nextState;
				end
	//-------------------------------------------------------------			
			case(state)
			idle:  //
				if (rx == 0) 
					begin //Debo resetear todos los registros usados antes de cada lectura
						s_next = 0;
						n_next = 0;
						b_next = 0;
						nextState = start;
					end
				else 
					nextState = idle;
			start:  //
				if (s_reg == 7) 
					begin
						n_next = 0;
						s_next = 0;
						nextState = data;
					end
				else 
					begin
						s_next = s_reg + 1;
						nextState = start;
					end
			data:
				if (n_reg == (DBIT-1) && s_reg == 15) 
					begin
						nextState = stop;
					end
				else
					begin
						nextState = data;
					end
			stop:
				if (s_reg == (SB_TICK-1) && stop_bit == 0) 
					begin
						dout = b_reg;
						rx_done_tick = 1;
						s_next = 0;
						stop_bit = 1;
					end
				else
					begin
						s_next = s_reg + 1;
							if (s_reg == 7 && stop_bit == 1)
								begin
									s_next = 0;
									nextState = idle;
									stop_bit = 0;
								end
							else
								nextState = stop;
					end
				
			default: nextState = idle;
			endcase

	//---------------------------------------------------------------------		
	// Operaciones segun el estado actual		
			if(state == idle);
			else if(state == start);
			else if(state == data) 
				begin
					if (s_reg == 15)
						begin
							n_next = n_reg + 1;
							s_next = 0;
							b_next = b_reg >> 1;
							b_next [7] = rx;
						end
					else
						s_next = s_reg + 1;
				end
			else if(state == stop);
	//---------------------------------------------------------------------			
		end
	end

endmodule
