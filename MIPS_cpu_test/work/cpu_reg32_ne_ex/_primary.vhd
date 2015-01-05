library verilog;
use verilog.vl_types.all;
entity cpu_reg32_ne_ex is
    port(
        clk             : in     vl_logic;
        iack            : in     vl_logic;
        rst_n           : in     vl_logic;
        din             : in     vl_logic_vector(31 downto 0);
        wren            : in     vl_logic;
        dout            : out    vl_logic_vector(31 downto 0)
    );
end cpu_reg32_ne_ex;
