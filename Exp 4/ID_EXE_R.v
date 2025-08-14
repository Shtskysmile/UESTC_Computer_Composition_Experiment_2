`timescale 1ns / 1ps
module ID_EXE_R(
	ID_MemtoReg, ID_MemWr, ID_ALUctr, ID_RegWr_Org, ID_Rw, ID_BusA, ID_BusB, ID_Inst, ID_RegDst, ID_ALUSrc, ID_Imm32,
	EXE_MemtoReg, EXE_MemWr_Org, EXE_ALUctr, EXE_RegWr_Org, EXE_Rw, EXE_BusA, EXE_BusB, EXE_Inst, EXE_RegDst, EXE_ALUSrc, EXE_Imm32,
	CLK, reset, stall
);
input CLK, reset, stall;
input ID_MemtoReg, ID_MemWr, ID_RegWr_Org;
input [2:0] ID_ALUctr;
input [4:0] ID_Rw;
input [31:0] ID_BusA, ID_BusB;
output EXE_MemtoReg, EXE_MemWr_Org, EXE_RegWr_Org;
output [2:0] EXE_ALUctr;
output [4:0] EXE_Rw;
output [31:0] EXE_BusA, EXE_BusB;
reg EXE_MemtoReg, EXE_MemWr_Org, EXE_RegWr_Org;
reg [2:0] EXE_ALUctr;
reg [4:0] EXE_Rw;
reg [31:0] EXE_BusA, EXE_BusB;
// new code
input [31:0] ID_Inst, ID_Imm32;
input ID_ALUSrc, ID_RegDst;
output [31:0] EXE_Inst, EXE_Imm32;
output EXE_ALUSrc, EXE_RegDst;
reg [31:0] EXE_Inst, EXE_Imm32;
reg EXE_ALUSrc, EXE_RegDst;
always @ (negedge reset or posedge CLK)
	if (reset == 0)
	begin
		EXE_MemtoReg <= 0; 
		EXE_MemWr_Org <= 0;  
		EXE_ALUctr <= 0;  
		EXE_RegWr_Org <= 0; 
		EXE_Rw <= 0;
		EXE_BusA <= 0; 
		EXE_BusB <= 0;
		// new code
		EXE_Inst <= 0;	
		EXE_RegDst <= 0;
		EXE_ALUSrc <= 0;
		EXE_Imm32 <= 0;
	end
	else if (~stall)
	begin
		EXE_MemtoReg <= ID_MemtoReg; 
		EXE_MemWr_Org <= ID_MemWr;  
		EXE_ALUctr <= ID_ALUctr;  
		EXE_RegWr_Org <= ID_RegWr_Org; 
		EXE_Rw <= ID_Rw;
		EXE_BusA <= ID_BusA; 
		EXE_BusB <= ID_BusB;
		// new code
		EXE_Inst <= ID_Inst;	
		EXE_RegDst <= ID_RegDst;
		EXE_ALUSrc <= ID_ALUSrc;
		EXE_Imm32 <= ID_Imm32;
	end
endmodule
