-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Fri Jan 24 00:05:40 2025
-- Host        : Laptop-ASH running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/ultro/OneDrive/ALTRO/Desktop/ProgettoRetiLogiche_2024/FIXEDPOINTSIN_/FIXEDPOINTSIN_.sim/sim_1/synth/func/xsim/TB_SINE_func_synth.vhd
-- Design      : SINE
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a200tsbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SINE is
  port (
    CLK : in STD_LOGIC;
    RESET : in STD_LOGIC;
    ANGLE : in STD_LOGIC_VECTOR ( 8 downto 0 );
    SINE : out STD_LOGIC_VECTOR ( 9 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of SINE : entity is true;
  attribute M : integer;
  attribute M of SINE : entity is 9;
  attribute N : integer;
  attribute N of SINE : entity is 10;
end SINE;

architecture STRUCTURE of SINE is
  signal \ANGLE_ADJUSTED[1]_i_1_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[2]_i_1_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[3]_i_1_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[3]_i_2_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[3]_i_3_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[4]_i_1_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[4]_i_2_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[4]_i_3_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[4]_i_4_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[4]_i_5_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[5]_i_1_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[5]_i_2_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[5]_i_4_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[5]_i_5_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[6]_i_1_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[6]_i_2_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[6]_i_3_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[6]_i_4_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[6]_i_5_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[6]_i_6_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[6]_i_7_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[6]_i_8_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED_reg_n_0_[0]\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED_reg_n_0_[1]\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED_reg_n_0_[2]\ : STD_LOGIC;
  signal ANGLE_IBUF : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal CLK_IBUF : STD_LOGIC;
  signal CLK_IBUF_BUFG : STD_LOGIC;
  signal GT_180 : STD_LOGIC;
  signal NEG_FLAG : STD_LOGIC;
  signal NEG_FLAG_i_1_n_0 : STD_LOGIC;
  signal RESET_IBUF : STD_LOGIC;
  signal \SINE[0]_i_2_n_0\ : STD_LOGIC;
  signal \SINE[0]_i_3_n_0\ : STD_LOGIC;
  signal \SINE[1]_i_4_n_0\ : STD_LOGIC;
  signal \SINE[1]_i_5_n_0\ : STD_LOGIC;
  signal \SINE[1]_i_6_n_0\ : STD_LOGIC;
  signal \SINE[1]_i_7_n_0\ : STD_LOGIC;
  signal \SINE[2]_i_4_n_0\ : STD_LOGIC;
  signal \SINE[2]_i_5_n_0\ : STD_LOGIC;
  signal \SINE[2]_i_6_n_0\ : STD_LOGIC;
  signal \SINE[2]_i_7_n_0\ : STD_LOGIC;
  signal \SINE[3]_i_4_n_0\ : STD_LOGIC;
  signal \SINE[3]_i_5_n_0\ : STD_LOGIC;
  signal \SINE[3]_i_6_n_0\ : STD_LOGIC;
  signal \SINE[3]_i_7_n_0\ : STD_LOGIC;
  signal \SINE[4]_i_4_n_0\ : STD_LOGIC;
  signal \SINE[4]_i_5_n_0\ : STD_LOGIC;
  signal \SINE[4]_i_6_n_0\ : STD_LOGIC;
  signal \SINE[4]_i_7_n_0\ : STD_LOGIC;
  signal \SINE[5]_i_1_n_0\ : STD_LOGIC;
  signal \SINE[5]_i_2_n_0\ : STD_LOGIC;
  signal \SINE[5]_i_3_n_0\ : STD_LOGIC;
  signal \SINE[6]_i_1_n_0\ : STD_LOGIC;
  signal \SINE[6]_i_2_n_0\ : STD_LOGIC;
  signal \SINE[6]_i_3_n_0\ : STD_LOGIC;
  signal \SINE[6]_i_4_n_0\ : STD_LOGIC;
  signal \SINE[7]_i_2_n_0\ : STD_LOGIC;
  signal \SINE[7]_i_3_n_0\ : STD_LOGIC;
  signal \SINE[7]_i_4_n_0\ : STD_LOGIC;
  signal \SINE[7]_i_5_n_0\ : STD_LOGIC;
  signal \SINE[7]_i_6_n_0\ : STD_LOGIC;
  signal \SINE[8]_i_1_n_0\ : STD_LOGIC;
  signal \SINE[8]_i_2_n_0\ : STD_LOGIC;
  signal \SINE[8]_i_3_n_0\ : STD_LOGIC;
  signal \SINE[9]_i_1_n_0\ : STD_LOGIC;
  signal \SINE[9]_i_2_n_0\ : STD_LOGIC;
  signal SINE_OBUF : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \SINE_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \SINE_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \SINE_reg[1]_i_2_n_0\ : STD_LOGIC;
  signal \SINE_reg[1]_i_3_n_0\ : STD_LOGIC;
  signal \SINE_reg[2]_i_1_n_0\ : STD_LOGIC;
  signal \SINE_reg[2]_i_2_n_0\ : STD_LOGIC;
  signal \SINE_reg[2]_i_3_n_0\ : STD_LOGIC;
  signal \SINE_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \SINE_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \SINE_reg[3]_i_3_n_0\ : STD_LOGIC;
  signal \SINE_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \SINE_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \SINE_reg[4]_i_3_n_0\ : STD_LOGIC;
  signal \SINE_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal sel0 : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ANGLE_ADJUSTED[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \ANGLE_ADJUSTED[3]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \ANGLE_ADJUSTED[4]_i_4\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \ANGLE_ADJUSTED[4]_i_5\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \ANGLE_ADJUSTED[5]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \ANGLE_ADJUSTED[5]_i_3\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \ANGLE_ADJUSTED[5]_i_5\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \ANGLE_ADJUSTED[6]_i_4\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \ANGLE_ADJUSTED[6]_i_5\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of NEG_FLAG_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \SINE[7]_i_4\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \SINE[7]_i_6\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \SINE[8]_i_2\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \SINE[9]_i_2\ : label is "soft_lutpair6";
begin
\ANGLE_ADJUSTED[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A857FF00"
    )
        port map (
      I0 => \ANGLE_ADJUSTED[6]_i_3_n_0\,
      I1 => \ANGLE_ADJUSTED[3]_i_2_n_0\,
      I2 => GT_180,
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(0),
      O => \ANGLE_ADJUSTED[1]_i_1_n_0\
    );
\ANGLE_ADJUSTED[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5050504FAFAFAFB0"
    )
        port map (
      I0 => GT_180,
      I1 => \ANGLE_ADJUSTED[3]_i_2_n_0\,
      I2 => \ANGLE_ADJUSTED[6]_i_3_n_0\,
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(0),
      I5 => ANGLE_IBUF(2),
      O => \ANGLE_ADJUSTED[2]_i_1_n_0\
    );
\ANGLE_ADJUSTED[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF0050AFEF105FA0"
    )
        port map (
      I0 => GT_180,
      I1 => \ANGLE_ADJUSTED[3]_i_2_n_0\,
      I2 => \ANGLE_ADJUSTED[6]_i_3_n_0\,
      I3 => ANGLE_IBUF(3),
      I4 => ANGLE_IBUF(2),
      I5 => \ANGLE_ADJUSTED[3]_i_3_n_0\,
      O => \ANGLE_ADJUSTED[3]_i_1_n_0\
    );
\ANGLE_ADJUSTED[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1011"
    )
        port map (
      I0 => ANGLE_IBUF(8),
      I1 => ANGLE_IBUF(7),
      I2 => \ANGLE_ADJUSTED[6]_i_7_n_0\,
      I3 => ANGLE_IBUF(6),
      O => \ANGLE_ADJUSTED[3]_i_2_n_0\
    );
\ANGLE_ADJUSTED[3]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ANGLE_IBUF(1),
      I1 => ANGLE_IBUF(0),
      O => \ANGLE_ADJUSTED[3]_i_3_n_0\
    );
\ANGLE_ADJUSTED[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B80074FFB8FF7400"
    )
        port map (
      I0 => \ANGLE_ADJUSTED[4]_i_2_n_0\,
      I1 => GT_180,
      I2 => \ANGLE_ADJUSTED[4]_i_3_n_0\,
      I3 => \ANGLE_ADJUSTED[6]_i_3_n_0\,
      I4 => ANGLE_IBUF(4),
      I5 => \ANGLE_ADJUSTED[4]_i_4_n_0\,
      O => \ANGLE_ADJUSTED[4]_i_1_n_0\
    );
\ANGLE_ADJUSTED[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ANGLE_IBUF(2),
      I1 => ANGLE_IBUF(3),
      O => \ANGLE_ADJUSTED[4]_i_2_n_0\
    );
\ANGLE_ADJUSTED[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1011EFEEFFFF0000"
    )
        port map (
      I0 => ANGLE_IBUF(8),
      I1 => ANGLE_IBUF(7),
      I2 => \ANGLE_ADJUSTED[6]_i_7_n_0\,
      I3 => ANGLE_IBUF(6),
      I4 => ANGLE_IBUF(4),
      I5 => \ANGLE_ADJUSTED[4]_i_5_n_0\,
      O => \ANGLE_ADJUSTED[4]_i_3_n_0\
    );
\ANGLE_ADJUSTED[4]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA8"
    )
        port map (
      I0 => ANGLE_IBUF(3),
      I1 => ANGLE_IBUF(2),
      I2 => ANGLE_IBUF(1),
      I3 => ANGLE_IBUF(0),
      O => \ANGLE_ADJUSTED[4]_i_4_n_0\
    );
\ANGLE_ADJUSTED[4]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0155"
    )
        port map (
      I0 => ANGLE_IBUF(3),
      I1 => ANGLE_IBUF(1),
      I2 => ANGLE_IBUF(0),
      I3 => ANGLE_IBUF(2),
      O => \ANGLE_ADJUSTED[4]_i_5_n_0\
    );
