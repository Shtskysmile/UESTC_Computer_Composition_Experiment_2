`timescale 1ns / 1ps
module IF_ID_R(
	IF_Inst, 
	ID_Inst, 
	CLK, 
	Reset,
	stall
);
input [31:0] IF_Inst;
input CLK, Reset, stall;
output [31:0] ID_Inst;
reg [31:0] ID_Inst;
always @ (negedge Reset or posedge CLK)
	if (Reset == 0)
	begin
		ID_Inst <= 0;
	end
	else if (~stall)
	begin
		ID_Inst <= IF_Inst;
	end
endmodule
