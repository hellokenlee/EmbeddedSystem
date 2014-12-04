`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:43:08 11/22/2014 
// Design Name: 
// Module Name:    MeelyFSM 
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
module MeelyFSM(input clk,input reset,
		 			input Ta,input Tb,
		 			output wire[2:0] LA,output wire[2:0] LB);
		reg[1:0] state,nextState;
		reg[6:0] out;
		reg TA=1,TB=1;
		integer counter=0;
		parameter S0=2'b00;
		parameter S1=2'b01;
		parameter S2=2'b10;
		parameter S3=2'b11;
		parameter GR=6'b001100;
		parameter YR=6'b010100;
		parameter RG=6'b100001;
		parameter RY=6'b100010;
		
		always@(posedge clk,posedge reset)
		begin
			if(reset)
			begin
				state<=S0;
				TA<=1;
				TB<=1;
			end
			else
				if(counter>=5)
				begin
					state<=nextState;
					counter<=0;
					TA<=Ta;
					TB<=Tb;
				end
				else
					counter<=counter+1;
		end
		
		always @(*)
			case(state)
				S0:if(!TA)
					begin
						nextState<=S1;
						out<=YR;
					end
					else
					begin
						nextState<=S0;
						out<=GR;
					end
				S1:
				begin
					nextState<=S2;
					out<=RG;
				end
				S2:if(!TB)
					begin
						nextState<=S3;
						out<=RY;
					end
					else
					begin
						nextState<=S2;
						out<=RG;
					end
				S3:
				begin
					nextState<=S0;
					out<=GR;
				end
				default:
				begin
					nextState<=S0;
					out<=GR;
				end
			endcase
			assign LA=out[5:3];
			assign LB=out[2:0];
endmodule
