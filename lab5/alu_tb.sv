//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab 5
//Author: Mason Gerace
//Module Name: alu_tb
//Module Function: alu testbench module
//***************************************************************

module alu_tb( input logic [9:0] SW, input logic [3:0] KEY, output logic [9:0] LEDR, output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5 );

	logic [7:0] ac;
	logic [7:0] mdr;
	logic [7:0] opcode;
	logic [7:0] value;	
	logic [7:0] z;			//internal buses
	
	assign clk = KEY[0];
	assign load_value = ~KEY[1];
	assign load_ac = ~KEY[2];
	assign load_mdr = ~KEY[3];
	assign dataentry = SW[7:0];
	assign reset = SW[8];
	assign load_opcode = SW[9];
	assign LEDR[7:0] = value;

	alu al1( .ac(ac), .MDR(mdr), .opcode(opcode), .value(value), .Z(z), .NFLG(LEDR[8]), .ZFLG(LEDR[9]), );
	
	dualseg7 aludisp( .blank(0), .test(0), .datain(z), .disp0(HEX0), .disp1(HEX1) );
	
	
	
	ac ac1( .z(SW[7:0]), .clk(KEY[0]), .load_ac(~KEY[2]), .ac(ac) );

   	dualseg7 acdisp( .blank(0), .test(0), .datain(ac), .disp0(HEX2), .disp1(HEX3) );

	
	
	ir ir1( .mdr(SW[7:0]), .clk(KEY[0]), .reset(SW[8]), .load_irl(~KEY[1]), .load_iru(SW[9]), .opcode(opcode), .value(value) );
	
	
	
	pc pc1( .value(SW[7:0]), .clk(KEY[0]), .reset(SW[8]), .load_pc(~KEY[3]), .pc(mdr) );
	
	dualseg7 pcdisp( .blank(0), .test(0), .datain(mdr), .disp0(HEX4), .disp1(HEX5) );

endmodule 