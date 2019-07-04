`timescale 1ns/1ps
module stack_tb;
reg clk,reset,load,push,pop;
reg [15:0] d;
wire [15:0] qtop;
wire [15:0] qnext;

stack stack0(.clk(clk), .reset(reset), .load(load), .push(push), .pop(pop),
				.d(d), .qtop(qtop), .qnext(qnext));

initial begin
	clk = 0;
	forever
		#50 clk = ~clk;
end

initial begin
	$dumpfile("test.vcd");
	$dumpvars(0,stack_tb);
	
	reset = 0;load = 0;push = 0;pop = 0;d = 0;
	#100 reset=1;push=1;d=16'h1111;
	#100 push=1;d=16'h2222;
	#100 push=1;d=16'h3333;
	#100 push=1;d=16'h4444;
	#100 push=1;d=16'h5555;
	#100 push=0;pop=1;
	#100 pop=1;
	#100 pop=0;load=1;d=16'h1234;
	#100 load=0;pop=1;
end
endmodule