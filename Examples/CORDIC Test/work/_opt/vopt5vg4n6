library verilog;
use verilog.vl_types.all;
entity kordic is
    generic(
        IN_WIDTH        : integer := 16;
        EXTRA_BITS      : integer := 6
    );
    port(
        clock           : in     vl_logic;
        phase_step      : in     vl_logic_vector(31 downto 0);
        Xin             : in     vl_logic_vector;
        Yin             : in     vl_logic_vector;
        Xout            : out    vl_logic_vector;
        Yout            : out    vl_logic_vector
    );
end kordic;
