`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:28:39 12/18/2024
// Design Name:   PCR
// Module Name:   D:/Suhaotian/Exp1/PCR_t.v
// Project Name:  Exp1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PCR
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PCR_t;

	// Inputs
	reg [31:0] d_in;
	reg clk;
	reg reset;

	// Outputs
	wire [31:0] d_out;

	// Instantiate the Unit Under Test (UUT)
	PCR uut (
		.d_in(d_in), 
		.d_out(d_out), 
		.clk(clk), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		d_in = 0;
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 1;
      d_in = 32'h01010101;
		#100;
		d_in = 32'h02020202;
		// Add stimulus here

	end
always #25 clk = ~clk;      
endmodule

