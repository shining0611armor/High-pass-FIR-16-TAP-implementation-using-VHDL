
--###############################################################
---------------------written by mehran tamjidi-------------------
------------------------stu number:40103854----------------------
----------high pass fir filter implimentation (test bench)-------
--###############################################################



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

entity FIR16TAPfilter is

	Port (
	
				clk		: in STD_LOGIC;
				
				input  : in signed  (7 downto 0);
				
				output : out signed (21 downto 0)
				
			);
			
end FIR16TAPfilter;

architecture Behavioral of FIR16TAPfilter is

type M	 is array (0 to  7) of signed(18 downto 0);

type T0  is array (0 to  3) of signed(19 downto 0);

type T1  is array (0 to  1) of signed(20 downto 0);

type D  is array (0 to 15) of signed(7  downto 0);

type C is array (0 to  7) of signed(9  downto 0);


signal mxc   		: M;

signal Sum0  		: T0;

signal Sum1  		: T1;

constant Coeff 	: C := (b"1111000111",b"0000111101",b"0001000010",b"0001000111",b"0001000111",b"0000001011",b"1110011111",b"1000000010");
--constant coeff are the symmetric filter coefficient which are converted to binary via MATLAB 
signal Data  		: D;





--starting sequential calculation
begin

	Shift:
	process(clk)
	begin 	
		if rising_edge(clk) then 
			for k in 15 downto 0 loop
				if k = 0 then
					Data(0) <= input;
				else
					Data(k) <= Data(k-1);
				end if;      
			end loop;
		end if;
	end process;
	
	
	
	
	
	
	
	process(clk)
	begin 	
		if rising_edge(clk) then 
			for k in 0 to 7 loop
				mxc(k) <= Coeff(k) * (resize(Data(k),9) - resize(Data(15-k),9)); --using minus between the coefficients of the filter
					-- because the filter is antisymmetric and we want to using the symmetric properties as the question wanted
			end loop;
		for k in 0 to 3 loop
				Sum0(k) <= resize(mxc(2*k),20) + resize(mxc((2*k)+1),20);
			end loop;
		for k in 0 to 1 loop
				Sum1(k) <= resize(Sum0(2*k),21) + resize(Sum0((2*k)+1),21);
			end loop;
		end if;
	end process;
	output <= resize(Sum1(0),22) + resize(Sum1(1),22);
end Behavioral;

--now the filter is ready :)

