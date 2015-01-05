module mem_ctrl(stall, write, valid_in, wr_mem, rd_mem, Done, CacheHit, sel_tag_mem, sel_data_cache, Rd, Wr, hit, clk, rst, valid, mem_change, req, datahiz, cs);

  output write, valid_in; // for cache
	output wr_mem, rd_mem; // for main memory
	output Done, CacheHit, stall; // for top-level output
  output sel_data_cache;
  output sel_tag_mem;
  output datahiz;
  output cs;
	input Rd, Wr; // from primary input 
	input hit; // from cache
	input clk, rst, valid;
	input mem_change;
	input req;

reg [3:0] cs;
reg [3:0] ns;
reg write, valid_in, wr_mem, rd_mem, Done, CacheHit, sel_data_cache, sel_tag_mem, stall, datahiz;
parameter IDLE = 4'd0, READ = 4'd1, RDMISS = 4'd2, RDMEM = 4'd3, RDDATA = 4'd4, WRITE = 4'd5, WRHIT = 4'd6, WRMISS = 4'd7, WRMEM = 4'd8 ,  RDHIT = 4'd9;
//做個datain tenp reg
//state reg
always@(posedge clk or rst )
begin
  if(rst)
    cs <= IDLE;
  else
    cs <= ns;
end
  
//next state logic
always@(*)
begin
  case(cs)
    IDLE:begin
        if(~rst)
          begin
            if(Rd & !Wr)
              ns = READ;
            else if(!Rd & Wr)
              ns = WRITE;
            else
              ns = IDLE;
          end
        else
          ns = IDLE;
        end//IDLE
    READ:begin
      if( valid && hit )
        ns = RDHIT;
      else
        ns = RDMISS;
    end//READ
    RDHIT:begin
      ns = RDDATA;
    end
    RDMISS:begin
      ns = RDMEM;
    end
    RDMEM:
      ns = (mem_change) ? RDDATA : RDMEM ;
    RDDATA:begin
        if(~rst)
          begin
            if(Rd & !Wr)
              ns = READ;
            else if(!Rd & Wr)
              ns = WRITE;
            else 
              ns = IDLE;
          end
        else
          ns = IDLE;
        end//rddata
    WRITE:
      if( valid && hit )
        ns = WRHIT;
      else
        ns = WRMISS;
    WRHIT:
    ns = WRMEM;
    WRMISS:
    ns = WRMEM;
    WRMEM:begin
        if(~rst)
          begin
            if(Rd & !Wr)
              ns = READ;
            else if(!Rd & Wr)
              ns = WRITE;
            else
              ns = IDLE;
          end
        else
          ns = IDLE;
        end//wrmem
    default:
    ns = IDLE;
  endcase
end

//output logic
always@(*)
begin
  case(cs)
    IDLE:begin
      write = 0;
      valid_in = 0;
      wr_mem = 0;
      rd_mem = 0;
      Done = 1;
      CacheHit = 0;  
      sel_data_cache = 1;
      sel_tag_mem = 1;
      stall = 0;
	  datahiz = 1;
        end//IDLE
    READ:begin
      write = 0;
      valid_in = 0;
      wr_mem = 0;
      rd_mem = 0;
      Done = 0;
      sel_data_cache = 1;
      sel_tag_mem = 0;
      stall = 1;
      CacheHit = 0;
	  datahiz = 0;
    
    end
    RDHIT:begin
      write = 0;
      valid_in = 0;
      wr_mem = 0;
      rd_mem = 0;
      Done = 0;
      CacheHit = 1;
      sel_data_cache = 1;
      sel_tag_mem = 0;
      stall = 1;
	  datahiz = 0;
    end
    RDMISS:begin
      write = 0;
      valid_in = 1;
      wr_mem = 0;
      rd_mem = 1;
      Done = 0;
      CacheHit = 0;
      sel_data_cache = 1;
      sel_tag_mem = 0;
      stall = 1;
	  datahiz = 0;
    end
    RDMEM:begin
      write = 1;
      valid_in = 1;
      wr_mem = 0;
      rd_mem = 0;
      Done = 0;
      CacheHit = 0;
      sel_data_cache = 1;
      sel_tag_mem = 0;
      stall = 1;
	  datahiz = 0;
    end
    RDDATA:begin
      write = 0;
      valid_in = 0;
      wr_mem = 0;
      rd_mem = 0;
      Done = 0;
      CacheHit = 0;
      sel_data_cache = 1;
      sel_tag_mem = 1;
      stall = 0;
	  datahiz = 0;
    end
    WRITE:begin
      write = 0;
      valid_in = 0;
      wr_mem = 0;
      rd_mem = 0;
      Done = 0;
      sel_data_cache = 0;
      sel_tag_mem = 0;
      stall = 1;
      CacheHit = 0;
	  datahiz = 0;
  
      
    end
    WRHIT:begin
      write = 1;
      valid_in = 1;
      wr_mem = 0;
      rd_mem = 0;
      Done = 0;
      CacheHit = 1;
      sel_data_cache = 0;
      sel_tag_mem = 0;
      stall = 1;
	  datahiz = 0;
    end
    WRMISS:begin
      write = 1;
      valid_in = 0;
      wr_mem = 0;
      rd_mem = 0;
      Done = 0;
      CacheHit = 0;
      sel_data_cache = 0;
      sel_tag_mem = 0;
      stall = 1;
	  datahiz = 0;
    end
    WRMEM:begin
      write = 1;
      valid_in = 1;
      wr_mem = 1;
      rd_mem = 0;
      Done =0;
      CacheHit = 0;
      sel_data_cache = 0;
      sel_tag_mem = 0;
      stall = 0;
	  datahiz = 0;
    end
    
    default:begin
      write = 0;
      valid_in = 0;
      wr_mem = 0;
      rd_mem = 0;
      Done =0;
      CacheHit = 0;
      sel_data_cache = 0;
      sel_tag_mem = 0;
      stall = 0;
	  datahiz = 0;
    end
  endcase
end


  
endmodule
