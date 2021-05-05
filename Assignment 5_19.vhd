library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY assignment5_19 IS 
	PORT ( w : in  std_logic_vector(2 downto 0);
		   f : out std_logic );
END assignment5_19;

ARCHITECTURE behave OF assignment5_19 IS 
BEGIN 
    WITH w SELECT
    	f <= '0' WHEN "001",
    		 '0' WHEN "110",
    		 '1' WHEN OTHERS;
END behave;
