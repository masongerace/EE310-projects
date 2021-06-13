//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab 5
//Author: Mason Gerace
//Module Name: mux2to1
//Module Function: mux2to1
//***************************************************************

module mux2to1( input logic [7:0] value, pc, input logic fetch, output logic [7:0] address );

	assign address = (fetch)?pc:value;

endmodule 