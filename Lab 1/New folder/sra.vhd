-- ----------------------------------------------------
-- Company : Rochester Institute of Technology (RIT )
-- Engineer : Shubhang Mehrotra (sm9943)
--
-- Create Date : <CREATION_TIME_HERE >
-- Design Name : sllN
-- Module Name : sllN - behavioral
-- Project Name : <PROJECT_NAME_HERE >
-- Target Devices : Basys3
--
-- Description : N-bit logical left shift (SLL ) unit
-- ----------------------------------------------------
library IEEE ;
use IEEE . STD_LOGIC_1164 .ALL ;
use IEEE . NUMERIC_STD .ALL;
entity sraN is
GENERIC (N : INTEGER); --bit width
PORT (
A : IN std_logic_vector (N -1 downto 0);
SHIFT_AMT : IN std_logic_vector (N -1 downto 0);
Y : OUT std_logic_vector (N -1 downto 0)
);
end sraN ;
architecture behavioral of sraN is
type shifty_array is array (N -1 downto 0) of std_logic_vector (N -1 downto 0);
signal aSrA : shifty_array ;
begin
generateSRA : for i in 0 to N -1 generate
aSRA (i)(N -1-i downto 0) <= A(N -1 downto i);
right_fill : if i > 0 generate
aSRA (i)(N -1 downto N-i) <= ( others => A(N-1));
end generate right_fill ;
end generate generateSRA ;
Y <= aSRA ( to_integer ( unsigned ( SHIFT_AMT ))) when
( to_integer ( unsigned ( SHIFT_AMT )) < 32) else ( others => '0');
end behavioral ;
