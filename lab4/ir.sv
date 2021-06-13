//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab 4
//Author: Mason Gerace
//Module Name: ir
//Module Function: instruction register module
//***************************************************************

module ir (input logic signed [7:0] MDR, input logic clk, input logic LOAD_IRU, LOAD_IRL, RESET, 
				output logic signed [7:0] opcode, value);
	
always_ff@(posedge clk, posedge RESET)
	if(RESET)
	begin
		opcode <= 8'b0;
		value <= 8'b0;
	end
	
	else if (LOAD_IRU && ~LOAD_IRL)
	begin
		opcode <= MDR;
	end

	else if (~LOAD_IRU && LOAD_IRL)
	begin
		value <= MDR;
	end

endmodule
	