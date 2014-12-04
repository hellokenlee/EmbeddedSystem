`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:25:17 11/08/2014 
// Design Name: 
// Module Name:    bit4Shifter 
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
module bit4Shifter(input wire[2:0] s,input wire[3:0] d,output reg[3:0] y);
	always@(*)
	begin
		case(s)
			3'b000:y<=d;
			3'b001:
			begin
				y[3]<=0;
				y[2:0]<=d[3:1];
			end
			3'b010:
			begin
				y[0]<=0;
				y[3:1]<=d[2:0];
			end
			3'b011:
			begin
				y[3]<=d[0];
				y[2:0]<=d[3:1];
			end
			3'b100:
			begin
				y[0]<=d[3];
				y[3:1]<=d[2:0];
			end
			3'b101:
			begin
				y[3]<=d[3];
				y[2:0]<=d[3:1];
			end
			3'b110:
			begin
				y[3]<=d[1];
				y[2]<=0;
				y[1]<=d[3];
				y[0]<=d[2];
			end
			3'b111:y<=d;
		endcase
	end

endmodule
