library ieee ;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

Entity MSXDOS2_Top is
port (
    CLOCK_24:	  	in std_logic_vector(1 downto 0);		-- 24 MHz
    CLOCK_27:		in std_logic_vector(1 downto 0);		--	27 MHz
    CLOCK_50:		in std_logic;								--	50 MHz
    EXT_CLOCK:		in std_logic;								--	External Clock
                    
    KEY:				in std_logic_vector(3 downto 0);		--	Pushbutton[3:0]
                    
    SW:				in std_logic_vector(9 downto 0);		--	Toggle Switch[9:0]
                    
    HEX0:				out std_logic_vector(6 downto 0);	--	Seven Segment Digit 0
    HEX1:				out std_logic_vector(6 downto 0);	--	Seven Segment Digit 1
    HEX2:				out std_logic_vector(6 downto 0);	--	Seven Segment Digit 2
    HEX3:				out std_logic_vector(6 downto 0);	--	Seven Segment Digit 3
                    
    LEDG:				out std_logic_vector(7 downto 0);	--	LED Green[7:0]
    LEDR:				out std_logic_vector(9 downto 0);	--	LED Red[9:0]
                    
    UART_TXD:		out std_logic;								--	UART Transmitter
    UART_RXD:		in std_logic;								--	UART Receiver
                    
    DRAM_DQ:			inout std_logic_vector(15 downto 0);--	SDRAM Data bus 16 Bits
    DRAM_ADDR:		out std_logic_vector(11 downto 0);	--	SDRAM Address bus 12 Bits
    DRAM_LDQM:		out std_logic;								--	SDRAM Low-byte Data Mask 
    DRAM_UDQM:		out std_logic;								--	SDRAM High-byte Data Mask
    DRAM_WE_N:		out std_logic;								--	SDRAM Write Enable
    DRAM_CAS_N:		out std_logic;								--	SDRAM Column Address Strobe
    DRAM_RAS_N:		out std_logic;								--	SDRAM Row Address Strobe
    DRAM_CS_N:		out std_logic;								--	SDRAM Chip Select
    DRAM_BA_0:		out std_logic;								--	SDRAM Bank Address 0
    DRAM_BA_1:		out std_logic;								--	SDRAM Bank Address 0
    DRAM_CLK:		out std_logic;								--	SDRAM Clock
    DRAM_CKE:		out std_logic;								--	SDRAM Clock Enable
                    
    FL_DQ:			inout std_logic_vector(7 downto 0);	--	FLASH Data bus 8 Bits
    FL_ADDR:			out std_logic_vector(21 downto 0);	--	FLASH Address bus 22 Bits
    FL_WE_N:			out std_logic;								--	FLASH Write Enable
    FL_RST_N:		out std_logic;								--	FLASH Reset
    FL_OE_N:			out std_logic;								--	FLASH Output Enable
    FL_CE_N:			out std_logic;								--	FLASH Chip Enable
                    
    SRAM_DQ:			inout std_logic_vector(15 downto 0);--	SRAM Data bus 16 Bits
    SRAM_ADDR:		out std_logic_vector(17 downto 0);	--	SRAM Address bus 18 Bits
    SRAM_UB_N:		out std_logic;								--	SRAM High-byte Data Mask 
    SRAM_LB_N:		out std_logic;								--	SRAM Low-byte Data Mask 
    SRAM_WE_N:		out std_logic;								--	SRAM Write Enable
    SRAM_CE_N:		out std_logic;								--	SRAM Chip Enable
    SRAM_OE_N:		out std_logic;								--	SRAM Output Enable
    							
    SD_DAT:			inout std_logic;							--	SD Card Data
    SD_DAT3:		inout std_logic;							--	SD Card Data 3
    SD_CMD:			inout std_logic;							--	SD Card Command Signal
    SD_CLK:			out std_logic;								--	SD Card Clock
    							
    I2C_SDAT:		inout std_logic;							--	I2C Data
    I2C_SCLK:		out std_logic;								--	I2C Clock
    							
    PS2_DAT:			in std_logic;							--	PS2 Data
    PS2_CLK:			in std_logic;							--	PS2 Clock
    							
    TDI:				in std_logic;  							-- CPLD -> FPGA (data in)
    TCK:				in std_logic;  							-- CPLD -> FPGA (clk)
    TCS:				in std_logic;  							-- CPLD -> FPGA (CS)
    TDO:				out std_logic; 							-- FPGA -> CPLD (data out)
    							
    VGA_HS:			out std_logic;								--	VGA H_SYNC
    VGA_VS:			out std_logic;								--	VGA V_SYNC
    VGA_R:   		out std_logic_vector(3 downto 0);	--	VGA Red[3:0]
    VGA_G:	 		out std_logic_vector(3 downto 0);	--	VGA Green[3:0]
    VGA_B:   		out std_logic_vector(3 downto 0);	--	VGA Blue[3:0]
                    
    AUD_ADCLRCK:	inout std_logic;							--	Audio CODEC ADC LR Clock
    AUD_ADCDAT:		in std_logic;								--	Audio CODEC ADC Data
    AUD_DACLRCK:	inout std_logic;							--	Audio CODEC DAC LR Clock
    AUD_DACDAT:		out std_logic;								--	Audio CODEC DAC Data
    AUD_BCLK:		inout std_logic;							--	Audio CODEC Bit-Stream Clock
    AUD_XCK:			out std_logic;								--	Audio CODEC Chip Clock
                    
    --GPIO_0:			inout std_logic_vector(35 downto 0);--	GPIO Connection 0
    SD2_CS:	out std_logic;							--	SD Card Data
    SD2_SCK:	out std_logic;							--	SD Card Data 3
    SD2_MOSI: out std_logic;							--	SD Card Command Signal
    SD2_MISO: in std_logic;								--	SD Card Clock
	 
    
    -- MSX Bus
    A:					in std_logic_vector(15 downto 0);
    D:					inout std_logic_vector(7 downto 0);
    RD_n:				in std_logic;
    WR_n:				in std_logic;
    MREQ_n:			in std_logic;
    IORQ_n:			in std_logic;
    SLTSL_n:			in std_logic;
    CS1_n:			in std_logic;
    CS2_n:			in std_logic;
    BUSDIR_n:		out std_logic;
    M1_n:				in std_logic;
    INT_n:			out std_logic;
    MSX_CLK:			in std_logic;
    WAIT_n:			out std_logic); 
