//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab 8
//Author: Mason Gerace
//Module Name: up3_cu
//Module Function: up3 with control unit module for lab 8
//***************************************************************

module up3_cu( input logic clk, reset,
					output logic LOAD_PC, LOAD_AC, LOAD_IRU, LOAD_IRL, fetch, STORE_MEM, INCR_PC,
					output logic [7:0] pc, opcode, value, ac, address, mdr,
					output logic [3:0] STATE );

	logic [7:0] z;//ac, address, mdr;
	
	logic NFLG, ZFLG;
								
	ramlpminit ramlpm1( .data(ac), .wren(STORE_MEM), .address(address), .clock(clk), .q(mdr) );
	
	alu al1( .ac(ac), .MDR(mdr), .opcode(opcode), .value(value), .Z(z), .NFLG(NFLG), .ZFLG(ZFLG) );
	
	ac ac1( .z(z), .clk(clk), .load_ac(LOAD_AC), .ac(ac) );

	ir ir1( .mdr(mdr), .clk(clk), .reset(reset), .load_irl(LOAD_IRL), .load_iru(LOAD_IRU), .opcode(opcode), .value(value) );
	
	pc pc1( .value(value), .clk(clk), .reset(reset), .incr_pc(INCR_PC), .load_pc(LOAD_PC), .pc(pc) );
	
	mux2to1 mux1( .value(value), .pc(pc), .fetch(fetch), .address(address) );
	
	control control1( .opcode(opcode), .ZFLG(ZFLG), .NFLG(NFLG), .reset(reset), .clk(clk), .LOAD_PC(LOAD_PC), .LOAD_AC(LOAD_AC),
				.LOAD_IRU(LOAD_IRU), .LOAD_IRL(LOAD_IRL), .INCR_PC(INCR_PC), .fetch(fetch), .STORE_MEM(STORE_MEM), .STATE(STATE) );
	
endmodule 