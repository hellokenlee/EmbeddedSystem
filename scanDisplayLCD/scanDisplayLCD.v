`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:52:20 11/08/2014 
// Design Name: 
// Module Name:    scanDisplayLCD 
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
module scanDisplayLCD(input clk,output reg[6:0] seg,output reg[3:0] ga);
	integer counter=0;
	always@(posedge clk)
	begin
		counter<=counter+1;
		if(counter<400000)
		begin
			ga<=4'b0111;
			seg<=7'b100_1100;
		end
		else if(counter<800000)
		begin
			ga<=4'b1011;
			seg<=7'b001_0010;
		end
		else if(counter<1200000)
		begin
			ga<=4'b1101;
			seg<=7'b000_0100;
		end
		else if(counter<1600000)
		begin
			ga<=4'b1110;
			seg<=7'b100_1111;
		end
		else
			counter<=0;
	end
endmodule
