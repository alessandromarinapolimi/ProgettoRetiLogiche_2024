-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Sat Jan 25 22:12:48 2025
-- Host        : Laptop-ASH running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/ultro/OneDrive/ALTRO/Desktop/ProgettoRetiLogiche_2024/FIXEDPOINTSIN_/FIXEDPOINTSIN_.sim/sim_1/impl/func/xsim/TB_SINE_func_impl.vhd
-- Design      : SINE_CALCULATOR
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a200tsbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SINE_CALCULATOR is
  port (
    CLK : in STD_LOGIC;
    RESET : in STD_LOGIC;
    ANGLE : in STD_LOGIC_VECTOR ( 8 downto 0 );
    SINE : out STD_LOGIC_VECTOR ( 9 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of SINE_CALCULATOR : entity is true;
  attribute \DesignAttr:ENABLE_AIE_NETLIST_VIEW\ : boolean;
  attribute \DesignAttr:ENABLE_AIE_NETLIST_VIEW\ of SINE_CALCULATOR : entity is std.standard.true;
  attribute \DesignAttr:ENABLE_NOC_NETLIST_VIEW\ : boolean;
  attribute \DesignAttr:ENABLE_NOC_NETLIST_VIEW\ of SINE_CALCULATOR : entity is std.standard.true;
  attribute ECO_CHECKSUM : string;
  attribute ECO_CHECKSUM of SINE_CALCULATOR : entity is "d9774654";
  attribute M : integer;
  attribute M of SINE_CALCULATOR : entity is 9;
  attribute N : integer;
  attribute N of SINE_CALCULATOR : entity is 10;
end SINE_CALCULATOR;

architecture STRUCTURE of SINE_CALCULATOR is
  signal ANGLE_IBUF : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal CLK_IBUF : STD_LOGIC;
  signal CLK_IBUF_BUFG : STD_LOGIC;
  signal NEG_FLAG : STD_LOGIC;
  signal NEG_FLAG_i_1_n_0 : STD_LOGIC;
  signal NEG_FLAG_i_2_n_0 : STD_LOGIC;
  signal NEG_FLAG_i_3_n_0 : STD_LOGIC;
  signal RESET_IBUF : STD_LOGIC;
  signal \SINE[0]_i_10_n_0\ : STD_LOGIC;
  signal \SINE[0]_i_11_n_0\ : STD_LOGIC;
  signal \SINE[0]_i_2_n_0\ : STD_LOGIC;
  signal \SINE[0]_i_6_n_0\ : STD_LOGIC;
  signal \SINE[0]_i_7_n_0\ : STD_LOGIC;
  signal \SINE[0]_i_8_n_0\ : STD_LOGIC;
  signal \SINE[0]_i_9_n_0\ : STD_LOGIC;
  signal \SINE[1]_i_12_n_0\ : STD_LOGIC;
  signal \SINE[1]_i_13_n_0\ : STD_LOGIC;
  signal \SINE[1]_i_14_n_0\ : STD_LOGIC;
  signal \SINE[1]_i_15_n_0\ : STD_LOGIC;
  signal \SINE[1]_i_16_n_0\ : STD_LOGIC;
  signal \SINE[1]_i_17_n_0\ : STD_LOGIC;
  signal \SINE[1]_i_18_n_0\ : STD_LOGIC;
  signal \SINE[1]_i_19_n_0\ : STD_LOGIC;
  signal \SINE[1]_i_20_n_0\ : STD_LOGIC;
  signal \SINE[1]_i_21_n_0\ : STD_LOGIC;
  signal \SINE[1]_i_22_n_0\ : STD_LOGIC;
  signal \SINE[1]_i_23_n_0\ : STD_LOGIC;
  signal \SINE[1]_i_2_n_0\ : STD_LOGIC;
  signal \SINE[1]_i_3_n_0\ : STD_LOGIC;
  signal \SINE[1]_i_4_n_0\ : STD_LOGIC;
  signal \SINE[1]_i_8_n_0\ : STD_LOGIC;
  signal \SINE[2]_i_12_n_0\ : STD_LOGIC;
  signal \SINE[2]_i_13_n_0\ : STD_LOGIC;
  signal \SINE[2]_i_14_n_0\ : STD_LOGIC;
  signal \SINE[2]_i_15_n_0\ : STD_LOGIC;
  signal \SINE[2]_i_16_n_0\ : STD_LOGIC;
  signal \SINE[2]_i_17_n_0\ : STD_LOGIC;
  signal \SINE[2]_i_18_n_0\ : STD_LOGIC;
  signal \SINE[2]_i_19_n_0\ : STD_LOGIC;
  signal \SINE[2]_i_20_n_0\ : STD_LOGIC;
  signal \SINE[2]_i_21_n_0\ : STD_LOGIC;
  signal \SINE[2]_i_22_n_0\ : STD_LOGIC;
  signal \SINE[2]_i_23_n_0\ : STD_LOGIC;
  signal \SINE[2]_i_2_n_0\ : STD_LOGIC;
  signal \SINE[2]_i_3_n_0\ : STD_LOGIC;
  signal \SINE[2]_i_4_n_0\ : STD_LOGIC;
  signal \SINE[2]_i_8_n_0\ : STD_LOGIC;
  signal \SINE[3]_i_12_n_0\ : STD_LOGIC;
  signal \SINE[3]_i_13_n_0\ : STD_LOGIC;
  signal \SINE[3]_i_14_n_0\ : STD_LOGIC;
  signal \SINE[3]_i_15_n_0\ : STD_LOGIC;
  signal \SINE[3]_i_16_n_0\ : STD_LOGIC;
  signal \SINE[3]_i_17_n_0\ : STD_LOGIC;
  signal \SINE[3]_i_18_n_0\ : STD_LOGIC;
  signal \SINE[3]_i_19_n_0\ : STD_LOGIC;
  signal \SINE[3]_i_20_n_0\ : STD_LOGIC;
  signal \SINE[3]_i_21_n_0\ : STD_LOGIC;
  signal \SINE[3]_i_22_n_0\ : STD_LOGIC;
  signal \SINE[3]_i_23_n_0\ : STD_LOGIC;
  signal \SINE[3]_i_2_n_0\ : STD_LOGIC;
  signal \SINE[3]_i_3_n_0\ : STD_LOGIC;
  signal \SINE[3]_i_4_n_0\ : STD_LOGIC;
  signal \SINE[3]_i_8_n_0\ : STD_LOGIC;
  signal \SINE[4]_i_10_n_0\ : STD_LOGIC;
  signal \SINE[4]_i_11_n_0\ : STD_LOGIC;
  signal \SINE[4]_i_14_n_0\ : STD_LOGIC;
  signal \SINE[4]_i_15_n_0\ : STD_LOGIC;
  signal \SINE[4]_i_16_n_0\ : STD_LOGIC;
  signal \SINE[4]_i_17_n_0\ : STD_LOGIC;
  signal \SINE[4]_i_18_n_0\ : STD_LOGIC;
  signal \SINE[4]_i_19_n_0\ : STD_LOGIC;
  signal \SINE[4]_i_20_n_0\ : STD_LOGIC;
  signal \SINE[4]_i_21_n_0\ : STD_LOGIC;
  signal \SINE[4]_i_6_n_0\ : STD_LOGIC;
  signal \SINE[4]_i_7_n_0\ : STD_LOGIC;
  signal \SINE[5]_i_10_n_0\ : STD_LOGIC;
  signal \SINE[5]_i_11_n_0\ : STD_LOGIC;
  signal \SINE[5]_i_14_n_0\ : STD_LOGIC;
  signal \SINE[5]_i_15_n_0\ : STD_LOGIC;
  signal \SINE[5]_i_16_n_0\ : STD_LOGIC;
  signal \SINE[5]_i_17_n_0\ : STD_LOGIC;
  signal \SINE[5]_i_18_n_0\ : STD_LOGIC;
  signal \SINE[5]_i_19_n_0\ : STD_LOGIC;
  signal \SINE[5]_i_20_n_0\ : STD_LOGIC;
  signal \SINE[5]_i_21_n_0\ : STD_LOGIC;
  signal \SINE[5]_i_6_n_0\ : STD_LOGIC;
  signal \SINE[5]_i_7_n_0\ : STD_LOGIC;
  signal \SINE[6]_i_10_n_0\ : STD_LOGIC;
  signal \SINE[6]_i_11_n_0\ : STD_LOGIC;
  signal \SINE[6]_i_14_n_0\ : STD_LOGIC;
  signal \SINE[6]_i_15_n_0\ : STD_LOGIC;
  signal \SINE[6]_i_16_n_0\ : STD_LOGIC;
  signal \SINE[6]_i_17_n_0\ : STD_LOGIC;
  signal \SINE[6]_i_18_n_0\ : STD_LOGIC;
  signal \SINE[6]_i_19_n_0\ : STD_LOGIC;
  signal \SINE[6]_i_20_n_0\ : STD_LOGIC;
  signal \SINE[6]_i_21_n_0\ : STD_LOGIC;
  signal \SINE[6]_i_2_n_0\ : STD_LOGIC;
  signal \SINE[6]_i_6_n_0\ : STD_LOGIC;
  signal \SINE[6]_i_7_n_0\ : STD_LOGIC;
  signal \SINE[7]_i_10_n_0\ : STD_LOGIC;
  signal \SINE[7]_i_11_n_0\ : STD_LOGIC;
  signal \SINE[7]_i_12_n_0\ : STD_LOGIC;
  signal \SINE[7]_i_2_n_0\ : STD_LOGIC;
  signal \SINE[7]_i_3_n_0\ : STD_LOGIC;
  signal \SINE[7]_i_5_n_0\ : STD_LOGIC;
  signal \SINE[7]_i_6_n_0\ : STD_LOGIC;
  signal \SINE[7]_i_7_n_0\ : STD_LOGIC;
  signal \SINE[7]_i_8_n_0\ : STD_LOGIC;
  signal \SINE[7]_i_9_n_0\ : STD_LOGIC;
  signal \SINE[8]_i_2_n_0\ : STD_LOGIC;
  signal \SINE[8]_i_3_n_0\ : STD_LOGIC;
  signal \SINE[8]_i_4_n_0\ : STD_LOGIC;
  signal \SINE[9]_i_2_n_0\ : STD_LOGIC;
  signal \SINE[9]_i_3_n_0\ : STD_LOGIC;
  signal \SINE[9]_i_4_n_0\ : STD_LOGIC;
  signal \SINE[9]_i_5_n_0\ : STD_LOGIC;
  signal SINE_NEXT : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal SINE_OBUF : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \SINE_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \SINE_reg[0]_i_4_n_0\ : STD_LOGIC;
  signal \SINE_reg[0]_i_5_n_0\ : STD_LOGIC;
  signal \SINE_reg[1]_i_10_n_0\ : STD_LOGIC;
  signal \SINE_reg[1]_i_11_n_0\ : STD_LOGIC;
  signal \SINE_reg[1]_i_5_n_0\ : STD_LOGIC;
  signal \SINE_reg[1]_i_6_n_0\ : STD_LOGIC;
  signal \SINE_reg[1]_i_7_n_0\ : STD_LOGIC;
  signal \SINE_reg[1]_i_9_n_0\ : STD_LOGIC;
  signal \SINE_reg[2]_i_10_n_0\ : STD_LOGIC;
  signal \SINE_reg[2]_i_11_n_0\ : STD_LOGIC;
  signal \SINE_reg[2]_i_5_n_0\ : STD_LOGIC;
  signal \SINE_reg[2]_i_6_n_0\ : STD_LOGIC;
  signal \SINE_reg[2]_i_7_n_0\ : STD_LOGIC;
  signal \SINE_reg[2]_i_9_n_0\ : STD_LOGIC;
  signal \SINE_reg[3]_i_10_n_0\ : STD_LOGIC;
  signal \SINE_reg[3]_i_11_n_0\ : STD_LOGIC;
  signal \SINE_reg[3]_i_5_n_0\ : STD_LOGIC;
  signal \SINE_reg[3]_i_6_n_0\ : STD_LOGIC;
  signal \SINE_reg[3]_i_7_n_0\ : STD_LOGIC;
  signal \SINE_reg[3]_i_9_n_0\ : STD_LOGIC;
  signal \SINE_reg[4]_i_12_n_0\ : STD_LOGIC;
  signal \SINE_reg[4]_i_13_n_0\ : STD_LOGIC;
  signal \SINE_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \SINE_reg[4]_i_3_n_0\ : STD_LOGIC;
  signal \SINE_reg[4]_i_4_n_0\ : STD_LOGIC;
  signal \SINE_reg[4]_i_5_n_0\ : STD_LOGIC;
  signal \SINE_reg[4]_i_8_n_0\ : STD_LOGIC;
  signal \SINE_reg[4]_i_9_n_0\ : STD_LOGIC;
  signal \SINE_reg[5]_i_12_n_0\ : STD_LOGIC;
  signal \SINE_reg[5]_i_13_n_0\ : STD_LOGIC;
  signal \SINE_reg[5]_i_2_n_0\ : STD_LOGIC;
  signal \SINE_reg[5]_i_3_n_0\ : STD_LOGIC;
  signal \SINE_reg[5]_i_4_n_0\ : STD_LOGIC;
  signal \SINE_reg[5]_i_5_n_0\ : STD_LOGIC;
  signal \SINE_reg[5]_i_8_n_0\ : STD_LOGIC;
  signal \SINE_reg[5]_i_9_n_0\ : STD_LOGIC;
  signal \SINE_reg[6]_i_12_n_0\ : STD_LOGIC;
  signal \SINE_reg[6]_i_13_n_0\ : STD_LOGIC;
  signal \SINE_reg[6]_i_3_n_0\ : STD_LOGIC;
  signal \SINE_reg[6]_i_4_n_0\ : STD_LOGIC;
  signal \SINE_reg[6]_i_5_n_0\ : STD_LOGIC;
  signal \SINE_reg[6]_i_8_n_0\ : STD_LOGIC;
  signal \SINE_reg[6]_i_9_n_0\ : STD_LOGIC;
  signal \SINE_reg[7]_i_4_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of NEG_FLAG_i_3 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \SINE[6]_i_7\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \SINE[7]_i_7\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \SINE[8]_i_4\ : label is "soft_lutpair1";
begin
\ANGLE_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ANGLE(0),
      O => ANGLE_IBUF(0)
    );
\ANGLE_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ANGLE(1),
      O => ANGLE_IBUF(1)
    );
