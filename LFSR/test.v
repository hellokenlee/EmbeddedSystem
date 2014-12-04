`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:26:00 11/17/2014
// Design Name:   LFSR
// Module Name:   /home/kenlee/ESADHW/LFSR/LFSRTest.v
// Project Name:  LFSR
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LFSR
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DisplayTest;

	// Inputs
	reg clk;
	reg clr;
	// Outputs
	wire [7:0] qs;

	// Instantiate the Unit Under Test (UUT)
	DisplaySR uut (
		.clk(clk), 
		.clr(clr),
		.qs(qs)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		clr=1;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		#10
		clr=0;
		while(1)
		begin
			#10;
			clk=~clk;
		end
	end
      
endmodule