end MSXDOS2_Top;

architecture bevioural of MSXDOS2_Top is
	
	component decoder_7seg
	port (
		NUMBER		: in   std_logic_vector(3 downto 0);
		HEX_DISP	: out  std_logic_vector(6 downto 0));
	end component;

	signal HEXDIGIT0		: std_logic_vector(3 downto 0);
	signal HEXDIGIT1		: std_logic_vector(3 downto 0);
	signal HEXDIGIT2		: std_logic_vector(3 downto 0);
	signal HEXDIGIT3		: std_logic_vector(3 downto 0);
	
	signal s_reset: std_logic := '0';
	
	-- signals for cartridge emulation
	signal s_rom_en			: std_logic;
	signal s_io_addr 			: std_logic_vector(7 downto 0);
	signal s_fc					: std_logic_vector(7 downto 0) := "00000011";
	signal s_fd					: std_logic_vector(7 downto 0) := "00000010";
	signal s_fe					: std_logic_vector(7 downto 0) := "00000001";
	signal s_ff					: std_logic_vector(7 downto 0) := "00000000";
	signal s_mreq				: std_logic;
	signal s_iorq_r			: std_logic;
	signal s_iorq_w			: std_logic;
	signal s_iorq_r_reg		: std_logic;
	signal s_iorq_w_reg		: std_logic;
	signal s_mapper_reg_w	: std_logic;

	-- signals for MegaROM emulation
	signal ffff				: std_logic;
	signal slt_exp_n		: std_logic_vector(3 downto 0);
	
	-- Flash ASCII16
	signal rom_bank_wr_s	: std_logic;
	signal rom_bank1_q	: std_logic_vector(2 downto 0);
	signal rom_bank2_q	: std_logic_vector(3 downto 0);
	signal s_flashbase	: std_logic_vector(23 downto 0);
	signal s_rom_d			: std_logic_vector(7 downto 0);
	signal s_rom_a			: std_logic_vector(31 downto 0);
	signal s_d_bus_out	: std_logic;
	
	-- MSX-DOS & Nextor & SDCard
	signal io_cs			: std_logic;
	signal clock_i			: std_logic := '0';
	signal sd_wp_i			: std_logic_vector(1 downto 0);
	signal sd_pres_n_i	: std_logic_vector(1 downto 0);
	signal regs_cs_s		: std_logic;
	
	-- SPI port
	signal spi_cs_s		: std_logic;
	signal sd_chg_q		: std_logic_vector(1 downto 0);
	signal sd_chg_s		: std_logic_vector(1 downto 0);
	signal status_s		: std_logic_vector(7 downto 0);
	signal spi_ctrl_wr_s	: std_logic;
	signal spi_ctrl_rd_s	: std_logic;
	signal sd_sel_q		: std_logic_vector(1 downto 0);
	signal wait_n_s		: std_logic;

	-- Timer
	signal tmr_cnt_q		: std_logic_vector(15 downto 0);	-- clock 25MHz: decrement each 40ns
	signal tmr_wr_s		: std_logic;
	signal tmr_rd_s		: std_logic;
	
	signal s_sd_clk		: std_logic;
	signal s_sd_mosi		: std_logic;
	signal s_sd_miso		: std_logic;
	
