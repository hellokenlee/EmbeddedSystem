`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:45:12 10/30/2014 
// Design Name: 
// Module Name:    chooser38 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module chooser38(input wire[2:0] codeIn,
						output reg[7:0] ledOut);
	always @ (codeIn)
		case(codeIn)
			3'b000: ledOut<=8'b0000_0001;
			3'b001: ledOut<=8'b0000_0010;
			3'b010: ledOut<=8'b0000_0100;
			3'b011: ledOut<=8'b0000_1000;
			3'b100: ledOut<=8'b0001_0000;
			3'b101: ledOut<=8'b0010_0000;
			3'b110: ledOut<=8'b0100_0000;
			3'b111: ledOut<=8'b1000_0000;
		endcase
endmodule
