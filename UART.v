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
module UART(rx, clk, reset, tx, rx_empty, tx_full, acc_uart, wr_uart, start_bip
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
input [DBIT-1:0] acc_uart;
wire rd_uart;
input wr_uart;
input reset;
output start_bip;

wire [DBIT-1:0] r_data;
output tx;
output rx_empty;
output tx_full;
wire rx_full;

wire [DBIT-1:0] dout_wdata;
wire rxdonetick_wr;

wire [DBIT-1:0] rdata_din;
wire txdonetick_rd;
wire empty_txstart;

wire tick_stick;

Baud_Rate_Generator #(clk_Mhz, BaudRate) baudrategenerator (clk, tick_stick);
Receiver #(DBIT, SB_TICK) receptor (tick_stick, rx, start_bip, rxdonetick_wr, reset, state, clk);
Transmitter #(DBIT, SB_TICK) transmisor (tick_stick, tx, rdata_din, txdonetick_rd, reset, ~empty_txstart, clk);
//Fifo #(DBIT) fifo_receptor (dout_wdata, rd_uart, rxdonetick_wr, r_data, rx_full, rx_empty, clk);
Fifo #(DBIT) fifo_transmisor (acc_uart, txdonetick_rd, wr_uart, rdata_din, tx_full, empty_txstart, clk);

endmodule