\ANGLE_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ANGLE(2),
      O => ANGLE_IBUF(2)
    );
\ANGLE_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ANGLE(3),
      O => ANGLE_IBUF(3)
    );
\ANGLE_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ANGLE(4),
      O => ANGLE_IBUF(4)
    );
\ANGLE_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ANGLE(5),
      O => ANGLE_IBUF(5)
    );
\ANGLE_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ANGLE(6),
      O => ANGLE_IBUF(6)
    );
\ANGLE_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ANGLE(7),
      O => ANGLE_IBUF(7)
    );
\ANGLE_IBUF[8]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ANGLE(8),
      O => ANGLE_IBUF(8)
    );
CLK_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => CLK_IBUF,
      O => CLK_IBUF_BUFG
    );
CLK_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => CLK,
      O => CLK_IBUF
    );
NEG_FLAG_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0E"
    )
        port map (
      I0 => ANGLE_IBUF(8),
      I1 => NEG_FLAG_i_2_n_0,
      I2 => RESET_IBUF,
      O => NEG_FLAG_i_1_n_0
    );
NEG_FLAG_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCC8888888888888"
    )
        port map (
      I0 => ANGLE_IBUF(6),
      I1 => ANGLE_IBUF(7),
      I2 => ANGLE_IBUF(3),
      I3 => NEG_FLAG_i_3_n_0,
      I4 => ANGLE_IBUF(4),
      I5 => ANGLE_IBUF(5),
      O => NEG_FLAG_i_2_n_0
    );
