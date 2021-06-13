//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab 8
//Author: Mason Gerace
//Module Name: control
//Module Function: control module
//***************************************************************

module control( input logic [7:0] opcode, input logic NFLG, ZFLG, reset, clk, 
output logic LOAD_PC, INCR_PC, LOAD_AC, LOAD_IRU, LOAD_IRL, fetch, STORE_MEM,
output logic [3:0] STATE); 

	typedef enum logic [3:0] { start, prepu, fetchu, prepl, fetchl, exec, storemem, readmem, jump } statetype;

	statetype state, nextstate;
	
	always_ff@( negedge clk, posedge reset )
	
	if( reset ) state <= start;
	
	else state <= nextstate;
 
		always_comb
		case( state )
			start: nextstate = prepu;
			prepu: nextstate = fetchu;
			
			fetchu: 	case( opcode )
							8'h00: nextstate = prepu;
							8'h04: nextstate = exec;
							default: nextstate = prepl;
						endcase
						
			prepl: nextstate = fetchl;
			
			fetchl: case( opcode )
							8'h01: nextstate = readmem; 
							8'h02: nextstate = exec; 
							8'h03: nextstate = storemem; 
							8'h05: nextstate = readmem; 
							8'h06: nextstate = exec; 
							8'h07: nextstate = readmem; 
							8'h08: nextstate = exec; 
							8'h09: nextstate = readmem; 
							8'h0A: nextstate = readmem; 
							8'h0B: nextstate = readmem; 
							8'h0C: nextstate = readmem; 
							8'h0D: nextstate = readmem;
							8'h0E: nextstate = exec; 
							8'h0F: nextstate = exec; 
							
							8'h10: nextstate = jump;
							
							8'h11: nextstate = ( NFLG )?jump:prepu; 
							8'h12: nextstate = ( ~NFLG )?jump:prepu; 
							8'h13: nextstate = ( ZFLG )?jump:prepu; 
							8'h14: nextstate = ( ~ZFLG )?jump:prepu; 
							
							default: nextstate = prepu;
							
						endcase
						
			

			readmem: nextstate = exec;
			exec: nextstate = prepu;
			storemem: nextstate = prepu;
			jump: nextstate = prepu;
			default: nextstate = start;
		endcase
 	
	assign fetch = ( state == prepu  | state == fetchu | state == prepl | state == fetchl );
	assign INCR_PC = ( state == fetchu | state == fetchl );
	assign LOAD_IRU = ( state == fetchu );
	assign LOAD_IRL = ( state == fetchl );
	assign LOAD_AC = ( state == exec );
	assign LOAD_PC = ( state == jump );
	assign STORE_MEM = ( state == storemem );
	assign STATE = state;
	
endmodule 