\ANGLE_ADJUSTED[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B80074FFB8FF7400"
    )
        port map (
      I0 => \ANGLE_ADJUSTED[5]_i_2_n_0\,
      I1 => GT_180,
      I2 => \ANGLE_ADJUSTED[5]_i_4_n_0\,
      I3 => \ANGLE_ADJUSTED[6]_i_3_n_0\,
      I4 => ANGLE_IBUF(5),
      I5 => \ANGLE_ADJUSTED[6]_i_4_n_0\,
      O => \ANGLE_ADJUSTED[5]_i_1_n_0\
    );
\ANGLE_ADJUSTED[5]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1F"
    )
        port map (
      I0 => ANGLE_IBUF(3),
      I1 => ANGLE_IBUF(2),
      I2 => ANGLE_IBUF(4),
      O => \ANGLE_ADJUSTED[5]_i_2_n_0\
    );
\ANGLE_ADJUSTED[5]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFA8"
    )
        port map (
      I0 => ANGLE_IBUF(7),
      I1 => \ANGLE_ADJUSTED[6]_i_6_n_0\,
      I2 => ANGLE_IBUF(6),
      I3 => ANGLE_IBUF(8),
      O => GT_180
    );
\ANGLE_ADJUSTED[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF00001011EFEE"
    )
        port map (
      I0 => ANGLE_IBUF(8),
      I1 => ANGLE_IBUF(7),
      I2 => \ANGLE_ADJUSTED[6]_i_7_n_0\,
      I3 => ANGLE_IBUF(6),
      I4 => ANGLE_IBUF(5),
      I5 => \ANGLE_ADJUSTED[5]_i_5_n_0\,
      O => \ANGLE_ADJUSTED[5]_i_4_n_0\
    );
