module ram(clk,load,addr,d,q);
parameter DWIDTH = 16,AWIDTH = 12, WORDS = 4096;

input clk,load;
input [AWIDTH-1:0] addr;
input [DWIDTH-1:0] d;
output [DWIDTH-1:0] q;
reg [DWIDTH-1:0] q;
reg [DWIDTH-1:0] mem [WORDS-1:0];

always @(posedge clk)
	begin
		if(load) mem[addr] <= d;
		q <= mem[addr];
	end

integer i;
initial begin
	for(i=0;i<WORDS;i=i+1)
		mem[i] = 0;

mem[12'h000] = 16'hD000;
mem[12'h001] = 16'h3010;
mem[12'h002] = 16'h2010;
mem[12'h003] = 16'hE000;
mem[12'h004] = 16'h2010;
mem[12'h005] = 16'h500F;
mem[12'h006] = 16'h2010;
mem[12'h007] = 16'h1001;
mem[12'h008] = 16'hF001;
mem[12'h009] = 16'h3010;
mem[12'h00A] = 16'hD000;
mem[12'h00B] = 16'h1005;
mem[12'h00C] = 16'hF001;
mem[12'h00D] = 16'hE000;
mem[12'h00E] = 16'h4002;
mem[12'h00F] = 16'h0000;
mem[12'h010] = 16'h0000;
end
endmodule