----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/19/2018 03:27:28 PM
-- Design Name: 
-- Module Name: Test - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Test is
--  Port ( );
end Test;

architecture Behavioral of Test is

component Security is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           Command : in STD_LOGIC_VECTOR (31 downto 0);
           Door : in STD_LOGIC;
           Window : in STD_LOGIC;
           Alarmm : out STD_LOGIC);
end component;

signal clk, rst, Door, Window, Alarm : STD_LOGIC;
signal Command : STD_LOGIC_VECTOR (31 downto 0);

begin

S : Security port map (clk,rst,Command,Door,Window,Alarm); 

clock_process :process
begin
clk <= '0';
wait for 50 ns;
clk <= '1';
wait for 50 ns;
end process;
 

stim_proc: process
begin

rst <= '1';
wait for 20 ns;
rst <= '0';
wait for 29 ns;
--#1*123456*5396#
Command(0)<='0';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('#'), Command'length-1));
wait for 100 ns;
Command(0)<='1';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('1'), Command'length-1));
wait for 100 ns;
Command(0)<='0';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('*'), Command'length-1));
wait for 400 ns;
Command(0)<='1';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('1'), Command'length-1));
wait for 100 ns;
Command(0)<='0';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('2'), Command'length-1));
wait for 200 ns;
Command(0)<='1';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('3'), Command'length-1));
wait for 100 ns;
Command(0)<='0';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('4'), Command'length-1));
wait for 100 ns;
Command(0)<='1';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('5'), Command'length-1));
wait for 100 ns;
Command(0)<='0';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('6'), Command'length-1));
wait for 100 ns;
Command(0)<='1';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('*'), Command'length-1));
wait for 100 ns;
Command(0)<='0';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('5'), Command'length-1));
wait for 100 ns;
Command(0)<='1';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('3'), Command'length-1));
wait for 100 ns;
Command(0)<='0';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('9'), Command'length-1));
wait for 100 ns;
Command(0)<='1';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('6'), Command'length-1));
wait for 100 ns;
Command(0)<='0';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('#'), Command'length-1));
wait for 100 ns;


--#2*123456*8361#
Command(0)<='1';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('#'), Command'length-1));
wait for 100 ns;
Command(0)<='0';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('2'), Command'length-1));
wait for 100 ns;
Command(0)<='1';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('*'), Command'length-1));
wait for 100 ns;
Command(0)<='0';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('1'), Command'length-1));
wait for 100 ns;
Command(0)<='1';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('2'), Command'length-1));
wait for 200 ns;
Command(0)<='0';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('3'), Command'length-1));
wait for 100 ns;
Command(0)<='1';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('4'), Command'length-1));
wait for 100 ns;
Command(0)<='0';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('5'), Command'length-1));
wait for 100 ns;
Command(0)<='1';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('6'), Command'length-1));
wait for 100 ns;
Command(0)<='0';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('*'), Command'length-1));
wait for 100 ns;
Command(0)<='1';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('8'), Command'length-1));
wait for 100 ns;
Command(0)<='0';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('3'), Command'length-1));
wait for 100 ns;
Command(0)<='1';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('6'), Command'length-1));
wait for 100 ns;
Command(0)<='0';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('1'), Command'length-1));
wait for 100 ns;
Command(0)<='1';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('#'), Command'length-1));
wait for 100 ns;

