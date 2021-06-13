//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab 3
//Author: Mason Gerace
//Module Name: seg7
//Module Function module for the seven segment display
//**************************************************************************************

module dualseg7(input logic [7:0] push_in, input logic blank, input logic test, output logic [13:7] out2, output logic [6:0] out1);

//Combinational Logic Statements
seg7 output1(.push_in(push_in[3:0]), .blank(blank), .test(test), .segments(out1[6:0]));

seg7 output2(.push_in(push_in[7:4]), .blank(blank), .test(test), .segments(out2[13:7]));

endmodule