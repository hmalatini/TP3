`timescale 1ns / 1ps
//`define N 7

module EntradaALU #(parameter N=7)(r_data, rd_uart, full_rx, clk, w_data, wr_uart
    ); 
	
	input [N:0] r_data;
	input clk;
	input full_rx;
	
	wire [N:0] resultado_operacion;
	
	output reg [N:0] w_data = 0;
	output reg wr_uart = 0;
	output reg rd_uart = 0;
	
	reg wr_uart_next = 0;
	reg rd_uart_next = 0;
	
	reg retardo_escritura = 0; //Retardo para demorar un ciclo mas antes de enviar el resultado
	
	reg [4:0] state;
	reg [4:0] nextState; //Tendremos 4 estados y utilizaremos 4 bits para usar la lógica "One Hot - One Cold".

	//Declaramos los 5 estados que tendremos
	parameter idle = 5'b00001;
	parameter ValorA = 5'b00010;
	parameter ValorB = 5'b00100;
	parameter OpCode = 5'b01000;
	parameter Resultado = 5'b10000;

	
	reg [N:0] SalidaA = 0;
	reg [N:0] SalidaB = 0; 
	reg [5:0] SalidaOp = 0;
	
	ALU #(N) alu (SalidaA, SalidaB, SalidaOp, resultado_operacion);
	
	always@(posedge clk) 
	begin
		w_data = resultado_operacion;
		state = nextState;
		rd_uart = rd_uart_next;
		wr_uart = wr_uart_next;
		
		case(state)
		idle:
			if(full_rx == 0)
				begin
					nextState = idle;
				end
			else
				begin
					wr_uart_next = 0;
					nextState = ValorA;
				end
		ValorA:
			if(rd_uart == 1)
				begin
					rd_uart_next = 0;
					nextState = ValorB;
				end
			else
				begin
					rd_uart_next = 1;
					nextState = ValorA;
				end
		ValorB:
			if(rd_uart == 1)
				begin
					rd_uart_next = 0;
					SalidaA = r_data; //ACA LEO EL DATO ANTERIOR RECIEN POR TEMA DE CLOCK
					nextState = OpCode;
				end
			else
				begin
					rd_uart_next = 1;
					nextState = ValorB;
				end
		OpCode:
			if(rd_uart == 1)
				begin
					rd_uart_next = 0;
					SalidaB = r_data; //ACA LEO EL DATO ANTERIOR RECIEN POR TEMA DE CLOCK
					nextState = Resultado;
				end
			else
				begin
					rd_uart_next = 1;
					nextState = OpCode;
				end
		Resultado:
			if(wr_uart == 0 && retardo_escritura == 0)
				begin
					nextState = Resultado;
					retardo_escritura <= retardo_escritura + 1;
				end
			else if (retardo_escritura == 1)
				begin
					SalidaOp = r_data; //ACA LEO EL DATO ANTERIOR RECIEN POR TEMA DE CLOCK
					wr_uart_next = 1;
					retardo_escritura <= 0;
				end
			else
				begin
					w_data = resultado_operacion; //Y aca ya deberia estar listo el resultado
					wr_uart_next = 0;
					nextState = idle;
				end
		default: nextState = idle;
		endcase

	end
endmodule
