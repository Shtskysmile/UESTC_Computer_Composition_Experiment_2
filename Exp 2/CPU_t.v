`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:18:47 11/18/2024
// Design Name:   CPU
// Module Name:   C:/Users/Administrator/Desktop/Suhaotian/Suhaotian/CPU_t.v
// Project Name:  Suhaotian
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module CPU_t;

	// Inputs
	reg clk;
	reg reset_reg;
	reg reset_pc;

	// Outputs
	wire [31:0] result;
	wire [31:0] pc;
	wire [31:0] inst;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.clk(clk), 
		.reset_reg(reset_reg), 
		.reset_pc(reset_pc), 
		.result(result), 
		.pc(pc), 
		.inst(inst)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset_reg = 0;
		reset_pc = 0;

		// Wait 100 ns for global reset to finish
		#40;
        reset_pc = 1;
		reset_reg = 1;
		// Add stimulus here

	end
      
always #20 clk = ~clk;
endmodule

