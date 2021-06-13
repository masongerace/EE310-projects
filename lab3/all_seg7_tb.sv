//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab 3
//Author: Mason Gerace
//Module Name: all_seg7_tb
//Module Function module for the seven segment display
//**************************************************************************************

//Module Declaration
module all_seg7_tb(input logic [9:0] SW, output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);

//Combinational Logic Statements
	dualseg7 dualseg7_1(.push_in(SW[7:0]), .blank(SW[9]), .test(SW[8]), .out1(HEX0), .out2(HEX1));

	dualseg7 dualseg7_2(.push_in(SW[7:0]), .blank(SW[9]), .test(SW[8]), .out1(HEX2), .out2(HEX3));
	
	dualseg7 dualseg7_3(.push_in(SW[7:0]), .blank(SW[9]), .test(SW[8]), .out1(HEX4), .out2(HEX5));

endmodule 
