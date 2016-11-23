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
module UART(rx, clk, reset, tx, salida_acc, wr_uart
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
wire rd_uart;
input wr_uart;
input reset; 

wire [DBIT-1:0] r_data;
output tx;
wire rx_full;

wire [DBIT-1:0] dout_wdata;
wire rxdonetick_wr;

wire [DBIT-1:0] rdata_din;
wire txdonetick_rd;
wire empty_txstart;

wire tick_stick;

input [15:0] salida_acc;

reg primer_halt = 1;
reg escribir = 0;
//PARA TESTING


//----------------------------------------Modulos--------------------------------------------//
Baud_Rate_Generator #(clk_Mhz, BaudRate) baudrategenerator (clk, tick_stick);
//Receiver #(DBIT, SB_TICK) receptor (tick_stick, rx, rxdonetick_wr,  clk);
Transmitter #(DBIT, SB_TICK) transmisor (tick_stick, tx, rdata_din, txdonetick_rd, ~empty_txstart, clk);
Fifo #(DBIT) fifo_transmisor (salida_acc[15:8], salida_acc[7:0], txdonetick_rd, escribir, rdata_din, empty_txstart, clk);

//----------------------------------------Logica--------------------------------------------//
always@(posedge clk)
begin
	if(wr_uart == 1)
		begin
			if(primer_halt == 1)
				begin
					escribir = 1;
					primer_halt = 0;
				end
			else
				begin
					escribir = 0;
				end
		end
	else
		begin
			primer_halt = 1;
		end
end

endmodule
