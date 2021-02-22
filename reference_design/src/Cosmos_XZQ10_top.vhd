---------------------------------------------------------------------------------------------------
-- Copyright (c) 2021 by Enclustra GmbH, Switzerland.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of
-- this hardware, software, firmware, and associated documentation files (the
-- "Product"), to deal in the Product without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute,
-- sublicense, and/or sell copies of the Product, and to permit persons to whom the
-- Product is furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Product.
--
-- THE PRODUCT IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
-- INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
-- PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
-- HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
-- OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- PRODUCT OR THE USE OR OTHER DEALINGS IN THE PRODUCT.
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- libraries
---------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

---------------------------------------------------------------------------------------------------
-- entity declaration
---------------------------------------------------------------------------------------------------
entity Cosmos_XZQ10_top is
  
  port (
    -- PS MIO Pins
    FIXED_IO_mio                   : inout  std_logic_vector(53 downto 0);
    FIXED_IO_ddr_vrn               : inout  std_logic;
    FIXED_IO_ddr_vrp               : inout  std_logic;
    FIXED_IO_ps_srstb              : inout  std_logic;
    FIXED_IO_ps_clk                : inout  std_logic;
    FIXED_IO_ps_porb               : inout  std_logic;
    DDR_cas_n                      : inout  std_logic;
    DDR_cke                        : inout  std_logic;
    DDR_ck_n                       : inout  std_logic;
    DDR_ck_p                       : inout  std_logic;
    DDR_cs_n                       : inout  std_logic;
    DDR_reset_n                    : inout  std_logic;
    DDR_odt                        : inout  std_logic;
    DDR_ras_n                      : inout  std_logic;
    DDR_we_n                       : inout  std_logic;
    DDR_ba                         : inout  std_logic_vector(2 downto 0);
    DDR_addr                       : inout  std_logic_vector(14 downto 0);
    DDR_dm                         : inout  std_logic_vector(3 downto 0);
    DDR_dq                         : inout  std_logic_vector(31 downto 0);
    DDR_dqs_n                      : inout  std_logic_vector(3 downto 0);
    DDR_dqs_p                      : inout  std_logic_vector(3 downto 0);
    
    -- FMC0
    FMC0_HA02_FMC1_LA30_N          : inout   std_logic;
    FMC0_HA02_FMC1_LA30_P          : inout   std_logic;
    FMC0_HA03_FMC1_LA32_N          : inout   std_logic;
    FMC0_HA03_FMC1_LA32_P          : inout   std_logic;
    FMC0_HA04_FMC1_LA27_N          : inout   std_logic;
    FMC0_HA04_FMC1_LA27_P          : inout   std_logic;
    FMC0_HA05_FMC1_LA33_N          : inout   std_logic;
    FMC0_HA05_FMC1_LA33_P          : inout   std_logic;
    FMC0_HA06_FMC1_LA24_N          : inout   std_logic;
    FMC0_HA06_FMC1_LA24_P          : inout   std_logic;
    FMC0_HA07_FMC1_LA28_N          : inout   std_logic;
    FMC0_HA07_FMC1_LA28_P          : inout   std_logic;
    FMC0_HA08_FMC1_LA26_N          : inout   std_logic;
    FMC0_HA08_FMC1_LA26_P          : inout   std_logic;
    FMC0_HA09_FMC1_LA31_N          : inout   std_logic;
    FMC0_HA09_FMC1_LA31_P          : inout   std_logic;
    FMC0_HA10_FMC1_LA22_N          : inout   std_logic;
    FMC0_HA10_FMC1_LA22_P          : inout   std_logic;
    FMC0_HA11_FMC1_LA21_N          : inout   std_logic;
    FMC0_HA11_FMC1_LA21_P          : inout   std_logic;
    FMC0_HA12_FMC1_LA23_N          : inout   std_logic;
    FMC0_HA12_FMC1_LA23_P          : inout   std_logic;
    FMC0_HA13_FMC1_LA29_N          : inout   std_logic;
    FMC0_HA13_FMC1_LA29_P          : inout   std_logic;
    FMC0_HA14_FMC1_LA19_N          : inout   std_logic;
    FMC0_HA14_FMC1_LA19_P          : inout   std_logic;
    FMC0_HA15_FMC1_LA20_N          : inout   std_logic;
    FMC0_HA15_FMC1_LA20_P          : inout   std_logic;
    FMC0_HA16_FMC1_LA25_N          : inout   std_logic;
    FMC0_HA16_FMC1_LA25_P          : inout   std_logic;
    FMC0_HA18_N                    : inout   std_logic;
    FMC0_HA18_P                    : inout   std_logic;
    FMC0_HA19_N                    : inout   std_logic;
    FMC0_HA19_P                    : inout   std_logic;
    FMC0_HA20_N                    : inout   std_logic;
    FMC0_HA20_P                    : inout   std_logic;
    FMC0_HA21_N                    : inout   std_logic;
    FMC0_HA21_P                    : inout   std_logic;
    FMC0_HA22_N                    : inout   std_logic;
    FMC0_HA22_P                    : inout   std_logic;
    FMC0_HA23_N                    : inout   std_logic;
    FMC0_HA23_P                    : inout   std_logic;
    FMC0_HB01_FMC1_LA15_N          : inout   std_logic;
    FMC0_HB01_FMC1_LA15_P          : inout   std_logic;
    FMC0_HB02_FMC1_LA14_N          : inout   std_logic;
    FMC0_HB02_FMC1_LA14_P          : inout   std_logic;
    FMC0_HB03_FMC1_LA16_N          : inout   std_logic;
    FMC0_HB03_FMC1_LA16_P          : inout   std_logic;
    FMC0_HB04_FMC1_LA09_N          : inout   std_logic;
    FMC0_HB04_FMC1_LA09_P          : inout   std_logic;
    FMC0_HB05_FMC1_LA13_N          : inout   std_logic;
    FMC0_HB05_FMC1_LA13_P          : inout   std_logic;
    FMC0_HB07_FMC1_LA11_N          : inout   std_logic;
    FMC0_HB07_FMC1_LA11_P          : inout   std_logic;
    FMC0_HB08_FMC1_LA10_N          : inout   std_logic;
    FMC0_HB08_FMC1_LA10_P          : inout   std_logic;
    FMC0_HB09_FMC1_LA12_N          : inout   std_logic;
    FMC0_HB09_FMC1_LA12_P          : inout   std_logic;
    FMC0_HB10_FMC1_LA04_N          : inout   std_logic;
    FMC0_HB10_FMC1_LA04_P          : inout   std_logic;
    FMC0_HB11_FMC1_LA07_N          : inout   std_logic;
    FMC0_HB11_FMC1_LA07_P          : inout   std_logic;
    FMC0_HB12_FMC1_LA05_N          : inout   std_logic;
    FMC0_HB12_FMC1_LA05_P          : inout   std_logic;
    FMC0_HB13_FMC1_LA08_N          : inout   std_logic;
    FMC0_HB13_FMC1_LA08_P          : inout   std_logic;
    FMC0_HB14_FMC1_LA03_N          : inout   std_logic;
    FMC0_HB14_FMC1_LA03_P          : inout   std_logic;
    FMC0_HB15_FMC1_LA02_N          : inout   std_logic;
    FMC0_HB15_FMC1_LA02_P          : inout   std_logic;
    FMC0_HB16_FMC1_LA06_N          : inout   std_logic;
    FMC0_HB16_FMC1_LA06_P          : inout   std_logic;
    FMC0_HB18_N                    : inout   std_logic;
    FMC0_HB18_P                    : inout   std_logic;
    FMC0_HB19_N                    : inout   std_logic;
    FMC0_HB19_P                    : inout   std_logic;
    FMC0_HB20_N                    : inout   std_logic;
    FMC0_HB20_P                    : inout   std_logic;
    FMC0_HB21_N                    : inout   std_logic;
    FMC0_HB21_P                    : inout   std_logic;
    FMC0_LA02_N                    : inout   std_logic;
    FMC0_LA02_P                    : inout   std_logic;
    FMC0_LA03_N                    : inout   std_logic;
    FMC0_LA03_P                    : inout   std_logic;
    FMC0_LA04_N                    : inout   std_logic;
    FMC0_LA04_P                    : inout   std_logic;
    FMC0_LA05_N                    : inout   std_logic;
    FMC0_LA05_P                    : inout   std_logic;
    FMC0_LA06_N                    : inout   std_logic;
    FMC0_LA06_P                    : inout   std_logic;
    FMC0_LA07_N                    : inout   std_logic;
    FMC0_LA07_P                    : inout   std_logic;
    FMC0_LA08_N                    : inout   std_logic;
    FMC0_LA08_P                    : inout   std_logic;
    FMC0_LA09_N                    : inout   std_logic;
    FMC0_LA09_P                    : inout   std_logic;
    FMC0_LA10_N                    : inout   std_logic;
    FMC0_LA10_P                    : inout   std_logic;
    FMC0_LA11_N                    : inout   std_logic;
    FMC0_LA11_P                    : inout   std_logic;
    FMC0_LA12_N                    : inout   std_logic;
    FMC0_LA12_P                    : inout   std_logic;
    FMC0_LA13_N                    : inout   std_logic;
    FMC0_LA13_P                    : inout   std_logic;
    FMC0_LA14_N                    : inout   std_logic;
    FMC0_LA14_P                    : inout   std_logic;
    FMC0_LA15_N                    : inout   std_logic;
    FMC0_LA15_P                    : inout   std_logic;
    FMC0_LA16_N                    : inout   std_logic;
    FMC0_LA16_P                    : inout   std_logic;
    FMC0_LA19_N                    : inout   std_logic;
    FMC0_LA19_P                    : inout   std_logic;
    FMC0_LA20_N                    : inout   std_logic;
    FMC0_LA20_P                    : inout   std_logic;
    FMC0_LA21_N                    : inout   std_logic;
    FMC0_LA21_P                    : inout   std_logic;
    FMC0_LA22_N                    : inout   std_logic;
    FMC0_LA22_P                    : inout   std_logic;
    FMC0_LA23_N                    : inout   std_logic;
    FMC0_LA23_P                    : inout   std_logic;
    FMC0_LA24_N                    : inout   std_logic;
    FMC0_LA24_P                    : inout   std_logic;
    FMC0_LA25_N                    : inout   std_logic;
    FMC0_LA25_P                    : inout   std_logic;
    FMC0_LA26_N                    : inout   std_logic;
    FMC0_LA26_P                    : inout   std_logic;
    FMC0_LA27_N                    : inout   std_logic;
    FMC0_LA27_P                    : inout   std_logic;
    FMC0_LA28_N                    : inout   std_logic;
    FMC0_LA28_P                    : inout   std_logic;
    FMC0_LA29_N                    : inout   std_logic;
    FMC0_LA29_P                    : inout   std_logic;
    FMC0_LA30_N                    : inout   std_logic;
    FMC0_LA30_P                    : inout   std_logic;
    FMC0_LA31_N                    : inout   std_logic;
    FMC0_LA31_P                    : inout   std_logic;
    FMC0_LA32_N                    : inout   std_logic;
    FMC0_LA32_P                    : inout   std_logic;
    FMC0_LA33_N                    : inout   std_logic;
    FMC0_LA33_P                    : inout   std_logic;
    FMC0_HA17_CC_N                 : inout   std_logic;
    FMC0_HA17_CC_P                 : inout   std_logic;
    FMC0_HB00_FMC1_LA00_CC_N       : inout   std_logic;
    FMC0_HB00_FMC1_LA00_CC_P       : inout   std_logic;
    FMC0_HB06_FMC1_LA01_CC_N       : inout   std_logic;
    FMC0_HB06_FMC1_LA01_CC_P       : inout   std_logic;
    FMC0_HB17_CC_N                 : inout   std_logic;
    FMC0_HB17_CC_P                 : inout   std_logic;
    FMC0_LA00_CC_N                 : inout   std_logic;
    FMC0_LA00_CC_P                 : inout   std_logic;
    FMC0_LA01_CC_N                 : inout   std_logic;
    FMC0_LA01_CC_P                 : inout   std_logic;
    FMC0_LA17_CC_N                 : inout   std_logic;
    FMC0_LA17_CC_P                 : inout   std_logic;
    FMC0_LA18_CC_N                 : inout   std_logic;
    FMC0_LA18_CC_P                 : inout   std_logic;
    FMC0_CLK0_M2C_N                : inout   std_logic;
    FMC0_CLK0_M2C_P                : inout   std_logic;
    FMC0_CLK1_M2C_N                : inout   std_logic;
    FMC0_CLK1_M2C_P                : inout   std_logic;
    
    -- I2C_PL
    I2C_SCL_PL                     : inout   std_logic;
    I2C_SDA_PL                     : inout   std_logic;
    
    -- LED
    DIO_LED_N                      : out     std_logic;
    DII_LED_N                      : out     std_logic;
    
    -- PL_200_MHz_Oscillator
    CLK200_N                       : in      std_logic;
    CLK200_P                       : in      std_logic;
    
    -- PL_DDR3_Memory
    DDR3PL_WE_N                    : out     std_logic;
    DDR3PL_CAS_N                   : out     std_logic;
    DDR3PL_RAS_N                   : out     std_logic;
    DDR3PL_RST_N                   : out     std_logic;
    DDR3PL_BA                      : out     std_logic_vector(2 downto 0);
    DDR3PL_DQ                      : inout   std_logic_vector(15 downto 0);
    DDR3PL_A                       : out     std_logic_vector(13 downto 0);
    DDR3PL_CKE                     : out     std_logic_vector(0 downto 0);
    DDR3PL_CK_N                    : out     std_logic_vector(0 downto 0);
    DDR3PL_CK_P                    : out     std_logic_vector(0 downto 0);
    DDR3PL_ODT                     : out     std_logic_vector(0 downto 0);
    DDR3PL_DM                      : inout   std_logic_vector(1 downto 0);
    DDR3PL_DQS_N                   : inout   std_logic_vector(1 downto 0);
    DDR3PL_DQS_P                   : inout   std_logic_vector(1 downto 0);
    
    -- PL_Fast_Ethernet_1
    ETH1_CLK                       : out     std_logic;
    ETH1_MDC                       : out     std_logic;
    ETH1_MDIO                      : inout   std_logic;
    ETH1_RESET_N                   : out     std_logic;
    ETH1_INT_N_PWDN_N              : inout   std_logic;
    
    -- PL_Fast_Ethernet_1A
    ETH1A_RXER                     : in      std_logic;
    ETH1A_TXEN                     : out     std_logic;
    ETH1A_CRSDV                    : in      std_logic;
    ETH1A_RXD                      : in      std_logic_vector(1 downto 0);
    ETH1A_CLK                      : in      std_logic_vector(3 downto 3);
    ETH1A_TXD                      : out     std_logic_vector(1 downto 0);
    
    -- PL_Fast_Ethernet_1B
    ETH1B_RXER                     : in      std_logic;
    ETH1B_TXEN                     : out     std_logic;
    ETH1B_CRSDV                    : in      std_logic;
    ETH1B_RXD                      : in      std_logic_vector(1 downto 0);
    ETH1B_CLK                      : in      std_logic_vector(3 downto 3);
    ETH1B_TXD                      : out     std_logic_vector(1 downto 0)
  );
