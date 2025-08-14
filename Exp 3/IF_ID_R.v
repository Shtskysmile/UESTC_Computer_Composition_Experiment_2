`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:32:25 11/25/2024 
// Design Name: 
// Module Name:    IF_ID_R 
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
module IF_ID_R(
	IF_Inst, 
	ID_Inst, 
	CLK, 
	Reset
);
input [31:0] IF_Inst;
input CLK, Reset;
output [31:0] ID_Inst;
reg [31:0] ID_Inst;
always @ (negedge Reset or posedge CLK)
	if (Reset == 0)
	begin
		ID_Inst <= 0;
	end
	else
	begin
		ID_Inst <= IF_Inst;
	end
endmodule
