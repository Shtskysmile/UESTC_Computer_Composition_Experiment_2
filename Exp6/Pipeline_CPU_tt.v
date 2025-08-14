`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:01:53 12/09/2024
// Design Name:   Pipeline_CPU
// Module Name:   D:/SuhaotianSky/Pipeline_CPU_tt.v
// Project Name:  SuhaotianSky
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Pipeline_CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Pipeline_CPU_tt;

	// Inputs
	reg clk;
	reg reset_pc;
	reg reset_reg;
	reg reset_IF_ID;
	reg reset_ID_EXE;
	reg reset_EXE_MEM;
	reg reset_MEM_WB;

	// Outputs
	wire [31:0] result;

	// Instantiate the Unit Under Test (UUT)
	Pipeline_CPU uut (
		.clk(clk), 
		.reset_pc(reset_pc), 
		.reset_reg(reset_reg), 
		.reset_IF_ID(reset_IF_ID), 
		.reset_ID_EXE(reset_ID_EXE), 
		.reset_EXE_MEM(reset_EXE_MEM), 
		.reset_MEM_WB(reset_MEM_WB), 
		.result(result)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset_pc = 0;
		reset_reg = 0;
		reset_IF_ID = 0;
		reset_ID_EXE = 0;
		reset_EXE_MEM = 0;
		reset_MEM_WB = 0;

		// Wait 20 ns for global reset to finish
		#50;
      reset_pc = 1;
		reset_reg = 1;
		reset_IF_ID = 1;
		reset_ID_EXE = 1;
		reset_EXE_MEM = 1;
		reset_MEM_WB = 1;
		
		// Add stimulus here

	end
always #25 clk = ~clk;
endmodule

