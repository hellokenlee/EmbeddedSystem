`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:19:13 11/08/2014
// Design Name:   bit4Adder
// Module Name:   /home/kenlee/ESADHW/bit4Adder/bit4AdderTest.v
// Project Name:  bit4Adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bit4Adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bit4AdderTest;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;

	// Outputs
	wire cout;
	wire [3:0] S;

	// Instantiate the Unit Under Test (UUT)
	bit4Adder uut (
		.A(A), 
		.B(B), 
		.cout(cout), 
		.S(S)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		// Add stimulus here
		#100;
		A<=4'b0000;
		B<=4'b0000;
		#100;
		A<=4'b0000;
		B<=4'b0001;
		#100;
		A<=4'b0000;
		B<=4'b0010;
		#100;
		A<=4'b0000;
		B<=4'b0011;
		#100;
		A<=4'b0000;
		B<=4'b0100;
		#100;
		A<=4'b0000;
		B<=4'b0101;
		#100;
		A<=4'b0000;
		B<=4'b0110;
		#100;
		A<=4'b0000;
		B<=4'b0111;
		#100;
		A<=4'b0000;
		B<=4'b1000;
		#100;
		A<=4'b0000;
		B<=4'b1001;
		#100;
		A<=4'b0000;
		B<=4'b1010;
		#100;
		A<=4'b0000;
		B<=4'b1011;
		#100;
		A<=4'b0000;
		B<=4'b1100;
		#100;
		A<=4'b0000;
		B<=4'b1101;
		#100;
		A<=4'b0000;
		B<=4'b1110;
		#100;
		A<=4'b0000;
		B<=4'b1111;
		
		#100;
		A<=4'b0001;
		B<=4'b0000;
		#100;
		A<=4'b0001;
		B<=4'b0001;
		#100;
		A<=4'b0001;
		B<=4'b0010;
		#100;
		A<=4'b0001;
		B<=4'b0011;
		#100;
		A<=4'b0001;
		B<=4'b0100;
		#100;
		A<=4'b0001;
		B<=4'b0101;
		#100;
		A<=4'b0001;
		B<=4'b0110;
		#100;
		A<=4'b0001;
		B<=4'b0111;
		#100;
		A<=4'b0001;
		B<=4'b1000;
		#100;
		A<=4'b0001;
		B<=4'b1001;
		#100;
		A<=4'b0001;
		B<=4'b1010;
		#100;
		A<=4'b0001;
		B<=4'b1011;
		#100;
		A<=4'b0001;
		B<=4'b1100;
		#100;
		A<=4'b0001;
		B<=4'b1101;
		#100;
		A<=4'b0001;
		B<=4'b1110;
		#100;
		A<=4'b0001;
		B<=4'b1111;
	end
      
endmodule

