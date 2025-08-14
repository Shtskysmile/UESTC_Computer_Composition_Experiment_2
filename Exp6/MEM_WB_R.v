`timescale 1ns / 1ps
module MEM_WB_R(
	MEM_MemtoReg, MEM_RegWr, MEM_Rw, MEM_Result, MEM_MemOut, 
	WB_MemtoReg, WB_RegWr, WB_Rw, WB_Result, WB_MemOut,
	CLK, reset
    );
input CLK, reset;
input MEM_MemtoReg, MEM_RegWr;
input [4:0] MEM_Rw;
input [31:0] MEM_Result, MEM_MemOut;
output WB_MemtoReg, WB_RegWr;
output [4:0] WB_Rw;
output [31:0] WB_Result, WB_MemOut;
reg WB_MemtoReg, WB_RegWr;
reg [4:0] WB_Rw;
reg [31:0] WB_Result, WB_MemOut;
always @ (negedge reset or posedge CLK)
	if (reset == 0)
	begin
		WB_MemtoReg <= 0;
		WB_RegWr <= 0;
		WB_Rw <= 0;
		WB_Result <= 0;
		WB_MemOut <= 0;
	end
	else
	begin
		WB_MemtoReg <= MEM_MemtoReg;
		WB_RegWr <= MEM_RegWr;
		WB_Rw <= MEM_Rw;
		WB_Result <= MEM_Result;
		WB_MemOut <= MEM_MemOut;
	end
endmodule
