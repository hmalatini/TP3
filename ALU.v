`timescale 1ns / 1ps
//`define N 7

module ALU #(parameter N=7)(input signed [N:0] BusA,
   input [N:0] BusB,
   input [5:0] OpCode,
	output reg[N:0] Result);
	
	wire [N:0] Suma;
	wire [N:0] Resta;
	wire [N:0] And;
	wire [N:0] Xor;
	wire [N:0] Or;
	wire [N:0] Nor;
	wire [N:0] Asr;
	wire [N:0] Lsr;

	assign Suma = BusA + BusB;
	assign Resta = BusA - BusB;
	assign And = BusA & BusB;
	assign Xor = BusA ^ BusB;
	assign Or = BusA | BusB;
	assign Nor = ~(BusA | BusB);
	assign Asr = BusA >>> 1; //Arithmetic Shift Right
	assign Lsr = BusA >> 1; //Logical Shift Roght

	always @(*)
      case(OpCode)
			'b100000: Result = Suma;
			'b100010: Result = Resta;
			'b100100: Result = And;
			'b100101: Result = Or;
			'b100110: Result = Xor;
			'b000011: Result = Asr;
			'b000010: Result = Lsr;
			'b100111: Result = Nor;
      default: Result = 0;
		endcase
endmodule
