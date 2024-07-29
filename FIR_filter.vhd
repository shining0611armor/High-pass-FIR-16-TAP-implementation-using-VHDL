


--###############################################################
---------------------written by mehran tamjidi-------------------
------------------------stu number:40103854----------------------
----------high pass fir filter implimentation (test bench)-------
--###############################################################


--defining liberaries
Library IEEE;  
 USE IEEE.Std_logic_1164.all;    
 USE IEEE.numeric_std.all;  
 Use STD.TEXTIO.all;  
 
 
 
 
  -- Testbench VHDL code for FIR Filter 
  --There is no final model FIR_filter so we just pass it
 entity FIR_filter is  
 
 end FIR_filter; 
 
 
 
 
 
 --defining behaivioral component architecture
 architecture behaivioral of FIR_filter is  
 
 Component FIR16TAPfilter is  
 port(  
         input : IN  signed(7 downto 0);
         output : OUT  signed(21 downto 0);
         clk : IN  std_logic
		);
 end Component; 


--defining signals
		--input   
	signal input : signed(7 downto 0) := (others => '0');
	
		--Outputs
   signal output : signed(21 downto 0) := (others => '0');
	
		--clk
   signal clk : std_logic := '0';
	
		--defining input and outputs
 file my_input : TEXT open READ_MODE is "input.txt";  -- reading inputs by input.txt located at the directory
 file my_output : TEXT open WRITE_MODE is "output.txt"; -- saving result in output.txt in directory
 
 begin  
      --- port mapping
   FIR: FIR16TAPfilter PORT MAP ( 
          clk => clk,
          input => input,
          output => output
        );
		  
           process(clk)  
           begin  
           clk          <= not clk after 5 ns;
           end process;  
			  
     -- reading from input file input.txt to the variable input 
           process(clk)  
			  
           variable my_input_line : LINE;  
			  
           variable input1: integer;  
			  
           begin   
                if rising_edge(clk) then                      
                     readline(my_input, my_input_line);  
                     read(my_input_line,input1);  
                     input <= to_signed(input1, 8);
                end if;  
					 
           end process; 

     --Writing output result to output file 
			  
           process(clk)  
			  
           variable my_output_line : LINE;  
			  
           variable input1: integer;  
			  
           begin  
                if falling_edge(clk) then  
                          write(my_output_line, to_integer(signed(output)));  --calling write function
                          writeline(my_output,my_output_line);  
                end if;  
           end process;   
                                
 end Architecture; 