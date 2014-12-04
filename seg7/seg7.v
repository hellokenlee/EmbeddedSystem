`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:17:31 10/30/2014 
// Design Name: 
// Module Name:    seg7 
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
module seg7(input wire[3:0] a,output reg[6:0] seg,output wire[3:0] ga);
	assign ga=4'b0111;

	always @(a)
		case(a)
			4'b0000:seg<=7'b000_0001;
			4'b0001:seg<=7'b100_1111;
			4'b0010:seg<=7'b001_0010;
			4'b0011:seg<=7'b000_0110;
			4'b0100:seg<=7'b100_1100;
			4'b0101:seg<=7'b010_0100;
			4'b0110:seg<=7'b010_0000;
			4'b0111:seg<=7'b000_1111;
			4'b1000:seg<=7'b000_0000;
			4'b1001:seg<=7'b000_0100;
			4'b1010:seg<=7'b000_1000;
			4'b1011:seg<=7'b110_0000;
			4'b1100:seg<=7'b011_0001;
			4'b1101:seg<=7'b100_0010;
			4'b1110:seg<=7'b011_0000;
			4'b1111:seg<=7'b011_1000;
		endcase
endmodule
