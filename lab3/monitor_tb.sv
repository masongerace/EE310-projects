//EE 310 Fundamentals of Computer Engineering
//Assignment: Lab 3
//Author: Mason Gerace
//Module Name: monitor
//Module Function test bench for monitor module
//**************************************************************************************

module monitor_tb (input logic [1:0] KEY, input logic [0:0] SW, output logic [0:0] LEDR);

	// Instantiate device under test (DUT)
	monitor monitor_test(KEY[1:0], SW[0], LEDR[0]);

endmodule