end Cosmos_XZQ10_top;

architecture rtl of Cosmos_XZQ10_top is

  ---------------------------------------------------------------------------------------------------
  -- component declarations
  ---------------------------------------------------------------------------------------------------
  component Cosmos_XZQ10 is
    port (
      Clk100              : out    std_logic;
      Clk50               : out    std_logic;
      Rst_N               : out    std_logic;
      IRQ0                : in     std_logic;
      IRQ1                : in     std_logic;
      FIXED_IO_mio        : inout  std_logic_vector(53 downto 0);
      FIXED_IO_ddr_vrn    : inout  std_logic;
      FIXED_IO_ddr_vrp    : inout  std_logic;
      FIXED_IO_ps_srstb   : inout  std_logic;
      FIXED_IO_ps_clk     : inout  std_logic;
      FIXED_IO_ps_porb    : inout  std_logic;
      DDR_cas_n           : inout  std_logic;
      DDR_cke             : inout  std_logic;
      DDR_ck_n            : inout  std_logic;
      DDR_ck_p            : inout  std_logic;
      DDR_cs_n            : inout  std_logic;
      DDR_reset_n         : inout  std_logic;
      DDR_odt             : inout  std_logic;
      DDR_ras_n           : inout  std_logic;
      DDR_we_n            : inout  std_logic;
      DDR_ba              : inout  std_logic_vector(2 downto 0);
      DDR_addr            : inout  std_logic_vector(14 downto 0);
      DDR_dm              : inout  std_logic_vector(3 downto 0);
      DDR_dq              : inout  std_logic_vector(31 downto 0);
      DDR_dqs_n           : inout  std_logic_vector(3 downto 0);
      DDR_dqs_p           : inout  std_logic_vector(3 downto 0);
      IIC_sda_i           : in     std_logic;
      IIC_sda_o           : out    std_logic;
      IIC_sda_t           : out    std_logic;
      IIC_scl_i           : in     std_logic;
      IIC_scl_o           : out    std_logic;
      IIC_scl_t           : out    std_logic;
      LED_N               : out    std_logic_vector(0 downto 0);
      SYS_CLK_clk_p       : in     std_logic;
      SYS_CLK_clk_n       : in     std_logic;
      DDR3_dq             : inout  std_logic_vector(15 downto 0);
      DDR3_dqs_p          : inout  std_logic_vector(1 downto 0);
      DDR3_dqs_n          : inout  std_logic_vector(1 downto 0);
      DDR3_addr           : out    std_logic_vector(13 downto 0);
      DDR3_ba             : out    std_logic_vector(2 downto 0);
      DDR3_ras_n          : out    std_logic;
      DDR3_cas_n          : out    std_logic;
      DDR3_we_n           : out    std_logic;
      DDR3_reset_n        : out    std_logic;
      DDR3_ck_p           : out    std_logic_vector(0 downto 0);
      DDR3_ck_n           : out    std_logic_vector(0 downto 0);
      DDR3_cke            : out    std_logic_vector(0 downto 0);
      DDR3_dm             : out    std_logic_vector(1 downto 0);
      DDR3_odt            : out    std_logic_vector(0 downto 0)
    );
    
  end component Cosmos_XZQ10;

  ---------------------------------------------------------------------------------------------------
  -- signal declarations
  ---------------------------------------------------------------------------------------------------
  signal Clk100           : std_logic;
  signal Clk50            : std_logic;
  signal Rst_N            : std_logic;
  signal IRQ0             : std_logic;
  signal IRQ1             : std_logic;
  signal IIC_sda_i        : std_logic;
  signal IIC_sda_o        : std_logic;
  signal IIC_sda_t        : std_logic;
  signal IIC_scl_i        : std_logic;
  signal IIC_scl_o        : std_logic;
  signal IIC_scl_t        : std_logic;
  signal LED_N            : std_logic_vector(0 downto 0);
  signal LedCount         : unsigned(23 downto 0);

