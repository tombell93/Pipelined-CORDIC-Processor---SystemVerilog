library verilog;
use verilog.vl_types.all;
entity cordic is
    generic(
        IN_WIDTH        : integer := 16;
        EXTRA_BITS      : integer := 5
    );
    port(
        clock           : in     vl_logic;
        frequency       : in     vl_logic_vector(31 downto 0);
        in_data         : in     vl_logic_vector;
        out_data_I      : out    vl_logic_vector;
        out_data_Q      : out    vl_logic_vector
    );
end cordic;
