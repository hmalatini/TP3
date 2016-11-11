`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:47:08 10/10/2016 
// Design Name: 
// Module Name:    Transmitter 
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
module Transmitter #(parameter DBIT=8, parameter SB_TICK=16)(s_tick, tx, din, tx_done_tick, reset, tx_start, clk
    );
	input s_tick, reset, tx_start, clk;
	input [DBIT-1:0] din;
	output reg tx_done_tick = 0;
	output reg tx = 1;
	
	reg [3:0] s_reg = 'b0000; //Contador de los "s_tick" de entrada (que provienen del Baud_Rate_Generator)
	reg [3:0] s_next = 'b0000;
	reg [2:0] n_reg = 'b000; //Contador de la cantidad de datos que se transmitieron
	reg [2:0] n_next = 'b000;
	/*s_next y n_next son utilizados para hacer mas entendible la máquina de estado, actualizando las variables 
	al inicio de cada clock en el always */
	
	reg [7:0] b_reg = 0; //Donde se almacenará el dato a transmitir, recibido a través de "din"
	reg [7:0] b_next = 0; 
	
	reg [3:0] state, nextState; //Tendremos 4 estados y utilizaremos 4 bits para usar la lógica "One Hot - One Cold".

//Declaramos los 4 estados que tendremos
	parameter idle = 4'b0001;
	parameter start = 4'b0010;
	parameter data = 4'b0100;
	parameter stop = 4'b1000;
	
   always @(posedge clk)
	begin
	tx_done_tick = 0;
		if (s_tick == 1)
		begin
	//------------------------------------------------------------
	// Asignación síncrona: Actualización del estado y las variables	
			if(reset == 1) 
				state = idle;
			else 
				begin
					n_reg = n_next;
					s_reg = s_next;
					b_reg = b_next;
					tx_done_tick = 0;
					state = nextState;
				end
	//------------------------------------------------------------
	// Asignación síncrona: Actualización del siguiente estado	
			case(state)
			idle:  //
				if (tx_start == 1)
					begin
						s_next = 0;
						tx_done_tick = 1; //Para enviar un pulso y leer el dato de la fifo. (Durara un solo ciclo de s_tick)
						nextState = start;
					end
				else
					begin
						nextState = idle;
					end
			start:  //
				if (s_reg == 15)
					begin
						b_next = din;     //Guardamos el dato de la entrada "din" en "b_reg" ni bien esté disponible
						nextState = data;
					end
				else
					begin
						tx = 0;
						n_next = 0;
						s_next = s_reg + 1;
					end
			data:
				if (s_reg == 15) 
					begin
						tx = 1 & b_reg;
						b_next = b_reg >> 1;
						s_next = 0;
						if (n_reg == (DBIT-1))
							nextState = stop;
						else
							n_next = n_reg + 1;
					end
				else
					begin
						s_next = s_reg + 1;
					end
			stop:
				if (s_reg ==(SB_TICK-1) && tx == 1)
					begin
						//tx_done_tick = 1;
						nextState = idle;
					end
				else if (s_reg == (SB_TICK-1)) 
					begin
						tx= 1;
						s_next = s_reg + 1;
					end
				else
					begin
						s_next = s_reg + 1;
					end
				
			default: nextState = idle;
			endcase
		end
	end

endmodule
