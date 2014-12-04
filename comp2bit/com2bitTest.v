`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:40:08 10/30/2014
// Design Name:   comp2bit
// Module Name:   /home/kenlee/2cmp/comp2bit/com2bitTest.v
// Project Name:  comp2bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: comp2bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module com2bitTest;

	// Inputs
	reg [1:0] a;
	reg [1:0] b;
	// output
	wire[2:0] c;
	// Instantiate the Unit Under Test (UUT)
	comp2bit uut (a,b,c);

	initial begin
		// Initialize Inputs
		a[0] = 1;
		a[1] = 1;
		b[0] = 1;
		b[1] = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#100
			a<=2'b00;
			b<=2'b00;
		#100
			a<=2'b00;
			b<=2'b01;
		#100
			a<=2'b00;
			b<=2'b10;
		#100
			a[0]<=0;
			a[1]<=0;
			b[0]<=1;
			b[1]<=1;
		#100
			a[0]<=0;
			a[1]<=1;
			b[0]<=0;
			b[1]<=0;
		#100
			a[0]<=0;
			a[1]<=1;
			b[0]<=0;
			b[1]<=1;
		#100
			a[0]<=0;
			a[1]<=1;
			b[0]<=1;
			b[1]<=0;
		#100
			a[0]<=0;
			a[1]<=1;
			b[0]<=1;
			b[1]<=1;
		#100
			a[0]<=1;
			a[1]<=0;
			b[0]<=0;
			b[1]<=0;
		#100
			a[0]<=1;
			a[1]<=0;
			b[0]<=0;
			b[1]<=1;
		#100
			a[0]<=1;
			a[1]<=0;
			b[0]<=1;
			b[1]<=0;
		#100
			a[0]<=1;
			a[1]<=0;
			b[0]<=1;
			b[1]<=1;
		#100
			a[0]<=1;
			a[1]<=1;
			b[0]<=0;
			b[1]<=0;
		#100
			a[0]<=1;
			a[1]<=1;
			b[0]<=0;
			b[1]<=1;
		#100
			a[0]<=1;
			a[1]<=1;
			b[0]<=1;
			b[1]<=0;
		#100
			a[0]<=1;
			a[1]<=1;
			b[0]<=1;
			b[1]<=1;
	end
      
endmodule

