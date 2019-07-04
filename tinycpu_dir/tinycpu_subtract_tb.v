`timescale 1ns/1ps
module tinycpu_subtract_tb;

reg clk,reset,run;
reg [15:0] in;
wire [2:0] cs;
wire [15:0] irout,qtop,dbus,out;
wire [11:0] pcout,abus;

tinycpu tinycpu0(.clk(clk), .reset(reset), .run(run), .in(in),
				.cs(cs), .pcout(pcout), .irout(irout), .qtop(qtop),
				.abus(abus), .dbus(dbus), .out(out));

initial begin
	clk = 0;
	forever #50 clk = ~clk;
end

initial begin
	$dumpfile("test.vcd");
	$dumpvars(0,tinycpu_subtract_tb);
	reset = 0;run = 0;in = 3;
	#100 reset = 1;run = 1;
	#100 run = 0;in = 7;
	#12000 $finish;
end
endmodule