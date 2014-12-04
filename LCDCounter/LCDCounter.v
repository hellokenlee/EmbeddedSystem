`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:20:15 11/13/2014 
// Design Name: 
// Module Name:    Counter 
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
module scanDisplayLCD(input wire[6:0] n1,input wire[6:0] n2,input wire[6:0] n3,input wire[6:0] n4,input clk,
								output reg[6:0] seg,output reg[3:0] ga);
	integer counter=0;
	always@(posedge clk)
	begin
		counter<=counter+1;
		if(counter<400_000)
		begin
			ga<=4'b0111;
			seg<=n1;//no.1 bit
		end
		else if(counter<800000)
		begin
			ga<=4'b1011;
			seg<=n2;//no.2 bit
		end
		else if(counter<1200000)
		begin
			ga<=4'b1101;
			seg<=n3;//no.3 bit
		end
		else if(counter<1600000)
		begin
			ga<=4'b1110;
			seg<=n4;//no.4 bit
		end
		else
			counter<=0;
	end
endmodule


module counter(input clk,output wire[6:0] seg,output wire[3:0] ga);
	integer cnt1=1;
	integer cnt2=2;
	integer cnt3=3;
	integer cnt4=4;
	reg[6:0] n1=7'b0000000;
	reg[6:0] n2=7'b0000000;
	reg[6:0] n3=7'b0000000;
	reg[6:0] n4=7'b0000000;
	integer counter=0;
	scanDisplayLCD s(n1,n2,n3,n4,clk,seg,ga);
	always@(posedge clk)
	begin
		counter<=counter+1;
		if(counter<100_000_000)
		begin
			case(cnt1)
				0:n1<=7'b000_0001;
				1:n1<=7'b100_1111;
				2:n1<=7'b001_0010;
				3:n1<=7'b000_0110;
				4:n1<=7'b100_1100;
				5:n1<=7'b010_0100;
				6:n1<=7'b010_0000;
				7:n1<=7'b000_1111;
				8:n1<=7'b000_0000;
				9:n1<=7'b000_0100;
			endcase
			case(cnt2)
				0:n2<=7'b000_0001;
				1:n2<=7'b100_1111;
				2:n2<=7'b001_0010;
				3:n2<=7'b000_0110;
				4:n2<=7'b100_1100;
				5:n2<=7'b010_0100;
				6:n2<=7'b010_0000;
				7:n2<=7'b000_1111;
				8:n2<=7'b000_0000;
				9:n2<=7'b000_0100;
			endcase
			case(cnt3)
				0:n3<=7'b000_0001;
				1:n3<=7'b100_1111;
				2:n3<=7'b001_0010;
				3:n3<=7'b000_0110;
				4:n3<=7'b100_1100;
				5:n3<=7'b010_0100;
				6:n3<=7'b010_0000;
				7:n3<=7'b000_1111;
				8:n3<=7'b000_0000;
				9:n3<=7'b000_0100;
			endcase
			case(cnt4)
				0:n4<=7'b000_0001;
				1:n4<=7'b100_1111;
				2:n4<=7'b001_0010;
				3:n4<=7'b000_0110;
				4:n4<=7'b100_1100;
				5:n4<=7'b010_0100;
				6:n4<=7'b010_0000;
				7:n4<=7'b000_1111;
				8:n4<=7'b000_0000;
				9:n4<=7'b000_0100;
			endcase
		end
		else
		begin
			counter<=0;
			cnt1<=cnt1+1;
			if(cnt1==9)
			begin
				cnt1<=0;
				cnt2<=cnt2+1;
				if(cnt2==9)
				begin
					cnt2<=0;
					cnt3<=cnt3+1;
					if(cnt3==9)
					begin
						cnt3<=0;
						cnt4<=cnt4+1;
						if(cnt4==9)
							cnt4<=0;
					end
				end
			end
		end
	end
	
endmodule
