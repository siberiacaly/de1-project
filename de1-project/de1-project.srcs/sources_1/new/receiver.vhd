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
    fall_i : in std_logic;
    rise_i : in std_logic;
    dot_out : out std_logic;
    dash_out : out std_logic;
     
    
    );
end entity receiver;

architecture Behavioral of receiver is

-- Define the signal that uses different states
  signal sig_state : t_state;

  -- Internal clock enable
  signal sig_en : std_logic;

  -- Local delay counter
  signal sig_cnt : unsigned(4 downto 0);
  signal pause_cnt : unsinged (4 downto 0);

  -- Specific values for local counter
  constant c_DELAY_LONG : unsigned(4 downto 0) := b"1_1100"; --! 4-second delay
  constant c_DELAY_SHORT : unsigned(4 downto 0) := b"0_1100"; --! 2-second delay
  constant c_DELAY_DASH : unsigned(4 downto 0) := b"0_0110"; --! 1-second delay
  constant c_DELAY_DOT : unsigned(4 downto 0) := b"0_0010"; --! 1-second delay
  constant c_ZERO       : unsigned(4 downto 0) := b"0_0000"; --! Just zero


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

p_receiver_button : process (clk) is
  begin

 if rising_edge(clk) then

            if (reset = '1') then           -- Synchronous reset
                dot_o <= '0';  -- Clear all bits
                dash_o <= '0';  
                en_o <= '0';        
                
            elsif (sig_en = '1') then
                
                
                if (fall_i =  '1') and sig_cnt < DELAY_DOT then
                    dot_out = 1
            
            
                elsif (fall_i =  '1') and sig_cnt > DELAY_DOT and sig_cnt < DELAY_DASH then
                    dash_out = 1
                    
                if rise_i /= '1' then
                  sig_cnt <= sig_cnt + 1;
                  
                
                

end process p_receiver_button;

end Behavioral;
