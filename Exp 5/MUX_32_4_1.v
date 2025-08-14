`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:21:29 12/02/2024 
// Design Name: 
// Module Name:    MUX_32_4_1 
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
module MUX_32_4_1(
	a0, a1, a2, a3, s, y
    );
	input [31:0] a0, a1, a2, a3;
	input [1:0] s;
	output [31:0] y;
	reg [31:0] y;
	always @ (a0, a1, a2, a3, s)
	begin
		if (s == 0)
		begin
			y <= a0;
		end
		else if (s == 1)
		begin
			y <= a1;
		end
		else if (s == 2)
		begin
			y <= a2;
		end
		else 
		begin
			y <= a3;
		end
	end


endmodule
