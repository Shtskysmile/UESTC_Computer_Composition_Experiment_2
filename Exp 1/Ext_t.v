`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:38:25 12/18/2024
// Design Name:   Ext
// Module Name:   D:/Suhaotian/Exp1/Ext_t.v
// Project Name:  Exp1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Ext
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Ext_t;

	// Inputs
	reg [15:0] imm16;
	reg ExtOp;

	// Outputs
	wire [31:0] imm32;

	// Instantiate the Unit Under Test (UUT)
	Ext uut (
		.imm16(imm16), 
		.imm32(imm32), 
		.ExtOp(ExtOp)
	);

	initial begin
		// Initialize Inputs
		imm16 = 16'h8000;
		ExtOp = 0;

		// Wait 100 ns for global reset to finish
		#100;
      ExtOp = 1;  
		// Add stimulus here

	end
      
endmodule

