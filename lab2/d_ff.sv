//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab 2
//Author: Mason Gerace
//Module Name: d_ff
//Module Function d flip flop 
//**************************************************************************************

//Module Declaration
module d_ff(input logic clk, d, reset, output logic q);

//Internal Signal Declarations
always_ff @(posedge clk, negedge reset)
	if (~reset) q <= 0;//reset is active low
	//Combinational Logic Statements
	else q <= d;
//Sequential Logic Statements
endmodule 
