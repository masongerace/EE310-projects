//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab 9
//Author: Mason Gerace
//Module Name: up3_cu_tb
//Module Function: up3 with control unit testbench module for lab 8
//***************************************************************

module up3_cu_tb( input logic [9:0] SW,
						input logic [3:0] KEY, 
						output logic [9:0] LEDR, 
						output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5 );

	logic [7:0] opcode, value, pc, ac, mdr, address, data, data0, data1, data2;		//internal busses
	
	logic [3:0] STATE;
	
	logic LOAD_PC, LOAD_AC, LOAD_IRU, LOAD_IRL, fetch, STORE_MEM, INCR_PC, LD_ADDR, LD_DAT, NFLG, ZFLG;

	always_comb  
		if(KEY[3])
			begin 
			data0 = mdr;
			data1 = address;
			data2 = pc;
			LEDR[0] = STORE_MEM; 
			LEDR[1] = fetch; 
			LEDR[2] = INCR_PC; 
			LEDR[3] = LOAD_PC; 
			LEDR[4] = LOAD_IRL; 
			LEDR[5] = LOAD_IRU; 
			LEDR[6] = LOAD_AC; 
			LEDR[7] = LD_DAT; 
			LEDR[8] = LD_ADDR;
			LEDR[9] = KEY[3];
			end
		else
			begin
			data0 = ac;
			//data1 will be datain (instead of value)
			data1 = value;
			data2 = opcode;
			LEDR[7:0] = STATE;
			LEDR[8] = 0;
			LEDR[9] = KEY[3];
			end
			
	up3_cu up3a( .clk(KEY[0]), .clk2(~KEY[2]), .reset(~KEY[1]), .LOAD_PC(LOAD_PC), .LOAD_AC(LOAD_AC), .LOAD_IRU(LOAD_IRU), .LOAD_IRL(LOAD_IRL), 
			.fetch(fetch), .STORE_MEM(STORE_MEM), .INCR_PC(INCR_PC), .pc(pc), .opcode(opcode), .value(value), 
			.STATE(STATE), .ac(ac), .address(address), .mdr(mdr), .LD_ADDR(SW[9]), .LD_DAT(SW[8]), dataIn(SW[7:0], .data(data) );

	dualseg7 irldisp( .datain(data0), .disp0(HEX0), .disp1(HEX1) );
	
	
	dualseg7 irudisp( .datain(data1), .disp0(HEX2), .disp1(HEX3) );
	
	
	dualseg7 pcdisp( .datain(data2), .disp0(HEX4), .disp1(HEX5) );

endmodule 
