module DataMem(we,addr,datain,clk,dataout
    );
	 input [31:0] datain;
	 input [4:0] addr;
	 input clk,we;
	 output [31:0] dataout;
	 
	 reg [31:0] ram [0:31];
	 assign dataout=ram[addr];		
	 always @(posedge clk)begin
	 if(we)ram[addr]=datain;
	 end
	 
	 integer i;
	 initial 
	 begin		
	 for(i=0;i<11;i=i+1)				
	    ram[i]=i;
	 for(i=11;i<32;i=i+1)				
	    ram[i]=0;
     end
	 
endmodule