NEG_FLAG_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => ANGLE_IBUF(0),
      I1 => ANGLE_IBUF(1),
      I2 => ANGLE_IBUF(2),
      O => NEG_FLAG_i_3_n_0
    );
NEG_FLAG_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => NEG_FLAG_i_1_n_0,
      Q => NEG_FLAG,
      R => '0'
    );
RESET_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => RESET,
      O => RESET_IBUF
    );
\SINE[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \SINE[0]_i_2_n_0\,
      I1 => \SINE_reg[0]_i_3_n_0\,
      I2 => ANGLE_IBUF(8),
      I3 => \SINE_reg[0]_i_4_n_0\,
      I4 => ANGLE_IBUF(6),
      I5 => \SINE_reg[0]_i_5_n_0\,
      O => SINE_NEXT(0)
    );
\SINE[0]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCE1CDF8DED24DBA"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(2),
      I4 => ANGLE_IBUF(1),
      I5 => ANGLE_IBUF(0),
      O => \SINE[0]_i_10_n_0\
    );
\SINE[0]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6C31D224C798F58B"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(2),
      I4 => ANGLE_IBUF(0),
      I5 => ANGLE_IBUF(1),
      O => \SINE[0]_i_11_n_0\
    );
\SINE[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55BBB55100BFF442"
    )
        port map (
      I0 => ANGLE_IBUF(5),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(0),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(3),
      O => \SINE[0]_i_2_n_0\
    );
\SINE[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"313E2E10C0FEC11D"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(0),
      O => \SINE[0]_i_6_n_0\
    );
\SINE[0]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"963D87E1"
    )
        port map (
      I0 => ANGLE_IBUF(4),
      I1 => ANGLE_IBUF(3),
      I2 => ANGLE_IBUF(2),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(1),
      O => \SINE[0]_i_7_n_0\
    );
\SINE[0]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E96E313BA4E95CF8"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(2),
      I4 => ANGLE_IBUF(0),
      I5 => ANGLE_IBUF(1),
      O => \SINE[0]_i_8_n_0\
    );
\SINE[0]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"449FAC9E5C90297B"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(1),
      O => \SINE[0]_i_9_n_0\
    );
\SINE[1]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"30D000D011EE3E2F"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(0),
      I5 => ANGLE_IBUF(2),
      O => \SINE[1]_i_12_n_0\
    );
\SINE[1]_i_13\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"D77CAB0D"
    )
        port map (
      I0 => ANGLE_IBUF(4),
      I1 => ANGLE_IBUF(3),
      I2 => ANGLE_IBUF(2),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(0),
      O => \SINE[1]_i_13_n_0\
    );
\SINE[1]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3679EF28EB695A79"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(2),
      I4 => ANGLE_IBUF(0),
      I5 => ANGLE_IBUF(1),
      O => \SINE[1]_i_14_n_0\
    );
\SINE[1]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE2D529E4EFCA210"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(0),
      I5 => ANGLE_IBUF(2),
      O => \SINE[1]_i_15_n_0\
    );
\SINE[1]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCDFEFCEC4EED964"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(0),
      I3 => ANGLE_IBUF(3),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(1),
      O => \SINE[1]_i_16_n_0\
    );
\SINE[1]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"50E4B4A2E653B707"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(0),
      I5 => ANGLE_IBUF(2),
      O => \SINE[1]_i_17_n_0\
    );
\SINE[1]_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"01C03FFFEE2EFE32"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(1),
      O => \SINE[1]_i_18_n_0\
    );
\SINE[1]_i_19\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4F1B9E6C"
    )
        port map (
      I0 => ANGLE_IBUF(4),
      I1 => ANGLE_IBUF(3),
      I2 => ANGLE_IBUF(1),
      I3 => ANGLE_IBUF(2),
      I4 => ANGLE_IBUF(0),
      O => \SINE[1]_i_19_n_0\
    );
\SINE[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \SINE[1]_i_4_n_0\,
      I1 => \SINE_reg[1]_i_5_n_0\,
      I2 => ANGLE_IBUF(8),
      I3 => \SINE_reg[1]_i_6_n_0\,
      I4 => ANGLE_IBUF(6),
      I5 => \SINE_reg[1]_i_7_n_0\,
      O => \SINE[1]_i_2_n_0\
    );
\SINE[1]_i_20\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DF174F80DE130681"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(2),
      I4 => ANGLE_IBUF(1),
      I5 => ANGLE_IBUF(0),
      O => \SINE[1]_i_20_n_0\
    );
\SINE[1]_i_21\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BACDE23C710ED56B"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(1),
      O => \SINE[1]_i_21_n_0\
    );
\SINE[1]_i_22\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"311103030D2C2E2E"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(1),
      I5 => ANGLE_IBUF(2),
      O => \SINE[1]_i_22_n_0\
    );
\SINE[1]_i_23\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3CD723CB6693578C"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(2),
      I4 => ANGLE_IBUF(1),
      I5 => ANGLE_IBUF(0),
      O => \SINE[1]_i_23_n_0\
    );
\SINE[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \SINE[1]_i_8_n_0\,
      I1 => \SINE_reg[1]_i_9_n_0\,
      I2 => ANGLE_IBUF(8),
      I3 => \SINE_reg[1]_i_10_n_0\,
      I4 => ANGLE_IBUF(6),
      I5 => \SINE_reg[1]_i_11_n_0\,
      O => \SINE[1]_i_3_n_0\
    );
\SINE[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"550527BD555072EA"
    )
        port map (
      I0 => ANGLE_IBUF(5),
      I1 => ANGLE_IBUF(0),
      I2 => ANGLE_IBUF(4),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(3),
      O => \SINE[1]_i_4_n_0\
    );
