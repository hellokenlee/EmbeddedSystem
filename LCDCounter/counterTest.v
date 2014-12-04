`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:52:46 11/13/2014
// Design Name:   counter
// Module Name:   /home/kenlee/ESADHW/LCDCounter/counterTest.v
// Project Name:  LCDCounter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module counterTest;

	// Inputs
	reg clk;

	// Outputs
	wire [6:0] seg;
	wire [3:0] ga;

	// Instantiate the Unit Under Test (UUT)
	counter uut (
		.clk(clk), 
		.seg(seg), 
		.ga(ga)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		while(1)
		begin
			#5;
			clk=1;
			#5;
			clk=0;
		end
	end
      
endmodule

