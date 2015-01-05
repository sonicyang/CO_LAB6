library verilog;
use verilog.vl_types.all;
entity mem_ctrl is
    generic(
        IDLE            : integer := 0;
        READ            : integer := 1;
        RDMISS          : integer := 2;
        RDMEM           : integer := 3;
        RDDATA          : integer := 4;
        \WRITE\         : integer := 5;
        WRHIT           : integer := 6;
        WRMISS          : integer := 7;
        WRMEM           : integer := 8;
        RDHIT           : integer := 9
    );
    port(
        stall           : out    vl_logic;
        write           : out    vl_logic;
        valid_in        : out    vl_logic;
        wr_mem          : out    vl_logic;
        rd_mem          : out    vl_logic;
        Done            : out    vl_logic;
        CacheHit        : out    vl_logic;
        sel_tag_mem     : out    vl_logic;
        sel_data_cache  : out    vl_logic;
        Rd              : in     vl_logic;
        Wr              : in     vl_logic;
        hit             : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        valid           : in     vl_logic;
        mem_change      : in     vl_logic;
        req             : in     vl_logic;
        datahiz         : out    vl_logic;
        cs              : out    vl_logic_vector(3 downto 0)
    );
end mem_ctrl;
