`timescale 1ns / 1ps
module Pipeline_CPU(
	clk, reset_pc, reset_reg, reset_IF_ID, reset_ID_EXE, reset_EXE_MEM, reset_MEM_WB, result
);
input clk, reset_pc, reset_reg, reset_IF_ID, reset_ID_EXE, reset_EXE_MEM, reset_MEM_WB;
output [31:0] result;

wire Jump, Branch;

wire [31:0] ID_Inst;

wire ID_MemWr, ID_MemtoReg, ID_RegWr_Org;
wire [2:0] ID_ALUctr;
wire [4:0] ID_Rw;	 
wire [31:0] WB_BusW, ID_BusA, ID_BusB;
wire [4:0] WB_Rw;
wire WB_RegWr;

wire EXE_MemtoReg, EXE_MemWr_Org, EXE_MemWr, EXE_RegWr_Org;
wire [4:0] EXE_Rw; 
wire [2:0] EXE_ALUctr;
wire [31:0] EXE_BusA, EXE_BusB;

wire EXE_RegWr;
wire [31:0] EXE_Result;
assign result = EXE_Result;

wire MEM_MemtoReg, MEM_MemWr, MEM_RegWr;
wire [4:0] MEM_Rw;
wire [31:0] MEM_Result, MEM_BusB;	

wire [31:0] MEM_MemOut;

wire WB_MemtoReg;
wire [31:0] WB_Result, WB_MemOut; 


wire stall;
wire ID_RegDst, ID_ALUSrc, EXE_RegDst, EXE_ALUSrc;
wire [31:0] ID_Imm32;
wire [31:0] EXE_Inst;
wire [31:0] B;
wire [31:0] EXE_Imm32;

// new code
wire [31:0] IF_Inst;
wire [31:0] ID_jpc;
wire [31:0] EXE_bpc;
wire [31:0] IF_PC;

wire [31:0] ID_PC;
IF_STAGE if_stage (
	.CLK(clk), 
	.Reset(reset_pc), 
	.Jump(Jump), 
	.Branch(Branch), 
	.ID_jpc(ID_jpc),
	.EXE_bpc(EXE_bpc),
	.IF_Inst(IF_Inst),
	.IF_PC(IF_PC),
	.stall(stall)
);

IF_ID_R if_id_r (
	.IF_Inst(IF_Inst), 
	.ID_Inst(ID_Inst), 
	.IF_PC(IF_PC),
	.ID_PC(ID_PC),
	.CLK(clk), 
	.Reset(reset_IF_ID),
	.stall(stall)
);
	 
wire [31:0] ID_Inst_flush;	 
ID_STAGE id_stage (
	.ID_Inst(ID_Inst),
	.ID_PC(ID_PC),
	.ID_ALUctr(ID_ALUctr),
	.ID_MemWr(ID_MemWr),
	.ID_MemtoReg(ID_MemtoReg),
	.ID_RegWr_Org(ID_RegWr_Org),
	.ID_Rw(ID_Rw),
	.Branch(Branch),
	.Jump(Jump),
	.BusW(WB_BusW),
	.CLK(~clk),
	.Reset(reset_reg),
	.ID_BusA(ID_BusA),
	.ID_BusB(ID_BusB),
	.WB_Rw(WB_Rw),
	.WB_Reg_Wr(WB_RegWr),

	.ID_Imm32(ID_Imm32),
	.ID_RegDst(ID_RegDst),
	.ID_ALUSrc(ID_ALUSrc),
	.ID_jpc(ID_jpc),
	.ID_Inst_flush(ID_Inst_flush)
);

wire [31:0] EXE_PC;
ID_EXE_R id_exe_r (
	.ID_MemtoReg(ID_MemtoReg), 
	.ID_MemWr(ID_MemWr), 
	.ID_ALUctr(ID_ALUctr), 
	.ID_RegWr_Org(ID_RegWr_Org),  
	.ID_Rw(ID_Rw), 
	.ID_BusA(ID_BusA), 
	.ID_BusB(ID_BusB),

	.ID_Inst(ID_Inst_flush), 
	.ID_RegDst(ID_RegDst), 
	.ID_ALUSrc(ID_ALUSrc),
	.ID_Imm32(ID_Imm32),
	.ID_PC(ID_PC),

	.EXE_MemtoReg(EXE_MemtoReg), 
	.EXE_MemWr_Org(EXE_MemWr_Org),  
	.EXE_ALUctr(EXE_ALUctr), 
	.EXE_RegWr_Org(EXE_RegWr_Org), 
	.EXE_Rw(EXE_Rw), 
	.EXE_BusA(EXE_BusA), 
	.EXE_BusB(EXE_BusB), 

	.EXE_Inst(EXE_Inst), 
	.EXE_RegDst(EXE_RegDst), 
	.EXE_ALUSrc(EXE_ALUSrc),
	.EXE_Imm32(EXE_Imm32),
	.EXE_PC(EXE_PC),

	.CLK(clk), 
	.reset(reset_ID_EXE),
	.stall(stall)
);

EXE_STAGE exe_stage (
	.EXE_Inst(EXE_Inst),
	.EXE_Imm32(EXE_Imm32),
	.EXE_ALUSrc(EXE_ALUSrc),
	.EXE_RegDst(EXE_RegDst),
	.MEM_Rw(MEM_Rw),
	.WB_Rw(WB_Rw),
	.WB_RegWr(WB_RegWr),
	.MEM_RegWr(MEM_RegWr),
	.MEM_MemtoReg(MEM_MemtoReg),
	.WB_BusW(WB_BusW),
	.MEM_Result(MEM_Result),

	.B(B),
	.stall(stall),

	.EXE_BusA(EXE_BusA), 
	.EXE_BusB(EXE_BusB),
	.EXE_ALUctr(EXE_ALUctr), 
	.EXE_RegWr_Org(EXE_RegWr_Org),
	.EXE_RegWr(EXE_RegWr),
	.EXE_Result(EXE_Result),
	
	.EXE_PC(EXE_PC),
	.EXE_bpc(EXE_bpc),
	.Branch(Branch),

	.EXE_MemWr_Org(EXE_MemWr_Org),
	.EXE_MemWr(EXE_MemWr)
);
	  
EXE_MEM_R exe_mem_r (
	.EXE_MemtoReg(EXE_MemtoReg), 
	.EXE_MemWr(EXE_MemWr), 
	.EXE_RegWr(EXE_RegWr), 
	.EXE_Rw(EXE_Rw), 
	.EXE_Result(EXE_Result), 
	.B(B),
	
	.MEM_MemtoReg(MEM_MemtoReg), 
	.MEM_MemWr(MEM_MemWr), 
	.MEM_RegWr(MEM_RegWr), 
	.MEM_Rw(MEM_Rw), 
	.MEM_Result(MEM_Result), 
	.MEM_BusB(MEM_BusB),
	
	.CLK(clk), 
	.reset(reset_EXE_MEM)
);

MEM_STAGE mem_stage (
	.MEM_MemWr(MEM_MemWr),
	.MEM_Result(MEM_Result),
	.MEM_BusB(MEM_BusB),
	.CLK(clk),
	.MEM_MemOut(MEM_MemOut)
);
	 
MEM_WB_R mem_wb_r (
	.MEM_MemtoReg(MEM_MemtoReg), 
	.MEM_RegWr(MEM_RegWr), 
	.MEM_Rw(MEM_Rw), 
	.MEM_Result(MEM_Result), 
	.MEM_MemOut(MEM_MemOut), 
	.WB_MemtoReg(WB_MemtoReg), 
	.WB_RegWr(WB_RegWr), 
	.WB_Rw(WB_Rw), 
	.WB_Result(WB_Result), 
	.WB_MemOut(WB_MemOut),
	.CLK(clk), 
	.reset(reset_MEM_WB)
);

WB_STAGE wb_stage (
	.WB_Result(WB_Result), 
	.WB_MemOut(WB_MemOut),
	.WB_MemtoReg(WB_MemtoReg), 
	.BusW(WB_BusW)
);

endmodule
