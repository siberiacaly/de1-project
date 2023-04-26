----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/26/2023 10:22:02 AM
-- Design Name: 
-- Module Name: edge_detect - Behavioral
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

entity edge_detect is
--  Port ( );
    port(
        clk     : in std_logic;
        sig_i   : in std_logic;
        rise_o  : out std_logic;
        fall_o  : out std_logic
    );
end edge_detect;

architecture Behavioral of edge_detect is

    signal s_curr : std_logic;
    signal s_prev : std_logic;
    
begin
 p_detector : process(clk)
    begin
        if rising_edge(clk) then
            s_curr <= sig_i;
            s_prev <= s_curr;
        end if;

    end process p_detector;
    
    rise_o <= s_curr and (not s_prev);
    fall_o <= (not s_curr) and s_prev;
end Behavioral;
