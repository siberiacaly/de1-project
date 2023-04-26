----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2023 09:31:31 AM
-- Design Name: 
-- Module Name: receiver - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;




entity receiver is
  port (
    clk   : in    std_logic;                    --! Main clock
    rst   : in    std_logic;                 --! High-active synchronous reset
    data_in : in std_logic;
    dot_out : out std_logic;
    dash_out : out std_logic;
    state : out std_logic_vector(1 downto 0) 
    );
end entity receiver;

architecture Behavioral of receiver is

  -- Internal clock enable
  signal sig_en : std_logic;
  signal sig_cnt : natural;
  signal pause_cnt : natural;
  -- Local delay counter

  
  -- Specific values for local counter
 -- constant c_DELAY_LONG : std_logic_vector(4 downto 0) := b"1_1100"; --! 4-second delay
  constant c_DELAY_SHORT : natural := 2; --! 2-second delay
  -- constant c_DELAY_DASH : std_logic_vector(4 downto 0) := b"0_0110"; --! 1-second delay
  constant c_DELAY_DOT : natural := 1; --! 1-second delay
  constant c_ZERO       : natural := 0; --! Just zero


begin

  --------------------------------------------------------
  -- Instance (copy) of clock_enable entity generates
  -- an enable pulse every 250 ms (4 Hz)
  --------------------------------------------------------
  clk_en0 : entity work.clock_enable
    generic map (
      -- FOR SIMULATION, KEEP THIS VALUE TO 1
      -- FOR IMPLEMENTATION, CALCULATE VALUE: 250 ms / (1/100 MHz)
      -- 1   @ 10 ns
      -- ??? @ 250 ms
      g_MAX => 1
    )
    port map (
      clk => clk,
      rst => rst,
      ce  => sig_en
    );    

p_receiver : process(clk)
  begin

 if rising_edge(clk) then
            if (rst = '1') then      -- Synchronous reset
                sig_cnt <= 0; 
            else
                if (data_in = '1') then        
                     if (sig_cnt <= c_DELAY_DOT) then  -- check if dot
                         dot_out <= '1';                   
                     elsif (sig_cnt > c_DELAY_DOT) then    -- check if dash
                         dash_out <= '1';
                     end if;
                elsif (data_in = '0') then
                     if (pause_cnt <= c_DELAY_SHORT) then  -- check if dot
                         state <= "01";-- end of char     
                    elsif (pause_cnt > c_DELAY_SHORT) then    -- check if dash
                          state <= "10";-- end of word
                    end if;
                else 
                     dot_out <= '0';  -- Clear all bits
                     dash_out <= '0';  
                     sig_en <= '0';   
                end if;
            end if; 
  end if;                                                                   
end process p_receiver;

end Behavioral;