--#2*8361*4042#
Command(0)<='0';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('#'), Command'length-1));
wait for 100 ns;
Command(0)<='1';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('2'), Command'length-1));
wait for 100 ns;
Command(0)<='0';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('*'), Command'length-1));
wait for 100 ns;
Command(0)<='1';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('8'), Command'length-1));
wait for 100 ns;
Command(0)<='0';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('3'), Command'length-1));
wait for 200 ns;
Command(0)<='1';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('6'), Command'length-1));
wait for 100 ns;
Command(0)<='0';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('1'), Command'length-1));
wait for 100 ns;
Command(0)<='1';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('*'), Command'length-1));
wait for 100 ns;
Command(0)<='0';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('4'), Command'length-1));
wait for 100 ns;
Command(0)<='1';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('0'), Command'length-1));
wait for 100 ns;
Command(0)<='0';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('4'), Command'length-1));
wait for 100 ns;
Command(0)<='1';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('2'), Command'length-1));
wait for 100 ns;
Command(0)<='0';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('#'), Command'length-1));
wait for 100 ns;

--#1*1#
Command(0)<='1';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('#'), Command'length-1));
wait for 100 ns;
Command(0)<='0';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('1'), Command'length-1));
wait for 100 ns;
Command(0)<='1';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('*'), Command'length-1));
wait for 100 ns;
Command(0)<='0';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('1'), Command'length-1));
wait for 100 ns;
Command(0)<='1';
Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('#'), Comma


-----------------------wait long

--Door<='1';
--wait for 100 ns;
--Command(0)<='0';
--Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('#'), Command'length-1));
--wait for 100 ns;
--Command(0)<='1';
--Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('1'), Command'length-1));
--wait for 100 ns;
--Command(0)<='0';
--Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('4'), Command'length-1));
--wait for 100 ns;
--Command(0)<='1';
--Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('1'), Command'length-1));
--wait for 2000 ns;

--Command(0)<='0';
--Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('#'), Command'length-1));
--wait for 100 ns;
--Command(0)<='1';
--Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('5'), Command'length-1));
--wait for 100 ns;
--Command(0)<='0';
--Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('3'), Command'length-1));
--wait for 100 ns;
--Command(0)<='1';
--Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('9'), Command'length-1));
--wait for 100 ns;
--Command(0)<='0';
--Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('6'), Command'length-1));
--wait for 100 ns;
--Command(0)<='1';
--Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('#'), Command'length-1));
--wait for 200 ns;



--------------------------------------------------------------------- 3 times

--Door<='1';
--wait for 100 ns;
--Command(0)<='0';
--Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('#'), Command'length-1));
--wait for 100 ns;
--Command(0)<='1';
--Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('5'), Command'length-1));
--wait for 100 ns;
--Command(0)<='0';
--Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('3'), Command'length-1));
--wait for 100 ns;
--Command(0)<='1';
--Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('3'), Command'length-1));
--wait for 100 ns;
--Command(0)<='0';
--Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('9'), Command'length-1));
--wait for 100 ns;
--Command(0)<='1';
--Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('#'), Command'length-1));
--wait for 200 ns;

--Command(0)<='0';
--Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('#'), Command'length-1));
--wait for 100 ns;
--Command(0)<='1';
--Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('1'), Command'length-1));
--wait for 100 ns;
--Command(0)<='0';
--Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('4'), Command'length-1));
--wait for 100 ns;
--Command(0)<='1';
--Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('1'), Command'length-1));
--wait for 100 ns;
--Command(0)<='0';
--Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('1'), Command'length-1));
--wait for 100 ns;
--Command(0)<='1';
--Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('#'), Command'length-1));
--wait for 200 ns;


--Command(0)<='0';
--Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('#'), Command'length-1));
--wait for 100 ns;
--Command(0)<='1';
--Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('1'), Command'length-1));
--wait for 100 ns;
--Command(0)<='0';
--Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('4'), Command'length-1));
--wait for 100 ns;
--Command(0)<='1';
--Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('1'), Command'length-1));
--wait for 100 ns;
--Command(0)<='0';
--Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('1'), Command'length-1));
--wait for 100 ns;
--Command(0)<='1';
--Command(31 downto 1) <= std_logic_vector(to_signed(character'pos('#'), Command'length-1));
--wait for 200 ns;

Window<='1';
wait for 200 ns;
Window<='0';

wait;
end process;

end Behavioral;
