//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab 4
//Author: Mason Gerace
//Module Name: pc_tb
//Module Function: program counter testbench module
//***************************************************************

module pc_tb( input logic [9:0] SW, input logic [1:0] KEY, output logic [6:0] HEX0, HEX1 );

	logic [7:0] pc; //internal bus
	
	pc pc1( .value(SW[7:0]), .clk(KEY[0]), .RESET(~KEY[1]), .INCR_PC(SW[8]), .LOAD_PC(SW[9]), .pc(pc) );
	
	dualseg7 pcdisp0( .blank(0), .test(0), .datain(pc), .disp0(HEX0), .disp1(HEX1) );
	
endmodule 