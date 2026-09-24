-------------------------------------------------------------------------------
-- Dr. Kaputa
-- seven segment test bench
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_tb is
end counter_tb;

architecture arch of counter_tb is

component counter is
  port (
    clk             : in std_logic; 
    reset           : in std_logic;
    seven_seg_out   : out std_logic_vector(6 downto 0)
  );  
end component; 

-- component generic_counter is
  -- generic (
    -- max_count       : integer range 0 to 100 := 3
  -- );
  -- port (
    -- clk             : in  std_logic; 
    -- reset           : in  std_logic;
    -- output          : out std_logic
  -- );  
-- end component;

-- component generic_adder_beh is
  -- generic (
    -- bits    : integer := 8
  -- );
  -- port (
    -- a       : in  std_logic_vector(bits-1 downto 0);
    -- b       : in  std_logic_vector(bits-1 downto 0);
    -- cin     : in  std_logic;
    -- sum     : out std_logic_vector(bits-1 downto 0);
    -- cout    : out std_logic
  -- );
-- end component generic_adder_beh;

-- constant NUM_BITS   : integer := 4;
signal output       : std_logic;
constant period     : time := 20ns;                                              
signal clk          : std_logic := '0';
signal reset        : std_logic := '1';
-- signal bcd          : std_logic_vector(3 downto 0) := "0000";
-- signal sync1        : std_logic;
-- signal sync2        : std_logic;
-- signal a            : std_logic_vector(NUM_BITS - 1 downto 0) := (others => '0');
-- signal b            : std_logic_vector(NUM_BITS - 1 downto 0) := (others => '0');
-- signal cin          : std_logic := '0';
signal sum          : std_logic_vector(3 downto 0);
-- signal cout         : std_logic;
signal enable       : std_logic;
signal sum_sig      : std_logic_vector(3 downto 0) := "0001";


begin

-- bcd iteration
-- sequential_tb : process 
    -- begin
      -- report "****************** sequential testbench start ****************";
      -- wait for 80 ns;   -- let all the initial conditions trickle through
      -- for i in 0 to 9 loop
        -- bcd <= std_logic_vector(unsigned(bcd) + 1 );
        -- wait for 40 ns;
      -- end loop;
      -- report "****************** sequential testbench stop ****************";
      -- wait;
  -- end process; 

-- process(clk,reset)
  -- begin
    -- if (reset = '1') then 
      -- sum_sig <= 0;
    -- elsif (clk'event and clk = '1') then
      -- if (enable = 1) then
        -- sum_sig <= sum;
      -- end if; 
    -- end if;
  -- end process;

-- clock process
clock: process
  begin
    clk <= not clk;
    wait for period/2;
end process; 
 
-- reset process
async_reset: process
  begin
    wait for 2 * period;
    reset <= '0';
    wait;
end process; 

uut: counter  
  port map(        
    clk            => clk,
    reset          => reset,
    seven_seg_out  => open
  );
  
end arch;