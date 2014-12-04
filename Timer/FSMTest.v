`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:32:08 11/28/2014
// Design Name:   StateMachine
// Module Name:   /home/kenlee/ESADHW/Timer/FSMTest.v
// Project Name:  Timer
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: StateMachine
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FSMTest;

	// Inputs
	reg start;
	reg stop;
	reg inc;
	reg reset;
	reg msclk;

	// Outputs
	wire Cen;

	// Instantiate the Unit Under Test (UUT)
	StateMachine uut (
		.start(start), 
		.stop(stop), 
		.inc(inc), 
		.reset(reset), 
		.msclk(msclk), 
		.Cen(Cen)
	);

	initial begin
		// Initialize Inputs
		start = 1;
		stop = 0;
		inc = 0;
		reset = 1;
		msclk = 0;

		// Wait 100 ns for global reset to finish
		#100;
      reset=0;
		// Add stimulus here
		while(1)
		begin
			#5;
			msclk=1;
			#5;
			msclk=0;
		end
	end
   initial begin
		#500;
		start=0;
		stop=1;
		#100;
		stop=0;
		#100;
		inc=1;
		#100;
		inc=0;
		#100;
		inc=1;
		#100;
		inc=0;
	end
endmodule

