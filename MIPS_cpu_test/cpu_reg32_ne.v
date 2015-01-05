//+FHDR----------------------------------------------------------------
// (C) Copyright CASLab.EE.NCKU
// All Right Reserved
//---------------------------------------------------------------------
// FILE NAME: cpu_reg32_ne.v
// AUTHOR: Chen-Chien Wang
// CONTACT INFORMATION: ccwang@casmail.ee.ncku.edu.tw
//---------------------------------------------------------------------
// RELEASE VERSION: V1.0
// VERSION DESCRIPTION: First Edition no errata
//---------------------------------------------------------------------
// RELEASE: Apr. 01, 2005  08:51
//---------------------------------------------------------------------
// PURPOSE:
//-FHDR----------------------------------------------------------------

// synopsys translate_off
`include "timescale.v"
// synopsys translate_on

module cpu_reg32_ne(irq,epc,clk, rst_n, din, wren, dout, iack);

        input           clk;    // System clk
        input           rst_n;  // System Reset
        input   [31:0]  din;    // Data input
		input	[31:0]	epc;
        input           wren; // Enable Register
		input	[7:0]	irq;
		input 			iack;
        output  [31:0]  dout;   // Data Output

        reg     [31:0]  dout;
		
        always@(negedge clk or negedge rst_n or posedge iack)
        begin
                if(~rst_n)    	
					begin
					dout<=32'b0;
					end
				else if(iack)	dout<=32'h00001000;

				else
					begin
						if(din ==32'h00002004)  dout<=epc;
						else if(wren) begin dout<=din;  $monitor("%0dns :\$monitor: wren=%b ",$stime,wren);   end
						else 	dout<=dout;  	
					end		
                 
        end


endmodule