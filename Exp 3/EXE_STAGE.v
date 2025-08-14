`timescale 1ns / 1ps
module EXE_STAGE(
	EXE_BusA,
	EXE_B,
	EXE_ALUctr,
	EXE_RegWr_Org,
	EXE_RegWr,
	Zero,
	EXE_Result
);
input EXE_RegWr_Org;
input [31:0] EXE_BusA, EXE_B;
input [2:0] EXE_ALUctr;
output Zero, EXE_RegWr;
output [31:0] EXE_Result;
wire Overflow;
assign EXE_RegWr = EXE_RegWr_Org & (~Overflow);
ALU alu(
	.A(EXE_BusA),
	.B(EXE_B),
	.ALUctr(EXE_ALUctr),
	.Zero(Zero),
	.Overflow(Overflow),
	.Result(EXE_Result)
);	 
endmodule
