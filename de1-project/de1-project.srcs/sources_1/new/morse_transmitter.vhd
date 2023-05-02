library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Morse_Transmitter is
    Port ( input_text : in  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           output_signal : out  STD_LOGIC);
end Morse_Transmitter;

architecture Behavioral of Morse_Transmitter is

    -- Morse code lookup table
    type morse_table_type is array (natural range <>) of std_logic_vector(3 downto 0);
    constant morse_table : morse_table_type := (
        0 => "0000", -- space
        1 => "01",   -- A
        2 => "1000", -- B
        3 => "1010", -- C
        4 => "100",  -- D
        5 => "0",    -- E
        6 => "0010", -- F
        7 => "110",  -- G
        8 => "0000", -- H
        9 => "00",   -- I
        10 => "0111",-- J
        11 => "101", -- K
        12 => "0100",-- L
        13 => "11",  -- M
        14 => "10",  -- N
        15 => "111", -- O
        16 => "0110",-- P
        17 => "1101",-- Q
        18 => "010", -- R
        19 => "000", -- S
        20 => "1",   -- T
        21 => "001", -- U
        22 => "0001",-- V
        23 => "011", -- W
        24 => "1001",-- X
        25 => "1011",-- Y
        26 => "1100" -- Z
    );

    signal morse_code : std_logic_vector(31 downto 0);
    signal counter : integer range 0 to 31 := 0;
    signal dot_duration : integer := 1;
    signal dash_duration : integer := 3;
    signal space_duration : integer := 3;
    signal word_space_duration : integer := 7;
    signal signal_duration : integer := 0;
    signal signal_state : integer := 0;
    signal output_state : std_logic := '0';

begin
    transmit_process: process(clk, reset)
    begin
        if reset = '1' then
            output_signal <= '0';
            signal_duration <= 0;
            signal_state <= 0;
            output_state <= '0';
        elsif rising_edge(clk) then
            case signal_state is
                when 0 =>
                    if counter = 0 then
                        signal_duration <= dot_duration;
                        output_state <= morse_code(signal_state);
                        output_signal <= '1';
                        signal_state <= 1;
                    else
                        signal_duration <= signal_duration + 1;
                    end if;
                when 1 =>
                    if counter = 0 then
                        signal_duration <= space_duration;
                        output_state <= '0';
                        output_signal <= '0';
                        signal_state <= 2;
                    else
                        signal_duration <= signal_duration + 1;
                    end if;
                when 2 =>
                    if counter = 0 then
                        signal_duration <= dash_duration;
                        output_state <= morse_code(signal_state);
                        output_signal <= '1';
                        signal_state <= 3;
                    else
                        signal_duration <= signal_duration + 1;
                    end if;
                when 3 =>
                    if counter = 0 then
                        signal_duration <= space_duration;
                        output_state <= '0';
                        output_signal <= '0';
                        signal_state <= 4;
                    else
                        signal_duration <= signal_duration + 1;
                    end if;
                when 4 =>
                    if counter = 0 then
                        signal_duration <= dot_duration;
                        output_state <= morse_code(signal_state);
                        output_signal <= '1';
                        signal_state <= 5;
                    else
                        signal_duration <= signal_duration + 1;
                    end if;
                when 5 =>
                    if counter = 0 then
                        signal_duration <= word_space_duration;
                        output_state <= '0';
                        output_signal <= '0';
                        signal_state <= 0;
                    else
                        signal_duration <= signal_duration + 1;
                    end if;
            end case;
            
            if signal_duration = 0 then
                counter <= counter + 1;
                if counter = 2 then
                    counter <= 0;
                end if;
            else
                signal_duration <= signal_duration - 1;
            end if;
        end if;
    end process;

end Behavioral;
