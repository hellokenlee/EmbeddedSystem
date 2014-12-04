`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:00:52 11/28/2014
// Design Name:   Divider
// Module Name:   /home/kenlee/ESADHW/Timer/deviderTest.v
// Project Name:  Timer
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Divider
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module deviderTest;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire msclk;

	// Instantiate the Unit Under Test (UUT)
	Divider uut (
		.clk(clk), 
		.reset(reset), 
		.msclk(msclk)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		
		// Wait 100 ns for global reset to finish
		#100;
      reset=0;
		// Add stimulus here
		while(1)
		begin
			#5;
			clk<=1;
			#5;
			clk<=0;
		end
	end
      
endmodule

