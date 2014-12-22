`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SYSU.SS
// Engineer: KenLee
//
// Create Date:    21:07:16 12/14/2014 
// Design Name:    CPU
// Target Devices: NEXYS3
// Dependencies: config.v
//////////////////////////////////////////////////////////////////////////////////
/**宏定义导入(定义了状态,指令等)**/
`include "config.v"
/**
*ALU模块
*
*	- 对于每一个时钟周期,把reg_A 和 reg_B的数据根据ex_ir指令运算,把结果输出到ALUo
*	- 标志位(flag)的判断留给CPU
*	- 待写 : 逻辑运算
*	- 对于每一个regA或者regB或者cf变化,ALUo变化
*/
module ALU(input wire[15:0] reg_A,input wire[15:0] reg_B,input wire[15:0] ex_ir,input cf_in,
				output reg[15:0] ALUo,output reg cf_out);
	always@(*)
		begin
			//如果最高为位1 做加法 
			if(ex_ir[15]==1)
				{cf_out,ALUo}<=reg_A+reg_B+cf_in;
			// 如果为0 逻辑运算,减法或者其他操作
			else
			begin
				//如果011 开头 做减法
				if(ex_ir[14:13]==2'b11)
					{cf_out,ALUo}<=reg_A-reg_B-cf_in;
				//逻辑运算+移位运算
				else
					begin
						cf_out<=0;
						case(ex_ir[15:11])
							//逻辑运算
							`AND:ALUo<=reg_A&reg_B;
							`OR: ALUo<=reg_A|reg_B;
							`XOR:ALUo<=reg_A^reg_B;
							//算术,逻辑左移
							`SLL:{cf_out,ALUo}<=reg_A<<reg_B;
							`SRL:{cf_out,ALUo}<=reg_A<<reg_B;
							`SRA:{cf_out,ALUo}<=reg_A>>>reg_B;
							`SLA:{cf_out,ALUo}<=reg_A<<<reg_B;
							default 
								ALUo<=`zero16;
						endcase
					end
			end
		end
endmodule

/**
*CPU模块
*
*	- 里面包含一个ALU
*	- BUG1:ID和WB阶段对通用寄存器有读写冲突
*	- BUG2:跳转之后要加3个NOP...
*/
module CPU(input clock,input enable,input reset,input start,input wire[3:0] select_y,input wire[15:0] d_datain,input wire[15:0] i_datain,
				output wire[7:0] d_addr,output wire[15:0] d_dataout,output d_we,output wire[7:0] i_addr,output wire[15:0] y);
	//状态机状态
	reg next_state,state;
	//指令计数器
	reg[7:0] pc;
	//8*16b 的通用寄存器
	reg[15:0] gr[7:0];
	//各级流水线的指令寄存器
	reg[15:0] id_ir,ex_ir,mem_ir,wb_ir;
	//运算相关寄存器
	reg[15:0] reg_A,reg_B,reg_C,reg_C1;
	//ALU输出
	wire[15:0] ALUo;
	//存储相关寄存器
	reg[15:0] smdr,smdr1;
	//标志位
	reg zf,nf,cf;
	wire cfo;
	//内存r/w信号
	reg dw;
	//ALU实例化
	ALU alu(reg_A,reg_B,ex_ir,cf,ALUo,cfo);
	//输出
	assign d_we=dw;
	assign d_addr=reg_C[7:0];
	assign d_dataout=smdr1;
	assign i_addr=pc;
	/**控制器Control级流水**/
	always @(posedge clock)
		begin
			if (!reset)
				state <= `idle;
			else
				state <= next_state;
		end
	always @(*)
		begin
			case (state)
				`idle : 
					if ((enable == 1'b1) && (start == 1'b1))
						next_state <= `exec;
					else
						next_state <= `idle;
				`exec :
					if ((enable == 1'b0) || (wb_ir[15:8] == `HALT))
						next_state <= `idle;
					else
						next_state <= `exec;
			endcase
		end
	/**指令读取IF级流水**/
	always @(posedge clock or negedge reset)
		begin
			if (!reset)
				begin
					id_ir <= `zero16;
					pc <= `zero8;
				end
				
			else if (state ==`exec)
				begin
					//读入指令[读入到ID环节的指令寄存器]
					id_ir <= i_datain;
					//各种跳转
					if(mem_ir[15:8]==`JUMP)
						pc <= mem_ir[7:0];
					else
						case(mem_ir[15:11])
							`BZ:if(zf)
									pc<=reg_C[7:0];
							`BNZ:if(!zf)
									pc<=reg_C[7:0];
							`BN:if(nf)
									pc<=reg_C[7:0];
							`BNN:if(!nf)
									pc<=reg_C[7:0];
							`BC:if(cf)
									pc<=reg_C[7:0];
							`BNC:if(cf)
									pc<=reg_C[7:0];
							default pc <= pc + 1;
						endcase
				end
		end
	/**数据读取ID级流水**/
	always @(posedge clock or negedge reset)
		begin
			if (!reset)
				begin
					ex_ir <= `zero16;	
				end
			else if (state == `exec)
				begin
					//给下一级流水输入指令到ir
					ex_ir <= id_ir;
					//赋值Reg_A:
					if (id_ir[15:14]==2'b11 ||id_ir[15:11]==`LDIH ||id_ir[15:11]==`SUBI||id_ir[15:11]==`ADDI)
						//	- 当op为 ADDI ,JMPR ,B* ,LDIH,SUBI的时候,reg_A为r1
						reg_A <= gr[(id_ir[10:8])];
					else	
						//	- 其他情况regA为r2
						reg_A <= gr[id_ir[6:4]];	
					//赋值Reg_B:
					if (id_ir[15:14] == 2'b11||id_ir[15:11]==`LDIH ||id_ir[15:11]==`SUBI||id_ir[15:11]==`ADDI)
						// - 当op为 ADDI ,JMPR ,B* ,LDIH,SUBI的时候,reg_B为{val2,val3}
						reg_B <= {`zero8, id_ir[7:0]};
					else if (id_ir[15:13]==3'b010 || id_ir[15:11]==`LOAD)
						// - 当op为 S**,STORE,LOAD 时,reg_B为val3
						reg_B <= {`zero12, id_ir[3:0]};
					else if (id_ir[15:11]==`STORE)
						// - 特别的 为STORE 处理smdr
						begin
							reg_B <= {`zero12, id_ir[3:0]};
							smdr <= gr[id_ir[10:8]];
						end
					else
						// - 其他的时候,reg_B为r3
						reg_B <= gr[id_ir[2:0]];
				end
		end
	/**执行EX级流水*/
	always @(posedge clock or negedge reset)
		begin
			if (!reset)
				begin
					mem_ir <= `zero16;
					cf<=0;
				end
			else if (state == `exec)
				begin
					//给下一级ir赋值
					mem_ir <= ex_ir;
					//接收ALU的运算结果 存到reg_C
					reg_C <= ALUo;
					//处理标志位 对于除了B*,JMPR,LOAD,STORE以外的处理标志位
					if(ex_ir[15:14]==2'b11 || ex_ir[15:11]==5'b00000 ||ex_ir[15:11] == `LOAD||ex_ir[15:11] == `STORE)
						;
					else
						begin
							//进位标志位
							cf<=cfo;
							//零标志位
							if (ALUo == `zero16)
								zf <= 1'b1;
							else
								zf <= 1'b0;
							//负数标志位
							if (ALUo[15] == 1'b1)
								nf <= 1'b1;
							else
								nf <= 1'b0;
						end
					//特别的对于store指令,把smdr往下传,把datawrite标志为1
					if (ex_ir[15:11] == `STORE)
						begin
							dw <= 1'b1;
							smdr1 <= smdr;
						end
					else
						dw <= 1'b0;
				end
		end
	/**存储MEM级流水**/
	always @(posedge clock or negedge reset)
		begin
			if (!reset)
				begin
					wb_ir <=`zero16;
				end
			else if (state == `exec)
				begin
					wb_ir <= mem_ir;
					//如果为load指令,读入d_datain数据,
					if (mem_ir[15:11] == `LOAD)
						reg_C1 <= d_datain;
					//否则读入上一级结果
					else
						reg_C1 <= reg_C;
				end
		end
	/**回写WB级流水**/
	always @(posedge clock or negedge reset)
		begin
			if (!reset)
				begin
					//通用寄存器初始化
					gr[0]<=`zero16;
					gr[1]<=`zero16;
					gr[2]<=`zero16;
					gr[3]<=`zero16;
					gr[4]<=`zero16;
					gr[5]<=`zero16;
					gr[6]<=`zero16;
					gr[7]<=`zero16;
				end
			else if (state == `exec)
			begin
				//对于需要返回赋值的指令,把上一级的结果写回指令指定的寄存器
				// 除了JMPR,B*,STORE,CMP,和单指令之外
				if (wb_ir[15:14]==2'b11||wb_ir[15:11]==`STORE||wb_ir[15:11]==`CMP||wb_ir[15:11]==5'b00000)
					//gr[wb_ir[10:8]]<=1
					;
				else
					gr[wb_ir[10:8]] <= reg_C1;
			end
		end
endmodule
