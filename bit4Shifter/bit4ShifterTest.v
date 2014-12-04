`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:46:56 11/08/2014
// Design Name:   bit4Shifter
// Module Name:   /home/kenlee/ESADHW/bit4Shifter/bit4ShifterTest.v
// Project Name:  bit4Shifter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bit4Shifter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bit4ShifterTest;

	// Inputs
	reg [2:0] s;
	reg [3:0] d;

	// Outputs
	wire [3:0] y;

	// Instantiate the Unit Under Test (UUT)
	bit4Shifter uut (
		.s(s), 
		.d(d), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		s = 0;
		d = 4'o1234;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#100;
		s=3'b000;
		#100;
		s=3'b001;
		#100;
		s=3'b010;
		#100;
		s=3'b011;
		#100;
		s=3'b100;
		#100;
		s=3'b101;
		#100;
		s=3'b110;
		#100;
		s=3'b111;
	end
      
endmodule

