//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab1
//Author: Mason Gerace
//Module Name: and3in
//Module Function: 3 input and gate
//**************************************************************************************

//Module Declaration
module and3in(
	SW0,	// input  SW0
	SW1,	// input  SW1
	SW2,	//	input	 SW2
	LEDR0	// output  LEDR0
);

//Internal Signal Declarations
input wire SW0;
input wire SW1;
input wire SW2;
output wire LEDR0;

//Combinational Logic Statements
assign LEDR0 = SW0 & SW1 & SW2;

//Sequential Logic Statements


endmodule
