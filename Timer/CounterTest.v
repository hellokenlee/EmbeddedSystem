`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:06:17 11/28/2014
// Design Name:   Counter
// Module Name:   /home/kenlee/ESADHW/Timer/CounterTest.v
// Project Name:  Timer
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CounterTest;

	// Inputs
	reg Cen;
	reg reset;
	reg msclk;

	// Outputs
	wire [3:0] one;
	wire [3:0] ten;
	wire [3:0] hun;
	wire [3:0] thoud;

	// Instantiate the Unit Under Test (UUT)
	Counter uut (
		.Cen(Cen), 
		.reset(reset), 
		.msclk(msclk), 
		.one(one), 
		.ten(ten), 
		.hun(hun), 
		.thoud(thoud)
	);

	initial begin
		// Initialize Inputs
		Cen = 1;
		reset = 1;
		msclk = 0;

		// Wait 100 ns for global reset to finish
		#100;
      reset=0;
		// Add stimulus here
		while(1)
		begin
			#5;
			msclk=1;
			#5;
			msclk=0;
		end
	end
      
endmodule

