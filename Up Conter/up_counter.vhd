-----------------------------------------------------------------------------
--	Filename:	 UP_Counter.vhd
--	Dependancies:	 None
--	Date created:	 20-05-2020
--	Design Software: ModelSim PE Student Edition 10.4a
--	Description:	 An up counter whose bit width can be changed.
--	Creator:	 Pratik Bhuran
-----------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Up_counter IS
GENERIC( g_COUNT_BITS	:INTEGER := 4					-- change the number of bits for up counter
	);

PORT(	clk			:IN STD_LOGIC;						-- clock input
	rst			:IN STD_LOGIC;						-- reset bit 
	Count_o			:OUT STD_LOGIC_VECTOR(g_COUNT_BITS - 1 DOWNTO 0)	-- counter output
	);
END Up_counter;
	
ARCHITECTURE behavioral OF Up_counter IS

SIGNAL COUNT_MAX	: INTEGER := 2**Count_o'LENGTH;
SIGNAL s_count		: INTEGER RANGE 0 TO COUNT_MAX - 1 := 0;

BEGIN
Count_o <= STD_LOGIC_VECTOR(TO_UNSIGNED(s_count, Count_o'LENGTH));		-- assign signal value to output as output cannot be read

	PROCESS( clk, rst, COUNT_MAX, s_count)					-- sensitivity list of process
		BEGIN
			
			IF (rst = '0') THEN					-- when reset condition is asserted
				s_count <= (0 * s_count);			-- clear the output
				
			ELSIF(clk'EVENT AND clk ='1') THEN			-- on rising edge of clock
				IF(s_count = COUNT_MAX - 1) THEN		-- when count reaches maximum value 
					s_count <= (0 * s_count);		-- reset count
				ELSE
					s_count <= s_count + 1;			-- increment count by 1 when not equal to max value
				END IF;
			END IF;
		
	END PROCESS;
	
END behavioral;