\SINE[1]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0AAE0EAC5BFA5AB8"
    )
        port map (
      I0 => ANGLE_IBUF(5),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(2),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(0),
      I5 => ANGLE_IBUF(3),
      O => \SINE[1]_i_8_n_0\
    );
\SINE[2]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFCFFF3E3E3EFF"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(0),
      I5 => ANGLE_IBUF(2),
      O => \SINE[2]_i_12_n_0\
    );
\SINE[2]_i_13\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"D0DBA50E"
    )
        port map (
      I0 => ANGLE_IBUF(4),
      I1 => ANGLE_IBUF(3),
      I2 => ANGLE_IBUF(0),
      I3 => ANGLE_IBUF(2),
      I4 => ANGLE_IBUF(1),
      O => \SINE[2]_i_13_n_0\
    );
\SINE[2]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C46F54BEC5DF55EF"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(1),
      O => \SINE[2]_i_14_n_0\
    );
\SINE[2]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"96A8D06F559BB3DD"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(0),
      I5 => ANGLE_IBUF(2),
      O => \SINE[2]_i_15_n_0\
    );
\SINE[2]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"02033113FC78ECEC"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(2),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(3),
      I5 => ANGLE_IBUF(0),
      O => \SINE[2]_i_16_n_0\
    );
\SINE[2]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2BFD8C8810477337"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(2),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(3),
      I5 => ANGLE_IBUF(0),
      O => \SINE[2]_i_17_n_0\
    );
\SINE[2]_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C00C00CCE110F110"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(1),
      I3 => ANGLE_IBUF(2),
      I4 => ANGLE_IBUF(0),
      I5 => ANGLE_IBUF(3),
      O => \SINE[2]_i_18_n_0\
    );
\SINE[2]_i_19\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0BA45BF3"
    )
        port map (
      I0 => ANGLE_IBUF(4),
      I1 => ANGLE_IBUF(3),
      I2 => ANGLE_IBUF(0),
      I3 => ANGLE_IBUF(2),
      I4 => ANGLE_IBUF(1),
      O => \SINE[2]_i_19_n_0\
    );
\SINE[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \SINE[2]_i_4_n_0\,
      I1 => \SINE_reg[2]_i_5_n_0\,
      I2 => ANGLE_IBUF(8),
      I3 => \SINE_reg[2]_i_6_n_0\,
      I4 => ANGLE_IBUF(6),
      I5 => \SINE_reg[2]_i_7_n_0\,
      O => \SINE[2]_i_2_n_0\
    );
\SINE[2]_i_20\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3B902B852A81BC16"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(1),
      O => \SINE[2]_i_20_n_0\
    );
\SINE[2]_i_21\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"680FBB0DD5F166A6"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(1),
      O => \SINE[2]_i_21_n_0\
    );
\SINE[2]_i_22\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FECC2132CECD3132"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(2),
      I4 => ANGLE_IBUF(0),
      I5 => ANGLE_IBUF(1),
      O => \SINE[2]_i_22_n_0\
    );
\SINE[2]_i_23\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"541F4B03E1B4B4F8"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(0),
      O => \SINE[2]_i_23_n_0\
    );
\SINE[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \SINE[2]_i_8_n_0\,
      I1 => \SINE_reg[2]_i_9_n_0\,
      I2 => ANGLE_IBUF(8),
      I3 => \SINE_reg[2]_i_10_n_0\,
      I4 => ANGLE_IBUF(6),
      I5 => \SINE_reg[2]_i_11_n_0\,
      O => \SINE[2]_i_3_n_0\
    );
\SINE[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAABFFEDDD5"
    )
        port map (
      I0 => ANGLE_IBUF(5),
      I1 => ANGLE_IBUF(3),
      I2 => ANGLE_IBUF(2),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(4),
      I5 => ANGLE_IBUF(0),
      O => \SINE[2]_i_4_n_0\
    );
\SINE[2]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BF151554E8034203"
    )
        port map (
      I0 => ANGLE_IBUF(5),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(2),
      I4 => ANGLE_IBUF(1),
      I5 => ANGLE_IBUF(0),
      O => \SINE[2]_i_8_n_0\
    );
\SINE[3]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F0F3F3FFFFFFFFE"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(1),
      I5 => ANGLE_IBUF(2),
      O => \SINE[3]_i_12_n_0\
    );
\SINE[3]_i_13\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0D73D788"
    )
        port map (
      I0 => ANGLE_IBUF(4),
      I1 => ANGLE_IBUF(3),
      I2 => ANGLE_IBUF(0),
      I3 => ANGLE_IBUF(2),
      I4 => ANGLE_IBUF(1),
      O => \SINE[3]_i_13_n_0\
    );
\SINE[3]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D4FF45AF7F65EE44"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(1),
      O => \SINE[3]_i_14_n_0\
    );
\SINE[3]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5F0032FAE5071DF5"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(0),
      I2 => ANGLE_IBUF(4),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(3),
      O => \SINE[3]_i_15_n_0\
    );
\SINE[3]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A8FF99DD56846422"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(2),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(3),
      I5 => ANGLE_IBUF(1),
      O => \SINE[3]_i_16_n_0\
    );
\SINE[3]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1DA2AFFB60594044"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(2),
      I3 => ANGLE_IBUF(3),
      I4 => ANGLE_IBUF(0),
      I5 => ANGLE_IBUF(1),
      O => \SINE[3]_i_17_n_0\
    );
\SINE[3]_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0C0F00000000005"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(0),
      I2 => ANGLE_IBUF(4),
      I3 => ANGLE_IBUF(2),
      I4 => ANGLE_IBUF(1),
      I5 => ANGLE_IBUF(3),
      O => \SINE[3]_i_18_n_0\
    );
\SINE[3]_i_19\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"D68C2877"
    )
        port map (
      I0 => ANGLE_IBUF(4),
      I1 => ANGLE_IBUF(3),
      I2 => ANGLE_IBUF(0),
      I3 => ANGLE_IBUF(2),
      I4 => ANGLE_IBUF(1),
      O => \SINE[3]_i_19_n_0\
    );
\SINE[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \SINE[3]_i_4_n_0\,
      I1 => \SINE_reg[3]_i_5_n_0\,
      I2 => ANGLE_IBUF(8),
      I3 => \SINE_reg[3]_i_6_n_0\,
      I4 => ANGLE_IBUF(6),
      I5 => \SINE_reg[3]_i_7_n_0\,
      O => \SINE[3]_i_2_n_0\
    );
\SINE[3]_i_20\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"202288229D37CB23"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(1),
      I2 => ANGLE_IBUF(2),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(3),
      I5 => ANGLE_IBUF(4),
      O => \SINE[3]_i_20_n_0\
    );
\SINE[3]_i_21\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"83A6FCFCFC5A1212"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(1),
      I5 => ANGLE_IBUF(2),
      O => \SINE[3]_i_21_n_0\
    );
\SINE[3]_i_22\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"56640203999BFDFC"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(2),
      I4 => ANGLE_IBUF(0),
      I5 => ANGLE_IBUF(1),
      O => \SINE[3]_i_22_n_0\
    );
