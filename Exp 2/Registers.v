`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/26 10:48:23
// Design Name: 
// Module Name: Registers
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


module Registers(rna,rnb,wd,wn,write,clk,reset,A,B
    );
	 input [4:0] rna,rnb,wn;
    input [31:0] wd;
	 input write,clk,reset;
	 output [31:0] A,B;
	 reg [31:0] register [1:31];
	 assign A=(rna==0)?0:register[rna];
	 assign B=(rnb==0)?0:register[rnb];
	 integer i;
	 always @(posedge clk or negedge reset)
	     if(reset==0) 
		  begin		  
		  for(i=1;i<11;i=i+1)		
		      register[i]<=i;
		  for(i=11;i<32;i=i+1)
		      register[i]<=0; 
		  end  		 
		  else if((wn!=0)&&write)
		     register[wn]<=wd;
endmodule
