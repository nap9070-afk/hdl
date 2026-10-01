-------------------------------------------------------------------------------
-- Dr. Kaputa
-- synchronizer 3 bit example
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;      

entity top is 
  port (
    clk               : in std_logic;
    reset             : in std_logic;
	input1            : in std_logic_vector(2 downto 0);
	input2            : in std_logic_vector(2 downto 0);
	add_btn           : in std_logic;
	sub_btn           : in std_logic;
	seven_seg_a    : out std_logic_vector(6 downto 0);
	seven_seg_b     : out std_logic_vector(6 downto 0);
	seven_seg_result  : out std_logic_vector(6 downto 0);
  );
end entity top;

architecture arch of top is

signal a_sync         : std_logic_vector(2 downto 0);
signal b_sync         : std_logic_vector(2 downto 0);
signal a_four_bit     : std_logic_vector(3 downto 0);
signal b_four_bit     : std_logic_vector(3 downto 0);
signal result         : std_logic_vector(3 downto 0);
signal add_flag       : std_logic;
signal sub_flag       : std_logic;
signal flag           : std_logic;

component synchronizer_3bit is
  port  (
    clk               : in std_logic;
	reset             : in std_logic;
	async_in          : in std_logic_vector(2 downto 0);
	sync_out          : out std_logic_vector(2 downto 0);
  );
end component;

component rising_edge_synchronizer is
  port (
    clk               : in std_logic;
	reset             : in std_logic;
	input             : in std_logic;
	edge              : out std_logic;
  );
end component;

component seven_seg is
  port (
    clk               : in std_logic;
	reset             : in std_logic;
	bcd               : in std_logic_vector(3 downto 0);
	seven_seg_out     : out std_logic_vector(6 downto 0);
  );
end component;

component add_sub is 
  port (
    clk               : in std_logic;
	reset             : in std_logic;
	flag              : in std_logic;
	result            : out std_logic_vector(3 downto 0);
  );
end component;

begin
	
	
	process(clk, add_flag, sub_flag)
	begin
	  if rising_edge(clk)then
        if add_flag = '1'then
          flag <= '1';
		elsif sub_flag = '1'then
		  flag <= '0';
		end if;
	  end if;
	end process;
	    
end arch; 