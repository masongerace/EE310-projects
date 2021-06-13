//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab 5
//Author: Mason Gerace
//Module Name: alu
//Module Function: alu module
//***************************************************************

module alu( input logic signed [7:0] MDR, input logic signed [7:0] ac, input logic signed [7:0] opcode, 
				input logic signed [7:0] value, output logic signed [7:0] Z, output logic ZFLG, NFLG );
		
	enum { NOP, LOAD, LOADI, STORE, CLR, ADD, ADDI, SUBT, SUBTI, 
			 NEG, NOT, AND, OR, XOR, SHL, SHR, JUMP, JNEG, JPOSZ,
			 JZERO, JNZER } opcodes; 
	assign ZFLG = ( ac == 0 )? 1:0;
	assign NFLG = ac[7]? 1:0;
	always_comb
		case( opcode )
		
		8'h01: 		Z = MDR; 						//LOAD MDR
		8'h02:		Z = value;						//LOAD value			
		8'h04:		Z <= 8'b0; 						//clear			
		8'h05:		Z = ac + MDR;					//add ac + mdr		
		8'h06:		Z = ac + value;				//add ac + value			
		8'h07:		Z = ac - MDR; 					//sub ac - mdr	
		8'h08:		Z = ac - value;				//sub ac - value			
		8'h09:		Z = ~MDR + 1;					//neg 0 - mdr			
		8'h0A:		Z = ~MDR;						//not ~mdr			
		8'h0B:		Z = ac & MDR;					//and ac & mdr			
		8'h0C:		Z = ac | MDR;					//or ac | mdr			
		8'h0D:		Z = ac ^ MDR;					//xor ac ^ mdr			
		8'h0E:		Z = ac << value[2:0];		//ac shifted left			
		8'h0F:		Z = ac >> value[2:0];		//ac shifted right
		default:		Z = 8'b0;						//default case
		
		endcase
		
endmodule
