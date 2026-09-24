-------------------------------------------------------------------------------
-- Dr. Kaputa
-- seven segment test bench
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_top is
  port (
    clk             : in std_logic; 
    reset           : in std_logic;
    seven_seg_out   : out std_logic_vector(6 downto 0)
  );
end entity counter_top;

architecture arch of counter_top is

component counter is
  port (
    clk             : in std_logic; 
    reset           : in std_logic;
    seven_seg_out   : out std_logic_vector(6 downto 0)
  );  
end component; 

begin

uut3: counter
  port map(
    clk => clk,
	reset => reset,
	seven_seg_out => seven_seg_out
  );

end arch;