`define ADDRWIDTH 32
`define DATAWIDTH 32
`define TAGWIDTH  20
`define IndexWidth 	8		// The number of bits for Index
`define Entry	   	512		// The number of entrues for Cache
`define LineWidth	2		// The number of bits for one line		
`define Valid 1

`include "timescale.v"



module I_Cache (clk,rst_n, CSn, ADDR, DO, data_in, IADDR, IREQ, cache_stall_n);

	input				clk;		// System clock
	input				rst_n;
	// signals between CPU and Cache
	input				CSn;		// chip enable
	input [31:0]		ADDR;		// read address	form CPU [31:0]=32bits
	output [31:0]		DO;			// data output
	output				cache_stall_n;

	// signals between Main_Memory and Cache
	input [127:0]		data_in;	// IDBUS from Main_Memory (new data)
	output [31:0]		IADDR;		// address to Main Memory
	output				IREQ;		// access to Main Memory
	
	// Internal signals
	wire	[31:0]		do;
	reg		[31:0]		DO_reg;
	reg					write;
	reg					stall_n;	// signal for stall
	reg					Enable;		// Cache Enable ( based on CSn)
	// signals in Cache and CacheRam
	
	wire					Cache_Hit;			// Cache Hit
	wire					Way1_Hit;			// Way 1 Hit
	wire					Way2_Hit;			// Way 2 Hit


	wire [`IndexWidth-1:0]	index;				// Number of index
	wire [`LineWidth-1:0]	line;				// Number of line
	
	wire [127:0]			data_in;			// data into CacheRam	 (128-bit)
	wire [127:0]			data_out1;			// data out from Way 1 (128-bit)
	wire [127:0]			data_out2;			// data out from Way 2 (128-bit)
	wire [`DATAWIDTH-1:0]	data_out_hit1;		// data out from Way 1 (32-bit)
	wire [`DATAWIDTH-1:0]	data_out_hit2;		// data out from Way 2 (32-bit)
	reg  [`DATAWIDTH-1:0]	data_out_hit1_reg;	// Buffer for data_out_hit1 
	reg  [`DATAWIDTH-1:0]	data_out_hit2_reg;	// Buffer for data_out_hit2
	wire [`DATAWIDTH-1:0]	data_out_miss;		// data from CacheRam	 (32-bit)
	reg  [`DATAWIDTH-1:0]	data_out_miss_reg;	// Buffer data from CacheRam
	wire [`TAGWIDTH-1:0]	tag_in;				// tag_in  from the CPU
	wire [`TAGWIDTH-1:0]	tag_out1;			// tag_out from the Cache Way 1
	wire [`TAGWIDTH-1:0]	tag_out2;			// tag_out from the Cache Way 2
	wire					valid_in;			// Valid_in form the CPU
	wire					valid_out1;			// Valid_out form the Cache Way1
	wire					valid_out2;			// Valid_out form the Cache Way2
	
	reg [0:0]				Cache_Flag	[0:`Entry-1];	// Registers for 2 Way Flag
	reg [0:0]				Cache_Valid [0:`Entry-1];	// Registers for Valid Bit
	reg [`TAGWIDTH-1:0]		Cache_Tag	[0:`Entry-1];	// Registers for Tag
	reg [127:0]				Cache_Data 	[0:`Entry-1];	// Registers for Data

	integer i;
	
	// signals for finate state machine
	parameter 			Hit  		= 2'b00;
	parameter			Miss 		= 2'b01;
	parameter			Miss_Ready	= 2'b10;
	parameter			Reset		= 2'b11;
	
	reg	[1:0]			current_state, next_state;
	
	
