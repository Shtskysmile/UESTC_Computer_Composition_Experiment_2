`timescale 1ns / 1ps
module MEM_STAGE(
	MEM_MemWr,
	MEM_Result,
	MEM_BusB,
	CLK,
	MEM_MemOut
);
input MEM_MemWr, CLK;
input [31:0] MEM_Result, MEM_BusB;
output [31:0] MEM_MemOut;
DataMem datamem(
	.we(MEM_MemWr),
	.addr(MEM_Result[4:0]),
	.datain(MEM_BusB),
	.clk(CLK),
	.dataout(MEM_MemOut)
);
endmodule
