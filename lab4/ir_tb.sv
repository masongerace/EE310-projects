//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab 4
//Author: Mason Gerace
//Module Name: ir_tb
//Module Function: instruction register testbench module
//***************************************************************

module ir_tb( input logic [9:0] SW, input logic [1:0] KEY, output logic [6:0] HEX0, HEX1, HEX2, HEX3 );

	logic [7:0] opcode;
	logic [7:0] value;	//internal bus
	
	ir ir1( .MDR(SW[7:0]), .clk(KEY[0]), .RESET(~KEY[1]), .LOAD_IRL(SW[8]), .LOAD_IRU(SW[9]), .opcode(opcode), .value(value) );
	
	dualseg7 irdisp0( .blank(0), .test(0), .datain(value), .disp0(HEX0), .disp1(HEX1) );
	
	dualseg7 irdisp1( .blank(0), .test(0), .datain(opcode), .disp0(HEX2), .disp1(HEX3) );
	
endmodule 