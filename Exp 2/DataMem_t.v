`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:06:29 12/19/2024
// Design Name:   DataMem
// Module Name:   D:/SuHaotian/Exp2/DataMem_t.v
// Project Name:  Exp2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DataMem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DataMem_t;

	// Inputs
	reg we;
	reg [4:0] addr;
	reg [31:0] datain;
	reg clk;

	// Outputs
	wire [31:0] dataout;

	// Instantiate the Unit Under Test (UUT)
	DataMem uut (
		.we(we), 
		.addr(addr), 
		.datain(datain), 
		.clk(clk), 
		.dataout(dataout)
	);

	initial begin
		// Initialize Inputs
		we = 0;
		addr = 0;
		datain = 0;
		clk = 0;

		// Wait 50 ns for global reset to finish
		#50;
        
		// Add stimulus here
		addr = 1;
		datain = 32'hffffffff;
		#50;
		we = 1;
	end
always #25 clk = ~clk;      
endmodule

