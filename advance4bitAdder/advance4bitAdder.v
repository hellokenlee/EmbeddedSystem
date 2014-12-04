`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:10:57 11/08/2014 
// Design Name: 
// Module Name:    advance4bitAdder 
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
//Ci+1=Ai * Bi+（Ai+Bi）* Ci
module advance4bitAdder(input wire[3:0] A,input wire[3:0] B,
					output wire cout,output wire[3:0] S);
	wire c0,c1,c2,c3;
	assign c0=1'b0;
	assign c1=A[0]&B[0]^(A[0]^B[0])&c0;
	assign c2=A[1]&B[1]^(A[1]^B[1])&c1;
	assign c3=A[2]&B[2]^(A[2]^B[2])&c2;
	assign cout=A[3]&B[3]^(A[3]^B[3])&c3;
	assign S[0]=A[0]^B[0]^c0;
	assign S[1]=A[1]^B[1]^c1;
	assign S[2]=A[2]^B[2]^c2;
	assign S[3]=A[3]^B[3]^c3;
endmodule
