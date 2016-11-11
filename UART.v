`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:56:00 10/11/2016 
// Design Name: 
// Module Name:    main 
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
module UART(rx, clk, reset, tx, acc_uart, wr_uart, start_bip, led
    );
//--------------------------Parametros para UART----------------------	
parameter BaudRate = 19200;
parameter clk_Mhz = 100;
parameter DBIT = 8;
parameter SB_TICK = 16;
//-------------------------------------------------------------------

wire [DBIT-1:0] w_data;
input rx;
input clk;
input [15:0] acc_uart; //Ver de parametrizarlo mas adelante
wire rd_uart;
input wr_uart;
input reset;
output start_bip;

wire [DBIT-1:0] r_data;
output tx;
wire rx_full;

wire [DBIT-1:0] dout_wdata;
wire rxdonetick_wr;

wire [DBIT-1:0] rdata_din;
wire txdonetick_rd;
wire empty_txstart;

wire tick_stick;

reg wr_uart_special = 0; //registro que lo va a manejar éste modulo en el alway para poder apilar/tranimitr primero 8 bits y despues otros 8 bits
reg [DBIT-1:0] acc_uart_special = 0;

reg [1:0] send_word = 0; //registro de bandera que se usará para saber que bloque de los dos de 8 bits se va a enviar.


//PARA TESTING EN PLACA
output reg led = 0;

Baud_Rate_Generator #(clk_Mhz, BaudRate) baudrategenerator (clk, tick_stick);
Receiver #(DBIT, SB_TICK) receptor (tick_stick, rx, start_bip, rxdonetick_wr, reset, state, clk);
Transmitter #(DBIT, SB_TICK) transmisor (tick_stick, tx, rdata_din, txdonetick_rd, reset, ~empty_txstart, clk);
//Fifo #(DBIT) fifo_receptor (dout_wdata, rd_uart, rxdonetick_wr, r_data, rx_full, rx_empty, clk);
Fifo #(DBIT) fifo_transmisor (acc_uart_special, txdonetick_rd, wr_uart_special, rdata_din, empty_txstart, clk/*, led*/);


always @(posedge clk)
	begin
		//wr_uart_special = 0;
		if (wr_uart == 1)
			begin
				led = 1;
				case (send_word)
					'b00:
						begin
							acc_uart_special = acc_uart [7:0];
							wr_uart_special = 1;
							send_word = 'b01;
						end
					'b01:
						begin
							wr_uart_special = 0;
							send_word = 'b10;
						end
					'b10:
						begin
							acc_uart_special = acc_uart [15:8];
							wr_uart_special = 1;
							send_word = 'b11;
						end
					'b11:
						begin
							wr_uart_special = 0; //Se quedara en este estado hasta que wr_uart se haga 0
						end
					default:  wr_uart_special = 0;
				endcase
			end
		else
			send_word = 'b00;
	end

endmodule
