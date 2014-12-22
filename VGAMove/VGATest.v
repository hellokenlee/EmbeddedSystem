`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:41:19 12/04/2014
// Design Name:   VGAStatic
// Module Name:   /home/kenlee/ESADHW/VGAMove/VGATest.v
// Project Name:  VGAMove
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VGAStatic
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module VGATest;

	// Inputs
	reg dclk;

	// Outputs
	wire vs;
	wire hs;
	wire [2:0] r;
	wire [2:0] g;
	wire [1:0] b;
	wire dirX;
	wire dirY;

	// Instantiate the Unit Under Test (UUT)
	VGAStatic uut (
		.dclk(dclk), 
		.vs(vs), 
		.hs(hs), 
		.r(r), 
		.g(g), 
		.b(b), 
		.dirX(dirX), 
		.dirY(dirY)
	);

	initial begin
		// Initialize Inputs
		dclk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		while(1)
		
	end
      
endmodule

