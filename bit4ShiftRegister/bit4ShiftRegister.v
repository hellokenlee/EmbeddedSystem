`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:56:05 11/17/2014 
// Design Name: 
// Module Name:    bit4ShiftRegister 
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

module bit4ShiftRegister(input data_in,input clk,input clr,
								output wire[3:0] q);
		DLatch D3(clk,clr,data_in,q[3]);
		DLatch D2(clk,clr,q[3],q[2]);
		DLatch D1(clk,clr,q[2],q[1]);
		DLatch D0(clk,clr,q[1],q[0]);
endmodule

//for better actual view divided clk into 1HZ
module bit4ShiftRegisterSlow(input data_in1,input clk1,input clr1,
								output wire[3:0] qs,output reg clk2);
		integer counter=0;
		bit4ShiftRegister RegSlow(data_in1,clk2,clr1,qs);
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
