// top module
`timescale 100ps/1ps
module dcache_system(
   // Outputs
   DataOut, Done, Stall_n, CacheHit,  addr_mem, wr_mem, rd_mem, hitc, totalc, DataOut_test,
   // Inputs
   req, Addr, DataIn, Rd, Wr, clk, rst, data_out_mem
   );
   
   input [31:0] Addr;
   input [31:0] DataIn;
   input        Rd;
   input        Wr;
   input        clk;
   input        rst;
   input        req;
   
   input [31:0] data_out_mem;
   
   output [31:0] DataOut;
   output Done;
   output Stall_n;
   output CacheHit;
   output [31:0] DataOut_test;
   
   
   //new
   output addr_mem;
   output wr_mem;
   output rd_mem;

   output hitc;
   output totalc;

   /* data_mem = 1, inst_mem = 0 *
    * needed for cache parameter */
   parameter mem_type = 0;

	/* internal signal */
	wire write, valid_in, sel_data_cache; // for cache
	wire wr_mem, rd_mem, sel_tag_mem; // for main memory
	//wire [2:0] offset_mem, offset_mem_q1, offset_mem_q2;
	wire err_ctrl;
	wire hit1, valid1, hit2, valid2; // from cache

	wire enable, err_cache;
	wire [10:0] index;
	//wire [2:0] offset, offset_cache;
	wire [20:0] tag_in, tag_out, tag_out1, tag_out2, tag_in1, tag_in2;
	wire [31:0] data_in_cache;
	
	wire [31:0] DataOut1, DataOut2, DataOut_test;
	
	wire [31:0] addr_mem;
	wire [31:0] data_out_mem;
	wire [3:0] busy;
	wire Stall_mem, err_mem, Stall;

	wire change;
	wire [17:0] tag_mem;
	wire datahiz;
	wire [3:0]  cs;
	wire cacheWR;
	wire enable1, enable2;
	wire [9:0] hitc;
	wire [9:0] totalc;

	// address
	assign index = Addr[10:0];
	//assign offset = Addr[2:0];
	assign tag_in = Addr[31:11];
	assign addr_mem = {tag_mem, index};//assign addr_mem = {tag_mem, index, offset_mem};

	// delay offset for 2 cycle for read operation
//	dff offset_reg1 [2:0] (.d(offset_mem), .q(offset_mem_q1), .clk(clk), .rst(rst));
	//dff offset_reg2 [2:0] (.d(offset_mem_q1), .q(offset_mem_q2), .clk(clk), .rst(rst));
    
	count counter (.go(rd_mem), .change(change), .clk(clk), .rst(rst));
//	change_signal data_out_mem_change (.change(change), .data(data_out_mem), .clk(clk), .rst(rst), .en(rd_mem));
	// 1 - from main mem, 0 - from primary input
	assign data_in_cache = sel_data_cache ? data_out_mem : DataIn;
    // read from memory to cache, delay offset for 2cycle to write into cache
    // write data to memroy, offsets for cache and memory are synchronous
	//assign offset_cache = sel_data_cache ? offset_mem_q2 : ( sel_tag_mem ? offset_mem : offset);
	// 1 - from tag_out, 0 - from primary input
	assign tag_mem = sel_tag_mem ? tag_out : tag_in;

	assign enable = ~rst;
	
	assign Stall_n = ~Stall;

	
	//2-way set 
	assign hit = hit1 | hit2;
	assign valid = valid1 | valid2;
	
	assign tag_out = (hit2)? tag_out2 : tag_out1;
	assign DataOut = (hit2)? DataOut2 : DataOut1;
	
	assign cacheWR = ((cs==4'd3)|(cs==4'd7))? 1:0 ;

	assign DataOut_test = (Stall)? 32'bz : DataOut; 
	

	cacheDecide cacheD(.numout(numout) ,.cacheWR(cacheWR), .rst(rst));
	assign enable1 = (!numout & enable)?1:0;
	assign enable2 = ( numout & enable)?1:0;

        //hit rate
	hitrate hitcount(.hitc(hitc), .totalc(totalc), .cs(cs), .rst(rst), .clk(clk));
	
	mem_ctrl ctrl_unit(
	/* input */
	.Rd(Rd), .Wr(Wr), .hit(hit),  .valid(valid),
	.clk(clk), .rst(rst), .mem_change(change), .req(req),
	/* output */
	.write(write), .valid_in(valid_in), .sel_data_cache(sel_data_cache),
	.wr_mem(wr_mem), .rd_mem(rd_mem), .sel_tag_mem(sel_tag_mem), //.offset(offset_mem),
	.Done(Done), .CacheHit(CacheHit), .stall(Stall), .datahiz(datahiz), .cs(cs) // output Done, CacheHit, Stall
	);

	cache #(0 + mem_type) c0 (
		/* input */
		.enable(enable1), .clk(clk), .rst(rst),
		.tag_in(tag_in), .index(index), 
		.data_in(data_in_cache), .write(write), .valid_in(valid_in),.datahiz(datahiz),
		/* output */
		.tag_out(tag_out1), .data_out(DataOut1), // output DataOut
		.hit(hit1),  .valid(valid1)
	);

		cache #(0 + mem_type) c1 (
		/* input */
		.enable(enable2), .clk(clk), .rst(rst),
		.tag_in(tag_in), .index(index), 
		.data_in(data_in_cache), .write(write), .valid_in(valid_in),.datahiz(datahiz),
		/* output */
		.tag_out(tag_out2), .data_out(DataOut2), // output DataOut
		.hit(hit2),  .valid(valid2)
	);
   

endmodule // mem_system
