`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:19:07 12/18/2024
// Design Name:   Not
// Module Name:   D:/Suhaotian/Exp1/Not_t.v
// Project Name:  Exp1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Not
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Not_t;

	// Inputs
	reg A;

	// Outputs
	wire B;

	// Instantiate the Unit Under Test (UUT)
	Not uut (
		.A(A), 
		.B(B)
	);

	initial begin
		// Initialize Inputs
		A = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		A = 1;
	end
      
endmodule

