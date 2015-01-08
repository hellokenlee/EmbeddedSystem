`timescale 1ns / 1ps


module onBoardTest;

	// Inputs
	reg clock;
	reg enable;
	reg reset;
	reg start;
	reg [2:0] select_y;

	// Outputs
	wire [6:0] seg;
	wire [3:0] ga;

	// Instantiate the Unit Under Test (UUT)
	onBoard uut (
		.clock(clock), 
		.enable(enable), 
		.reset(reset), 
		.start(start), 
		.select_y(select_y), 
		.seg(seg), 
		.ga(ga)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		enable = 0;
		reset = 0;
		start = 0;
		select_y = 0;

		// Wait 100 ns for global reset to finish
		#100;
      while(1)
		begin
			#5
			clock<=1;
			#5
			clock<=0;
		end
		// Add stimulus here
	end
	initial begin
		$monitor("pc: %h  id_ir: %b  regA: %h  regB: %h  regC: %h  daddr: %h  ddout: %h  dw: %b  regC1: %h  gr0: %h  gr1: %h  gr2: %h  gr3: %h gr4: %h gr5: %h gr6:%h cf %b s_y:%d y:%h", 
			uut.a.C.pc, uut.a.C.id_ir, uut.a.C.reg_A, uut.a.C.reg_B, uut.a.C.reg_C,
			uut.a.d_addr, uut.a.d_dataout, uut.a.d_we, uut.a.C.reg_C1, uut.a.C.gr[0],uut.a.C.gr[1], uut.a.C.gr[2], uut.a.C.gr[3],uut.a.C.gr[4],uut.a.C.gr[5],uut.a.C.gr[6],uut.a.C.cf,uut.select_y,uut.y);
		//初始化变量
		select_y <= 0;
		enable <= 0; start <= 0;reset <= 0;
		//置reset
		#300 
		reset <= 1;
		#10 enable <= 1;
		#10 start <=1;
		#1000
		select_y<=0;
		#1000
		select_y<=1;
		#1000
		select_y<=2;
		#1000
		select_y<=3;
		#1000
		select_y<=4;
		#1000
		select_y<=5;
		#1000
		select_y<=6;
		#1000
		select_y<=7;
		//测试
	end
      
endmodule
