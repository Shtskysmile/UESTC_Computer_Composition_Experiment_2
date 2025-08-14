module Ext(
	imm16, imm32, ExtOp
);
input ExtOp;
input [15:0] imm16;
output [31:0] imm32;
reg [31:0] imm32;
always @ (ExtOp or imm16 or imm32)
	imm32 = (ExtOp == 1)?{{16{imm16[15]}},imm16}:{{16{0}},imm16};
endmodule