\SINE[3]_i_23\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"662D584C9AD2B3FB"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(2),
      I4 => ANGLE_IBUF(0),
      I5 => ANGLE_IBUF(1),
      O => \SINE[3]_i_23_n_0\
    );
\SINE[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \SINE[3]_i_8_n_0\,
      I1 => \SINE_reg[3]_i_9_n_0\,
      I2 => ANGLE_IBUF(8),
      I3 => \SINE_reg[3]_i_10_n_0\,
      I4 => ANGLE_IBUF(6),
      I5 => \SINE_reg[3]_i_11_n_0\,
      O => \SINE[3]_i_3_n_0\
    );
\SINE[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFFDDFFAAABAA80"
    )
        port map (
      I0 => ANGLE_IBUF(5),
      I1 => ANGLE_IBUF(3),
      I2 => ANGLE_IBUF(2),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(4),
      I5 => ANGLE_IBUF(1),
      O => \SINE[3]_i_4_n_0\
    );
\SINE[3]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4242020015545757"
    )
        port map (
      I0 => ANGLE_IBUF(5),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(2),
      I4 => ANGLE_IBUF(0),
      I5 => ANGLE_IBUF(1),
      O => \SINE[3]_i_8_n_0\
    );
\SINE[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \SINE_reg[4]_i_2_n_0\,
      I1 => \SINE_reg[4]_i_3_n_0\,
      I2 => NEG_FLAG,
      I3 => \SINE_reg[4]_i_4_n_0\,
      I4 => ANGLE_IBUF(8),
      I5 => \SINE_reg[4]_i_5_n_0\,
      O => SINE_NEXT(4)
    );
\SINE[4]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555DDFDFDD9DD757"
    )
        port map (
      I0 => ANGLE_IBUF(5),
      I1 => ANGLE_IBUF(3),
      I2 => ANGLE_IBUF(1),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(4),
      O => \SINE[4]_i_10_n_0\
    );
\SINE[4]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FC00FFFFFDFFFA00"
    )
        port map (
      I0 => ANGLE_IBUF(0),
      I1 => ANGLE_IBUF(3),
      I2 => ANGLE_IBUF(4),
      I3 => ANGLE_IBUF(5),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(1),
      O => \SINE[4]_i_11_n_0\
    );
\SINE[4]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"540088A8B9FF7756"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(1),
      I5 => ANGLE_IBUF(2),
      O => \SINE[4]_i_14_n_0\
    );
\SINE[4]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C88ECCA63E393F11"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(0),
      I5 => ANGLE_IBUF(2),
      O => \SINE[4]_i_15_n_0\
    );
\SINE[4]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8AAA20000BBBB111"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(3),
      I2 => ANGLE_IBUF(1),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(4),
      O => \SINE[4]_i_16_n_0\
    );
\SINE[4]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"550022AABAF0F050"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(0),
      I2 => ANGLE_IBUF(4),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(3),
      O => \SINE[4]_i_17_n_0\
    );
\SINE[4]_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF55BF77508A4088"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(0),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(3),
      I5 => ANGLE_IBUF(2),
      O => \SINE[4]_i_18_n_0\
    );
\SINE[4]_i_19\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B6C133C071E251EE"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(2),
      I4 => ANGLE_IBUF(0),
      I5 => ANGLE_IBUF(1),
      O => \SINE[4]_i_19_n_0\
    );
\SINE[4]_i_20\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"755F5B5FF44E4E4E"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(2),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(0),
      I5 => ANGLE_IBUF(3),
      O => \SINE[4]_i_20_n_0\
    );
\SINE[4]_i_21\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AADDFF55450F07AF"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(0),
      I2 => ANGLE_IBUF(4),
      I3 => ANGLE_IBUF(2),
      I4 => ANGLE_IBUF(1),
      I5 => ANGLE_IBUF(3),
      O => \SINE[4]_i_21_n_0\
    );
\SINE[4]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C68E1E3E00000000"
    )
        port map (
      I0 => ANGLE_IBUF(1),
      I1 => ANGLE_IBUF(2),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(4),
      I5 => ANGLE_IBUF(5),
      O => \SINE[4]_i_6_n_0\
    );
\SINE[4]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5700570042540057"
    )
        port map (
      I0 => ANGLE_IBUF(5),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(2),
      I4 => ANGLE_IBUF(0),
      I5 => ANGLE_IBUF(1),
      O => \SINE[4]_i_7_n_0\
    );
\SINE[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \SINE_reg[5]_i_2_n_0\,
      I1 => \SINE_reg[5]_i_3_n_0\,
      I2 => NEG_FLAG,
      I3 => \SINE_reg[5]_i_4_n_0\,
      I4 => ANGLE_IBUF(8),
      I5 => \SINE_reg[5]_i_5_n_0\,
      O => SINE_NEXT(5)
    );
\SINE[5]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DDDDDDDD77377FFF"
    )
        port map (
      I0 => ANGLE_IBUF(5),
      I1 => ANGLE_IBUF(3),
      I2 => ANGLE_IBUF(1),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(4),
      O => \SINE[5]_i_10_n_0\
    );
\SINE[5]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFC0FFC0FFC0E0DF"
    )
        port map (
      I0 => ANGLE_IBUF(0),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(5),
      I3 => ANGLE_IBUF(3),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(1),
      O => \SINE[5]_i_11_n_0\
    );
\SINE[5]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F1A52D0D0D0F0F0E"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(1),
      I5 => ANGLE_IBUF(2),
      O => \SINE[5]_i_14_n_0\
    );
\SINE[5]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F3FC080FFBC3FFF"
    )
        port map (
      I0 => ANGLE_IBUF(0),
      I1 => ANGLE_IBUF(7),
      I2 => ANGLE_IBUF(2),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(4),
      I5 => ANGLE_IBUF(3),
      O => \SINE[5]_i_15_n_0\
    );
\SINE[5]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55EA15EA00000000"
    )
        port map (
      I0 => ANGLE_IBUF(2),
      I1 => ANGLE_IBUF(1),
      I2 => ANGLE_IBUF(0),
      I3 => ANGLE_IBUF(3),
      I4 => ANGLE_IBUF(4),
      I5 => ANGLE_IBUF(7),
      O => \SINE[5]_i_16_n_0\
    );
\SINE[5]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"54444466AA888888"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(3),
      I2 => ANGLE_IBUF(0),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(4),
      O => \SINE[5]_i_17_n_0\
    );
\SINE[5]_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F5FFFFFE0A02020"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(2),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(1),
      I5 => ANGLE_IBUF(3),
      O => \SINE[5]_i_18_n_0\
    );
\SINE[5]_i_19\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D393D3B330002004"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(2),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(0),
      I5 => ANGLE_IBUF(3),
      O => \SINE[5]_i_19_n_0\
    );
\SINE[5]_i_20\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DDDDD737DDDDD777"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(3),
      I2 => ANGLE_IBUF(1),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(4),
      O => \SINE[5]_i_20_n_0\
    );
\SINE[5]_i_21\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ABBBB9B955577777"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(3),
      I2 => ANGLE_IBUF(1),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(4),
      O => \SINE[5]_i_21_n_0\
    );
