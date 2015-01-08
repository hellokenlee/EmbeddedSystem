`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SYSU.SS
// Engineer: KenLee
// Create Date:    21:07:16 12/14/2014 
// Design Name:    Memory
// Target Devices: NEXYS3
// Dependencies: config.v
//////////////////////////////////////////////////////////////////////////////////
/**
*内存模块(时序逻辑模拟)
*
*	- 包括指令内存(IM)和数据内存(DM)
*	- 输入是一个地址,一个时钟(和CPU一致),一个读写信号(0读1写),一个输入数据(0时无效)
*	- 输出是输入地址的数据
*/
`include "config.v"
module Memory(input wire clock,input wire[7:0] address,input wire we,input wire[15:0] data_in,
				output wire[15:0] data_out);
	reg[15:0] RAM[255:0];
	initial begin
		RAM[0]<={`SUB, `gr4, 1'b0, `gr4, 1'b0, `gr4};//0
		RAM[1]<= {`SUB, `gr5, 1'b0, `gr5, 1'b0, `gr5};//1
		RAM[2]<= {`ADDI, `gr4, 8'b1111_1111};//2
		RAM[3]<= {`LDIH, `gr5, 8'b1111_1111};//3
		RAM[4]<= {`STORE, `gr4, 1'b0, `gr0, 4'b0000};//4
		RAM[5]<= {`STORE, `gr5, 1'b0, `gr0, 4'b0001};//5
		RAM[6]<= {`LOAD, `gr1, 1'b0, `gr0, 4'b0000};//6
		RAM[7]<= {`LOAD, `gr2, 1'b0, `gr0, 4'b0001};//7
		RAM[8]<= {`ADD, `gr3, 1'b0, `gr1, 1'b0, `gr2};//8
		RAM[9]<= {`JUMP, 8'b0000_1011};//9
		RAM[10]<= {`ADDI, `gr3, 8'b0000_0001};//10
		RAM[11]<= {`STORE, `gr3, 1'b0, `gr0, 4'b0010};//11
		RAM[12]<= {`HALT, `zero8};//12
	end
	assign data_out=RAM[address];
	always@(posedge clock)
		if(we)
			RAM[address]<=data_in;
endmodule 