library verilog;
use verilog.vl_types.all;
entity cpu_reg1_ne is
    port(
        clk             : in     vl_logic;
        iack            : in     vl_logic;
        rst_n           : in     vl_logic;
        din             : in     vl_logic;
        wren            : in     vl_logic;
        dout            : out    vl_logic
    );
end cpu_reg1_ne;
