----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/19/2023 10:07:32 AM
-- Design Name: 
-- Module Name: shift_register - Behavioral
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


library ieee;
use ieee.std_logic_1164.all;

entity shift_register is
    port (
        rst : in std_logic;
        set_in : in std_logic;
        data_in : in std_logic;
        data_out : out std_logic_vector(7 downto 0)
    );
end shift_register;

architecture behavioral of shift_register is
begin
    process (set_in, rst)
    variable shift_reg : std_logic_vector(7 downto 0);
    begin
        if rst = '1' then
            shift_reg := (others => '0');
        elsif rising_edge(set_in) then
            shift_reg(0) := data_in;
            shift_reg(7 downto 1) := shift_reg(6 downto 0);
        end if;
        data_out <= shift_reg;
    end process;
end behavioral;