\ANGLE_ADJUSTED[5]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAA8880"
    )
        port map (
      I0 => ANGLE_IBUF(4),
      I1 => ANGLE_IBUF(2),
      I2 => ANGLE_IBUF(0),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(3),
      O => \ANGLE_ADJUSTED[5]_i_5_n_0\
    );
\ANGLE_ADJUSTED[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8BB88B8B"
    )
        port map (
      I0 => \ANGLE_ADJUSTED[6]_i_2_n_0\,
      I1 => \ANGLE_ADJUSTED[6]_i_3_n_0\,
      I2 => ANGLE_IBUF(6),
      I3 => \ANGLE_ADJUSTED[6]_i_4_n_0\,
      I4 => ANGLE_IBUF(5),
      O => \ANGLE_ADJUSTED[6]_i_1_n_0\
    );
\ANGLE_ADJUSTED[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAABB80AAAA8B80"
    )
        port map (
      I0 => \ANGLE_ADJUSTED[6]_i_5_n_0\,
      I1 => ANGLE_IBUF(7),
      I2 => \ANGLE_ADJUSTED[6]_i_6_n_0\,
      I3 => ANGLE_IBUF(6),
      I4 => ANGLE_IBUF(8),
      I5 => \ANGLE_ADJUSTED[6]_i_7_n_0\,
      O => \ANGLE_ADJUSTED[6]_i_2_n_0\
    );
