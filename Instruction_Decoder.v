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
module Instruction_Decoder(OpCode, WrPC, SelA, SelB, WrAcc, Op, WrRam, RdRam, wr_uart);
//Declaración de Entradas y Salidas
input [4:0] OpCode;

output reg WrPC;
output reg [1:0] SelA;
output reg SelB;
output reg WrAcc;
output reg Op; //1 para Suma, 0 para resta
output reg WrRam;
output reg RdRam;

output reg wr_uart;

//Logica
always @(OpCode) //Esto habría que verlo, porque no tenemos un clk, pero siempre que cambie la unica entrada que tenemos, entra acá
begin
	//Ponemos todas las flags al estado inicial (Con asignaciones no bloqueantes así queda modificada por la del case)
	//Solo los enables, porque las otras entradas flags esta bien que quede con el ultimo valor
	WrAcc <= 0;
	WrRam <= 0;
	RdRam <= 0;
	wr_uart = 0;
	
	//Analizamos el OpCode para ver como decodificar la instruccion
	case(OpCode)
		'b00000: //HLT
			begin
				WrPC = 0; //No hacemos nada, ni permitimos que el PC incremente
				wr_uart = 1;
			end
		'b00001: //STO
			begin
				WrPC = 1; //Incrementamos el PC
				WrRam <= 1; //Y hablilitamos la escritura en la DM, entonces se guarda la salida del ACC y la ADDR
			end
		'b00010: //LD
			begin
				WrPC = 1; //Incrementamos el PC
				RdRam <= 1; //Habilitamos lectura, para poder sacar el operando de DM (Out_Data)
				WrAcc <= 1; //Procesamos lo que hay en el acumulador
				SelA <= 0; //Se selecciona la entrada al mux1 para que vaya al acumulador
			end
		'b00011: //LDI
			begin
				WrPC = 1; //Incrementamos el PC
				WrAcc <= 1; //Procesamos lo que hay en el acumulador
				SelA <= 1; //Se selecciona la entrada al mux1 para que vaya al acumulador
			end
		'b00100: //ADD
			begin
				WrPC = 1; //Incrementamos el PC
				WrAcc <= 1; //Procesamos lo que hay en el acumulador
				RdRam <= 1; //Habilitamos lectura, para poder sacar el operando de DM (Out_Data)
				SelB <= 0; //Seleccionamos la entrada del multiplexor2
				SelA <= 2; //Se selecciona la entrada al mux1 para que vaya al acumulador
				Op <= 1; //Hacemos la suma
			end
		'b00101: //ADDI
			begin
				WrPC = 1; //Incrementamos el PC
				WrAcc <= 1; //Procesamos lo que hay en el acumulador
				SelB <= 1; //Seleccionamos la entrada del multiplexor2
				SelA <= 2;
				Op <= 1; //Hacemos la suma
			end
		'b00110: //SUB
			begin
				WrPC = 1; //Incrementamos el PC
				WrAcc <= 1; //Procesamos lo que hay en el acumulador
				RdRam <= 1; //Habilitamos lectura, para poder sacar el operando de DM (Out_Data)
				SelB <= 0; //Seleccionamos la entrada del multiplexor2
				SelA <= 2;
				Op <= 0; //Hacemos la resta
			end
		'b00111: //SUBI
			begin
				WrPC = 1; //Incrementamos el PC
				WrAcc <= 1; //Procesamos lo que hay en el acumulador
				SelB <= 1; //Seleccionamos la entrada del multiplexor2
				SelA <= 2;
				Op <= 0; //Hacemos la resta
			end
		default:
			begin
				WrPC = 0; //No hacemos nada
			end

	endcase
end

endmodule
