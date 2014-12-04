`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:30:34 10/30/2014
// Design Name:   chooser
// Module Name:   /home/kenlee/ESADHW/chooser/chooserTest.v
// Project Name:  chooser
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: chooser
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module chooserTest;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg s;

	// Outputs
	wire [3:0] y;

	// Instantiate the Unit Under Test (UUT)
	chooser uut (
		.a(a), 
		.b(b), 
		.s(s), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		a = 3'b101;
		b = 3'b010;
		s = 0;

		// Wait 100 ns for global reset to finish
		#100;
       
		// Add stimulus here
		#200;
		s<=1;
		#200
		s<=0;
	end
      
endmodule