\ANGLE_ADJUSTED[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"15555555FFFFFFFF"
    )
        port map (
      I0 => \ANGLE_ADJUSTED[6]_i_8_n_0\,
      I1 => ANGLE_IBUF(0),
      I2 => ANGLE_IBUF(1),
      I3 => ANGLE_IBUF(3),
      I4 => ANGLE_IBUF(2),
      I5 => ANGLE_IBUF(8),
      O => \ANGLE_ADJUSTED[6]_i_3_n_0\
    );
\ANGLE_ADJUSTED[6]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00015555"
    )
        port map (
      I0 => ANGLE_IBUF(4),
      I1 => ANGLE_IBUF(0),
      I2 => ANGLE_IBUF(1),
      I3 => ANGLE_IBUF(2),
      I4 => ANGLE_IBUF(3),
      O => \ANGLE_ADJUSTED[6]_i_4_n_0\
    );
\ANGLE_ADJUSTED[6]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A9555555"
    )
        port map (
      I0 => ANGLE_IBUF(6),
      I1 => ANGLE_IBUF(3),
      I2 => ANGLE_IBUF(2),
      I3 => ANGLE_IBUF(4),
      I4 => ANGLE_IBUF(5),
      O => \ANGLE_ADJUSTED[6]_i_5_n_0\
    );
\ANGLE_ADJUSTED[6]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEAA000000000000"
    )
        port map (
      I0 => ANGLE_IBUF(3),
      I1 => ANGLE_IBUF(1),
      I2 => ANGLE_IBUF(0),
      I3 => ANGLE_IBUF(2),
      I4 => ANGLE_IBUF(4),
      I5 => ANGLE_IBUF(5),
      O => \ANGLE_ADJUSTED[6]_i_6_n_0\
    );
\ANGLE_ADJUSTED[6]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0111555555555555"
    )
        port map (
      I0 => ANGLE_IBUF(5),
      I1 => ANGLE_IBUF(2),
      I2 => ANGLE_IBUF(0),
      I3 => ANGLE_IBUF(1),
      I4 => ANGLE_IBUF(4),
      I5 => ANGLE_IBUF(3),
      O => \ANGLE_ADJUSTED[6]_i_7_n_0\
    );
\ANGLE_ADJUSTED[6]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => ANGLE_IBUF(4),
      I1 => ANGLE_IBUF(5),
      I2 => ANGLE_IBUF(6),
      I3 => ANGLE_IBUF(7),
      O => \ANGLE_ADJUSTED[6]_i_8_n_0\
    );
\ANGLE_ADJUSTED_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => ANGLE_IBUF(0),
      Q => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      R => '0'
    );
\ANGLE_ADJUSTED_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \ANGLE_ADJUSTED[1]_i_1_n_0\,
      Q => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      R => '0'
    );
\ANGLE_ADJUSTED_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \ANGLE_ADJUSTED[2]_i_1_n_0\,
      Q => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      R => '0'
    );
\ANGLE_ADJUSTED_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \ANGLE_ADJUSTED[3]_i_1_n_0\,
      Q => sel0(0),
      R => '0'
    );
\ANGLE_ADJUSTED_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \ANGLE_ADJUSTED[4]_i_1_n_0\,
      Q => sel0(1),
      R => '0'
    );
\ANGLE_ADJUSTED_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \ANGLE_ADJUSTED[5]_i_1_n_0\,
      Q => sel0(2),
      R => '0'
    );
