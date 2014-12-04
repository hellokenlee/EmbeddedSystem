`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:24:21 11/28/2014
// Design Name:   Decoder
// Module Name:   /home/kenlee/ESADHW/Timer/DecoderTest.v
// Project Name:  Timer
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Decoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DecoderTest;

	// Inputs
	reg [3:0] in;

	// Outputs
	wire [6:0] out;

	// Instantiate the Unit Under Test (UUT)
	Decoder uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#100;
		in<=in+1;
		#100;
		in<=in+1;
		#100;
		in<=in+1;
		#100;
		in<=in+1;
		#100;
		in<=in+1;
		#100;
		in<=in+1;
		#100;
		in<=in+1;
		#100;
		in<=in+1;
		#100;
		in<=in+1;
		#100;
		in<=in+1;
	end
      
endmodule

