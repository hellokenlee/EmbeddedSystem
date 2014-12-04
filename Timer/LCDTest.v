`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:46:08 11/28/2014
// Design Name:   LCDDisPlay
// Module Name:   /home/kenlee/ESADHW/Timer/LCDTest.v
// Project Name:  Timer
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LCDDisPlay
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module LCDTest;

	// Inputs
	reg msclk;
	reg reset;
	reg [3:0] one;
	reg [3:0] ten;
	reg [3:0] hun;
	reg [3:0] thoud;

	// Outputs
	wire [6:0] seg;
	wire [3:0] ga;
	wire dp;

	// Instantiate the Unit Under Test (UUT)
	LCDDisPlay uut (
		.msclk(msclk), 
		.reset(reset), 
		.one(one), 
		.ten(ten), 
		.hun(hun), 
		.thoud(thoud), 
		.seg(seg), 
		.ga(ga), 
		.dp(dp)
	);

	initial begin
		// Initialize Inputs
		reset = 1;
		one = 0;
		ten = 0;
		hun = 0;
		thoud = 0;
		#100;
		reset=0;
		while(1)
		begin
			#100;
			one<=one+1;
			if(one>=10)
			begin
				one<=0;
				ten<=ten+1;
			end
			if(ten>=10)
			begin
				ten<=0;
				hun<=hun+1;
			end
			if(hun>=10)
			begin
				hun<=0;
				thoud<=thoud+1;
			end
			if(thoud>=10)
				thoud<=0;
		end
	end
   initial begin
		msclk=0;
		while(1)
		begin
			#5;
			msclk<=1;
			#5;
			msclk<=0;
		end
	end
endmodule

