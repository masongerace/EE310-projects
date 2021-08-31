//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab 9
//Author: Mason Gerace
//Module Name: up3_cu
//Module Function: up3 with control unit module for final project
//***************************************************************

module up3_cu( input logic clk, clk2, reset,
					input logic [7:0] dataIn,
					output logic LOAD_PC, LOAD_AC, LOAD_IRU, LOAD_IRL, fetch, STORE_MEM, INCR_PC, LD_ADDR, LD_DAT,
					output logic [7:0] pc, opcode, value, ac, address, mdr,
					output logic [3:0] STATE );

	//data in bus goes here?
	logic [7:0] z, data;//ac, address, mdr;
	
	logic NFLG, ZFLG;
								
	ramlpminit ramlpm1( .data(ac), .wren(STORE_MEM), .address(address), .clock(clk), .q(mdr) );
	
	alu al1( .ac(ac), .MDR(mdr), .opcode(opcode), .value(value), .Z(z), .NFLG(NFLG), .ZFLG(ZFLG) );
	
	ac ac1( .z(z), .clk(clk), .load_ac(LOAD_AC), .ac(ac) );

	ir ir1( .mdr(mdr), .clk(clk), .reset(reset), .load_irl(LOAD_IRL), .load_iru(LOAD_IRU), .opcode(opcode), .value(value) );
	
	pc pc1( .value(value), .clk(clk), .reset(reset), .incr_pc(INCR_PC), .load_pc(LOAD_PC), .pc(pc) );
	
	mux2to1 mux1( .value(value), .pc(pc), .fetch(fetch), .address(address) );
	
	//changes start here
	//2:1 mux with addr/data and AC as inputs, output value line to fetch mux
	mux2to1 mux1( .value(value), .pc(data), .fetch(LD_ADDR), .address(value) );
	//
	//2:1 mux with addr/data and addr/value as inputs, output ac line to ram
	mux2to1 mux1( .value(ac), .pc(data), .fetch(LD_DAT), .address(ac) );

	//then the new ram will go here?
	//will take in addr/data, LD_DAT, LD_ADDR, clk2, and output 
	data_sw dataReg( .dataIn(dataIn), .clk( clk2 ), .reset(reset), .LD_ADDR(LD_ADDR), .LD_DAT(LD_DAT), .data_sw(data) )

	control control1( .opcode(opcode), .ZFLG(ZFLG), .NFLG(NFLG), .reset(reset), .clk(clk), .LOAD_PC(LOAD_PC), .LOAD_AC(LOAD_AC),
			.LOAD_IRU(LOAD_IRU), .LOAD_IRL(LOAD_IRL), .INCR_PC(INCR_PC), .fetch(fetch), .STORE_MEM(STORE_MEM), .STATE(STATE), 
			.LD_ADDR(LD_ADDR), .LD_DAT(LD_DAT) );
	
endmodule 
