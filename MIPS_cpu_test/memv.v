// Separate version for the valid bit because of flash clear:

module memv (data_out, addr, data_in, write, clk, rst);
   output data_out;
   input [10:0] addr;
   input       data_in;
   input       write;
   input       clk;
   input       rst;


   reg         mem [0:4095];

   
   integer     i;

   assign      data_out = (write | rst)? 0 : mem[addr];

   always @(posedge clk) begin
      if (rst) begin
         for (i=0; i<4095; i=i+1) begin
            mem[i] = 0; // in hardware this would be a special flash-clear wire!
         end
      end
      if (!rst && write) mem[addr] = data_in;
      
   end
endmodule
