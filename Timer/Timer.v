`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:54:47 11/28/2014 
// Design Name: 
// Module Name:    Timmer 
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
module Divider(input clk,input reset,output reg msclk);
	integer counter=0;
	always@(posedge clk,posedge reset)
	begin
		if(reset)
		begin
			counter<=0;
			msclk<=0;
		end
		else if(counter>=49_999)
		begin
			counter<=0;
			if(msclk==1)
				msclk<=0;
			else
				msclk<=1;
		end
		else
			counter<=counter+1;
	end
endmodule

module StateMachine(input start,input stop,input inc,input reset,input msclk,output Cen);
	reg[1:0] state,nextState;
	//states
	parameter Stop=2'b00;
	parameter Start=2'b01;
	parameter Inc=2'b10;
	parameter Trap=2'b11;
	//state changes
	always@(posedge msclk,posedge reset)
	begin
		if(reset)
				state<=Stop;
		else
			state<=nextState;
	end
	//nextState refresh
	always@(*)
	begin
		case(state)
			Stop:
				if(start)
						nextState<=Start;
				else if(inc)
						nextState<=Inc;
				else
					nextState<=Stop;
			Start:
				if(stop)
					nextState<=Stop;
				else
					nextState<=Start;
			Inc:
				nextState<=Trap;
			Trap:
				if(inc)
					nextState<=Trap;
				else
					nextState<=Stop;
		endcase
	end
	assign Cen=(state==Start)||(state==Trap&&!inc);
endmodule

module Counter(input Cen,input reset,input msclk,output reg[3:0] one,
					output reg[3:0] ten,output reg[3:0] hun,output reg[3:0] thoud);
	always@(posedge msclk,posedge reset)
	begin
		if(reset)
		begin
			one<=4'b0000;
			ten<=4'b0000;
			hun<=4'b0000;
			thoud<=4'b0000;
		end
		else
		begin
			if(Cen)
				one<=one+1;
			if(one>=10)
			begin
				one<=0;
				ten<=ten+1;
			end
			if(ten>=10)
			begin
				ten<=0;
				hun<=hun+1;
			end
			if(hun>=10)
			begin
				hun<=0;
				thoud<=thoud+1;
			end
			if(thoud>=10)
				thoud<=0;
		end
	end
endmodule
module Decoder(input wire[3:0] in,output reg[6:0] out);
	always@(*)
	begin
		case(in)
			0:out<=7'b000_0001;
			1:out<=7'b100_1111;
			2:out<=7'b001_0010;
			3:out<=7'b000_0110;
			4:out<=7'b100_1100;
			5:out<=7'b010_0100;
			6:out<=7'b010_0000;
			7:out<=7'b000_1111;
			8:out<=7'b000_0000;
			9:out<=7'b000_0100;
			default:out<=7'b111_1111;
		endcase
	end
endmodule
module LCDDisPlay(input msclk,input reset,input wire[3:0] one,input wire[3:0] ten,input wire[3:0] hun,input wire[3:0] thoud,
						output reg[6:0] seg,output reg[3:0] ga,output reg dp);
	wire[6:0] oneSeg,tenSeg,hunSeg,thoudSeg;
	integer counter=0;
	Decoder oneD(one,oneSeg);
	Decoder tenD(ten,tenSeg);
	Decoder hunD(hun,hunSeg);
	Decoder thoudD(thoud,thoudSeg);
	always@(posedge msclk,posedge reset)
	begin
		if(reset)
		begin
			seg<=7'b000_0001;
			dp=1;
			ga=4'b0111;
		end
		else
		begin
			counter<=counter+1;
			if(counter<4)
			begin
				ga<=4'b1110;
				dp<=1;
				seg<=oneSeg;
			end
			else if(counter<8)
			begin
				ga<=4'b1101;
				dp<=1;
				seg<=tenSeg;
			end
			else if(counter<12)
			begin
				ga<=4'b1011;
				dp<=1;
				seg<=hunSeg;
			end
			else if(counter<16)
			begin
				ga<=4'b0111;
				dp<=0;
				seg<=thoudSeg;
			end
			else
				counter<=0;
		end
	end
endmodule
module Timmer(input clk,input reset,input start,input stop,input inc,
					output wire[6:0] seg,output wire[3:0] ga,output wire dp);
	wire msclk,Cen;
	wire[3:0] one,ten,hun,thoud;
	Divider d(clk,reset,msclk);
	StateMachine s(start,stop,inc,reset,msclk,Cen);
	Counter c(Cen,reset,msclk,one,ten,hun,thoud);
	LCDDisPlay l(msclk,reset,one,ten,hun,thoud,seg,ga,dp);
endmodule
