// Memories used by the cache:

module memc (data_out, addr, data_in, write, clk, rst);
   parameter Size = 1;
   output [Size-1:0] data_out;
   input [10:0]       addr;
   input [Size-1:0]  data_in;
   input             write;
   input             clk;
   input             rst;


   reg [Size-1:0]    mem [0:4095];

   integer           i;

   assign            data_out =  mem[addr];

   always @(posedge clk) begin

      if (rst) begin
         for (i=0; i<4095; i=i+1) begin
            mem[i] = 32'b0;
         end
      end

      if (!rst && write) mem[addr] = data_in;
      
   end
endmodule