\ANGLE_ADJUSTED_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \ANGLE_ADJUSTED[6]_i_1_n_0\,
      Q => sel0(3),
      R => '0'
    );
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
NEG_FLAG_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => GT_180,
      I1 => \ANGLE_ADJUSTED[6]_i_3_n_0\,
      O => NEG_FLAG_i_1_n_0
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
\SINE[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DCF4CFEF63587012"
    )
        port map (
      I0 => sel0(2),
      I1 => sel0(1),
      I2 => sel0(0),
      I3 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      O => \SINE[0]_i_2_n_0\
    );
\SINE[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"01EEEE4111FE1150"
    )
        port map (
      I0 => sel0(2),
      I1 => sel0(1),
      I2 => sel0(0),
      I3 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      O => \SINE[0]_i_3_n_0\
    );
\SINE[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E65DC7CEC4C4F16E"
    )
        port map (
      I0 => sel0(2),
      I1 => sel0(1),
      I2 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I3 => sel0(0),
      I4 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      O => \SINE[1]_i_4_n_0\
    );
\SINE[1]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE01EF10114100FB"
    )
        port map (
      I0 => sel0(2),
      I1 => sel0(1),
      I2 => sel0(0),
      I3 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      O => \SINE[1]_i_5_n_0\
    );
\SINE[1]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"399903ABAF26860C"
    )
        port map (
      I0 => sel0(2),
      I1 => sel0(1),
      I2 => sel0(0),
      I3 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      O => \SINE[1]_i_6_n_0\
    );
\SINE[1]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFFEEEFF0011AB"
    )
        port map (
      I0 => sel0(2),
      I1 => sel0(1),
      I2 => sel0(0),
      I3 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      O => \SINE[1]_i_7_n_0\
    );
\SINE[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0A2B11917D4AE66E"
    )
        port map (
      I0 => sel0(2),
      I1 => sel0(1),
      I2 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I4 => sel0(0),
      I5 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      O => \SINE[2]_i_4_n_0\
    );
\SINE[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFDFF365D"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I3 => sel0(0),
      I4 => sel0(1),
      I5 => sel0(2),
      O => \SINE[2]_i_5_n_0\
    );
\SINE[2]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FC6E8339C64738B0"
    )
        port map (
      I0 => sel0(2),
      I1 => sel0(1),
      I2 => sel0(0),
      I3 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      O => \SINE[2]_i_6_n_0\
    );
\SINE[2]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1100100101BEAF14"
    )
        port map (
      I0 => sel0(2),
      I1 => sel0(1),
      I2 => sel0(0),
      I3 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      O => \SINE[2]_i_7_n_0\
    );
\SINE[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2A5F11F7D484E688"
    )
        port map (
      I0 => sel0(2),
      I1 => sel0(1),
      I2 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I4 => sel0(0),
      I5 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      O => \SINE[3]_i_4_n_0\
    );
\SINE[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFBFFA86E"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I3 => sel0(0),
      I4 => sel0(1),
      I5 => sel0(2),
      O => \SINE[3]_i_5_n_0\
    );
\SINE[3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DC31A0774EB189F6"
    )
        port map (
      I0 => sel0(2),
      I1 => sel0(1),
      I2 => sel0(0),
      I3 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      O => \SINE[3]_i_6_n_0\
    );
\SINE[3]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000010444455"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(0),
      I2 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I5 => sel0(2),
      O => \SINE[3]_i_7_n_0\
    );
\SINE[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"27FF9777D8886008"
    )
        port map (
      I0 => sel0(2),
      I1 => sel0(1),
      I2 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I4 => sel0(0),
      I5 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      O => \SINE[4]_i_4_n_0\
    );
\SINE[4]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFDFFEAAA"
    )
        port map (
      I0 => sel0(0),
      I1 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I4 => sel0(1),
      I5 => sel0(2),
      O => \SINE[4]_i_5_n_0\
    );
\SINE[4]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D408880839777F76"
    )
        port map (
      I0 => sel0(2),
      I1 => sel0(1),
      I2 => sel0(0),
      I3 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      O => \SINE[4]_i_6_n_0\
    );
\SINE[4]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000001555"
    )
        port map (
      I0 => sel0(1),
      I1 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I4 => sel0(0),
      I5 => sel0(2),
      O => \SINE[4]_i_7_n_0\
    );
