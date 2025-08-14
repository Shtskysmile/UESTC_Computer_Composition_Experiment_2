module Fetch(
	clk, reset, branch, zero, jump, target, imm16, ExtOp, Inst, PC, stall
);
input clk, reset, branch, zero, jump, ExtOp;
input [25:0] target;
input [15:0] imm16;
output [31:0] Inst, PC;

// new code
input stall;

wire [31:0] Npc, jpc, PC4, bpc, imm32, imm32_bpc, Other_PC;
wire B_Select;

PCR pcr (
		.d_in(Npc), 
		.d_out(PC), 
		.clk(clk), 
		.reset(reset),
		.stall(stall)
	);
	
Adder adder1 (
		.a(PC), 
		.b(32'h0004), 
		.c(PC4)
	);

Adder adder2 (
		.a(PC4), 
		.b(imm32_bpc), 
		.c(bpc)
	);
	
MUX_32_2_1 muxBranch (
		.a0(PC4), 
		.a1(bpc), 
		.s(B_Select), 
		.y(Other_PC)
	);
	
MUX_32_2_1 muxJump (
		.a0(Other_PC), 
		.a1(jpc), 
		.s(jump), 
		.y(Npc)
	);
	
Ext ext (
		.imm16(imm16), 
		.imm32(imm32), 
		.ExtOp(ExtOp)
	);
	
Inst_Rom InstMem (
		.pc(PC[6:2]),
		.inst(Inst)
	);

assign jpc = {PC[31:28], {target[25:0], 2'b00}};
assign imm32_bpc = {imm32[29:0], 2'b00};
assign B_Select = branch & zero;

endmodule
