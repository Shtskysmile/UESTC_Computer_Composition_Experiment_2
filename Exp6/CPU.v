`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:33:13 11/18/2024 
// Design Name: 
// Module Name:    CPU 
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
module CPU(
	clk, reset_reg, reset_pc, result, pc, inst
    );
input clk, reset_reg, reset_pc;
output [31:0] pc, inst, result;

wire branch, jump, zero, overflow, extop, regdst, regwr, alusrc, memwr, memtoreg, reg_wr;
wire [31:0] busA, busB, busW, dataout, B, imm32;
wire [25:0] target;
wire [15:0] imm16;
wire [2:0] aluctr;
wire [4:0] rs, rt, rd, rw;

assign reg_wr = regwr & (~overflow);
assign imm16 = inst[15:0];
assign target = inst[25:0];
assign rs = inst[25:21];
assign rt = inst[20:16];
assign rd = inst[15:11];
assign rw = (regdst == 0)? rt : rd;
Ext ext (
	.imm16(imm16), 
	.imm32(imm32), 
	.ExtOp(extop)
);

ALU alu(
	.A(busA),
	.B(B),
	.ALUctr(aluctr),
	.Zero(zero),
	.Overflow(overflow),
	.Result(result)
);

CU cu (
	.Inst(inst),
	.RegDst(regdst),
	.RegWr(regwr),
	.ALUSrc(alusrc),
	.ALUctr(aluctr),
	.MemWr(memwr),
	.MemtoReg(memtoreg),
	.ExtOp(extop),
	.Jump(jump),
	.Branch(branch)
);

Fetch fetch (
	.clk(clk), 
	.reset(reset_pc), 
	.branch(branch), 
	.zero(zero), 
	.jump(jump), 
	.target(target), 
	.imm16(imm16),
	.ExtOp(extop), 
	.Inst(inst), 
	.PC(pc)
);

DataMem datamem(
	.we(memwr),
	.addr(result[4:0]),
	.datain(busB),
	.clk(clk),
	.dataout(dataout)
);

Registers registers (
	.rna(rs),
	.rnb(rt),
	.wd(busW),
	.wn(rw),
	.write(reg_wr),
	.clk(clk),
	.reset(reset_reg),
	.A(busA),
	.B(busB)
);

MUX32_2_1 mem_or_alu(
	.A(result),
	.B(dataout),
	.S(memtoreg),
	.C(busW)
);

MUX32_2_1 busB_or_imm32(
	.A(busB),
	.B(imm32),
	.S(alusrc),
	.C(B)
);



endmodule
