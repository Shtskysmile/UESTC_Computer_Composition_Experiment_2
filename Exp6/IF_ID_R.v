`timescale 1ns / 1ps
module IF_ID_R(
	IF_Inst, 
	ID_Inst,
	IF_PC,
	ID_PC,
	CLK, 
	Reset,
	stall
);
input [31:0] IF_Inst, IF_PC;
input CLK, Reset, stall;
output [31:0] ID_Inst, ID_PC;
reg [31:0] ID_Inst, ID_PC;
always @ (negedge Reset or posedge CLK)
	if (Reset == 0)
	begin
		ID_Inst <= 0;
		ID_PC <= 0;
	end
	else if (~stall)
	begin
		ID_Inst <= IF_Inst;
		ID_PC <= IF_PC;
	end
endmodule
