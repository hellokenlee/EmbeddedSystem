`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:40:20 11/08/2014 
// Design Name: 
// Module Name:    bit4ToBCD 
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
module bit4ToBCD(input wire[3:0] bin,output reg[4:0] BCD
    );
	always @(*)
		begin
			if(bin<4'b1010)
				begin
					BCD[4]<=0;
					BCD[3:0]<=bin[3:0];
				end
			else
				begin
					BCD[4]<=1;
					BCD[3:0]<=bin-4'b1010;
				end
		end

endmodule
