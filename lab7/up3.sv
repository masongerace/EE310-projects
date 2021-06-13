//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab 7
//Author: Mason Gerace
//Module Name: up3
//Module Function: up3 module
//***************************************************************

module up3( input logic clk, reset, LOAD_PC, LOAD_AC, LOAD_IRU, LOAD_IRL, 
				fetch, STORE_MEM, INCR_PC, 
				output logic [7:0] pc, opcode, value );

	logic [7:0] z, ac, mdr, address;
	logic NFLG, ZFLG;
	
	ramlpminit ramlpm1( .data(ac), .wren(STORE_MEM), .address(address), .clock(clk), .q(mdr) );
	
	alu al1( .ac(ac), .MDR(mdr), .opcode(opcode), .value(value), .Z(z), .NFLG(NFLG), .ZFLG(ZFLG) );
	
	ac ac1( .z(z), .clk(clk), .load_ac(LOAD_AC), .ac(ac) );

	ir ir1( .mdr(mdr), .clk(clk), .reset(reset), .load_irl(LOAD_IRL), .load_iru(LOAD_IRU), .opcode(opcode), .value(value) );
	
	pc pc1( .value(value), .clk(clk), .reset(reset), .incr_pc(INCR_PC), .load_pc(LOAD_PC), .pc(pc) );
	
	mux2to1 mux1( .value(value), .pc(pc), .fetch(fetch), .address(address) );
	
endmodule 	