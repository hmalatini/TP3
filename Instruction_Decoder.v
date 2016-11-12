`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:06:30 11/02/2016 
// Design Name: 
// Module Name:    Instruction_Decoder 
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
module Instruction_Decoder(OpCode, WrPC, SelA, SelB, WrAcc, Op, WrRam, RdRam, wr_uart, led3, led4);
//Declaraci�n de Entradas y Salidas
input [4:0] OpCode;

output reg WrPC;
output reg [1:0] SelA;
output reg SelB;
output reg WrAcc;
output reg Op; //1 para Suma, 0 para resta
output reg WrRam;
output reg RdRam;

output reg wr_uart;

//reg start = 1;

//PARA TESTING EN PLACA
output reg led3 = 0;
output reg led4 = 0;

//Logica
always @(OpCode) //Esto habr�a que verlo, porque no tenemos un clk, pero siempre que cambie la unica entrada que tenemos, entra ac�
begin
	//Ponemos todas las flags al estado inicial (Con asignaciones no bloqueantes as� queda modificada por la del case)
	//Solo los enables, porque las otras entradas flags esta bien que quede con el ultimo valor
//	WrPC <= 0;
	WrAcc <= 0;
	WrRam <= 0;
	RdRam <= 0;
	wr_uart = 0;
	
	//Analizamos el OpCode para ver como decodificar la instruccion
	case(OpCode)
		'b00000: //HLT
			begin
				WrPC = 0; //No hacemos nada, ni permitimos que el PC incremente
				led3 = 0; //TESTING
				led4 = 1; //TESTING
				//if(start == 1)
					//begin
						wr_uart = 1;
						led3 = 1; //Para Testing
						//start = 0; //Para Uart
					//end
			end
		'b00001: //STO
			begin
				WrPC = 1; //Incrementamos el PC
				WrRam <= 1; //Y hablilitamos la escritura en la DM, entonces se guarda la salida del ACC y la ADDR
				//start = 1; //Para Uart
				//led3 = 0; //TESTING
				led4 = 0; //TESTING
			end
		'b00010: //LD
			begin
				WrPC = 1; //Incrementamos el PC
				RdRam <= 1; //Habilitamos lectura, para poder sacar el operando de DM (Out_Data)
				WrAcc <= 1; //Procesamos lo que hay en el acumulador
				SelA <= 0; //Se selecciona la entrada al mux1 para que vaya al acumulador
				//start = 1; //Para Uart
				//led3 = 0; //TESTING
				led4 = 0; //TESTING
			end
		'b00011: //LDI
			begin
				WrPC = 1; //Incrementamos el PC
				WrAcc <= 1; //Procesamos lo que hay en el acumulador
				SelA <= 1; //Se selecciona la entrada al mux1 para que vaya al acumulador
				//start = 1; //Para Uart
				//led3 = 0; //TESTING
				led4 = 0; //TESTING
			end
		'b00100: //ADD
			begin
				WrPC = 1; //Incrementamos el PC
				WrAcc <= 1; //Procesamos lo que hay en el acumulador
				RdRam <= 1; //Habilitamos lectura, para poder sacar el operando de DM (Out_Data)
				SelB <= 0; //Seleccionamos la entrada del multiplexor2
				SelA <= 2; //Se selecciona la entrada al mux1 para que vaya al acumulador
				Op <= 1; //Hacemos la suma
				//start = 1; //Para Uart
				//led3 = 0; //TESTING
				led4 = 0; //TESTING
			end
		'b00101: //ADDI
			begin
				WrPC = 1; //Incrementamos el PC
				WrAcc <= 1; //Procesamos lo que hay en el acumulador
				SelB <= 1; //Seleccionamos la entrada del multiplexor2
				SelA <= 2;
				Op <= 1; //Hacemos la suma
				//start = 1; //Para Uart
				//led3 = 0; //TESTING
				led4 = 0; //TESTING
			end
		'b00110: //SUB
			begin
				WrPC = 1; //Incrementamos el PC
				WrAcc <= 1; //Procesamos lo que hay en el acumulador
				RdRam <= 1; //Habilitamos lectura, para poder sacar el operando de DM (Out_Data)
				SelB <= 0; //Seleccionamos la entrada del multiplexor2
				SelA <= 2;
				Op <= 0; //Hacemos la resta
				//start = 1; //Para Uart
				//led3 = 0; //TESTING
				led4 = 0; //TESTING
			end
		'b00111: //SUBI
			begin
				WrPC = 1; //Incrementamos el PC
				WrAcc <= 1; //Procesamos lo que hay en el acumulador
				SelB <= 1; //Seleccionamos la entrada del multiplexor2
				SelA <= 2;
				Op <= 0; //Hacemos la resta
				//start = 1; //Para Uart
				//led3 = 0; //TESTING
				led4 = 0; //TESTING
			end
		default:
			begin
				WrPC = 0; //Incrementamos el PC y no hacemos nada
				//led3 = 0;
				led4 = 0; //TESTING
			end

	endcase
end

endmodule