\SINE[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \SINE[5]_i_2_n_0\,
      I1 => NEG_FLAG,
      I2 => \SINE[6]_i_3_n_0\,
      I3 => sel0(3),
      I4 => \SINE[5]_i_3_n_0\,
      O => \SINE[5]_i_1_n_0\
    );
\SINE[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5B0F8F8F8F8F8786"
    )
        port map (
      I0 => sel0(2),
      I1 => sel0(1),
      I2 => sel0(0),
      I3 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      O => \SINE[5]_i_2_n_0\
    );
\SINE[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A7F7777760000008"
    )
        port map (
      I0 => sel0(2),
      I1 => sel0(1),
      I2 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I5 => sel0(0),
      O => \SINE[5]_i_3_n_0\
    );
\SINE[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \SINE[6]_i_2_n_0\,
      I1 => NEG_FLAG,
      I2 => \SINE[6]_i_3_n_0\,
      I3 => sel0(3),
      I4 => \SINE[6]_i_4_n_0\,
      O => \SINE[6]_i_1_n_0\
    );
\SINE[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6333333333333B3A"
    )
        port map (
      I0 => sel0(2),
      I1 => sel0(1),
      I2 => sel0(0),
      I3 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      O => \SINE[6]_i_2_n_0\
    );
\SINE[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFF7FFFF"
    )
        port map (
      I0 => sel0(1),
      I1 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I4 => sel0(0),
      I5 => sel0(2),
      O => \SINE[6]_i_3_n_0\
    );
\SINE[6]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9CCCCCCCCCCCCCC4"
    )
        port map (
      I0 => sel0(2),
      I1 => sel0(1),
      I2 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I5 => sel0(0),
      O => \SINE[6]_i_4_n_0\
    );
\SINE[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFBC8C8C8C"
    )
        port map (
      I0 => \SINE[7]_i_4_n_0\,
      I1 => sel0(3),
      I2 => sel0(1),
      I3 => \SINE[7]_i_5_n_0\,
      I4 => sel0(0),
      I5 => sel0(2),
      O => \SINE[7]_i_2_n_0\
    );
\SINE[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000045455550"
    )
        port map (
      I0 => sel0(2),
      I1 => \SINE[7]_i_6_n_0\,
      I2 => sel0(1),
      I3 => \SINE[9]_i_2_n_0\,
      I4 => sel0(0),
      I5 => sel0(3),
      O => \SINE[7]_i_3_n_0\
    );
\SINE[7]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FDFF"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I3 => sel0(0),
      O => \SINE[7]_i_4_n_0\
    );
\SINE[7]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      O => \SINE[7]_i_5_n_0\
    );
\SINE[7]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      O => \SINE[7]_i_6_n_0\
    );
\SINE[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFF00FE00FE00"
    )
        port map (
      I0 => sel0(2),
      I1 => \SINE[8]_i_2_n_0\,
      I2 => sel0(1),
      I3 => NEG_FLAG,
      I4 => \SINE[8]_i_3_n_0\,
      I5 => sel0(3),
      O => \SINE[8]_i_1_n_0\
    );
\SINE[8]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I3 => sel0(0),
      O => \SINE[8]_i_2_n_0\
    );
\SINE[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000080000"
    )
        port map (
      I0 => sel0(1),
      I1 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I4 => sel0(0),
      I5 => sel0(2),
      O => \SINE[8]_i_3_n_0\
    );
\SINE[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000000"
    )
        port map (
      I0 => sel0(3),
      I1 => sel0(1),
      I2 => \SINE[9]_i_2_n_0\,
      I3 => sel0(0),
      I4 => sel0(2),
      I5 => NEG_FLAG,
      O => \SINE[9]_i_1_n_0\
    );
\SINE[9]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      O => \SINE[9]_i_2_n_0\
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
      D => \SINE_reg[0]_i_1_n_0\,
      Q => SINE_OBUF(0),
      R => RESET_IBUF
    );
\SINE_reg[0]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[0]_i_2_n_0\,
      I1 => \SINE[0]_i_3_n_0\,
      O => \SINE_reg[0]_i_1_n_0\,
      S => sel0(3)
    );
