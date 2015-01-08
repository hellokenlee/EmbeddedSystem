`timescale 1ns / 1ps
/**
* 板载测试模块
*/
`include "config.v"
module onBoard(input wire clock,input wire enable,input wire reset,input wire start,input wire[2:0] select_y,
				output wire[6:0] seg,output wire[3:0] ga);
	wire[15:0] y;
	//CPU实例化
	ALL a(clock,enable,reset,start,select_y,1'b0,`zero16,`zero8,y);
	//显示实例化 
	Display d(clock,y,seg,ga);
endmodule
