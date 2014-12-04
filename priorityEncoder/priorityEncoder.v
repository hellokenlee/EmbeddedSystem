`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:23:28 11/08/2014 
// Design Name: 
// Module Name:    priorityEncoder 
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
module priorityEncoder(input wire[7:0] x,output reg[2:0] y,output reg inValid
    );
	always@(*)
		begin
			inValid<=0;
			if(x[7]==1)
				y<=3'b111;
			else if(x[6]==1)
				y<=3'b110;
			else if(x[5]==1)
				y<=3'b101;
			else if(x[4]==1)
				y<=3'b100;
			else if(x[3]==1)
				y<=3'b011;
			else if(x[2]==1)
				y<=3'b010;
			else if(x[1]==1)
				y<=3'b001;
			else if(x[0]==1)
				y<=3'b000;
			else
				begin
					y<=3'b000;
					inValid<=1;
				end
		end
endmodule
