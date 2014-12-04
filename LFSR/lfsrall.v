`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:01:25 11/17/2014 
// Design Name: 
// Module Name:    LFSR 
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
module DLatch(input clk,input clr,input d,
					output reg q);
		always@(posedge clr or posedge clk)
		begin
			if(clr==1)
			begin
				q<=0;
			end
			else
				q<=d;
		end
endmodule

module LFSR(input clk,input clr,
				output wire[3:0] q);
		DLatch D3(clk,clr,q[0],q[3]);
		DLatch D2(clk,clr,q[3]~^q[0],q[2]);
		DLatch D1(clk,clr,q[2],q[1]);
		DLatch D0(clk,clr,q[1],q[0]);
endmodule

module DisplaySR(input clk,input clr,
				output wire[7:0] qs);
		wire[3:0] randomOut;
		LFSR random(clk,clr,randomOut);
		DLatch D7(clk,clr,randomOut[2],qs[7]);
		DLatch D6(clk,clr,qs[7],qs[6]);
		DLatch D5(clk,clr,qs[6],qs[5]);
		DLatch D4(clk,clr,qs[5],qs[4]);
		DLatch D3(clk,clr,qs[4],qs[3]);
		DLatch D2(clk,clr,qs[3],qs[2]);
		DLatch D1(clk,clr,qs[2],qs[1]);
		DLatch D0(clk,clr,qs[1],qs[0]);
endmodule
//for better actual view divided clk into 1HZ
module DispalySlow(input clk1,input clr,
				output wire[7:0] qs);
		integer counter=0;
		reg clk2;
		DisplaySR Slow(clk2,clr,qs);
		always@(posedge clk1)
		begin
			counter<=counter+1;
			if(counter>=100_000_000)
			begin
				counter<=0;
				if(clk2!=0)
					clk2<=0;
				else
					clk2<=1;
			end
			else
				;
		end
endmodule

