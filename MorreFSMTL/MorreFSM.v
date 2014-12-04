`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:42:09 11/20/2014 
// Design Name: 
// Module Name:    MorreFSM 
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
module MorreFSM(input clk,input reset,
					input Ta,input Tb,
					output wire[2:0] LA,output wire[2:0] LB);
	reg[5:0] state,nextState;
	integer counter=0;
	//red= 00 yellow=01 green=11
	//bit1:red;	bit2:yellow;	bit3:green
	//states
	parameter S0=6'b001100;
	parameter S1=6'b010100;
	parameter S2=6'b100001;
	parameter S3=6'b100010;
	//states reg
	always@(posedge clk,posedge reset)
	begin
		//异步清零
		if(reset)
			state<=S0;
		else
		begin
			//timer 5 for deubg ,500_000_000 for use;
			if(counter>=500_000_000)
			begin
				state<=nextState;
				counter<=0;
			end
			else
				counter<=counter+1;
		end
	end
	//refresh nextState
	always@(*)
		case(state)
			S0:if(!Ta)
					nextState=S1;
				else
					nextState=S0;
			S1:nextState=S2;
			S2:if(!Tb)
					nextState=S3;
				else
					nextState=S2;
			S3:nextState=S0;
			default nextState=S0;
		endcase
	//update output
	assign LA=state[5:3];
	assign LB=state[2:0];
endmodule
