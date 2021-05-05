library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY assignment5_20 IS
    PORT (w : in  std_logic_vector(2 downto 0);
    	  f : out std_logic);
END assignment5_20;

ARCHITECTURE behave OF assignment5_20
BEGIN
	WITH w SELECT 
		f <= '0' WHEN "000",
		     '0' WHEN "100",
		     '0' WHEN "111",
		     '1' WHEN OTHERS;
END behave;