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
module UART(rx, clk, reset, tx, acc_uart, WrPC_Input, WrPC_Output, enable
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
input reset;

wire start_bip;

//AND DE LA UART
output reg WrPC_Input = 0; //Este ira al PC
input WrPC_Output;

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

reg [2:0] send_word = 0; //registro de bandera que se usará para saber que bloque de los dos de 8 bits se va a enviar.

//PARA TESTEAR CON SWITCH
input enable;

Baud_Rate_Generator #(clk_Mhz, BaudRate) baudrategenerator (clk, tick_stick);
Receiver #(DBIT, SB_TICK) receptor (tick_stick, rx, start_bip, rxdonetick_wr, reset, clk);
Transmitter #(DBIT, SB_TICK) transmisor (tick_stick, tx, rdata_din, txdonetick_rd, reset, ~empty_txstart, clk);
Fifo #(DBIT) fifo_transmisor (acc_uart_special, txdonetick_rd, wr_uart_special, rdata_din, empty_txstart, clk);

//assign WrPC_Input = WrPC_Onput & start_bip;

always @(posedge clk)
	begin
		WrPC_Input = WrPC_Output & start_bip;
		if (WrPC_Output == 0 && enable == 1)
			begin
				case (send_word)
					'b000:
						begin
							acc_uart_special = acc_uart [7:0];
							//acc_uart_special = 'b11111111;
							wr_uart_special = 1;
							send_word = 'b001;
						end
					'b001:
						begin
							wr_uart_special = 0;
							send_word = 'b010;
						end
					'b010:
						begin
							send_word = 'b011;
						end
					'b011:
						begin
							acc_uart_special = acc_uart [15:8];
							//acc_uart_special = 'b10101111;
							wr_uart_special = 1;
							send_word = 'b100;
						end
					'b100:
						begin
							wr_uart_special = 0;
							send_word = 'b101;
						end
					'b101:
						begin
							wr_uart_special = 0; //Se quedara en este estado hasta que wr_uart se haga 0
						end
					default:
						begin
							wr_uart_special = 0;
						end
				endcase
			end
		else
			begin
				send_word = 'b000;
			end
	end

endmodule
