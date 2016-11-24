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
module Instruction_Decoder(OpCode, WrPC, SelA, SelB, WrAcc, Op, WrRam, RdRam);
//Declaración de Entradas y Salidas
input [4:0] OpCode;

output reg WrPC = 1; //ARRANCA EN UNO PARA QUE NO IMPRIMA POR UART NI BIEN ARRANCA LA PLACA
output reg [1:0] SelA;
output reg SelB;
output reg WrAcc = 0;
output reg Op; //1 para Suma, 0 para resta
output reg WrRam = 0;
output reg RdRam = 0;

//Logica
always @(*) //Esto habría que verlo, porque no tenemos un clk, pero siempre que cambie la unica entrada que tenemos, entra acá
begin
	//Analizamos el OpCode para ver como decodificar la instruccion
	case(OpCode)
		'b00000: //HLT
			begin
				WrPC = 0; //No hacemos nada, ni permitimos que el PC incremente
				WrAcc = 0;
				WrRam = 0;
				RdRam = 0;
			end
		'b00001: //STO
			begin
				WrPC = 1; //Incrementamos el PC
				WrRam = 1; //Y hablilitamos la escritura en la DM, entonces se guarda la salida del ACC y la ADDR
				RdRam = 0;
				WrAcc = 0;
			end
		'b00010: //LD
			begin
				WrPC = 1; //Incrementamos el PC
				RdRam = 1; //Habilitamos lectura, para poder sacar el operando de DM (Out_Data)
				WrAcc = 1; //Procesamos lo que hay en el acumulador
				WrRam = 0;
				SelA = 0; //Se selecciona la entrada al mux1 para que vaya al acumulador
			end
		'b00011: //LDI
			begin
				WrPC = 1; //Incrementamos el PC
				WrAcc = 1; //Procesamos lo que hay en el acumulador
				RdRam = 0;
				WrRam = 0;
				SelA = 1; //Se selecciona la entrada al mux1 para que vaya al acumulador
			end
		'b00100: //ADD
			begin
				WrPC = 1; //Incrementamos el PC
				WrAcc = 1; //Procesamos lo que hay en el acumulador
				RdRam = 1; //Habilitamos lectura, para poder sacar el operando de DM (Out_Data)
				WrRam = 0;
				SelB = 0; //Seleccionamos la entrada del multiplexor2
				SelA = 2; //Se selecciona la entrada al mux1 para que vaya al acumulador
				Op = 1; //Hacemos la suma
			end
		'b00101: //ADDI
			begin
				WrPC = 1; //Incrementamos el PC
				WrAcc = 1; //Procesamos lo que hay en el acumulador
				RdRam = 0;
				WrRam = 0;
				SelB = 1; //Seleccionamos la entrada del multiplexor2
				SelA = 2;
				Op = 1; //Hacemos la suma
			end
		'b00110: //SUB
			begin
				WrPC = 1; //Incrementamos el PC
				WrAcc = 1; //Procesamos lo que hay en el acumulador
				RdRam = 1; //Habilitamos lectura, para poder sacar el operando de DM (Out_Data)
				WrRam = 0;
				SelB = 0; //Seleccionamos la entrada del multiplexor2
				SelA = 2;
				Op = 0; //Hacemos la resta
			end
		'b00111: //SUBI
			begin
				WrPC = 1; //Incrementamos el PC
				WrAcc = 1; //Procesamos lo que hay en el acumulador
				RdRam = 0;
				WrRam = 0;
				SelB = 1; //Seleccionamos la entrada del multiplexor2
				SelA = 2;
				Op = 0; //Hacemos la resta
			end
		default:
			begin
				WrPC = 0; //No hacemos nada, ni permitimos que el PC incremente
				WrAcc = 0;
				WrRam = 0;
				RdRam = 0;
			end

	endcase
end

endmodule
