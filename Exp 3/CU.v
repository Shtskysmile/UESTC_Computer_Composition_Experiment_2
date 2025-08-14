`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/26 11:01:19
// Design Name: 
// Module Name: CU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CU(Inst,RegDst,RegWr,ALUSrc,ALUctr,MemWr,MemtoReg,ExtOp,Jump,Branch
    );
    input [31:0] Inst;
    output RegDst,RegWr,ALUSrc,MemWr,MemtoReg,ExtOp,Jump,Branch;
    output [2:0] ALUctr;   
     
    wire i_add,i_sub,i_subu,i_slt,i_sltu,i_ori,i_addiu,i_lw,i_sw,i_beq,i_j;
    wire R_Op,R_type;
    wire [5:0] OP,Func;    
    
    assign OP=Inst[31:26];
    assign Func=Inst[5:0];    
    
    and (R_Op,~OP[5],~OP[4],~OP[3],~OP[2],~OP[1],~OP[0]);    
    
    and (i_add,R_Op,Func[5],~Func[4],~Func[3],~Func[2],~Func[1],~Func[0]);
    and (i_sub,R_Op,Func[5],~Func[4],~Func[3],~Func[2],Func[1],~Func[0]);
    and (i_subu,R_Op,Func[5],~Func[4],~Func[3],~Func[2],Func[1],Func[0]);
    and (i_slt,R_Op,Func[5],~Func[4],Func[3],~Func[2],Func[1],~Func[0]);
    and (i_sltu,R_Op,Func[5],~Func[4],Func[3],~Func[2],Func[1],Func[0]);
    and (i_ori,~OP[5],~OP[4],OP[3],OP[2],~OP[1],OP[0]);
    and (i_addiu,~OP[5],~OP[4],OP[3],~OP[2],~OP[1],OP[0]);
    and (i_lw,OP[5],~OP[4],~OP[3],~OP[2],OP[1],OP[0]);
    and (i_sw,OP[5],~OP[4],OP[3],~OP[2],OP[1],OP[0]);
    and (i_beq,~OP[5],~OP[4],~OP[3],OP[2],~OP[1],~OP[0]);
    and (i_j,~OP[5],~OP[4],~OP[3],~OP[2],OP[1],~OP[0]);   
     
    assign R_type=i_add|i_sub|i_subu|i_slt|i_sltu;
    assign RegDst=R_type;
    assign RegWr=R_type|i_ori|i_addiu|i_lw;
    assign ALUSrc=i_ori|i_addiu|i_lw|i_sw;
    assign MemWr=i_sw;
    assign MemtoReg=i_lw;
    assign ExtOp=i_addiu|i_lw|i_sw|i_beq;
    assign Jump=i_j;
    assign Branch=i_beq;    
    
    reg [2:0] ALUctr;
    always @(*)
    case(OP)
    6'b000000:
        case (Func)
        6'b100000:ALUctr=3'b001;
        6'b100010:ALUctr=3'b101;
        6'b100011:ALUctr=3'b100;
        6'b101010:ALUctr=3'b111;
        6'b101011:ALUctr=3'b110;
		  default:ALUctr=3'b011;
        endcase
    6'b001101:ALUctr=3'b010;    
    6'b001001:ALUctr=3'b000; 
    6'b100011:ALUctr=3'b000; 
    6'b101011:ALUctr=3'b000; 
    6'b000100:ALUctr=3'b100; 
   default:ALUctr=3'b011; 
   endcase   
   
endmodule
