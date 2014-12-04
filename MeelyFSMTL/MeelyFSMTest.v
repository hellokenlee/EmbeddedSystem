`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:02:15 11/22/2014
// Design Name:   MeelyFSM
// Module Name:   /home/kenlee/ESADHW/MeelyFSMTL/MeelyFSMTest.v
// Project Name:  MeelyFSMTL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MeelyFSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MeelyFSMTest;

	// Inputs
	reg clk;
	reg reset;
	reg Ta;
	reg Tb;

	// Outputs
	wire [2:0] LA;
	wire [2:0] LB;

	// Instantiate the Unit Under Test (UUT)
	MeelyFSM uut (
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
		Tb = 1;

		// Wait 100 ns for global reset to finish
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

