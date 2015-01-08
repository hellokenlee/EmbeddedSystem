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
		RAM[0] <= {`SUB, `gr1, 1'b0, `gr1, 1'b0, `gr1};
		RAM[1] <= {`SUB, `gr2, 1'b0, `gr2, 1'b0, `gr2};
		RAM[2] <= {`ADDI, `gr1, 8'b1111_1111};
		RAM[3] <= {`LDIH, `gr2, 8'b1111_1111};
		RAM[4] <= {`STORE, `gr1, 1'b0, `gr0, 4'b0000};
		RAM[5] <= {`STORE, `gr2, 1'b0, `gr0, 4'b0001};
		RAM[6] <= {`LOAD, `gr3, 1'b0, `gr0, 4'b0000};
		RAM[7] <= {`LOAD, `gr4, 1'b0, `gr0, 4'b0001};
		RAM[8] <= {`ADD, `gr5, 1'b0, `gr3, 1'b0, `gr4};
		RAM[9] <= {`STORE, `gr5, 1'b0, `gr0, 4'b0010};

		RAM[10] <= {`SUB, `gr6, 1'b0, `gr6, 1'b0, `gr6};
		RAM[11] <= {`ADDI, `gr6, 8'b0000_0011};
		RAM[12] <= {`ADDI, `gr5, 8'b0000_0001};
		RAM[13] <= {`SUBI, `gr6, 8'b0000_0001};
		RAM[14] <= {`CMP, 3'b000, 1'b0, `gr6, 1'b0, `gr0};
		RAM[15] <= {`BNZ, `gr0, 8'b0000_1100};

		RAM[16] <= {`AND, `gr7, 1'b0, `gr1, 1'b0, `gr2};
		RAM[17] <= {`OR, `gr7, 1'b0, `gr1, 1'b0, `gr2};
		RAM[18] <= {`XOR, `gr7, 1'b0, `gr1, 1'b0, `gr2};
		RAM[19] <= {`SLL, `gr7, 1'b0, `gr2, 4'b0100};
		RAM[20] <= {`SLA, `gr7, 1'b0, `gr2, 4'b0100};
		RAM[21] <= {`SRL, `gr7, 1'b0, `gr2, 4'b0100};
		RAM[22] <= {`SRA, `gr7, 1'b0, `gr2, 4'b0100};

		RAM[23] <= {`HALT, 8'd0};
	end
	assign data_out=RAM[address];
	always@(posedge clock)
		if(we)
			RAM[address]<=data_in;
endmodule 