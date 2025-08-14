module MUX32_4_1(A,B,C,D,S,Result);
input [31:0] A,B,C,D;
input [1:0] S;
output [31:0] Result;
reg [31:0] Result;
always @(*) begin
case(S) 
2'b00: Result=A;
2'b01: Result=B;
2'b10: Result=C;
2'b11: Result=D;
endcase
end
endmodule