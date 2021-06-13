//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab 5
//Author: Mason Gerace
//Module Name: up3_tb
//Module Function: up3 testbench module
//***************************************************************

module up3_cu_tb( input logic [9:0] SW, input logic [3:0] KEY, output logic [9:0] LEDR, output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5 );

	logic [7:0] opcode, value, pc;		//internal busses
	
	logic [2:0] STATE;
	
	logic LOAD_PC, LOAD_AC, LOAD_IRU, LOAD_IRL, fetch, STORE_MEM, INCR_PC;
	
	assign clk = KEY[0];
	assign reset = ~KEY[1];
	
	assign LEDR[0] = STORE_MEM;
	assign LEDR[1] = fetch;
	assign LEDR[2] = INCR_PC;
	assign LEDR[3] = LOAD_PC;
	assign LEDR[4] = LOAD_IRL;
	assign LEDR[5] = LOAD_IRU;
	assign LEDR[6] = LOAD_AC;
	assign LEDR[9:7] = STATE;
	
	up3_cu up3b( .clk(KEY[0]), .reset(~KEY[1]), .LOAD_PC(LOAD_PC), .LOAD_AC(LOAD_AC), .LOAD_IRU(LOAD_IRU), .LOAD_IRL(LOAD_IRL), 
					.fetch(fetch), .STORE_MEM(STORE_MEM), .INCR_PC(INCR_PC), .pc(pc), .opcode(opcode), .value(value), .STATE(STATE) );

	dualseg7 irldisp( .blank(0), .test(0), .datain(value), .disp0(HEX0), .disp1(HEX1) );
	
	
	dualseg7 irudisp( .blank(0), .test(0), .datain(opcode), .disp0(HEX2), .disp1(HEX3) );
	
	
	dualseg7 pcdisp( .blank(0), .test(0), .datain(pc), .disp0(HEX4), .disp1(HEX5) );
	
endmodule 	