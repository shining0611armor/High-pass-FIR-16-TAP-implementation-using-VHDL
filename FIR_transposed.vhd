library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

entity FIR_Transposed is
	Port (
				clk		: in STD_LOGIC;
				input  : in signed  (7 downto 0);
				output : out signed (32 downto 0)
			);
end FIR_Transposed;

architecture Behavioral of FIR_Transposed is

type ic is array (0 to  7) of signed(9  downto 0);

type id is array (0 to 14) of signed(31 downto 0);

type ix 	 is array (0 to 15) of signed(17 downto 0);

type idd is array (0 to 14) of signed(31 downto 0);

constant c 	: ic := (b"1111000111",b"0000111101",b"0001000010",b"0001000111",b"0001000111",b"0000001011",b"1110011111",b"1000000010");
signal x   		: ix;

signal d 		: id;

signal dd 		: idd;

begin
	
	Shift:
	process(clk)
	begin 	
		if rising_edge(clk) then 
			for j in 14 downto 0 loop
				dd(j) <= d(j);
			end loop;
		end if;
	end process;
	
	M:
	process(clk)
	begin 	
		if falling_edge(clk) then 
			for j in 0 to 7 loop
				x(j) <= c(j) * input;
				x(15-j) <= c(j) * input;
			end loop;
		end if;
	end process;
	
	A:
	process(clk)
	begin 	
		if falling_edge(clk) then 
			for j in 1 to 14 loop
				d(j) <= dd(j-1) - resize(x(j),32);
			end loop;
			d(0) <= resize(x(0),32);
		end if;
	end process;
	
	S:
	process(clk)
	begin 	
		if falling_edge(clk) then 
			output <= dd(14) - resize(x(15),33);
		end if;
	end process;
end Behavioral;

