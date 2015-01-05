module cache (
              input enable,
              input clk,
              input rst,
              input [20:0] tag_in,
              input [10:0] index,
              //input [2:0] offset,
              input [31:0] data_in,
             // input comp,
              input write,
              input valid_in,
			  input datahiz,

              output [20:0] tag_out,
              output [31:0] data_out,
              output hit,
            //  output dirty,
              output valid

              );

   parameter         cache_id = 0;  // overridden for each cache instance

   wire  [31:0] c_data_out;
   reg   [10:0] index_temp;
   reg   [31:0] data_temp;
   reg   [20:0] tag_temp;
   //wire  [11:0] index_temp;
   
   always@(posedge clk or posedge rst)begin
   
		if(rst)begin
				index_temp <= 11'b0;
				//data_temp  <= 32'b0;
				//tag_temp   <= 20'b0;
				end
			else begin
				if(clk)begin
				index_temp <= index;
				//data_temp  <= data_in;
				//tag_temp   <= tag_in;
				end else
				begin
				index_temp <= index_temp;
				//data_temp  <= data_temp;
				//tag_temp   <= tag_temp;
				end
			end
				
				
		
		
   
   end
   
   assign            go = enable & ~rst;
   assign            match = (tag_in == tag_out);


   assign            wr_data  = go & write ;
   assign            wr_tag   = go & write ;
   assign            wr_valid = go & write ; 
   
   assign            data_out = (datahiz) ? 32'bz : c_data_out ;


   memc #(32) mem_w0 (c_data_out,index_temp, data_in, wr_data, clk, rst);
   memc #(21) mem_tg (tag_out, index_temp, tag_in,   wr_tag,   clk, rst);
   memv       mem_vl (validbit,index_temp, valid_in, wr_valid, clk, rst);

   assign            hit = go & match;

   assign            valid = go & validbit & (~write);

endmodule

