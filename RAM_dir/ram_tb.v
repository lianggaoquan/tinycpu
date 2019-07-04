`timescale 1ns/1ps
module ram_tb;
reg clk,load;
reg [11:0] addr;
reg [15:0] d;
wire [15:0] q;

ram ram0(.clk(clk), .load(load), .addr(addr), .d(d), .q(q));

initial begin
	clk = 0;
	forever
		#50 clk = ~clk;
end

initial begin
$dumpfile("test.vcd");
$dumpvars(0,ram_tb);

load = 0;d = 0;
#100 addr = 12'h000;
#100 addr = 12'h001;
#100 addr = 12'h006;
#100 addr = 12'h010;load = 1;d = 8'h55;
#100 addr = 12'h00D;load = 0;d = 0;
#100 addr = 12'h010;
end
endmodule