\SINE[5]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1555AA8000000000"
    )
        port map (
      I0 => ANGLE_IBUF(3),
      I1 => ANGLE_IBUF(0),
      I2 => ANGLE_IBUF(1),
      I3 => ANGLE_IBUF(2),
      I4 => ANGLE_IBUF(4),
      I5 => ANGLE_IBUF(5),
      O => \SINE[5]_i_6_n_0\
    );
\SINE[5]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0707070707075350"
    )
        port map (
      I0 => ANGLE_IBUF(5),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(1),
      I5 => ANGLE_IBUF(2),
      O => \SINE[5]_i_7_n_0\
    );
\SINE[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \SINE[6]_i_2_n_0\,
      I1 => \SINE_reg[6]_i_3_n_0\,
      I2 => NEG_FLAG,
      I3 => \SINE_reg[6]_i_4_n_0\,
      I4 => ANGLE_IBUF(8),
      I5 => \SINE_reg[6]_i_5_n_0\,
      O => SINE_NEXT(6)
    );
\SINE[6]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"77777777FFBFFFFF"
    )
        port map (
      I0 => ANGLE_IBUF(5),
      I1 => ANGLE_IBUF(3),
      I2 => ANGLE_IBUF(1),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(4),
      O => \SINE[6]_i_10_n_0\
    );
\SINE[6]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFCFCFF8F0F0F0F0"
    )
        port map (
      I0 => ANGLE_IBUF(0),
      I1 => ANGLE_IBUF(5),
      I2 => ANGLE_IBUF(4),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(3),
      O => \SINE[6]_i_11_n_0\
    );
\SINE[6]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"63333B3B3B393938"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(1),
      I5 => ANGLE_IBUF(2),
      O => \SINE[6]_i_14_n_0\
    );
\SINE[6]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCC8CCCFFFF3F3F3"
    )
        port map (
      I0 => ANGLE_IBUF(0),
      I1 => ANGLE_IBUF(7),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(4),
      O => \SINE[6]_i_15_n_0\
    );
\SINE[6]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEA001500000000"
    )
        port map (
      I0 => ANGLE_IBUF(3),
      I1 => ANGLE_IBUF(1),
      I2 => ANGLE_IBUF(0),
      I3 => ANGLE_IBUF(2),
      I4 => ANGLE_IBUF(4),
      I5 => ANGLE_IBUF(7),
      O => \SINE[6]_i_16_n_0\
    );
\SINE[6]_i_17\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00150000"
    )
        port map (
      I0 => ANGLE_IBUF(4),
      I1 => ANGLE_IBUF(2),
      I2 => ANGLE_IBUF(1),
      I3 => ANGLE_IBUF(3),
      I4 => ANGLE_IBUF(7),
      O => \SINE[6]_i_17_n_0\
    );
\SINE[6]_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9CCCCCCCC646C646"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(2),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(0),
      I5 => ANGLE_IBUF(3),
      O => \SINE[6]_i_18_n_0\
    );
\SINE[6]_i_19\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555555400222222"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(3),
      I2 => ANGLE_IBUF(0),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(4),
      O => \SINE[6]_i_19_n_0\
    );
\SINE[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"30303C0C48480C0C"
    )
        port map (
      I0 => \SINE[6]_i_6_n_0\,
      I1 => ANGLE_IBUF(6),
      I2 => ANGLE_IBUF(4),
      I3 => \SINE[6]_i_7_n_0\,
      I4 => ANGLE_IBUF(3),
      I5 => ANGLE_IBUF(5),
      O => \SINE[6]_i_2_n_0\
    );
\SINE[6]_i_20\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55555737FFFFFDDD"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(3),
      I2 => ANGLE_IBUF(1),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(4),
      O => \SINE[6]_i_20_n_0\
    );
\SINE[6]_i_21\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEEEAFFFFFFFF"
    )
        port map (
      I0 => ANGLE_IBUF(4),
      I1 => ANGLE_IBUF(2),
      I2 => ANGLE_IBUF(1),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(3),
      I5 => ANGLE_IBUF(7),
      O => \SINE[6]_i_21_n_0\
    );
\SINE[6]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ANGLE_IBUF(1),
      I1 => ANGLE_IBUF(2),
      O => \SINE[6]_i_6_n_0\
    );
\SINE[6]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ANGLE_IBUF(0),
      I1 => ANGLE_IBUF(1),
      I2 => ANGLE_IBUF(2),
      O => \SINE[6]_i_7_n_0\
    );
\SINE[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \SINE[7]_i_2_n_0\,
      I1 => \SINE[7]_i_3_n_0\,
      I2 => NEG_FLAG,
      I3 => \SINE_reg[7]_i_4_n_0\,
      I4 => ANGLE_IBUF(8),
      I5 => \SINE[7]_i_5_n_0\,
      O => SINE_NEXT(7)
    );
\SINE[7]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCC3C3C3B3"
    )
        port map (
      I0 => ANGLE_IBUF(0),
      I1 => ANGLE_IBUF(5),
      I2 => ANGLE_IBUF(3),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(4),
      O => \SINE[7]_i_10_n_0\
    );
\SINE[7]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFD9D55555555"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(3),
      I2 => ANGLE_IBUF(1),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(4),
      O => \SINE[7]_i_11_n_0\
    );
\SINE[7]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"40222222AAAAAAAA"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(3),
      I2 => ANGLE_IBUF(0),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(4),
      O => \SINE[7]_i_12_n_0\
    );
\SINE[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0055FEAA00000000"
    )
        port map (
      I0 => ANGLE_IBUF(4),
      I1 => ANGLE_IBUF(1),
      I2 => ANGLE_IBUF(2),
      I3 => ANGLE_IBUF(3),
      I4 => ANGLE_IBUF(5),
      I5 => ANGLE_IBUF(6),
      O => \SINE[7]_i_2_n_0\
    );
\SINE[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3000BBBB30008888"
    )
        port map (
      I0 => \SINE[7]_i_6_n_0\,
      I1 => ANGLE_IBUF(6),
      I2 => \SINE[7]_i_7_n_0\,
      I3 => ANGLE_IBUF(7),
      I4 => ANGLE_IBUF(5),
      I5 => \SINE[7]_i_8_n_0\,
      O => \SINE[7]_i_3_n_0\
    );
\SINE[7]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFBBCF88"
    )
        port map (
      I0 => \SINE[7]_i_11_n_0\,
      I1 => ANGLE_IBUF(6),
      I2 => ANGLE_IBUF(7),
      I3 => ANGLE_IBUF(5),
      I4 => \SINE[7]_i_12_n_0\,
      O => \SINE[7]_i_5_n_0\
    );
\SINE[7]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555577700000000"
    )
        port map (
      I0 => ANGLE_IBUF(4),
      I1 => ANGLE_IBUF(2),
      I2 => ANGLE_IBUF(0),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(3),
      I5 => ANGLE_IBUF(7),
      O => \SINE[7]_i_6_n_0\
    );
\SINE[7]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFFFFFF"
    )
        port map (
      I0 => ANGLE_IBUF(3),
      I1 => ANGLE_IBUF(0),
      I2 => ANGLE_IBUF(1),
      I3 => ANGLE_IBUF(2),
      I4 => ANGLE_IBUF(4),
      O => \SINE[7]_i_7_n_0\
    );
