library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

entity ROM_4X4 is 
  generic (
    WIDTH : integer := 4;  --Bits per Word
    DEPTH : integer := 4;  --Number of WORDS IN ROM
  );

port (
  clock    : in  std_logic; 
  address  : in  std_logic_vector(integer(ceil(log2(real(DEPTH))))-1 downto 0); 
  data_out : out std_logic_vector(WIDTH-1 downto 0)
);
end entity; 

architecture ROM_4X4_arch of ROM_4X4 is 

  type ROM_ARRAY is array(0 to DEPTH-1) of std_logic_vector(WIDTH-1 downto 0);

  --STORE DATA IN ROM ARRAY
  constant ROM : ROM_ARRAY is (  0 => "0001",
                                  1 => "0010",
                                  2 => "0100",
                                  3 => "1000");
  
  MEMORY : process(clock)
    begin 
      if (rising_edge(clock) then 
        data_out <= ROM(to_integer(unsigned(address)));
      end if;
 end process MEMORY; 

end architecture;
          
          
          
  
                        
  


