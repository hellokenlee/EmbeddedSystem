`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:46:43 11/08/2014
// Design Name:   bit4ToBCD
// Module Name:   /home/kenlee/ESADHW/bit4ToBCD/bit4ToBCDTest.v
// Project Name:  bit4ToBCD
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bit4ToBCD
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bit4ToBCDTest;

	// Inputs
	reg [3:0] bin;

	// Outputs
	wire [4:0] BCD;

	// Instantiate the Unit Under Test (UUT)
	bit4ToBCD uut (
		.bin(bin), 
		.BCD(BCD)
	);

	initial begin
		// Initialize Inputs
		bin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#100;
		bin<=4'b0000;
		#100;
		bin<=4'b0001;
		#100;
		bin<=4'b0010;
		#100;
		bin<=4'b0011;
		#100;
		bin<=4'b0100;
		#100;
		bin<=4'b0101;
		#100;
		bin<=4'b0110;
		#100;
		bin<=4'b0111;
		#100;
		bin<=4'b1000;
		#100;
		bin<=4'b1001;
		#100;
		bin<=4'b1010;
		#100;
		bin<=4'b1011;
		#100;
		bin<=4'b1100;
		#100;
		bin<=4'b1101;
		#100;
		bin<=4'b1110;
		#100;
		bin<=4'b1111;
	end
      
endmodule