\SINE[7]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9DDDDDDDD555D554"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(4),
      I2 => ANGLE_IBUF(2),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(0),
      I5 => ANGLE_IBUF(3),
      O => \SINE[7]_i_8_n_0\
    );
\SINE[7]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFBFFFFFF"
    )
        port map (
      I0 => ANGLE_IBUF(4),
      I1 => ANGLE_IBUF(2),
      I2 => ANGLE_IBUF(0),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(3),
      I5 => ANGLE_IBUF(5),
      O => \SINE[7]_i_9_n_0\
    );
\SINE[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88BB8888B888B888"
    )
        port map (
      I0 => \SINE[9]_i_2_n_0\,
      I1 => NEG_FLAG,
      I2 => \SINE[8]_i_2_n_0\,
      I3 => ANGLE_IBUF(8),
      I4 => \SINE[8]_i_3_n_0\,
      I5 => ANGLE_IBUF(6),
      O => SINE_NEXT(8)
    );
\SINE[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000400000"
    )
        port map (
      I0 => ANGLE_IBUF(4),
      I1 => ANGLE_IBUF(2),
      I2 => ANGLE_IBUF(1),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(3),
      I5 => ANGLE_IBUF(5),
      O => \SINE[8]_i_2_n_0\
    );
\SINE[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000400000"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => ANGLE_IBUF(3),
      I2 => \SINE[8]_i_4_n_0\,
      I3 => ANGLE_IBUF(2),
      I4 => ANGLE_IBUF(4),
      I5 => ANGLE_IBUF(5),
      O => \SINE[8]_i_3_n_0\
    );
\SINE[8]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => ANGLE_IBUF(1),
      I1 => ANGLE_IBUF(0),
      O => \SINE[8]_i_4_n_0\
    );
\SINE[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \SINE[9]_i_2_n_0\,
      I1 => NEG_FLAG,
      O => SINE_NEXT(9)
    );
\SINE[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBBBBFFFCCCFC"
    )
        port map (
      I0 => \SINE[9]_i_3_n_0\,
      I1 => ANGLE_IBUF(8),
      I2 => \SINE[9]_i_4_n_0\,
      I3 => ANGLE_IBUF(5),
      I4 => \SINE[9]_i_5_n_0\,
      I5 => ANGLE_IBUF(6),
      O => \SINE[9]_i_2_n_0\
    );
\SINE[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFFFFFFFFFF"
    )
        port map (
      I0 => ANGLE_IBUF(4),
      I1 => ANGLE_IBUF(2),
      I2 => ANGLE_IBUF(1),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(3),
      I5 => ANGLE_IBUF(5),
      O => \SINE[9]_i_3_n_0\
    );
\SINE[9]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => ANGLE_IBUF(4),
      I1 => ANGLE_IBUF(2),
      I2 => ANGLE_IBUF(1),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(3),
      I5 => ANGLE_IBUF(7),
      O => \SINE[9]_i_4_n_0\
    );
\SINE[9]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF7FFFFFFFF"
    )
        port map (
      I0 => ANGLE_IBUF(4),
      I1 => ANGLE_IBUF(2),
      I2 => ANGLE_IBUF(1),
      I3 => ANGLE_IBUF(0),
      I4 => ANGLE_IBUF(3),
      I5 => ANGLE_IBUF(7),
      O => \SINE[9]_i_5_n_0\
    );
\SINE_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SINE_OBUF(0),
      O => SINE(0)
    );
\SINE_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SINE_OBUF(1),
      O => SINE(1)
    );
\SINE_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SINE_OBUF(2),
      O => SINE(2)
    );
\SINE_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SINE_OBUF(3),
      O => SINE(3)
    );
\SINE_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SINE_OBUF(4),
      O => SINE(4)
    );
\SINE_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SINE_OBUF(5),
      O => SINE(5)
    );
\SINE_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SINE_OBUF(6),
      O => SINE(6)
    );
\SINE_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SINE_OBUF(7),
      O => SINE(7)
    );
\SINE_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SINE_OBUF(8),
      O => SINE(8)
    );
\SINE_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SINE_OBUF(9),
      O => SINE(9)
    );
\SINE_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => SINE_NEXT(0),
      Q => SINE_OBUF(0),
      R => RESET_IBUF
    );
\SINE_reg[0]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[0]_i_6_n_0\,
      I1 => \SINE[0]_i_7_n_0\,
      O => \SINE_reg[0]_i_3_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[0]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[0]_i_8_n_0\,
      I1 => \SINE[0]_i_9_n_0\,
      O => \SINE_reg[0]_i_4_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[0]_i_5\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[0]_i_10_n_0\,
      I1 => \SINE[0]_i_11_n_0\,
      O => \SINE_reg[0]_i_5_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => SINE_NEXT(1),
      Q => SINE_OBUF(1),
      R => RESET_IBUF
    );
\SINE_reg[1]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[1]_i_2_n_0\,
      I1 => \SINE[1]_i_3_n_0\,
      O => SINE_NEXT(1),
      S => NEG_FLAG
    );
\SINE_reg[1]_i_10\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[1]_i_20_n_0\,
      I1 => \SINE[1]_i_21_n_0\,
      O => \SINE_reg[1]_i_10_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[1]_i_11\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[1]_i_22_n_0\,
      I1 => \SINE[1]_i_23_n_0\,
      O => \SINE_reg[1]_i_11_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[1]_i_5\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[1]_i_12_n_0\,
      I1 => \SINE[1]_i_13_n_0\,
      O => \SINE_reg[1]_i_5_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[1]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[1]_i_14_n_0\,
      I1 => \SINE[1]_i_15_n_0\,
      O => \SINE_reg[1]_i_6_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[1]_i_7\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[1]_i_16_n_0\,
      I1 => \SINE[1]_i_17_n_0\,
      O => \SINE_reg[1]_i_7_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[1]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[1]_i_18_n_0\,
      I1 => \SINE[1]_i_19_n_0\,
      O => \SINE_reg[1]_i_9_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => SINE_NEXT(2),
      Q => SINE_OBUF(2),
      R => RESET_IBUF
    );
\SINE_reg[2]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[2]_i_2_n_0\,
      I1 => \SINE[2]_i_3_n_0\,
      O => SINE_NEXT(2),
      S => NEG_FLAG
    );
\SINE_reg[2]_i_10\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[2]_i_20_n_0\,
      I1 => \SINE[2]_i_21_n_0\,
      O => \SINE_reg[2]_i_10_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[2]_i_11\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[2]_i_22_n_0\,
      I1 => \SINE[2]_i_23_n_0\,
      O => \SINE_reg[2]_i_11_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[2]_i_5\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[2]_i_12_n_0\,
      I1 => \SINE[2]_i_13_n_0\,
      O => \SINE_reg[2]_i_5_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[2]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[2]_i_14_n_0\,
      I1 => \SINE[2]_i_15_n_0\,
      O => \SINE_reg[2]_i_6_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[2]_i_7\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[2]_i_16_n_0\,
      I1 => \SINE[2]_i_17_n_0\,
      O => \SINE_reg[2]_i_7_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[2]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[2]_i_18_n_0\,
      I1 => \SINE[2]_i_19_n_0\,
      O => \SINE_reg[2]_i_9_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => SINE_NEXT(3),
      Q => SINE_OBUF(3),
      R => RESET_IBUF
    );
