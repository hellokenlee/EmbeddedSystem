`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:52:42 10/30/2014
// Design Name:   chooser38
// Module Name:   /home/kenlee/ESADHW/decoder38/decoder38Test.v
// Project Name:  decoder38
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: chooser38
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module decoder38Test;

	// Inputs
	reg [2:0] codeIn;

	// Outputs
	wire [7:0] ledOut;

	// Instantiate the Unit Under Test (UUT)
	chooser38 uut (
		.codeIn(codeIn), 
		.ledOut(ledOut)
	);

	initial begin
		// Initialize Inputs
		codeIn = 3'b000;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#100;
		codeIn=3'b000;
		#100;
		codeIn=3'b001;
		#100;
		codeIn=3'b010;
		#100;
		codeIn=3'b011;
		#100;
		codeIn=3'b100;
		#100;
		codeIn=3'b101;
		#100;
		codeIn=3'b110;
		#100;
		codeIn=3'b111;
	end
      
endmodule

