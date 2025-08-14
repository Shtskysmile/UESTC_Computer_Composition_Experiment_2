module Inst_Rom(
	pc, inst
);
input [4:0] pc;
output [31:0] inst;
wire [31:0] rom [0:31]; 


assign rom[5'h00] = 32'h00000000; 	// NOP
assign rom[5'h01] = 32'b000000_00010_00011_00001_00000_100000;	// add r1 r2 r3 r1 = 0x5
assign rom[5'h02] = 32'b000010_00000000000000000000000101;	// j 0x5
assign rom[5'h03] = 32'b000000_00010_00011_00001_00000_100000;	// add r1 r2 r3 r1 = 0x5 flush
assign rom[5'h04] = 32'b000000_00010_00011_00001_00000_100000;	// add r1 r2 r3 r1 = 0x5 ignored
assign rom[5'h05] = 32'b000100_00001_00001_0000000000000011;	// beq r1 r1 0x3 jump to 9
assign rom[5'h06] = 32'b000000_00010_00001_00011_00000_100001;	// addu r3 r2 r1
assign rom[5'h07] = 32'b000000_00101_00110_00100_00000_100001;	// addu r4 r5 r6
assign rom[5'h08] = 32'b000000_01000_01001_00111_00000_100001;	// addu r7 r8 r9
assign rom[5'h09] = 32'b000100_00001_00010_0000000000000111;	// beq r1 r2 0x7
assign rom[5'h0A] = 32'b000000_00011_00010_00011_00000_100000;	// add r3 r3 r2	r3 = 5
assign rom[5'h0B] = 32'h00000000;	// NOP
assign rom[5'h0C] = 32'b000000_00011_00001_00001_00000_100010;	// sub r1 r3 r1 r1 = 0
assign rom[5'h0D]=32'h00000000;   	
assign rom[5'h0E]=32'h00000000;   
assign rom[5'h0F]=32'h00000000;   
assign rom[5'h10]=32'h00000000;   
assign rom[5'h11]=32'h00000000;   
assign rom[5'h12]=32'h00000000;   
assign rom[5'h13]=32'h00000000;   
assign rom[5'h14]=32'h00000000;   
assign rom[5'h15]=32'h00000000;   
assign rom[5'h16]=32'h00000000;  
assign rom[5'h17]=32'h00000000;   
assign rom[5'h18]=32'h00000000;   
assign rom[5'h19]=32'h00000000;  
assign rom[5'h1A]=32'h00000000;   
assign rom[5'h1B]=32'h00000000;   
assign rom[5'h1C]=32'h00000000;   
assign rom[5'h1D]=32'h00000000;   
assign rom[5'h1E]=32'h00000000;   
assign rom[5'h1F]=32'h00000000;   
assign inst = rom[pc];

endmodule
