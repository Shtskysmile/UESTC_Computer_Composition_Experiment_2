`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:31:18 12/09/2024 
// Design Name: 
// Module Name:    Flush_ID 
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
module Flush_ID(
	ID_Inst_org, Branch, ID_Inst
    );
	input [31:0] ID_Inst_org;
	input Branch;
	output [31:0] ID_Inst;
	reg [31:0] ID_Inst;
	always @ (*)
	begin
		if (Branch)
		begin
			ID_Inst <= 0;
		end
		else 
		begin
			ID_Inst <= ID_Inst_org;
		end
	end

endmodule
