`timescale 1ns / 1ps
module ID_EXE_R(
	ID_MemtoReg, ID_MemWr, ID_ALUctr, ID_RegWr_Org, ID_Rw, ID_BusA, ID_B, ID_BusB,
	EXE_MemtoReg, EXE_MemWr, EXE_ALUctr, EXE_RegWr_Org, EXE_Rw, EXE_BusA, EXE_B, EXE_BusB, 
	CLK, reset
    );
input CLK, reset;
input ID_MemtoReg, ID_MemWr, ID_RegWr_Org;
input [2:0] ID_ALUctr;
input [4:0] ID_Rw;
input [31:0] ID_BusA, ID_B, ID_BusB;
output EXE_MemtoReg, EXE_MemWr, EXE_RegWr_Org;
output [2:0] EXE_ALUctr;
output [4:0] EXE_Rw;
output [31:0] EXE_BusA, EXE_B, EXE_BusB;
reg EXE_MemtoReg, EXE_MemWr, EXE_RegWr_Org;
reg [2:0] EXE_ALUctr;
reg [4:0] EXE_Rw;
reg [31:0] EXE_BusA, EXE_B, EXE_BusB;
always @ (negedge reset or posedge CLK)
	if (reset == 0)
	begin
		EXE_MemtoReg <= 0; 
		EXE_MemWr <= 0;  
		EXE_ALUctr <= 0;  
		EXE_RegWr_Org <= 0; 
		EXE_Rw <= 0;
		EXE_BusA <= 0; 
		EXE_B <= 0; 
		EXE_BusB <= 0;
	end
	else
	begin
		EXE_MemtoReg <= ID_MemtoReg; 
		EXE_MemWr <= ID_MemWr;  
		EXE_ALUctr <= ID_ALUctr;  
		EXE_RegWr_Org <= ID_RegWr_Org; 
		EXE_Rw <= ID_Rw;
		EXE_BusA <= ID_BusA; 
		EXE_B <= ID_B; 
		EXE_BusB <= ID_BusB;
	end
endmodule