begin
  
  ---------------------------------------------------------------------------------------------------
  -- processor system instance
  ---------------------------------------------------------------------------------------------------
  Cosmos_XZQ10_i: component Cosmos_XZQ10
    port map (
      Clk100               => Clk100,
      Clk50                => Clk50,
      Rst_N                => Rst_N,
      IRQ0                 => IRQ0,
      IRQ1                 => 'Z',
      FIXED_IO_mio         => FIXED_IO_mio,
      FIXED_IO_ddr_vrn     => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp     => FIXED_IO_ddr_vrp,
      FIXED_IO_ps_srstb    => FIXED_IO_ps_srstb,
      FIXED_IO_ps_clk      => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb     => FIXED_IO_ps_porb,
      DDR_cas_n            => DDR_cas_n,
      DDR_cke              => DDR_cke,
      DDR_ck_n             => DDR_ck_n,
      DDR_ck_p             => DDR_ck_p,
      DDR_cs_n             => DDR_cs_n,
      DDR_reset_n          => DDR_reset_n,
      DDR_odt              => DDR_odt,
      DDR_ras_n            => DDR_ras_n,
      DDR_we_n             => DDR_we_n,
      DDR_ba               => DDR_ba,
      DDR_addr             => DDR_addr,
      DDR_dm               => DDR_dm,
      DDR_dq               => DDR_dq,
      DDR_dqs_n            => DDR_dqs_n,
      DDR_dqs_p            => DDR_dqs_p,
      IIC_sda_i            => IIC_sda_i,
      IIC_sda_o            => IIC_sda_o,
      IIC_sda_t            => IIC_sda_t,
      IIC_scl_i            => IIC_scl_i,
      IIC_scl_o            => IIC_scl_o,
      IIC_scl_t            => IIC_scl_t,
      LED_N                => LED_N,
      SYS_CLK_clk_p        => CLK200_P,
      SYS_CLK_clk_n        => CLK200_N,
      DDR3_dq              => DDR3PL_DQ,
      DDR3_dqs_p           => DDR3PL_DQS_P,
      DDR3_dqs_n           => DDR3PL_DQS_N,
      DDR3_addr            => DDR3PL_A,
      DDR3_ba              => DDR3PL_BA,
      DDR3_ras_n           => DDR3PL_RAS_N,
      DDR3_cas_n           => DDR3PL_CAS_N,
      DDR3_we_n            => DDR3PL_WE_N,
      DDR3_reset_n         => DDR3PL_RST_N,
      DDR3_ck_p            => DDR3PL_CK_P,
      DDR3_ck_n            => DDR3PL_CK_N,
      DDR3_cke             => DDR3PL_CKE,
      DDR3_dm              => DDR3PL_DM,
      DDR3_odt             => DDR3PL_ODT
    );
  
  I2C_SDA_PL <= IIC_sda_o when IIC_sda_t = '0' else 'Z';
  IIC_sda_i <= I2C_SDA_PL;
  I2C_SCL_PL <= IIC_scl_o when IIC_scl_t = '0' else 'Z';
  IIC_scl_i <= I2C_SCL_PL;
  process (Clk50)
  begin
    if rising_edge (Clk50) then
      if Rst_N = '0' then
        LedCount    <= (others => '0');
      else
        LedCount    <= LedCount + 1;
      end if;
    end if;
  end process;
  DIO_LED_N <= '0' when LedCount(LedCount'high) = '0' else 'Z';
  DII_LED_N <= '0' when LED_N(0) = '0' else 'Z';
  ETH1_CLK <= Clk50;

end rtl;
