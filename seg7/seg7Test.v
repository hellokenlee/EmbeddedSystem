`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:56:41 10/30/2014
// Design Name:   seg7
// Module Name:   /home/kenlee/ESADHW/seg7/seg7Test.v
// Project Name:  seg7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: seg7
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module seg7Test;

	// Inputs
	reg [3:0] a;

	// Outputs
	wire [6:0] seg;
	wire [3:0] ga;

	// Instantiate the Unit Under Test (UUT)
	seg7 uut (
		.a(a), 
		.seg(seg), 
		.ga(ga)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#100;
		a<=4'b0001;
		#100;
		a<=4'b0010;
		#100;
		a<=4'b0011;
		#100;
		a<=4'b0100;
		#100;
		a<=4'b0101;
		#100;
		a<=4'b0110;
		#100;
		a<=4'b0111;
		#100;
		a<=4'b1000;
		#100;
		a<=4'b1001;
		#100;
		a<=4'b1010;
		#100;
		a<=4'b1011;
		#100;
		a<=4'b1100;
		#100;
		a<=4'b1101;
		#100;
		a<=4'b1110;
		#100;
		a<=4'b1111;
	end
      
endmodule

