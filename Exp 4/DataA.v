`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:18:36 12/02/2024 
// Design Name: 
// Module Name:    DataA 
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
module DataA(
	WB_BusW, EXE_BusA, MEM_Result,
	FwdA,
	DataA
    );
	input [31:0] WB_BusW, EXE_BusA, MEM_Result;
	input [1:0] FwdA;
	output [31:0] DataA;
	MUX_32_4_1 mux(
		.a0(MEM_Result),
		.a1(WB_BusW),
		.a2(EXE_BusA),
		.a3(32'hxxxxxxxx),
		.s(FwdA),
		.y(DataA)
	);
endmodule
