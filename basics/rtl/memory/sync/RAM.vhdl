library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity rw_4x4_sync is 
  --CONSTANTS DEFINING ENTITIES
  generic(
    WIDTH : integer:= 4; --BITS PER WORD
    DEPTH : integer:= 4  --NUMBER OF WORDS IN ROM ARRAY
  );

  port (
    clock    : in std_logic; 
    address  : in std_logic_vector(integer(ceil(log2(real(DEPTH))))-1 downto 0);
    data_out : out std_logic_vector(WIDTH-1 downto 0);
    data_in  : in std_logic_vector(WIDTH-1 downto 0);
    WE       : in std_logic);

end entity; 


architecture rw_4x4_sync_arch of rw_4x4_sync is 

  type RAM_ARRAY is array (0 to DEPTH-1) of std_logic_vector(WIDTH-1 downto 0);
  signal RW: RAM_ARRAY;

  begin 

    MEMORY : process(clock)
      begin 
        if (rising_edge(clock)) then 
          if (WE = '1') then 
            RW(to_integer(unsigned(address))) <= data_in;
          else 
            data_out <= RW(to_integer(unsigned(address)));
          end if;
        end if;
      end process MEMORY;

end architecture; 
