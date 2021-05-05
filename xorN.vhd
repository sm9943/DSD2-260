----------------------------------------------------------------------------------
-- Company: RIT DSD2
-- Engineer: Shubhang Mehrotra
-- 
-- Create Date: 02.02.2021 20:08:05
-- Design Name: xor: Homework 1
-- Module Name: xorN - Behavioral
-- Description: 
----------------------------------------------------------------------------------
library IEEE; use IEEE.STD_LOGIC_1164.all;

entity xorN is
generic(width: integer := 8);
port(a: in STD_LOGIC_VECTOR(width-1 downto 0);
y: out STD_LOGIC);
end;

architecture synth of xorN is
signal x: STD_LOGIC_VECTOR(width-1 downto 0);
begin
    x(0) <= a(0);
    gen: for i in 1 to width-1 generate
    x(i) <= a(i) xor x(i-1);
end generate;

y <= x(width-1);
end;
