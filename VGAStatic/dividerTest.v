`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:39:26 11/30/2014
// Design Name:   divider
// Module Name:   /home/kenlee/ESADHW/VGAStatic/dividerTest.v
// Project Name:  VGAStatic
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: divider
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dividerTest;

	// Inputs
	reg clk;

	// Outputs
	wire dclk;

	// Instantiate the Unit Under Test (UUT)
	divider uut (
		.clk(clk), 
		.dclk(dclk)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
      while(1)
		begin
			#5;
			clk=1;
			#5;
			clk=0;
		end
		// Add stimulus here

	end
      
endmodule

