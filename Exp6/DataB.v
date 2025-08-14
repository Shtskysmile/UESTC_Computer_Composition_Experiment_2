`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:30:29 12/02/2024 
// Design Name: 
// Module Name:    DataB 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module DataB(
	EXE_BusB, WB_BusW, MEM_Result,
	FwdB,
	DataB
    );
	input [31:0] EXE_BusB, WB_BusW, MEM_Result;
	input [1:0] FwdB;
	output [31:0] DataB;
	MUX_32_4_1 mux(
		.a0(MEM_Result),
		.a1(WB_BusW),
		.a2(EXE_BusB),
		.a3(32'hxxxxxxxx),
		.s(FwdB),
		.y(DataB)
	);

endmodule
