/*`include "timescale.v"
`include  "cpu_control_unit.v"
`include  "cpu_core.v"
`include  "cpu_ex.v"
`include  "cpu_ex_alu.v"
`include  "cpu_ex_alu_adder.v"
`include  "cpu_ex_alu_clo.v"
`include  "cpu_ex_alu_shifter.v"
`include  "cpu_ex_forward_unit.v"
`include  "cpu_id.v"
`include  "cpu_id_adder.v"
`include  "cpu_id_branch_unit.v"
`include  "cpu_id_forward_unit.v"
`include  "cpu_id_hdu.v"
`include  "cpu_id_reg32_ne.v"
`include  "cpu_id_regbank.v"
`include  "cpu_if.v"
`include  "cpu_mem.v"
`include  "cpu_wb.v" */

`include  "I_Cache.v"
    
module  cpu_top(
         // System Input
         CLK,
         RESETn,
	 IRQ,
	 d_cache_stall_n,
         // Instruction Memory Interface
         IREQn,
         IADDR,
         IDBUS,
         // Data Memory Interface
         DREQn,
         DWRITE,
         DBE,
         DADDR,
         DWDBUS,
         DRDBUS,
	 BIGENDIAN,
         IACK    //interrupt  ack
        );
		
	    //-------------------------------------------------------------
        //      System I/O signals
        //-------------------------------------------------------------
        input           CLK;		// System Clcok
        input           RESETn;		// System Reset (Low active)
	input   [5:0]   IRQ;       // Interrupt
	input           d_cache_stall_n;

		//-------------------------------------------------------------
        //	Instruction memory interface signals 
        //-------------------------------------------------------------
        output		IREQn;		// Instruction Memory Request
        output  [31:0]  IADDR;		// Instruction Address Bus
        input	[127:0]	IDBUS;		// Instruction Data Bus       

        //-------------------------------------------------------------
        //      Data memory interface signals 
        //-------------------------------------------------------------
        output		DREQn;		// Data Memory Request
        output		DWRITE;		// Data Memory Access Direction
        output	[3:0]	DBE;		// Data Memory Byte Enable
        output	[31:0]	DADDR;		// Data Address Bus
        output	[31:0]	DWDBUS;		// Data Write Bus
	input	[31:0]	DRDBUS;		// Data Read Bus
		//-------------------------------------------------------------
        //     Control interface signals
        //-------------------------------------------------------------   
        input		BIGENDIAN;	// [1]Big-Endian or 
                                        // [0]Little-Endian
	output			IACK;
	wire 			DREQ;
	wire			IREQ;	
	wire 			IACK;
	wire			I_Cache_REQ;
	wire	[31:0]		I_Cache_ADDR;
	wire	[31:0]		I_Cache_DBUS;
	wire			i_cache_stall_n;
	wire			d_cache_stall_n;
										
	assign 		DREQn = ~DREQ ;	
	assign 		IREQn = ~IREQ ;		
		
		
cpu_core u_cpu_core(
	
        // System input signals
        .CLK		(CLK),		// (I) System Clock
        .RESETn		(RESETn),		// (I) System Reset (Low active)
	.IRQ 	 	(IRQ),         //interupt  
	.i_cache_stall_n      (i_cache_stall_n),
	.d_cache_stall_n      (d_cache_stall_n),

        // Instruction memory interface signals 
        .IREQ		(I_Cache_REQ),		// (O) Instruction Memory Request
        .IADDR		(I_Cache_ADDR),		// (O) Instruction Address Bus
        .IDBUS		(I_Cache_DBUS),		// (I) Instruction Data Bus
        
        // Data memory interface signals 
        .DREQ		(DREQ),		// (O) Data memory REQuest
        .DWRITE		(DWRITE),		// (O) Data Memory Access Direction
        .DBE		(DBE),		// (O) Data Memory Access Size
        .DADDR		(DADDR), 		// (O) Data Address Bus
        .DWDBUS		(DWDBUS),		// (O) Data Write Bus
        .DRDBUS		(DRDBUS),		// (I) Data Read Bus 
        
        // Control interface signals
        .BIGENDIAN	(BIGENDIAN),	// (I) Big or Little Endian 
	.IACK		(IACK)

        // Coprocessor interface signals
        /*CPWDBUS,        // (O) CoProcessor Write Data BUS
        CPWREN,        	// (O) CoProcessor WRite ENable
        CPWRNUM,        // (O) CoProcessor Write Register NUMber
        CPRRNUM,       	// (O) CoProcessor Read Register NUMber
        CPRRSEL,        // (O) CoProcessor Read Register SELect
		CPRDBUS		// (I) CoProcessor Read Data BUS
		*/
        );
I_Cache u_i_cache(
		.clk		(CLK),	
		.rst_n		(RESETn),
		.CSn		(I_Cache_REQ),//(I)
		.ADDR		(I_Cache_ADDR),//(I)
		.DO		(I_Cache_DBUS),//(O)
		
		.IREQ		(IREQ),//
		.IADDR		(IADDR),//
		.data_in	(IDBUS),//
		
		.cache_stall_n	(i_cache_stall_n)
);
		
	endmodule
