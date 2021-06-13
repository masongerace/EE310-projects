//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab 2
//Author: Mason Gerace
//Module Name: jk_ff
//Module Function jk flip flop 
//**************************************************************************************

module jk_ff(input logic clk, j, k, reset, output logic q);

always_ff @(negedge clk, negedge reset)
	if (~reset) q <= 0;//reset is active low
	
	else q <= (j&(~q)) | ((~k)&q);

endmodule 