begin

	SD_CLK <= s_SD_CLK;
	LEDG <= rom_bank2_q(3 downto 0) & rom_bank1_q(2 downto 0) & '0';
	LEDR <= s_SD_CLK & spi_cs_s & spi_ctrl_rd_s & regs_cs_s & sd_sel_q & not sd_wp_i & not sd_pres_n_i;
	HEXDIGIT0 <= tmr_cnt_q(11 downto 8)	when tmr_rd_s = '1'; --status_s(3 downto 0);
	HEXDIGIT1 <= tmr_cnt_q(15 downto 12)	when tmr_rd_s = '1'; --status_s(7 downto 4);
	HEXDIGIT2 <= s_rom_a(11 downto 8);
	HEXDIGIT3 <= s_rom_a(15 downto 12);
	
	
	BUSDIR_n <= '0' when s_d_bus_out = '1' else '0';
	s_d_bus_out <= '1' when ((s_rom_en = '1') or (s_iorq_r_reg = '1')) else '0';
	s_rom_en <= (not SLTSL_n) when SW(9) ='1' else '0';		-- Will only enable Cart emulation if SW(9) is '1'

	WAIT_n	<= 'Z' when wait_n_s = '1' else '0';
	INT_n  <= 'Z';
	s_reset <= not KEY(0);

	
    -- Auxiliary Generic control signals
	s_iorq_r		<= '1' when RD_n = '0' and  IORQ_n = '0' else '0';
	s_iorq_w		<= '1' when WR_n = '0' and  IORQ_n = '0' else '0';
	
	s_io_addr <= A(7 downto 0);
	s_iorq_r_reg <= '1' when s_iorq_r = '1' and (s_io_addr = x"56" or s_io_addr = x"FC" or s_io_addr = x"FD" or s_io_addr = x"FE" or s_io_addr = x"FF") else '0';
	s_iorq_w_reg <= '1' when s_iorq_w = '1' and (s_io_addr = x"56" or s_io_addr = x"FC" or s_io_addr = x"FD" or s_io_addr = x"FE" or s_io_addr = x"FF") else '0';
	
	-- ROM Signals
	FL_RST_N <= '1';
	FL_OE_N <= RD_n;
	
	-- Bank write - Detect writes in addresses 6000h - 7800h
	-- This works well with Zemmix, but not with Cano V-25 MSX2
	--rom_bank_wr_s <= '1' when s_rom_en = '1' and WR_n = '0' and A(15 downto 13) = "011" and A(11) = '0' else  '0';
	rom_bank_wr_s <= '1' when s_rom_en = '1' and WR_n = '0' and ((A >= x"6000" and A <= x"67FF") OR (A >= x"7000" and A <= x"77FF")) else  '0';
	
	-- Checks address being access. Mirrors memory as per information in https://www.msx.org/wiki/MegaROM_Mappers#ASCII16_.28ASCII.29
	s_rom_a(23 downto 0) <= s_flashbase + (rom_bank1_q(2 downto 0) & A(13 downto 0)) when s_rom_en = '1' and (A(15 downto 14) = "01" or A(15 downto 14) = "11") else		-- Bank1
                           s_flashbase + (rom_bank2_q(3 downto 0) & A(13 downto 0)) when s_rom_en = '1' and (A(15 downto 14) = "10" or A(15 downto 14) = "00") else		-- Bank2:
	                        (others => '-');
	--s_rom_a(16 downto 14) <= rom_bank1_q when s_rom_en = '1' and (A(15 downto 14) = "01" or A(15 downto 14) = "11") else		-- Bank1
   --                         rom_bank2_q(2 downto 0) when s_rom_en = '1' and A(15 downto 14) = "10" else							-- Bank2:
	--                         (others => '-');

	
	-- The FLASHRAM is shared with other cores. This register allows to define a specific address in the flash
	-- where the roms for this cores is written.
	-- ROMs for this core starts at postion 0x0000 and each ROM has 256KB
	s_flashbase <= x"180000" when SW(8) = '0' else
	               x"1CE000";
   FL_CE_N <= -- Excludes SPI range and regs range
		'0'	when A(15 downto 14) = "01" and s_rom_en = '1' and RD_n = '0'	and spi_cs_s = '0' and regs_cs_s = '0'	else
		'0'	when A(15 downto 14) = "10" and s_rom_en = '1' and rom_bank2_q(3) = '1'					else		-- Only if bank > 7
		'1';
   FL_WE_N	<=	'0'	when A(15 downto 14) = "10" and s_rom_en = '1' and WR_n = '0'	else 	'1';
   regs_cs_s <= '1'	when	s_rom_en = '1' and A >= x"7FF0" else '0';
	
	FL_ADDR <= s_rom_a(21 downto 0); -- "0000" & SW(4) & s_rom_a(16 downto 14) & A(13 downto 0);
    
	D <=	status_s	when spi_ctrl_rd_s = '1' else						
		   tmr_cnt_q(15 downto 8)	when tmr_rd_s = '1' else
			FL_DQ when s_rom_en = '1' and RD_n = '0' else  					-- MSX reads data from FLASH RAM - Emulation of Cartridges
	      (others => 'Z'); 

			
	-- SD Card Implementation
	io_cs			<= not IORQ_n and M1_n and SW(9);

	-- Status flags
	-- If no SD card is selected:
	-- b7-b2 : always 0
	-- b1-b0 : Switches status
	--
	-- If any SD card is selected:
	-- b7-b3 : always 0
	-- b2 : 1=Write protecton enabled for SD card slot selected
	-- b1 : 0=SD card present on slot selected
	-- b0 : 1=SD Card on slot selected changed since last read
	sd_pres_n_i <= not SW(1 downto 0);		-- SW1/SW0 is Flag of SDCard Inserted
	sd_wp_i <= not SW(3 downto 2);				-- SW3/SW2 is Write Protect for the SD Cards
	
	--sd_chg_s <= "00";
	
	status_s	<= "000000" & SW(4) & SW(9) when sd_sel_q = "00"	else													-- No SD selected
					"00000" & sd_wp_i(0) & sd_pres_n_i(0) & sd_chg_s(0) when sd_sel_q = "01" else		-- SD 1 selected
					"00000" & sd_wp_i(1) & sd_pres_n_i(1) & sd_chg_s(1) when sd_sel_q = "10" else		-- SD 2 selected
					(others => '-');
	
	spi_ctrl_wr_s <= '1' when s_rom_en = '1' and WR_n = '0' and A = X"7FF0"	else '0';
	spi_ctrl_rd_s <= '1' when s_rom_en = '1' and RD_n = '0' and A = X"7FF0"	else '0';
	
	SD_DAT3 <= not sd_sel_q(0);		-- cs	
	SD_CLK <= s_sd_clk;
	SD_CMD <= s_sd_mosi;

	SD2_CS <= not sd_sel_q(1);	
	SD2_SCK <= s_sd_clk;
	SD2_MOSI <= s_sd_mosi;
	s_sd_miso <= SD_DAT when sd_sel_q(0) = '1' else SD2_MISO;
	
	-- 7B00 = 0111 1011
	-- 7F00 = 0111 1111
	spi_cs_s	<= '1'  when s_rom_en = '1' and rom_bank1_q = "111" and	A >= x"7B00" and A < x"7F00" else
	            '0';
					
	tmr_wr_s <= '1' when s_rom_en = '1' and WR_n = '0' and A = x"7FF1" else '0';
	tmr_rd_s <= '1' when s_rom_en = '1' and RD_n = '0' and A = x"7FF1" else '0';

	-- Disk change FFs
	process (s_reset, spi_ctrl_rd_s, sd_sel_q, sd_pres_n_i(0))
	begin
		if s_reset = '1' then
			sd_chg_q(0) <= '0';
		elsif sd_pres_n_i(0) = '1' then
			sd_chg_q(0) <= '1';
		elsif falling_edge(spi_ctrl_rd_s) then
			if sd_sel_q = "01" then
				sd_chg_q(0) <= '0';
			end if;
		end if;
	end process;

		process (s_reset, spi_ctrl_rd_s, sd_sel_q, sd_pres_n_i(1))
	begin
		if s_reset = '0' then
			sd_chg_q(1) <= '0';
		elsif sd_pres_n_i(1) = '1' then
			sd_chg_q(1) <= '1';
		elsif falling_edge(spi_ctrl_rd_s) then
			if sd_sel_q = "10" then
				sd_chg_q(1) <= '0';
			end if;
		end if;
	end process;
	
	process (s_reset, spi_ctrl_rd_s)
	begin
		if s_reset = '1' then
			sd_chg_s <= (others => '0');
		elsif rising_edge(spi_ctrl_rd_s) then
			sd_chg_s <= sd_chg_q;
		end if;
	end process;

	
	-- Timer
	process (clock_i)
	begin
		if rising_edge(clock_i) then
			if tmr_wr_s = '1' then
				tmr_cnt_q(15 downto 8) <= D;
				tmr_cnt_q( 7 downto 0) <= (others => '1');
			elsif tmr_cnt_q /= 0 then
				tmr_cnt_q <= tmr_cnt_q - 1;
			end if;
		end if;
	end process;

	-- SPI Control register write
	process (s_reset, spi_ctrl_wr_s)
	begin
		if s_reset = '1' then
			sd_sel_q		<= "00";
		elsif falling_edge(spi_ctrl_wr_s) then
			sd_sel_q		<= D(1 downto 0);
		end if;
	end process;
	
	-- Bank write
	i_ROM_Banks:process (s_reset, rom_bank_wr_s)
	begin
		if s_reset = '1' then
			rom_bank1_q		<= (others => '0');
			rom_bank2_q		<= (others => '0');
		elsif falling_edge(rom_bank_wr_s) then
			case A(12) is
				when '0'   =>
					rom_bank1_q		<= D(2 downto 0);
				when '1'   =>
					rom_bank2_q		<= D(3 downto 0);
				when others =>
					null;
			end case;
		end if;
	end process;

	i_clock_i: process(CLOCK_50)
	begin
		if rising_edge(CLOCK_50) then
			clock_i <= not clock_i;
		end if;
	end process;
	   
	DISPHEX0 : decoder_7seg PORT MAP (
			NUMBER		=>	HEXDIGIT0,
			HEX_DISP		=>	HEX0
		);		
	
	DISPHEX1 : decoder_7seg PORT MAP (
			NUMBER		=>	HEXDIGIT1,
			HEX_DISP		=>	HEX1
	);		
	
	DISPHEX2 : decoder_7seg PORT MAP (
			NUMBER		=>	HEXDIGIT2,
			HEX_DISP		=>	HEX2
	);		
	
	DISPHEX3 : decoder_7seg PORT MAP (
			NUMBER		=>	HEXDIGIT3,
			HEX_DISP		=>	HEX3
	);

	-- Porta SPI - https://www.fatalerrors.org/a/sd-card-initialization-and-command-details.html
	portaspi: entity work.spi
	port map (
		clock_i			=> CLOCK_27(0),
		reset_n_i		=> not s_reset,
		-- CPU interface
		cs_i				=> spi_cs_s,
		data_bus_io		=> D,
		wr_n_i			=> WR_n,
		rd_n_i			=> RD_n,
		wait_n_o			=> wait_n_s,
		-- SD card interface
		spi_sclk_o		=> s_sd_clk,
		spi_mosi_o		=> s_sd_mosi, --SD_CMD,
		spi_miso_i		=> s_sd_miso  --SD_DAT 
	);
	
    I2C_SDAT		<= 'Z';
    AUD_ADCLRCK	<= 'Z';
    AUD_DACLRCK	<= 'Z';
    AUD_BCLK		<= 'Z';
    DRAM_DQ		<= (others => 'Z');
    SRAM_DQ		<= (others => 'Z');
    --GPIO_0		<= (others => 'Z');
	
end bevioural;
