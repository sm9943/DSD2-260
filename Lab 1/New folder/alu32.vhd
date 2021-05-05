----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.02.2021 19:10:54
-- Design Name: 
-- Module Name: alu32 - Behavioral
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
library IEEE ;
use IEEE . STD_LOGIC_1164 .ALL ;
use IEEE . NUMERIC_STD .ALL;
entity alu32 is
GENERIC (N : INTEGER := 32); --bit width
PORT (
A : IN std_logic_vector (N -1 downto 0);
B : IN std_logic_vector (N -1 downto 0);
OP : IN std_logic_vector (3 downto 0);
Y : OUT std_logic_vector (N -1 downto 0)
);
end alu32 ;
architecture structural of alu32 is

-- Declare the and gate component
Component and_gate is
GENERIC ( N : INTEGER); -- bit width
PORT (
A, B : IN std_logic_vector (N -1 downto 0);
Y : OUT std_logic_vector (N -1 downto 0)
);
end Component ;

-- Declare the or gate component
Component or_gate is
GENERIC ( N : INTEGER); -- bit width
PORT (
A, B : IN std_logic_vector (N -1 downto 0);
Y : OUT std_logic_vector (N -1 downto 0)
);
end Component ;

-- Declare the xor gate component
Component xor_gate is
GENERIC ( N : INTEGER); -- bit width
PORT (
A, B : IN std_logic_vector (N -1 downto 0);
Y : OUT std_logic_vector (N -1 downto 0)
);
end Component ;


-- Declare the shift left component
Component sllN is
GENERIC (N : INTEGER); --bit width
PORT (
A : IN std_logic_vector (N -1 downto 0);
SHIFT_AMT : IN std_logic_vector (N -1 downto 0);
Y : OUT std_logic_vector (N -1 downto 0)
);
end Component ;

-- Declare the shift right logical component
Component srlN is
GENERIC (N : INTEGER); --bit width
PORT (
A : IN std_logic_vector (N -1 downto 0);
SHIFT_AMT : IN std_logic_vector (N -1 downto 0);
Y : OUT std_logic_vector (N -1 downto 0)
);
end Component ;

-- Declare the shift right arithemtic component
Component sraN is
GENERIC (N : INTEGER); --bit width
PORT (
A : IN std_logic_vector (N -1 downto 0);
SHIFT_AMT : IN std_logic_vector (N -1 downto 0);
Y : OUT std_logic_vector (N -1 downto 0)
);
end Component ;

signal and_result : std_logic_vector (N-1 downto 0);
signal or_result  : std_logic_vector (N-1 downto 0);
signal xor_result  : std_logic_vector (N-1 downto 0);
signal sll_result : std_logic_vector (N-1 downto 0);
signal sra_result  : std_logic_vector (N-1 downto 0);
signal srl_result  : std_logic_vector (N-1 downto 0);

begin
-- Instantiate the and gate
and_comp : and_gate
generic map ( N => N)
port map ( A => A, B=>B, Y => and_result );

-- Instantiate the and gate
or_comp : or_gate
generic map ( N => N)
port map ( A => A, B=>B, Y => or_result );

-- Instantiate the and gate
xor_comp : xor_gate
generic map ( N => N)
port map ( A => A, B=>B, Y => xor_result );

-- Instantiate the SLL unit
sll_comp : sllN
generic map ( N => N )
port map ( A=> A, SHIFT_AMT => B, Y => sll_result );

-- Instantiate the SRL unit
srl_comp : srlN
generic map ( N => N)
port map ( A=> A, SHIFT_AMT => B, Y => srl_result );

-- Instantiate the SRA unit
sra_comp : sraN
generic map ( N => N )
port map ( A=> A, SHIFT_AMT => B, Y => sra_result );

-- Use OP to control which operation to show / perform
with OP select
            Y <= and_result when "1010",
                 or_result  when "1000",
                 xor_result when "1011",
                 sll_result when "1100",
                 srl_result when "1101",
                 sra_result when others;
                 
end structural;