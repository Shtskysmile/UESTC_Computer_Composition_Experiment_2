`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:33:49 12/02/2024 
// Design Name: 
// Module Name:    Passby_Stall_Unit 
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
module Passby_Stall_Unit(
    EXE_RegDst, EXE_Rt, EXE_Rs, MEM_Rw, WB_Rw, WB_RegWr, MEM_RegWr, MEM_MemtoReg, 
    FwdA, FwdB, stall
    );
    input EXE_RegDst, WB_RegWr, MEM_RegWr, MEM_MemtoReg;
    input [4:0] EXE_Rt, EXE_Rs, MEM_Rw, WB_Rw;
    output [1:0] FwdA, FwdB;
    output stall;
    reg[1:0] FwdA, FwdB;
    reg stall;
    always @ (EXE_RegDst or EXE_Rt or EXE_Rs or MEM_Rw or WB_Rw or WB_RegWr or MEM_RegWr or MEM_MemtoReg)
    begin
        if ((EXE_Rs == MEM_Rw) && MEM_RegWr && (~MEM_MemtoReg))
        begin 
            FwdA <= 2'b00;   // MEM_Result
        end
        else if ((EXE_Rs == WB_Rw) && WB_RegWr)
        begin
            FwdA <= 2'b01;   // WB_BusW
        end
        else
        begin
            FwdA <= 2'b10;    // BusA
        end

        if ((EXE_Rt == MEM_Rw) && MEM_RegWr && (~MEM_MemtoReg) && EXE_RegDst)
        begin
            FwdB <= 2'b00;   // MEM_Result
        end
        else if ((WB_Rw == EXE_Rt) && WB_RegWr && EXE_RegDst)
        begin
            FwdB <= 2'b01;   // WB_BusW
        end
        else
        begin
            FwdB <= 2'b10;   // BusB
        end

        if (((EXE_Rs == MEM_Rw) || ((EXE_Rt == MEM_Rw) && EXE_RegDst)) && MEM_MemtoReg && MEM_RegWr && (MEM_Rw!=0))
        begin
            stall <= 1;
        end
        else
        begin
            stall <= 0;
        end
    end

endmodule
