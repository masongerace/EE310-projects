//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab 3
//Author: Mason Gerace
//Module Name: seg7
//Module Function module for the seven segment display
//**************************************************************************************

module seg7(input logic [3:0]push_in, input logic blank, input logic test, output logic [6:0] segments);
	always_comb
		if(blank)segments = 7'b111_1111;
		else if(~blank & test)segments = 7'b000_0000;
		else
			case(push_in)
			//
			0:		segments=7'b100_0000;
			1:		segments=7'b111_1001;
			2:		segments=7'b010_0100;
			3:		segments=7'b011_0000;
			4:		segments=7'b001_1001;
			5:		segments=7'b001_0010;
			6:		segments=7'b000_0010;
			7:		segments=7'b111_1000;
			8:		segments=7'b000_0000;
			9:		segments=7'b001_0000;
			10:	segments=7'b000_1000;
			11:	segments=7'b000_0011;
			12:	segments=7'b100_0110;
			13:	segments=7'b010_0001;
			14:	segments=7'b000_0110;
			15:	segments=7'b000_1110;
			endcase

endmodule 