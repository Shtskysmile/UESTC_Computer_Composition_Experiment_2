`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:33:42 12/18/2024
// Design Name:   MUX_32_2_1
// Module Name:   D:/Suhaotian/Exp1/MUX_32_2_1_t.v
// Project Name:  Exp1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MUX_32_2_1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MUX_32_2_1_t;

	// Inputs
	reg [31:0] a0;
	reg [31:0] a1;
	reg s;

	// Outputs
	wire [31:0] y;

	// Instantiate the Unit Under Test (UUT)
	MUX_32_2_1 uut (
		.a0(a0), 
		.a1(a1), 
		.s(s), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		a0 = 0;
		a1 = 1;
		s = 0;

		// Wait 100 ns for global reset to finish
		#100;
      s = 1;  
		// Add stimulus here

	end
      
endmodule

