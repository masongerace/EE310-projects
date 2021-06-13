//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab 4
//Author: Mason Gerace
//Module Name: ac_tb
//Module Function: accumulator testbench module
//***************************************************************

module ac_tb(input logic [8:0] SW, input logic [0:0] KEY[0], output logic [6:0] HEX0, HEX1);

	logic [7:0] ac; //internal AC bus

		ac ac1( .ac(ac), .Z(SW[7:0]), .clk(KEY[0]), .LOAD_AC(SW[8]) );

      dualseg7 acdisp0( .blank(0), .test(0), .datain(ac), .disp0(HEX0), .disp1(HEX1) );

endmodule
