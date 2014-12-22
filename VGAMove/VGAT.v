`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:44:39 12/04/2014
// Design Name:   VGA
// Module Name:   /home/kenlee/ESADHW/VGAMove/VGAT.v
// Project Name:  VGAMove
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VGA
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module VGAT;

	// Inputs
	reg clk;
	reg[7:0] data;
	// Outputs
	wire vs;
	wire hs;
	wire [2:0] r;
	wire [2:0] g;
	wire [1:0] b;

	// Instantiate the Unit Under Test (UUT)
	VGA uut (
		.clk(clk), 
		.data(data),
		.vs(vs), 
		.hs(hs), 
		.r(r), 
		.g(g), 
		.b(b)
	);

	initial begin
		// Initialize Inputs
		data=8'b1111_1111;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		while(1)
		begin
			#5;
			clk=1;
			#5;
			clk=0;
		end
	end
      
endmodule

