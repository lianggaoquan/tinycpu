`timescale 1ns / 1ps
module counter_tb;
reg clk,reset,load,inc;
reg [15:0] d;
wire [15:0] q;
counter counter0(.clk(clk), .reset(reset), .load(load), .inc(inc), .d(d), .q(q));

initial begin
	clk = 0;
	forever
		#50 clk = ~clk;
end

initial begin
	$dumpfile("counter.vcd");
	$dumpvars(0,counter_tb);
	reset = 0;load = 0;
	inc = 0;
	d = 16'h0000;
	#100 reset = 1;
	#100 inc = 1;
	#300 inc = 0;load = 1;d = 16'h1234;
	#100 inc = 1;load = 0;d = 16'h0000;
	#500 reset = 0;
end
endmodule