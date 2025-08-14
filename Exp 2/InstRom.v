module Inst_Rom(
	pc, inst
);
input [4:0] pc;
output [31:0] inst;
wire [31:0] rom [0:31]; 

// op rs rt rd shamt func
// op rs rt imm
// op target
assign rom[5'h00]=32'h00000000;	// nop
assign rom[5'h01]=32'b000000_00100_00101_00001_00000_100000;	//add r1,r4,r5  r1=0x9
assign rom[5'h02]=32'b000000_00011_00100_00010_00000_100010;	//sub r2,r3,r4  r2=0xffffffff
assign rom[5'h03]=32'b000000_00100_00101_00011_00000_100011;	//subu r3,r4,r5  r3=0xffffffff 	 
assign rom[5'h04]=32'b000000_00101_00110_00100_00000_101010;	//slt r4,r5,r6  r4=0x1 
assign rom[5'h05]=32'b000000_00110_00111_00101_00000_101011; //sltu r5,r6,r7  r5=0x1
assign rom[5'h06]=32'b001101_00101_00110_0000000000010000;	//ori r6,r5,0x10  r6=0x11	
assign rom[5'h07]=32'b001001_00110_00111_0000000000000100; //addiu r7,r6,4 r7=0x15  
assign rom[5'h08]=32'b100011_00111_01000_0000000000000010; //lw r8,r7,0x2 r8=mem[0x17]  
assign rom[5'h09]=32'b101011_00001_00010_0000000000000010; //sw r2,r1,0x2 mem[0xB]=r2=0xffffffff  
assign rom[5'h0A]=32'b000100_00011_00011_0000000000000001; //beq r3,r3,0x1  jump to 0x8
assign rom[5'h0B]=32'b000100_00011_00100_0000000000000001; //beq r3,r4,0x1  
assign rom[5'h0C]=32'b000010_00000000000000000000001000; //jump 0x8
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
