`timescale 1ns / 1ps
module IF_STAGE(
	CLK, 
	Reset, 
	imm16, 
	Jump, 
	Branch, 
	Zero, 
	target, 
	ExtOp, 
	Inst, 
	PC
);
input CLK, Reset, Jump, Branch, Zero, ExtOp;
input [25:0] target;
input [15:0] imm16;
output [31:0] Inst,PC;
Fetch fetch (
	.clk(CLK), 
	.reset(Reset), 
	.branch(Branch), 
	.zero(Zero), 
	.jump(Jump), 
	.target(target), 
	.imm16(imm16),
	.ExtOp(ExtOp), 
	.Inst(Inst),
	.PC(PC)
);
endmodule
