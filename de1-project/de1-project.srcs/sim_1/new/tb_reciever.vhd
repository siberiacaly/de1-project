----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/26/2023 09:01:03 AM
-- Design Name: 
-- Module Name: tb_reciever - Behavioral
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

entity tb_reciever is
--  Port ( );
end tb_reciever;

architecture testbench of tb_reciever is

  constant c_CLK_100MHZ_PERIOD : time    := 10 ns;

  -- Local signals
  signal sig_clk_100mhz : std_logic;
  signal sig_rst        : std_logic;
  signal sig_data_in    : std_logic;



begin
  uut_cnt : entity work.receiver
    port map (
      clk    => sig_clk_100mhz,
      rst    => sig_rst,
      data_in => sig_data_in
    );



    p_clk_gen : process is
  begin

    while now < 750 ns loop             -- 75 periods of 100MHz clock

      sig_clk_100mhz <= '0';
      wait for c_CLK_100MHZ_PERIOD / 2;
      sig_clk_100mhz <= '1';
      wait for c_CLK_100MHZ_PERIOD / 2;

    end loop;
    wait;                               -- Process is suspended forever

  end process p_clk_gen;

p_reset_gen : process is
  begin

    sig_rst <= '0';
    wait for 5.5 sec;

    -- Reset activated
    sig_rst <= '1';
    wait for 70ns;

    -- Reset deactivated
    sig_rst <= '0';

    wait;

  end process p_reset_gen;
  
  p_stimulus : process is
  begin

    report "Stimulus process started";
    sig_data_in <= '0';
    wait for 1 sec;
    sig_data_in <= '1';
    wait for 0.5 sec;
    sig_data_in <= '0';
    wait for 2 sec;
    sig_data_in <= '1';
    wait for 2 sec;
    
    report "Stimulus process finished";
    wait;

  end process p_stimulus;


end testbench;
