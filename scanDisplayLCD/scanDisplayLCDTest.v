`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:14:09 11/08/2014
// Design Name:   scanDisplayLCD
// Module Name:   /home/kenlee/ESADHW/scanDisplayLCD/scanDisplayLCDTest.v
// Project Name:  scanDisplayLCD
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: scanDisplayLCD
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module scanDisplayLCDTest;

	// Inputs
	reg clk;

	// Outputs
	wire [6:0] seg;
	wire [3:0] ga;

	// Instantiate the Unit Under Test (UUT)
	scanDisplayLCD uut (
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

