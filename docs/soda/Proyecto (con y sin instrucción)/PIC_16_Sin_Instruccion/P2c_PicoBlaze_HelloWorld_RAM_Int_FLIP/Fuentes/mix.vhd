------------------------------------------------------------------------------------
-- Definition of a 16-bit mix process
-- Operation:
-- The input operand is split and mixed. The lower 8 bits are moved to the upper part,
-- and the upper 8 bits are moved to the lower part.
------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mix is
    Port (
        operand : in std_logic_vector(15 downto 0); -- 16-bit input
        Y : out std_logic_vector(15 downto 0);      -- 16-bit output
        clk : in std_logic                          -- Clock signal
    );
end mix;

architecture low_level_definition of mix is
begin
    FF: process (clk)
    begin
        if rising_edge(clk) then
            -- Intercambia los 8 ultimos con los 8 primeros bits
            Y <= operand(7 downto 0) & operand(15 downto 8);
        end if;
    end process FF;
end low_level_definition;
