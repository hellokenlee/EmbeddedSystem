`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:20:53 10/30/2014 
// Design Name: 
// Module Name:    chooser 
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
module chooser(input wire[3:0] a,input wire[3:0] b,input wire s,output reg[3:0] y);
	always @ (a or b or s)
		if(s==0)
			y<=a;
		else
			y<=b;
endmodule
