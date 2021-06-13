//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab 4
//Author: Mason Gerace
//Module Name: ac
//Module Function: accumulator sim
//***************************************************************
module ac (input logic signed [7:0]z, 
			input logic clk, 
			input logic load_ac, 
			output logic signed [7:0]ac);
	
	always_ff@(posedge clk)
	
	if(load_ac)
		ac <= z;
		
endmodule 
