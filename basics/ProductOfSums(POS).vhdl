library ieee;
use ieee.std_logic_1164.all;

entity POS is 
	port (
		x: in std_logic;
		y: in std_logic;
		z: out std_logic
	);
end POS;

architecture behavior of POS is
begin
	z <= ((x or y) and (not x or not y));
end behavior;


