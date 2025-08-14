`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:35:12 12/18/2024
// Design Name:   Inst_Rom
// Module Name:   D:/Suhaotian/Exp1/InstRom_t.v
// Project Name:  Exp1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Inst_Rom
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module InstRom_t;

	// Inputs
	reg [4:0] pc;

	// Outputs
	wire [31:0] inst;

	// Instantiate the Unit Under Test (UUT)
	Inst_Rom uut (
		.pc(pc), 
		.inst(inst)
	);

	initial begin
		// Initialize Inputs
		pc = 0;

		// Wait 100 ns for global reset to finish
		#100;
		pc = 4;
		#100;
		pc = 8;
        
		// Add stimulus here

	end
      
endmodule

