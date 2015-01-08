`timescale 1ns / 1ps
/**
* 板载测试模块
*/
`include "config.v"
module onBoard(input wire clock,input wire start,input wire reset,input wire stop,input wire inc,input wire[3:0] select_y,
				output wire[6:0] seg,output wire[3:0] ga);
	wire[15:0] y;
	wire enable_control,start_control;
	//板载测试控制模块
	Control c(clock,start,stop,inc,reset,enable_control,start_control);
	//CPU实例化
	ALL a(clock,enable_control,reset,start_control,select_y,1'b0,`zero16,`zero8,y);
	//显示实例化 
	Display d(clock,y,seg,ga);
endmodule
