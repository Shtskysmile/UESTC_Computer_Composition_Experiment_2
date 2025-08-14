`timescale 1ns / 1ps
module IF_STAGE(
	CLK, 
	Reset, 
	Jump, 
	Branch, 
	ID_jpc,
	EXE_bpc,
	IF_Inst, 
	IF_PC,
	stall
);
input CLK, Reset;
input stall;
input Jump, Branch;
input [31:0] ID_jpc, EXE_bpc;

output [31:0] IF_Inst, IF_PC;

Fetch fetch (
	.clk(CLK), 
	.reset(Reset), 
	.Branch(Branch), 
	.Jump(Jump), 
	.jpc(ID_jpc), 
	.bpc(EXE_bpc), 
	.IF_Inst(IF_Inst), 
	.IF_PC(IF_PC), 
	.stall(stall)
);


endmodule
