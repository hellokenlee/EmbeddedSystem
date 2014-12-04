`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:05:14 11/17/2014
// Design Name:   bit4ShiftRegister
// Module Name:   /home/kenlee/ESADHW/bit4ShiftRegister/bit4ShiftRegisterTest.v
// Project Name:  bit4ShiftRegister
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bit4ShiftRegister
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bit4ShiftRegisterTest;

	// Inputs
	reg data_in;
	reg clk;
	reg clr;

	// Outputs
	wire [3:0] q;

	// Instantiate the Unit Under Test (UUT)
	bit4ShiftRegister uut (
		.data_in(data_in), 
		.clk(clk), 
		.clr(clr), 
		.q(q)
	);

	initial begin
		// Initialize Inputs
		data_in = 0;
		clk = 0;
		clr = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		clr=1;
		data_in=1;
		#50;
		clk=~clk;
		#50;
		clk=~clk;
		clr=0;
		#50;
		clk=~clk;
		#50;
		clk=~clk;
		#50;
		clk=~clk;
		#50;
		clk=~clk;
		#50;
		clk=~clk;
		#50;
		clk=~clk;
		#50;
		clk=~clk;
		#50;
		clk=~clk;
		clr=1;
		while(1)
		begin
			#50;
			clk=~clk;
		end
	end
      
endmodule

