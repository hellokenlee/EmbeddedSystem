`timescale 1ns / 1ps
/**
* 板载控制模块
*/
module Control(input clock,input start,input stop,input inc,input reset,
					output reg enable_control,output reg start_control);
	reg[1:0] state,nextState;
	parameter Stop=2'b00;
	parameter Start=2'b01;
	parameter Inc=2'b10;
	parameter Trap=2'b11;
	//state changes
	always@(posedge clock)
	begin
		if(!reset)
				state<=Stop;
		else
			state<=nextState;
	end
	//nextState refresh
	always@(*)
	begin
		case(state)
			Stop:
			begin
			//暂停CPU
				enable_control<=0;
				start_control<=1;
				if(start)
						nextState<=Start;
				else if(inc)
						nextState<=Inc;
				else
					nextState<=Stop;
			end
			Start:
			begin
			//CPU 运作
				enable_control<=1;
				start_control<=1;
				if(stop)
					nextState<=Stop;
				else
					nextState<=Start;
			end
			Inc:
			begin
			//停一个时钟周期
				enable_control<=0;
				start_control<=1;
				nextState<=Trap;
			end
			Trap:
			begin
			//
				enable_control<=0;
				start_control<=1;
				if(inc)
					nextState<=Trap;
				else
				begin
					enable_control<=1;
					start_control<=1;
					nextState<=Stop;
				end
			end
		endcase
	end
endmodule
