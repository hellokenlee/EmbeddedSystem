`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:47:03 11/17/2014 
// Design Name: 
// Module Name:    Mux4Bit 
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
module Mux4Bit(input a,input b,input c,input d,input wire[1:0] s,
					output reg y);
		always@(*)
		begin
			case(s)
				2'b00:y<=a;
				2'b01:y<=b;
				2'b10:y<=c;
				2'b11:y<=d;
				//default:y<=a;
			endcase
		end
endmodule
