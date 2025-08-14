`timescale 1ns / 1ps
module EXE_STAGE(
	// new code
	EXE_Inst,
	EXE_Imm32,
	EXE_ALUSrc,
	EXE_RegDst,
	MEM_Rw,
	WB_Rw,
	WB_RegWr,
	MEM_RegWr,
	MEM_MemtoReg,
	WB_BusW,
	MEM_Result,

	B,
	stall,

	EXE_BusA,
	EXE_BusB,
	EXE_ALUctr,
	EXE_RegWr_Org,
	EXE_RegWr,
	Zero,
	EXE_Result,

	EXE_MemWr_Org,
	EXE_MemWr
);

input EXE_RegWr_Org;
input [31:0] EXE_BusA, EXE_BusB;
input [2:0] EXE_ALUctr;

// new code
input [31:0] EXE_Inst;
input [31:0] EXE_Imm32;	
input [4:0] MEM_Rw, WB_Rw;
input EXE_RegDst, MEM_MemtoReg, WB_RegWr, MEM_RegWr, MEM_MemtoReg, EXE_ALUSrc;
input [31:0] WB_BusW, MEM_Result;

output Zero, EXE_RegWr;
output [31:0] EXE_Result;
wire Overflow;

// new code
output stall;
output [31:0] B;

// new code
wire [31:0] DataA, DataB;	
wire [1:0] FwdA, FwdB;
wire [4:0] EXE_Rs, EXE_Rt;

// new code
assign EXE_Rs = EXE_Inst[25:21];
assign EXE_Rt = EXE_Inst[20:16];

// new code 
input EXE_MemWr_Org;
output EXE_MemWr;
assign EXE_MemWr = EXE_MemWr_Org & (~stall);
assign EXE_RegWr = EXE_RegWr_Org & (~Overflow) & (~stall);

// change two operands
ALU alu(
	.A(DataA),
	.B(DataB),
	.ALUctr(EXE_ALUctr),
	.Zero(Zero),
	.Overflow(Overflow),
	.Result(EXE_Result)
);	 

Passby_Stall_Unit passby_stall_unit(
	.EXE_RegDst(EXE_RegDst), 
	.EXE_Rt(EXE_Rt), 
	.EXE_Rs(EXE_Rs), 
	.MEM_Rw(MEM_Rw), 
	.WB_Rw(WB_Rw), 
	.WB_RegWr(WB_RegWr), 
	.MEM_RegWr(MEM_RegWr), 
	.MEM_MemtoReg(MEM_MemtoReg), 
    .FwdA(FwdA), 
	.FwdB(FwdB), 
	.stall(stall)
);

DataA dataA(
	.WB_BusW(WB_BusW), 
	.EXE_BusA(EXE_BusA), 
	.MEM_Result(MEM_Result),
	.FwdA(FwdA),
	.DataA(DataA)
);

DataB dataB(
	.EXE_BusB(EXE_BusB), 
	.WB_BusW(WB_BusW),
	.MEM_Result(MEM_Result),
	.FwdB(FwdB),
	.DataB(B)
);

MUX32_2_1 mux32_2_1(
	.A(B),
	.B(EXE_Imm32),
	.S(EXE_ALUSrc),
	.C(DataB)
);

endmodule
