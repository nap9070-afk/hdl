-------------------------------------------------------------------------------
-- Dr. Kaputa
-- seven segment test bench
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
  port (
    clk             : in std_logic; 
    reset           : in std_logic;
    seven_seg_out   : out std_logic_vector(6 downto 0)
  );
end entity counter;

architecture beh of counter is

component seven_seg is
  port (
    clk             : in std_logic; 
    reset           : in std_logic;
    bcd             : in std_logic_vector(3 downto 0);
    seven_seg_out   : out std_logic_vector(6 downto 0)
  );  
end component; 

component generic_counter is
  generic (
    max_count       : integer range 0 to 5000000 := 3
  );
  port (
    clk             : in  std_logic; 
    reset           : in  std_logic;
    output          : out std_logic
  );  
end component;

component generic_adder_beh is
  generic (
    bits    : integer := 4
  );
  port (
    a       : in  std_logic_vector(bits-1 downto 0);
    b       : in  std_logic_vector(bits-1 downto 0);
    cin     : in  std_logic;
    sum     : out std_logic_vector(bits-1 downto 0);
    cout    : out std_logic
  );
end component generic_adder_beh;

constant NUM_BITS   : integer := 4;
signal output       : std_logic;
constant period     : time := 20ns;                                              
-- signal clk          : std_logic := '0';
-- signal reset        : std_logic := '1';
signal bcd          : std_logic_vector(3 downto 0) := "0000";
signal sync1        : std_logic;
signal sync2        : std_logic;
signal a            : std_logic_vector(NUM_BITS - 1 downto 0) := (others => '0');
signal sum_sig         : std_logic_vector(3 downto 0);
signal enable          : std_logic;
-- signal sum             : std_logic_vector(3 downto 0);
signal inc             : std_logic_vector(3 downto 0) := "0001";
signal cin          : std_logic := '0';
signal sum          : std_logic_vector(NUM_BITS - 1 downto 0);
signal cout         : std_logic;
-- signal enable       : std_logic;


begin

  process(clk,reset)
    begin
    if (reset = '1') then 
      sum_sig <= "0000";
    elsif (clk'event and clk = '1') then
      if (enable = '1') then
        sum_sig <= sum;
      end if; 
    end if;
  end process;

uut: seven_seg  
  port map(        
    clk            => clk,
    reset          => reset,
    bcd            => sum_sig,
    seven_seg_out  => seven_seg_out
  );
  
uut1: generic_counter  
  generic map (
    max_count => 5000000
  )
  port map(
    clk       => clk,
    reset     => reset,
    output    => enable
  );
  
uut2: generic_counter  
  generic map (
    max_count => 19
  )
  port map(
    clk       => clk,
    reset     => reset,
    output    => sync2
  );
  
uut3: generic_adder_beh  
  generic map (
    bits => 4
  )
  port map(
    a       => sum_sig,
    b       => inc,
    cin     => cin,
    sum     => sum,
    cout    => cout
  );

end beh;