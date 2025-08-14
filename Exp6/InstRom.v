module Inst_Rom(
	pc, inst
);
input [4:0] pc;
output [31:0] inst;
wire [31:0] rom [0:31]; 

assign rom[5'h00] = 32'h00000000;										//NOP
assign rom[5'h01] = 32'b000000_00010_00011_00001_00000_100000;// add r1 r2 r3 r1 = 0x5
assign rom[5'h02] = 32'b000000_00001_00100_00010_00000_100000;// add r2 r1 r4 r2 = 0x9
assign rom[5'h03] = 32'b000000_00111_00001_00011_00000_100000;// add r3 r7 r1 r3 = 0xC
assign rom[5'h04] = 32'b100011_00001_00100_0000000000000010;// lw r4 0x2(r1) r4 = mem[0x7] = 0x7
// stall
assign rom[5'h05] = 32'b000000_00100_00001_00101_00000_100011;// subu r5 r4 r1 r5 = 0x2
assign rom[5'h06] = 32'b000000_00101_00001_00110_00000_100001;// addu r6 r5 r1 r6 = 0x7
assign rom[5'h07] = 32'b100011_01000_00111_0000000000000001; // lw r7 0x1(r8) r7 = mem[0x9] = 9
assign rom[5'h08] = 32'b101011_01001_00101_0000000000000010; // sw r5 0x2(r9) mem[0xB] = r5 = 2;
// bugs
assign rom[5'h09]=32'h10630001; // beq r3,r3,0x1  
assign rom[5'h0A]=32'h00000000; // NOP   
assign rom[5'h0B]=32'h00000000; // NOP 
assign rom[5'h0C]=32'h08000009; // jump 0x9 

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
