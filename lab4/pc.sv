//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab 4
//Author: Mason Gerace
//Module Name: pc
//Module Function: program counter module
//***************************************************************

module pc(input logic [7:0] value, input logic clk, LOAD_PC, INCR_PC, RESET, output logic [7:0] pc );

	
	always_ff@(posedge clk, posedge RESET)
	if(RESET)
	begin
		pc <= 8'b0;
	end
	
	else if(LOAD_PC && ~INCR_PC)
	begin
		pc <= value;
	end
	
	else if(INCR_PC && ~LOAD_PC)
	begin
		pc <= pc + 1;
	end

endmodule 