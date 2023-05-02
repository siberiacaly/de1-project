library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hex7seg is
    Port (
        hex_in : in std_logic_vector(3 downto 0);
        seg_out : out std_logic_vector(6 downto 0)
    );
end hex7seg;

architecture Behavioral of hex7seg is

begin
    process(hex_in)
    begin
        case hex_in is
            when "0000" => seg_out <= "0000001"; -- 0
            when "0001" => seg_out <= "1001111"; -- 1
            when "0010" => seg_out <= "0010010"; -- 2
            when "0011" => seg_out <= "0000110"; -- 3
            when "0100" => seg_out <= "1001100"; -- 4
            when "0101" => seg_out <= "0100100"; -- 5
            when "0110" => seg_out <= "0100000"; -- 6
            when "0111" => seg_out <= "0001111"; -- 7
            when "1000" => seg_out <= "0000000"; -- 8
            when "1001" => seg_out <= "0000100"; -- 9
            when "1010" => seg_out <= "0001000"; -- A
            when "1011" => seg_out <= "1100000"; -- B
            when "1100" => seg_out <= "0110001"; -- C
            when "1101" => seg_out <= "1000010"; -- D
            when "1110" => seg_out <= "0110000"; -- E
            when "1111" => seg_out <= "0111000"; -- F
            when others => seg_out <= "1111111"; -- default (off)
        end case;
    end process;

end Behavioral;