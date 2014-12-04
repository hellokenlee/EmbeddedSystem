`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:08:37 11/08/2014 
// Design Name: 
// Module Name:    bit4Adder 
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
module bit1Adder(input wire a,input wire b,input wire cin,
						output wire cout,output wire sum);
	assign sum=a^b^cin;
	assign cout=(a&b)^cin&(a^b);
	
endmodule

module bit4Adder(input wire[3:0] A,input wire[3:0] B,
					output wire cout,output wire[3:0] S);
	wire c0,c1,c2;
	bit1Adder adder0(A[0],B[0],1'b0,c0,S[0]);
	bit1Adder adder1(A[1],B[1],c0,c1,S[1]);
	bit1Adder adder2(A[2],B[2],c1,c2,S[2]);
	bit1Adder adder3(A[3],B[3],c2,cout,S[3]);
endmodule
