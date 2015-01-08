`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SYSU.SS
// Engineer: KenLee
// Create Date:    21:07:16 12/14/2014 
// Design Name:    LCD Display
// Target Devices: NEXYS3
// Dependencies: config.v
//////////////////////////////////////////////////////////////////////////////////
module Decoder(input wire[3:0] a,output reg[6:0] seg);
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

module Display(input clk,input wire[15:0] data,
					output reg[6:0] seg,output reg[3:0] ga);
	reg[20:0] counter;
	wire[6:0] seg4,seg3,seg2,seg1;
	Decoder d4(data[15:12],seg4);
	Decoder d3(data[11:8],seg3);
	Decoder d2(data[7:4],seg2);
	Decoder d1(data[3:0],seg1);
	always@(posedge clk)
	begin
		counter<=counter+1'b1;
		if(counter<400000)
		begin
		//最高位
			ga<=4'b0111;
			seg<=seg4;
		end
		else if(counter<800000)
		begin
		//次高
			ga<=4'b1011;
			seg<=seg3;
		end
		else if(counter<1200000)
		begin
			ga<=4'b1101;
			seg<=seg2;
		end
		else if(counter<1600000)
		begin
			ga<=4'b1110;
			seg<=seg1;
		end
		else
			counter<=0;
	end
endmodule
