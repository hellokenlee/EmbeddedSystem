`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:37:43 11/08/2014
// Design Name:   priorityEncoder
// Module Name:   /home/kenlee/ESADHW/priorityEncoder/priorityEncoderTest.v
// Project Name:  priorityEncoder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: priorityEncoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module priorityEncoderTest;

	// Inputs
	reg [0:7] x;

	// Outputs
	wire [0:2] y;
	wire inValid;

	// Instantiate the Unit Under Test (UUT)
	priorityEncoder uut (
		.x(x), 
		.y(y), 
		.inValid(inValid)
	);

	initial begin
		// Initialize Inputs
		x = 8'b00000000;
	
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#100;
		x<=8'b10_000_000;
		#100;
		x<=8'b11_000_000;
		#100;
		x<=8'b11_100_000;
		#100;
		x<=8'b11_110_000;
		#100;
		x<=8'b11_111_000;
		#100;
		x<=8'b11_111_100;
		#100;
		x<=8'b11_111_110;
		#100;
		x<=8'b11_111_111;
		#100;
		x<=8'b10_000_001;
	end
      
endmodule

