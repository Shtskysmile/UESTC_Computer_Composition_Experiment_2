`timescale 1ns / 1ps
module WB_STAGE(
	WB_Result, WB_MemOut, WB_MemtoReg,
	BusW
);
input WB_MemtoReg;
input [31:0] WB_Result, WB_MemOut;
output [31:0] BusW;

MUX32_2_1 mem_or_alu(
	.A(WB_Result),
	.B(WB_MemOut),
	.S(WB_MemtoReg),
	.C(BusW)
);

endmodule
