//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab 4
//Author: Mason Gerace
//Module Name: ir
//Module Function: ir
//***************************************************************
module ir (input logic [7:0]MDR, 
			input logic clk, 
			input logic load_IRU, 
			input logic load_IRL, 
			input logic reset, 
			output logic [7:0] opcode, value);
	
always_ff@(posedge clk, posedge reset)
if(reset)
	begin
	opcode <= 0;
	value <= 0;
	end
else if (load_IRU && ~load_IRL)
	begin
	opcode <= MDR;
	value <= value;
	end
else if (~load_IRU && load_IRL)
	begin
	opcode <= opcode;
	value <= MDR;
	end
endmodule