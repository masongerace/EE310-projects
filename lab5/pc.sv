//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab 4
//Author: Mason Gerace
//Module Name: pc
//Module Function: pc
//***************************************************************
module pc (input logic [7:0]addr, 
			input logic clk, load_PC, incr_PC, reset, 
			output logic [7:0]pc );

	
	always_ff@(posedge clk, posedge reset)
	if(reset)
	begin
		pc <= 0;
		end
	else if(load_PC && ~incr_PC)
	begin
		pc <= addr;
		end
	else if(incr_PC && ~load_PC)
	begin
		pc <= pc + 1;
		end
		
endmodule
	