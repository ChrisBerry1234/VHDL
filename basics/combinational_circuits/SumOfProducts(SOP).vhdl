library ieee;
use ieee.std_logic_1164.all;

entity SOP is
	port(
		x: in std_logic;
		y: in std_logic;
		z: out std_logic
	);
end SOP;

architecture behavior of SOP is
begin
	z <= (not x and y ) or (x and not y);
end behavior;

