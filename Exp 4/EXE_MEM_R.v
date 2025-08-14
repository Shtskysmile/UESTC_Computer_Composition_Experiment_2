`timescale 1ns / 1ps
module EXE_MEM_R(
	EXE_MemtoReg, EXE_MemWr, EXE_RegWr, EXE_Rw, EXE_Result, B,
	MEM_MemtoReg, MEM_MemWr, MEM_RegWr, MEM_Rw, MEM_Result, MEM_BusB,
	CLK, reset
);
input CLK, reset;
input EXE_MemtoReg, EXE_MemWr, EXE_RegWr;
input [4:0] EXE_Rw;
input [31:0] EXE_Result, B;
output MEM_MemtoReg, MEM_MemWr, MEM_RegWr;
output [4:0] MEM_Rw;
output [31:0] MEM_Result, MEM_BusB;
reg MEM_MemtoReg, MEM_MemWr, MEM_RegWr;
reg [4:0] MEM_Rw;
reg [31:0] MEM_Result, MEM_BusB;
always @ (negedge reset or posedge CLK)
	if (reset == 0)
	begin
		MEM_MemtoReg <= 0; 
		MEM_MemWr <= 0; 
		MEM_RegWr <= 0; 
		MEM_Rw <= 0;
		MEM_Result <= 0; 
		MEM_BusB <= 0;
	end
	else
	begin
		MEM_MemtoReg <= EXE_MemtoReg; 
		MEM_MemWr <= EXE_MemWr; 
		MEM_RegWr <= EXE_RegWr; 
		MEM_Rw <= EXE_Rw;
		MEM_Result <= EXE_Result; 
		MEM_BusB <= B;
	end
endmodule
