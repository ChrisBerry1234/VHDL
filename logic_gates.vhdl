library ieee;
use ieee.std_logic_1164.all;

entity gates2 is 
    port(
        a : in std_logic;
        b : in std_logic;
        y : out std_logic_vector(5 downto 0)  -- must be OUT
        -- two inputs and 6 different outputs
    );
end gates2;

architecture gates2_arch of gates2 is
begin
    y(5) <= a and b;
    y(4) <= a nand b;
    y(3) <= a or b;
    y(2) <= a nor b;
    y(1) <= a xor b;
    y(0) <= a xnor b;
end gates2_arch;