//--------------------------------------------------------------------------------------------------------------
// ======================================== Begining of main code ==============================================
//--------------------------------------------------------------------------------------------------------------

	// Devide the address into each signals
	assign	IADDR 	= 	ADDR;			 			// pass address to memory (use IREQ signal to control) 
	assign	line 	=	ADDR[3:2];		 			// get the line (Number)
	assign 	index	= 	ADDR[11:4];					// get the index(Number)
	assign	tag_in	=	ADDR[31:12];				// get the tag  (Number)
	assign	valid_in=   1'b1;						// set the valid in as 1
	
	// Signals about HIT and MISS
	assign	Way1_Hit	= (~valid_out1)?1'b0:(tag_in==tag_out1)?1'b1:1'b0;	
	assign	Way2_Hit	= (~valid_out2)?1'b0:(tag_in==tag_out2)?1'b1:1'b0;
	assign 	Cache_Hit 	= (Way1_Hit)?1'b1:(Way2_Hit)?1'b1:1'b0;									// if Way1 or Way2 hit => Hit
	assign	IREQ 		= (!Enable)?1'b0:(Cache_Hit)? 1'b0:1'b1;								// if (CacheEnable & Miss) ask data form Memory
	assign	do			= (Way1_Hit)? data_out_hit1:(Way2_Hit)? data_out_hit2:data_out_miss;	// Choose DataOut source 
	assign	DO 			= DO_reg;

	// Signals for Cache to Compare Hit or Miss
	assign data_out1	= Cache_Data[index];		// Way 1 Data
	assign tag_out1   	= Cache_Tag[index];			// Way 1 Tag
	assign valid_out1 	= Cache_Valid[index];		// Way 1 Valid
	assign data_out2	= Cache_Data[index+256];	// Way 2 Data
	assign tag_out2   	= Cache_Tag[index+256];		// Way 2 Tag
	assign valid_out2 	= Cache_Valid[index+256];	// Way 2 Valid

	assign data_out_hit1 = data_out_hit1_reg;		// DataOut for Way1 Hit
	assign data_out_hit2 = data_out_hit2_reg;		// DataOut for Way2 Hit
	assign data_out_miss = data_out_miss_reg;		// DataOut for Cache Miss
	
	assign cache_stall_n = stall_n;					// stall signal when Cache Miss happen
	

	// Set up the Output Data 
	always@(*)
	begin
		case(line) 			// Choose the data from the line Number
			2'b00: 	
				begin
					data_out_hit1_reg = data_out1[31 :0 ];
					data_out_hit2_reg = data_out2[31 :0 ];
					data_out_miss_reg = data_in  [31 :0 ];
				end
			2'b01:
				begin
					data_out_hit1_reg = data_out1[63 :32];
					data_out_hit2_reg = data_out2[63 :32];
					data_out_miss_reg = data_in  [63 :32];
					
				end
			2'b10:	
				begin
					data_out_hit1_reg = data_out1[95 :64];
					data_out_hit2_reg = data_out2[95 :64];
					data_out_miss_reg = data_in  [95 :64];
				end
			default:
				begin
					data_out_hit1_reg = data_out1[127:96];
					data_out_hit2_reg = data_out2[127:96];
					data_out_miss_reg = data_in  [127:96];
				end
		endcase
	end
	
	always@(posedge clk)
	begin
		DO_reg = do;
		current_state = (!Enable)? Hit: next_state;
	end
	
	// Finate State Machine
	
	always@(*)
	begin
		case(current_state)
			Hit:			next_state = (Enable==1 && Cache_Hit==0)? Miss:Hit;
			Miss:			next_state = Miss_Ready;
			Miss_Ready:		next_state = Hit;
			Reset:			next_state = Hit;
			default:		next_state = Hit;
		endcase
	end
	
	always@(current_state)
	begin
		case(current_state)
			Miss:
			begin
				write = 0;
				stall_n = 0;
			end
			Miss_Ready:
			begin
				write = 1;
				stall_n = 1;
			end
			default:
			begin
				write = 0;
				stall_n = 1;
			end			
		endcase
	end
	
	
	// Fill data from Memory into Cache

	always@(negedge clk)
	begin
		Enable  = CSn;
		if(write)
		begin
			if(Cache_Flag[index+256]==1)
			begin
				#1 Cache_Data[index+256] = data_in;
				#1 Cache_Tag[index+256]  = tag_in;
				#1 Cache_Valid[index+256]= valid_in;
				#1 Cache_Flag[index+256] = 0;
				#1 Cache_Flag[index]	 = 1;	
			end
			else
			begin	
				#1 Cache_Data[index] 	 = data_in;
				#1 Cache_Tag[index]  	 = tag_in;
				#1 Cache_Valid[index]	 = valid_in;
				#1 Cache_Flag[index] 	 = 0;
				#1 Cache_Flag[index+256] = 1;	
			end	
		end
		
		if(!rst_n)
		begin
			for(i=0;i<`Entry;i=i+1)
			begin
				Cache_Valid[i]=0;
				Cache_Tag[i]=0;
				Cache_Data[i]=0;
				Cache_Flag[i]=0;
			end
		end
	end


endmodule