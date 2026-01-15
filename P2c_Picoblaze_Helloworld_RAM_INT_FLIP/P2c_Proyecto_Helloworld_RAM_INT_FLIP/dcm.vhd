library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity dcm_reloj is
    Port (
        clk    : in  STD_LOGIC; -- 50 MHz
        reset  : in  STD_LOGIC;

        rel_1  : out STD_LOGIC; -- 50 MHz (passthrough)
        rel_5  : out STD_LOGIC  -- 25 MHz (VGA)
    );
end dcm_reloj;

architecture Behavioral of dcm_reloj is

    signal clk_ibuf  : std_logic;
    signal clk_fb    : std_logic;
    signal clk_50    : std_logic;
    signal clk_25    : std_logic;

begin

    -- Input buffer
    IBUFG_inst : IBUFG
    port map (
        I => clk,
        O => clk_ibuf
    );

    -- DCM
    DCM_inst : DCM_SP
    generic map (
        CLKDV_DIVIDE => 2.0,       -- 50 / 2 = 25 MHz
        CLK_FEEDBACK => "1X",
        CLKIN_PERIOD => 20.0       -- 50 MHz
    )
    port map (
        CLKIN  => clk_ibuf,
        CLKFB  => clk_fb,
        RST    => reset,

        CLK0   => clk_50,
        CLKDV  => clk_25,

        LOCKED => open
    );

    -- Feedback buffer
    BUFG_fb : BUFG
    port map (
        I => clk_50,
        O => clk_fb
    );

    -- Output buffers
    BUFG_50 : BUFG
    port map (
        I => clk_50,
        O => rel_1
    );

    BUFG_25 : BUFG
    port map (
        I => clk_25,
        O => rel_5
    );

end Behavioral;
