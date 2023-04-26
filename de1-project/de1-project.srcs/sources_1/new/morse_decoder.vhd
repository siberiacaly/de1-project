----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/19/2023 10:10:28 AM
-- Design Name: 
-- Module Name: morse_decoder - Behavioral
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

entity morse_decoder is
port (
        clk : in std_logic;
        rst : in std_logic;
        data_in : in std_logic;
        
        shift : in std_logic;
        shift_reg_in : in std_logic;
        shift_reg_out : out std_logic_vector(7 downto 0);
        dash_in : in std_logic;
        dot_in : in std_logic;
        reciever_state : in std_logic_vector(1 downto 0)
    );
end morse_decoder;

architecture Behavioral of morse_decoder is

begin

shift_reg0: entity work.shift_register
    port map (
      rst => rst,
      set_in => shift,
      data_in => shift_reg_in,
      data_out  => shift_reg_out
    );
receiver0 : entity work.receiver
    port map(
    clk => clk,
    rst => rst,
    data_in => data_in
    --dash_in <= dash_out,
    --dot_in <= dot_out,
    --state => reciever_state
    );
    

end Behavioral;
