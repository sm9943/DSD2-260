----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.02.2021 19:10:54
-- Design Name: 
-- Module Name: xor - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity xor_gate is
GENERIC (N : INTEGER); --bit width
 port (A, B: in std_logic_vector(N-1 downto 0);
        Y : out std_logic_vector(N-1 downto 0));
end;

architecture oh_behave of xor_gate is begin
  Y <= A XOR B;
end;