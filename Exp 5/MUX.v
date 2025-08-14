module MUX_32_2_1(
	a0, a1, s, y
);
input [31:0] a0, a1;
input s;
output [31:0] y;
reg [31:0] y;
always @ (a0, a1, s)
if (s == 0)
begin
	y <= a0;
end
else
begin
	y <= a1;
end
endmodule