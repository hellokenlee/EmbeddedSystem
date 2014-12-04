`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:53:23 11/30/2014
// Design Name:   VGAStatic
// Module Name:   /home/kenlee/ESADHW/VGAStatic/VGATest.v
// Project Name:  VGAStatic
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
	reg [7:0] data;

	// Outputs
	wire vs;
	wire hs;
	wire [2:0] r;
	wire [2:0] g;
	wire [1:0] b;

	// Instantiate the Unit Under Test (UUT)
	VGAStatic uut (
		.dclk(dclk), 
		.data(data), 
		.vs(vs), 
		.hs(hs), 
		.r(r), 
		.g(g), 
		.b(b)
	);

	initial begin
		// Initialize Inputs
		dclk = 0;
		data = 8'b10_101_010;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		while(1)
		begin
			#1;
			dclk=1;
			#1;
			dclk=0;
		end
	end
      
endmodule

