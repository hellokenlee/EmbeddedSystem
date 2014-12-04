`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:28:27 10/30/2014 
// Design Name: 
// Module Name:    comp2bit 
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
module comp2bit(input wire[1:0] a,input wire[1:0] b,output wire[2:0] z);
assign z[2]=(a[1]==b[1])&(a[0]==b[0]);
assign z[1]=(a[1]>b[1])||(a[1]==b[1]&a[0]>b[0]);
assign z[0]=(a[1]<b[1])||(a[1]==b[1]&a[0]<b[0]);
endmodule
