`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:36:06 11/30/2014 
// Design Name: 
// Module Name:    VGAStatic 
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
//divide 100MHZ to 25MHZ
module divider(input clk,output reg dclk);
	integer counter=0;
	always@(posedge clk)
		if(counter>=1)
		begin
			if(dclk==0)
				dclk<=1;
			else
				dclk<=0;
			counter<=0;
		end
		else
			counter<=counter+1;
endmodule

//根据data来显示这个像素的颜色 data[7:5]=r,data[4:2]=g,data[1:0]=b
module VGAStatic(input dclk,input wire[7:0] data,
						output reg vs,output reg hs,output wire[2:0] r,output wire[2:0] g,output wire[1:0] b);
	integer verCounter=0;
	integer horCounter=0;
	//方块中心坐标(方块大小 10pix*10pix)
	integer rectX=149;
	integer rectY=41;
	reg dirX=1;
	reg dirY=1;
	//某个瞬间显示的RGB放这
	reg[7:0] disData=8'b00_000_000;
	assign {r,g,b}=disData;
	//水平坐标逻辑
	always@(posedge dclk)
	begin
		if(horCounter==799)
			horCounter<=0;
		else
			horCounter<=horCounter+1;
	end
	//垂直坐标逻辑
	always@(posedge dclk)
	begin
		if(verCounter==520)
			verCounter<=0;
		else
		begin
			if(horCounter==799)
				verCounter<=verCounter+1;
			else
				verCounter<=verCounter;
		end
			
	end
	//产生hs信号
	always@(posedge dclk)
	begin
		if(horCounter<96)
			hs<=0;
		else
			hs<=1;
	end
	//产生vs信号
	always@(posedge dclk)
	begin
		if(verCounter<2)
			vs<=0;
		else
			vs<=1;
	end
	//方块坐标更新
	always@(posedge dclk)
	begin
		//因为频率是60HZ,所以vercounter 1/60秒更新一次,然后1/60方块中心移动1pix
		if(verCounter==520)
		begin
			if(dirX)
				rectX<=rectX+1;
			else
				rectX<=rectX-1;
			if(dirY)
				rectY<=rectY+1;
			else
				rectY<=rectY-1;
			//左右两边越界
			//148 779
			if(rectX<158)
				dirX<=1;
			if(rectX>772)
				dirX<=0;
			//上下两边越界
			//31 506
			if(rectY<45)
				dirY<=1;
			if(rectY>501)
				dirY<=0;
		end
	end
	//只在T(disp)期间显示信号
	always@(posedge dclk)
	begin
		if(verCounter>31&&verCounter<511)
		begin
			if(horCounter>143&&horCounter<784)
			begin
				//在方块中心的(x,y)+-5 之内显示红色,之外显示白色
				if(verCounter>(rectY-10)&&verCounter<(rectY+10))
					if(horCounter>(rectX-10)&&horCounter<(rectX+10))
						disData<=8'b11_100_000;//red
					else
						disData<=data;//white
				else
					disData<=data;//white
			end
			else
				disData<=8'b00_000_000;
		end
		else
			disData<=8'b00_000_000;
	end
	
endmodule

module VGA(input clk,input wire[7:0] data,
				output vs,output hs,output wire[2:0] r,output wire[2:0] g,output wire[1:0] b);
	wire dclk;
	divider d(clk,dclk);
	VGAStatic v(dclk,data,vs,hs,r,g,b);
endmodule				
