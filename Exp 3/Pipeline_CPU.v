`timescale 1ns / 1ps
module Pipeline_CPU(
	clk, reset_pc, reset_reg, reset_IF_ID, reset_ID_EXE, reset_EXE_MEM, reset_MEM_WB, pc, inst, result
);
input clk, reset_pc, reset_reg, reset_IF_ID, reset_ID_EXE, reset_EXE_MEM, reset_MEM_WB;
output [31:0] pc, inst, result;

wire [25:0] target;
wire Jump, Branch, Zero, ExtOp;
wire [15:0] imm16;
IF_STAGE if_stage (
	.CLK(clk), 
	.Reset(reset_pc), 
	.imm16(imm16), 
	.Jump(Jump), 
	.Branch(Branch), 
	.Zero(Zero), 
	.target(target), 
	.ExtOp(ExtOp), 
	.Inst(inst), 
	.PC(pc)
);

wire [31:0] ID_Inst;
IF_ID_R if_id_r (
	.IF_Inst(inst), 
	.ID_Inst(ID_Inst), 
	.CLK(clk), 
	.Reset(reset_IF_ID)
);
	 
wire ID_MemWr, ID_MemtoReg, Overflow, ID_RegWr_Org;
wire [2:0] ID_ALUctr;
wire [4:0] ID_Rw;	 
wire [31:0] BusW, ID_BusA, ID_BusB, ID_B;
wire [4:0] WB_Rw;
wire WB_RegWr;
ID_STAGE id_stage (
	.ID_Inst(ID_Inst),
	.ID_ALUctr(ID_ALUctr),
	.ID_MemWr(ID_MemWr),
	.ID_MemtoReg(ID_MemtoReg),
	.ID_RegWr_Org(ID_RegWr_Org),
	.ID_Rw(ID_Rw),
	.ExtOp(ExtOp),
	.Jump(Jump),
	.Branch(Branch),
	.BusW(BusW),
	.CLK(clk),
	.Reset(reset_reg),
	.ID_BusA(ID_BusA),
	.ID_B(ID_B),
	.ID_BusB(ID_BusB),
	.WB_Rw(WB_Rw),
	.WB_Reg_Wr(WB_RegWr),
	.imm16(imm16),
	.target(target)
);

wire EXE_MemtoReg, EXE_MemWr, EXE_RegWr_Org;
wire [4:0] EXE_Rw; 
wire [2:0] EXE_ALUctr;
wire [31:0] EXE_BusA, EXE_BusB, EXE_B;
ID_EXE_R id_exe_r (
	.ID_MemtoReg(ID_MemtoReg), 
	.ID_MemWr(ID_MemWr), 
	.ID_ALUctr(ID_ALUctr), 
	.ID_RegWr_Org(ID_RegWr_Org),  
	.ID_Rw(ID_Rw), 
	.ID_BusA(ID_BusA), 
	.ID_B(ID_B), 
	.ID_BusB(ID_BusB),
	.EXE_MemtoReg(EXE_MemtoReg), 
	.EXE_MemWr(EXE_MemWr),  
	.EXE_ALUctr(EXE_ALUctr), 
	.EXE_RegWr_Org(EXE_RegWr_Org), 
	.EXE_Rw(EXE_Rw), 
	.EXE_BusA(EXE_BusA), 
	.EXE_B(EXE_B), 
	.EXE_BusB(EXE_BusB), 
	.CLK(clk), 
	.reset(reset_ID_EXE)
);

wire EXE_RegWr;
wire [31:0] EXE_Result;
assign result = EXE_Result;
EXE_STAGE exe_stage (
	.EXE_BusA(EXE_BusA), 
	.EXE_B(EXE_B), 
	.EXE_ALUctr(EXE_ALUctr), 
	.EXE_RegWr_Org(EXE_RegWr_Org),
	.EXE_RegWr(EXE_RegWr),
	.Zero(Zero),
	.EXE_Result(EXE_Result)
);
	 
wire MEM_MemtoReg, MEM_MemWr, MEM_RegWr;
wire [4:0] MEM_Rw;
wire [31:0] MEM_Result, MEM_BusB;	 
EXE_MEM_R exe_mem_r (
	.EXE_MemtoReg(EXE_MemtoReg), 
	.EXE_MemWr(EXE_MemWr), 
	.EXE_RegWr(EXE_RegWr), 
	.EXE_Rw(EXE_Rw), 
	.EXE_Result(EXE_Result), 
	.EXE_BusB(EXE_BusB),
	
	.MEM_MemtoReg(MEM_MemtoReg), 
	.MEM_MemWr(MEM_MemWr), 
	.MEM_RegWr(MEM_RegWr), 
	.MEM_Rw(MEM_Rw), 
	.MEM_Result(MEM_Result), 
	.MEM_BusB(MEM_BusB),
	
	.CLK(clk), 
	.reset(reset_EXE_MEM)
);

wire [31:0] MEM_MemOut;
MEM_STAGE mem_stage (
	.MEM_MemWr(MEM_MemWr),
	.MEM_Result(MEM_Result),
	.MEM_BusB(MEM_BusB),
	.CLK(clk),
	.MEM_MemOut(MEM_MemOut)
);
	 
wire WB_MemtoReg;
wire [31:0] WB_Result, WB_MemOut; 
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
	.BusW(BusW)
);

endmodule
