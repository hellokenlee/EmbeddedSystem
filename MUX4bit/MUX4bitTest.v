`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:02:12 11/17/2014
// Design Name:   Mux4Bit
// Module Name:   /home/kenlee/ESADHW/MUX4bit/MUX4bitTest.v
// Project Name:  MUX4bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mux4Bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MUX4bitTest;

	// Inputs
	reg a;
	reg b;
	reg c;
	reg d;
	reg [1:0] s;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	Mux4Bit uut (
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d), 
		.s(s), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		c = 0;
		d = 0;
		s = 2'b00;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#100;
		s=2'b00;
		a = 1;
		b = 0;
		c = 0;
		d = 0;
		#100;
		s=2'b01;
		a = 0;
		b = 1;
		c = 0;
		d = 0;
		#100;
		s=2'b10;
		a = 0;
		b = 0;
		c = 1;
		d = 0;
		#100;
		s=2'b11;
		a = 0;
		b = 0;
		c = 0;
		d = 1;
		#100;
		s=2'b00;
		a = 0;
		b = 0;
		c = 0;
		d = 0;
	end
      
endmodule

