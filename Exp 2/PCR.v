module PCR(
	d_in, d_out, clk, reset
);
input clk, reset;
input [31:0] d_in;
output [31:0] d_out;
reg [31:0] d_out;

always @ (negedge reset or posedge clk)
if (reset == 0)
begin
	d_out <= 0;
end
else
begin 
	d_out <= d_in;
end
endmodule
