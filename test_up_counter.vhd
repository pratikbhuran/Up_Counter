----------------------------------------------------------------------------------
--
--	FileName:		test_up_counter.vhd
--	Dependencies:		up_counter.vhd
--												
--	Design Software:	ModelSim PE Student Edition 10.4a
--	Date Created:		21-05-2020
--	
--	Description:		This is the test bench to simulate the up counter.
--						
-----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY test_up_counter IS

END test_up_counter;


ARCHITECTURE test OF test_up_counter IS

--------------Component declaration for Unit Under Test-------------------------
COMPONENT Up_counter IS

GENERIC( g_COUNT_BITS	:INTEGER  := 8						-- change the number of bits for up counter
	);

PORT(clk		:IN STD_LOGIC;						-- clock input
	rst			:IN STD_LOGIC;						-- reset bit 
	Count_o		:OUT STD_LOGIC_VECTOR(g_COUNT_BITS - 1 DOWNTO 0)	-- counter output
	);
	
END COMPONENT;


CONSTANT c_INPUT_CLK	: INTEGER := 125_000_000;		-- clock and periiod can be changed according to the user
CONSTANT c_CLK_PERIOD	: TIME	:= 8 ns;			
CONSTANT c_COUNT_BITS	: INTEGER := 8;				-- count bits should be same in both the codes

----------- input to  Unit Under Test ------------------
SIGNAL s_t_clk		: STD_LOGIC;
SIGNAL s_t_rst		: STD_LOGIC;

----------- output from Unit Under Test ----------------
SIGNAL s_t_Count_o	: STD_LOGIC_VECTOR(c_COUNT_BITS - 1 DOWNTO 0);

BEGIN

dev_to_test:Up_counter
GENERIC MAP(g_COUNT_BITS	=> c_COUNT_BITS)
			
PORT MAP(clk			=> s_t_clk,
	rst   			=> s_t_rst,
	Count_o			=> s_t_Count_o
	);
		
		
clk_process:PROCESS
	BEGIN
		s_t_clk <= '0';
		WAIT FOR c_CLK_PERIOD/2;
		s_t_clk <= '1';
		WAIT FOR c_CLK_PERIOD/2;
	END PROCESS;
	
stim_proc:PROCESS					-- Stimulus process, applies stimulus to input ports of UUT
	BEGIN
		s_t_rst	<= '0';
		WAIT FOR 50 ns;
		s_t_rst	<= '1';
		WAIT FOR 100 ns;
		
		WAIT;
	END PROCESS;
 stop_simulation :process				--Process to generate clock pulses
	begin
		wait for 2.925 us;			--run the simulation for this duration
		std.env.stop;				--call 'stop' procedure 
	end process ;


END Test;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
	
		