\SINE_reg[3]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[3]_i_2_n_0\,
      I1 => \SINE[3]_i_3_n_0\,
      O => SINE_NEXT(3),
      S => NEG_FLAG
    );
\SINE_reg[3]_i_10\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[3]_i_20_n_0\,
      I1 => \SINE[3]_i_21_n_0\,
      O => \SINE_reg[3]_i_10_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[3]_i_11\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[3]_i_22_n_0\,
      I1 => \SINE[3]_i_23_n_0\,
      O => \SINE_reg[3]_i_11_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[3]_i_5\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[3]_i_12_n_0\,
      I1 => \SINE[3]_i_13_n_0\,
      O => \SINE_reg[3]_i_5_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[3]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[3]_i_14_n_0\,
      I1 => \SINE[3]_i_15_n_0\,
      O => \SINE_reg[3]_i_6_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[3]_i_7\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[3]_i_16_n_0\,
      I1 => \SINE[3]_i_17_n_0\,
      O => \SINE_reg[3]_i_7_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[3]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[3]_i_18_n_0\,
      I1 => \SINE[3]_i_19_n_0\,
      O => \SINE_reg[3]_i_9_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => SINE_NEXT(4),
      Q => SINE_OBUF(4),
      R => RESET_IBUF
    );
\SINE_reg[4]_i_12\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[4]_i_18_n_0\,
      I1 => \SINE[4]_i_19_n_0\,
      O => \SINE_reg[4]_i_12_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[4]_i_13\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[4]_i_20_n_0\,
      I1 => \SINE[4]_i_21_n_0\,
      O => \SINE_reg[4]_i_13_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[4]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[4]_i_6_n_0\,
      I1 => \SINE[4]_i_7_n_0\,
      O => \SINE_reg[4]_i_2_n_0\,
      S => ANGLE_IBUF(6)
    );
\SINE_reg[4]_i_3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \SINE_reg[4]_i_8_n_0\,
      I1 => \SINE_reg[4]_i_9_n_0\,
      O => \SINE_reg[4]_i_3_n_0\,
      S => ANGLE_IBUF(6)
    );
\SINE_reg[4]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[4]_i_10_n_0\,
      I1 => \SINE[4]_i_11_n_0\,
      O => \SINE_reg[4]_i_4_n_0\,
      S => ANGLE_IBUF(6)
    );
\SINE_reg[4]_i_5\: unisim.vcomponents.MUXF8
     port map (
      I0 => \SINE_reg[4]_i_12_n_0\,
      I1 => \SINE_reg[4]_i_13_n_0\,
      O => \SINE_reg[4]_i_5_n_0\,
      S => ANGLE_IBUF(6)
    );
\SINE_reg[4]_i_8\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[4]_i_14_n_0\,
      I1 => \SINE[4]_i_15_n_0\,
      O => \SINE_reg[4]_i_8_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[4]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[4]_i_16_n_0\,
      I1 => \SINE[4]_i_17_n_0\,
      O => \SINE_reg[4]_i_9_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => SINE_NEXT(5),
      Q => SINE_OBUF(5),
      R => RESET_IBUF
    );
\SINE_reg[5]_i_12\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[5]_i_18_n_0\,
      I1 => \SINE[5]_i_19_n_0\,
      O => \SINE_reg[5]_i_12_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[5]_i_13\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[5]_i_20_n_0\,
      I1 => \SINE[5]_i_21_n_0\,
      O => \SINE_reg[5]_i_13_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[5]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[5]_i_6_n_0\,
      I1 => \SINE[5]_i_7_n_0\,
      O => \SINE_reg[5]_i_2_n_0\,
      S => ANGLE_IBUF(6)
    );
\SINE_reg[5]_i_3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \SINE_reg[5]_i_8_n_0\,
      I1 => \SINE_reg[5]_i_9_n_0\,
      O => \SINE_reg[5]_i_3_n_0\,
      S => ANGLE_IBUF(6)
    );
\SINE_reg[5]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[5]_i_10_n_0\,
      I1 => \SINE[5]_i_11_n_0\,
      O => \SINE_reg[5]_i_4_n_0\,
      S => ANGLE_IBUF(6)
    );
\SINE_reg[5]_i_5\: unisim.vcomponents.MUXF8
     port map (
      I0 => \SINE_reg[5]_i_12_n_0\,
      I1 => \SINE_reg[5]_i_13_n_0\,
      O => \SINE_reg[5]_i_5_n_0\,
      S => ANGLE_IBUF(6)
    );
\SINE_reg[5]_i_8\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[5]_i_14_n_0\,
      I1 => \SINE[5]_i_15_n_0\,
      O => \SINE_reg[5]_i_8_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[5]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[5]_i_16_n_0\,
      I1 => \SINE[5]_i_17_n_0\,
      O => \SINE_reg[5]_i_9_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => SINE_NEXT(6),
      Q => SINE_OBUF(6),
      R => RESET_IBUF
    );
\SINE_reg[6]_i_12\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[6]_i_18_n_0\,
      I1 => \SINE[6]_i_19_n_0\,
      O => \SINE_reg[6]_i_12_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[6]_i_13\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[6]_i_20_n_0\,
      I1 => \SINE[6]_i_21_n_0\,
      O => \SINE_reg[6]_i_13_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[6]_i_3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \SINE_reg[6]_i_8_n_0\,
      I1 => \SINE_reg[6]_i_9_n_0\,
      O => \SINE_reg[6]_i_3_n_0\,
      S => ANGLE_IBUF(6)
    );
\SINE_reg[6]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[6]_i_10_n_0\,
      I1 => \SINE[6]_i_11_n_0\,
      O => \SINE_reg[6]_i_4_n_0\,
      S => ANGLE_IBUF(6)
    );
\SINE_reg[6]_i_5\: unisim.vcomponents.MUXF8
     port map (
      I0 => \SINE_reg[6]_i_12_n_0\,
      I1 => \SINE_reg[6]_i_13_n_0\,
      O => \SINE_reg[6]_i_5_n_0\,
      S => ANGLE_IBUF(6)
    );
\SINE_reg[6]_i_8\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[6]_i_14_n_0\,
      I1 => \SINE[6]_i_15_n_0\,
      O => \SINE_reg[6]_i_8_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[6]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[6]_i_16_n_0\,
      I1 => \SINE[6]_i_17_n_0\,
      O => \SINE_reg[6]_i_9_n_0\,
      S => ANGLE_IBUF(5)
    );
\SINE_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => SINE_NEXT(7),
      Q => SINE_OBUF(7),
      R => RESET_IBUF
    );
\SINE_reg[7]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[7]_i_9_n_0\,
      I1 => \SINE[7]_i_10_n_0\,
      O => \SINE_reg[7]_i_4_n_0\,
      S => ANGLE_IBUF(6)
    );
\SINE_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => SINE_NEXT(8),
      Q => SINE_OBUF(8),
      R => RESET_IBUF
    );
\SINE_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => SINE_NEXT(9),
      Q => SINE_OBUF(9),
      R => RESET_IBUF
    );
end STRUCTURE;
