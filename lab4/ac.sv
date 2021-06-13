//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab 4
//Author: Mason Gerace
//Module Name: ac
//Module Function: accumulator module
//***************************************************************

module ac(input logic signed [7:0] Z, input logic clk, input logic LOAD_AC, output logic signed [7:0] ac);
	
	always_ff@(posedge clk)
	
	if(LOAD_AC)
		ac <= Z;
		
endmodule 