`timescale 1ns / 1ps
module ID_STAGE(
	ID_Inst,
	ID_PC,
	ID_ALUctr,
	ID_MemWr,
	ID_MemtoReg,
	ID_Rw,
	Branch,
	Jump,
	BusW,
	CLK,
	Reset,
	ID_BusA,
	ID_BusB,
	
	WB_Rw,
	WB_Reg_Wr,
	ID_RegWr_Org,

	ID_RegDst,
	ID_ALUSrc,
	ID_Imm32,
	
	ID_jpc,
	ID_Inst_flush
);
input CLK, Reset, WB_Reg_Wr;
input [4:0] WB_Rw;
input [31:0] ID_Inst, BusW;
input [31:0] ID_PC;
input Branch;
output ID_MemWr, ID_MemtoReg, Jump, ID_RegWr_Org;
output [4:0] ID_Rw;
output [2:0] ID_ALUctr; 
output [31:0] ID_BusA, ID_BusB;

output [31:0] ID_jpc;
output [31:0] ID_Inst_flush;

// new code
output ID_RegDst;
output ID_ALUSrc;
output [31:0] ID_Imm32;

wire [4:0] rs, rt, rd;
wire [25:0] target;
wire [15:0] imm16;
wire ExtOp;

assign target = ID_Inst[25:0];
assign imm16 = ID_Inst[15:0];
assign rs = ID_Inst[25:21];
assign rt = ID_Inst[20:16];
assign rd = ID_Inst[15:11];
assign ID_jpc = {ID_PC[31:28], target, 2'b00};
assign ID_Rw = (ID_RegDst == 0)? rt : rd;

Ext ext (
	.imm16(imm16), 
	.imm32(ID_Imm32), 
	.ExtOp(ExtOp)
);

CU cu (
	.Inst(ID_Inst_flush),
	.RegDst(ID_RegDst),
	.RegWr(ID_RegWr_Org),
	.ALUSrc(ID_ALUSrc),
	.ALUctr(ID_ALUctr),
	.MemWr(ID_MemWr),
	.MemtoReg(ID_MemtoReg),
	.Jump(Jump),
	.ExtOp(ExtOp)
);

Registers registers (
	.rna(rs),
	.rnb(rt),
	.wd(BusW),
	.wn(WB_Rw),
	.write(WB_Reg_Wr),
	.clk(CLK),
	.reset(Reset),
	.A(ID_BusA),
	.B(ID_BusB)
);

// Remove the MUX in ID_STAGE
// MUX32_2_1 busB_or_imm32(
// 	.A(ID_BusB),
// 	.B(imm32),
// 	.S(ALUSrc),
// 	.C(ID_B)
// );

Flush_ID flush_id(
	.ID_Inst_org(ID_Inst),
	.Branch(Branch),
	.ID_Inst(ID_Inst_flush)
);


endmodule
