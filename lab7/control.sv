//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab 7
//Author: Mason Gerace
//Module Name: control
//Module Function: control module
//***************************************************************

module control( input logic [7:0] opcode, input logic NFLG, ZFLG, reset, clk, 
output logic LOAD_PC, INCR_PC, LOAD_AC, LOAD_IRU, LOAD_IRL, fetch, STORE_MEM,
output logic [2:0] STATE); 

	typedef enum logic [2:0] { start, prepu, fetchu, prepl, fetchl } statetype;

	statetype state, nextstate;
	
	always_ff@( negedge clk, posedge reset )
	
	if( reset ) state <= start;
	
	else state <= nextstate;
	
	always_comb
		case( state )
			start: nextstate = prepu;
			prepu: nextstate = fetchu;
			fetchu: nextstate = prepl;
			prepl: nextstate = fetchl;
			fetchl: nextstate = prepu;
			default: nextstate = start;
		endcase
		
	assign fetch = ( state == prepu  | state == fetchu | state == prepl | state == fetchl );
	assign INCR_PC = ( state == fetchu | state == fetchl );
	assign LOAD_IRU = ( state == fetchu );
	assign LOAD_IRL = ( state == fetchl );
	assign LOAD_AC = 0;
	assign LOAD_PC = 0;
	assign STORE_MEM = 0;
	assign STATE = state;
	
endmodule 
