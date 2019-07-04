`timescale 1ns/1ps
module alu_tb;
reg clk;
reg [15:0] a;
reg [15:0] b;
reg [4:0] f;
wire [15:0] s;

alu alu0(.a(a), .b(b), .f(f), .s(s));

initial begin
	clk = 0;
	forever
		#50 clk = ~clk;
end

initial begin
	$dumpfile("test.vcd");
	$dumpvars(0,alu_tb);
	a = 16'h0000;b = 16'h1234;f = 5'b0000; //ADD

#100 a=16'h000A;b=16'h0100;f=5'b00010;	//MUL
#100 a=16'h1010;b=16'hFFFF;f=5'b01000;	//AND
#100 a=16'h0008;b=16'h1234;f=5'b00100;	//SHR
#100 a=16'h0000;b=16'h1234;f=5'b10010;	//NOT
#100 a=16'h0005;b=16'h0004;f=5'b01100;	//GE
#100 $finish;
end
endmodule