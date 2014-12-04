`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:27:39 11/21/2014
// Design Name:   MorreFSM
// Module Name:   /home/kenlee/ESADHW/MorreFSMTL/MorreFSMTest.v
// Project Name:  MorreFSMTL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MorreFSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MorreFSMTest;

	// Inputs
	reg clk;
	reg reset;
	reg Ta;
	reg Tb;

	// Outputs
	wire [1:0] LA;
	wire [1:0] LB;

	// Instantiate the Unit Under Test (UUT)
	MorreFSM uut (
		.clk(clk), 
		.reset(reset), 
		.Ta(Ta), 
		.Tb(Tb), 
		.LA(LA), 
		.LB(LB)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		Ta = 0;
		Tb = 0;

		// Wait 100 ns for global reset to finish
		#10;
		reset=0;
		while(1)
		begin
			#5;
			clk=0;
			#5;
			clk=1;
		end
		// Add stimulus here

	end
      
endmodule

