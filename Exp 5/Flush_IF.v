`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:08:56 12/09/2024 
// Design Name: 
// Module Name:    Flush 
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
module Flush_IF(
	IF_Inst_org, Branch, Jump, IF_Inst 
    );
input [31:0] IF_Inst_org;
input Branch, Jump;
output [31:0] IF_Inst;
reg [31:0] IF_Inst;
always @ (*)
begin
	if (Branch || Jump)
	begin
		IF_Inst <= 32'h00000000;
	end
	else
	begin
		IF_Inst <= IF_Inst_org;
	end
end

endmodule
