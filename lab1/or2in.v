//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab1
//Author: Mason Gerace
//Module Name: or2in
//Module Function: 2 input or gate
//**************************************************************************************

//Module Declaration
module or2in(
	SW0,	// input  SW0_sig
	SW1,	// input  SW1_sig
	LEDR0	// output  LEDR0_sig
);

//Internal Signal Declarations
input wire SW0;
input wire SW1;
output wire LEDR0;
//Combinational Logic Statements
assign LEDR0 = SW0 | SW1;

//Sequential Logic Statements


endmodule 