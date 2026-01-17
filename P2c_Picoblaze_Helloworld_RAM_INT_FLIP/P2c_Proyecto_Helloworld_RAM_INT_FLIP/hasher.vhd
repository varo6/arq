------------------------------------------------------------------------------------
--
-- 
-- 
--
-- 
--
--



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hasher is
    Port (
        operand : in  std_logic_vector(7 downto 0);
        Y       : out std_logic_vector(7 downto 0);
        clk     : in  std_logic
    );
end hasher;

architecture low_level_definition of hasher is
    constant MAGIC_KEY : std_logic_vector(7 downto 0) := x"A5";
    
    signal stage1_flip   : std_logic_vector(7 downto 0);
    signal stage2_xor    : std_logic_vector(7 downto 0);
    signal stage3_rot    : std_logic_vector(7 downto 0);
    signal stage4_swap   : std_logic_vector(7 downto 0);
	 signal r1, r2, stage5_mix : std_logic_vector(7 downto 0);
begin

    -- stage 1: FLIP
    -- stage 2: XOR con MAGIC_KEY 
    -- stage 3: ROT con 3 bits  
    -- stage 4: NIBBLE SWAP 
	 -- stage 5: MIX

    flip_gen: for i in 0 to 7 generate
        stage1_flip(i) <= operand(7-i);
    end generate;
    
    stage2_xor <= stage1_flip xor MAGIC_KEY;
    
    stage3_rot <= stage2_xor(4 downto 0) & stage2_xor(7 downto 5);
    
    stage4_swap <= stage3_rot(3 downto 0) & stage3_rot(7 downto 4);
	 
	 r1 <= stage4_swap(6 downto 0) & stage4_swap(7);          -- rotl1
	 
	 r2 <= stage4_swap(5 downto 0) & stage4_swap(7 downto 6); -- rotl2
	 
	 stage5_mix <= stage4_swap xor r1 xor (stage4_swap and r2);

    -- Registro de salida síncrono
    process(clk)
    begin
        if rising_edge(clk) then
            Y <= stage5_mix;
        end if;
    end process;

end low_level_definition;
