//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab 2
//Author: Mason Gerace
//Module Name: jk_ff_tb
//Module Function jk flip flop test bench
//**************************************************************************************

module jk_ff_tb(input logic SW[1:0], input logic[1:0] KEY, output logic [0:0] LEDR);

	jk_ff jk_ff_tb_1(.j(SW[0]), .k(SW[1]), .reset(KEY[1]), .clk(KEY[0]), .q(LEDR[0]));
	
endmodule 