\SINE_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \SINE_reg[1]_i_1_n_0\,
      Q => SINE_OBUF(1),
      R => RESET_IBUF
    );
\SINE_reg[1]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \SINE_reg[1]_i_2_n_0\,
      I1 => \SINE_reg[1]_i_3_n_0\,
      O => \SINE_reg[1]_i_1_n_0\,
      S => NEG_FLAG
    );
\SINE_reg[1]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[1]_i_4_n_0\,
      I1 => \SINE[1]_i_5_n_0\,
      O => \SINE_reg[1]_i_2_n_0\,
      S => sel0(3)
    );
\SINE_reg[1]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[1]_i_6_n_0\,
      I1 => \SINE[1]_i_7_n_0\,
      O => \SINE_reg[1]_i_3_n_0\,
      S => sel0(3)
    );
\SINE_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \SINE_reg[2]_i_1_n_0\,
      Q => SINE_OBUF(2),
      R => RESET_IBUF
    );
\SINE_reg[2]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \SINE_reg[2]_i_2_n_0\,
      I1 => \SINE_reg[2]_i_3_n_0\,
      O => \SINE_reg[2]_i_1_n_0\,
      S => NEG_FLAG
    );
\SINE_reg[2]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[2]_i_4_n_0\,
      I1 => \SINE[2]_i_5_n_0\,
      O => \SINE_reg[2]_i_2_n_0\,
      S => sel0(3)
    );
\SINE_reg[2]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[2]_i_6_n_0\,
      I1 => \SINE[2]_i_7_n_0\,
      O => \SINE_reg[2]_i_3_n_0\,
      S => sel0(3)
    );
\SINE_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \SINE_reg[3]_i_1_n_0\,
      Q => SINE_OBUF(3),
      R => RESET_IBUF
    );
\SINE_reg[3]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \SINE_reg[3]_i_2_n_0\,
      I1 => \SINE_reg[3]_i_3_n_0\,
      O => \SINE_reg[3]_i_1_n_0\,
      S => NEG_FLAG
    );
\SINE_reg[3]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[3]_i_4_n_0\,
      I1 => \SINE[3]_i_5_n_0\,
      O => \SINE_reg[3]_i_2_n_0\,
      S => sel0(3)
    );
\SINE_reg[3]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[3]_i_6_n_0\,
      I1 => \SINE[3]_i_7_n_0\,
      O => \SINE_reg[3]_i_3_n_0\,
      S => sel0(3)
    );
\SINE_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \SINE_reg[4]_i_1_n_0\,
      Q => SINE_OBUF(4),
      R => RESET_IBUF
    );
\SINE_reg[4]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \SINE_reg[4]_i_2_n_0\,
      I1 => \SINE_reg[4]_i_3_n_0\,
      O => \SINE_reg[4]_i_1_n_0\,
      S => NEG_FLAG
    );
\SINE_reg[4]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[4]_i_4_n_0\,
      I1 => \SINE[4]_i_5_n_0\,
      O => \SINE_reg[4]_i_2_n_0\,
      S => sel0(3)
    );
\SINE_reg[4]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[4]_i_6_n_0\,
      I1 => \SINE[4]_i_7_n_0\,
      O => \SINE_reg[4]_i_3_n_0\,
      S => sel0(3)
    );
\SINE_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \SINE[5]_i_1_n_0\,
      Q => SINE_OBUF(5),
      R => RESET_IBUF
    );
\SINE_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \SINE[6]_i_1_n_0\,
      Q => SINE_OBUF(6),
      R => RESET_IBUF
    );
\SINE_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \SINE_reg[7]_i_1_n_0\,
      Q => SINE_OBUF(7),
      R => RESET_IBUF
    );
\SINE_reg[7]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE[7]_i_2_n_0\,
      I1 => \SINE[7]_i_3_n_0\,
      O => \SINE_reg[7]_i_1_n_0\,
      S => NEG_FLAG
    );
\SINE_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \SINE[8]_i_1_n_0\,
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
      D => \SINE[9]_i_1_n_0\,
      Q => SINE_OBUF(9),
      R => RESET_IBUF
    );
end STRUCTURE;
