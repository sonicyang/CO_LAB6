library verilog;
use verilog.vl_types.all;
entity fu_cla4v is
    port(
        din1            : in     vl_logic_vector(3 downto 0);
        din2            : in     vl_logic_vector(3 downto 0);
        carry_in        : in     vl_logic;
        dout            : out    vl_logic_vector(3 downto 0);
        carry_out       : out    vl_logic;
        overflow        : out    vl_logic
    );
end fu_cla4v;
