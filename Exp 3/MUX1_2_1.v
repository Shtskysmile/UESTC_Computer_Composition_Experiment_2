module MUX1_2_1(a,b,s,c);
input a,b,s;
output c;
assign c=(s==0)?a:b;
endmodule

