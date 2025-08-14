module Fetch(
	clk, reset, Branch, Jump, jpc, bpc, IF_Inst, IF_PC, stall
);
input clk, reset, Branch, Jump;
input [31:0] jpc, bpc;
input stall;
output [31:0] IF_Inst, IF_PC;

wire [31:0] IF_Inst_org;
wire [31:0] Npc;
wire [31:0] pc4;
assign pc4 = IF_PC + 32'h00000004;
assign Npc = (Branch)?bpc:((Jump)?jpc:pc4);

PCR pcr (
		.d_in(Npc), 
		.d_out(IF_PC), 
		.clk(clk), 
		.reset(reset),
		.stall(stall)
	);
	
Inst_Rom InstMem (
		.pc(IF_PC[6:2]),
		.inst(IF_Inst_org)
	);

Flush_IF flush_if (
	.IF_Inst_org(IF_Inst_org),
	.Branch(Branch),
	.Jump(Jump),
	.IF_Inst(IF_Inst)
);

endmodule
