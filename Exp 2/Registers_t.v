`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:00:38 12/19/2024
// Design Name:   Registers
// Module Name:   D:/SuHaotian/Exp2/Registers_t.v
// Project Name:  Exp2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Registers
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Registers_t;

	// Inputs
	reg [4:0] rna;
	reg [4:0] rnb;
	reg [31:0] wd;
	reg [4:0] wn;
	reg write;
	reg clk;
	reg reset;

	// Outputs
	wire [31:0] A;
	wire [31:0] B;

	// Instantiate the Unit Under Test (UUT)
	Registers uut (
		.rna(rna), 
		.rnb(rnb), 
		.wd(wd), 
		.wn(wn), 
		.write(write), 
		.clk(clk), 
		.reset(reset), 
		.A(A), 
		.B(B)
	);

	initial begin
		// Initialize Inputs
		rna = 0;
		rnb = 0;
		wd = 0;
		wn = 0;
		write = 0;
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#50;
      reset = 1;  
		// Add stimulus here
		rna = 1;
		rnb = 2;
		#50;
		wd = 32'hffffffff;
		wn = 5;
		#50;
		rna = 5;
		#50;
		write = 1;
	end
always #25 clk = ~clk;      
endmodule

