//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab 2
//Author: Mason Gerace
//Module Name: d_ff_tb
//Module Function d flip flop testbench
//**************************************************************************************
//Module Declaration
module d_ff_tb(input logic [0:0] SW, input logic [1:0] KEY, output logic [0:0] LEDR);
	//Internal Signal Declarations
	d_ff d_ff_1(.d(SW[0]), .reset(KEY[1]), .clk(KEY[0]), .q(LEDR[0]));
//Sequential Logic Statements
endmodule 