`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:34:56 11/18/2024
// Design Name:   Fetch
// Module Name:   C:/Users/Administrator/Desktop/Suhaotian/Suhaotian/Fetch_t.v
// Project Name:  Suhaotian
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Fetch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Fetch_t;

	// Inputs
	reg clk;
	reg reset;
	reg branch;
	reg zero;
	reg jump;
	reg [25:0] target;
	reg [15:0] imm16;
	reg ExtOp;

	// Outputs
	wire [31:0] Inst;
	wire [31:0] PC;

	// Instantiate the Unit Under Test (UUT)
	Fetch uut (
		.clk(clk), 
		.reset(reset), 
		.branch(branch), 
		.zero(zero), 
		.jump(jump), 
		.target(target), 
		.imm16(imm16), 
		.ExtOp(ExtOp), 
		.Inst(Inst), 
		.PC(PC)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		branch = 0;
		zero = 0;
		jump = 0;
		target = 26'h8;
		imm16 = 16'h4;
		ExtOp = 0;

		// Wait 100 ns for global reset to finish
		#20;
		reset = 1;
		#100;
		branch = 1;
		zero = 1;
		#20;
		zero = 0;
		jump = 1;

	end
always #10 clk = ~clk;
endmodule