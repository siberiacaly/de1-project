library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity morse_decoder is
  Port ( clk : in  std_logic;
         rst : in  std_logic;
         dot_in : in  std_logic;
         dash_in : in  std_logic;
         char_out : out  std_logic_vector(7 downto 0));
end morse_decoder;

architecture Behavioral of morse_decoder is
  type state_type is (START, DOT, DASH, CHAR_DONE);
  signal current_state : state_type;

  signal dot_cnt : integer := 0;
  signal dash_cnt : integer := 0;
  signal char_cnt : integer := 0;

  constant DOT_THRESHOLD : integer := 10;  -- Threshold for detecting a dot
  constant DASH_THRESHOLD : integer := 30; -- Threshold for detecting a dash

  function decode_char(dot_count : integer; dash_count : integer) return std_logic_vector is
  begin
    case dot_count is
      when 1 => -- E
        if dash_count = 0 then
          return "01000101";
        else
          return "00000000";
        end if;
      when 2 => -- I or U
        if dash_count = 1 then
          return "01001001"; -- I
        elsif dash_count = 2 then
          return "01010101"; -- U
        else
          return "00000000";
        end if;
      when 3 => -- S or O
        if dash_count = 0 then
          return "01010011"; -- S
        elsif dash_count = 3 then
          return "01001111"; -- O
        else
          return "00000000";
        end if;
      when 4 => -- H or V
        if dash_count = 1 then
          return "01001000"; -- H
        elsif dash_count = 3 then
          return "01010110"; -- V
        else
          return "00000000";
        end if;
      when 5 => -- 5 or 4
        if dash_count = 4 then
          return "00110101"; -- 5
        elsif dash_count = 3 then
          return "00110100"; -- 4
        else
          return "00000000";
        end if;
      when 6 => -- F or ? or 3
        if dash_count = 2 then
          return "01000110"; -- F
        elsif dash_count = 4 then
          return "00111111"; -- ?
        elsif dash_count = 3 then
          return "00110011"; -- 3
        else
          return "00000000";
        end if;
      when 7 => -- L or ?
        if dash_count = 2 then
          return "01001100"; -- L
        elsif dash_count = 4 then
          return "00111111"; -- ?
        else
          return "00000000";
        end if;
      when 8 => -- P or J or 1
        if dash_count = 3 then
          return "01010000"; -- P
        elsif dash_count = 1 then
          return "01001010"; -- J
        elsif dash_count = 4 then
          return "00110001"; -- 1
        else
          return "00000000";
        end if;
      when 9 => -- W or 2
        if dash_count = 2 then
          return "01010111"; -- W
        elsif dash_count = 4 then
          return "00110010"; -- 2
        else
          return "00000000";
        end if;
      when 10 => -- R or K or X
        if dash_count = 1 then
          return "01010010"; -- R
        elsif dash_count = 3 then
          return "01001011"; -- K
        elsif dash_count = 4 then
          return "01011000"; -- X
        else
          return "00000000";
        end if;
      when 11 => -- D or C or Y or ?
        if dash_count = 2 then
          return "01000100"; -- D
        elsif dash_count = 3 then
          return "01000011"; -- C
        elsif dash_count = 5 then
          return "01011001"; -- Y
        elsif dash_count = 4 then
          return "00111111"; -- ?
        else
          return "00000000";
        end if;
      when 12 => -- B or N or Z or 7
