-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Sun Nov 17 10:07:31 2024
-- Host        : Laptop-ASH running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file {C:/Users/ultro/OneDrive/ALTRO/Desktop/PRL
--               OCT10/ProgettoRetiLogiche_2024/FIXED_POINT_SIN/FIXED_POINT_SIN.sim/sim_1/impl/func/xsim/TB_SINE_func_impl.vhd}
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
  attribute ECO_CHECKSUM of SINE_CALCULATOR : entity is "e03c5cb8";
  attribute M : integer;
  attribute M of SINE_CALCULATOR : entity is 9;
  attribute N : integer;
  attribute N of SINE_CALCULATOR : entity is 10;
end SINE_CALCULATOR;

architecture STRUCTURE of SINE_CALCULATOR is
  signal \ANGLE_ADJUSTED[1]_i_1_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[2]_i_1_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[3]_i_1_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[4]_i_1_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[4]_i_2_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[5]_i_1_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[5]_i_2_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[5]_i_3_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[6]_i_1_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[6]_i_2_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[6]_i_3_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED[6]_i_4_n_0\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED_reg_n_0_[0]\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED_reg_n_0_[1]\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED_reg_n_0_[2]\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED_reg_n_0_[3]\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED_reg_n_0_[4]\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED_reg_n_0_[5]\ : STD_LOGIC;
  signal \ANGLE_ADJUSTED_reg_n_0_[6]\ : STD_LOGIC;
  signal ANGLE_IBUF : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal ANGLE_REG : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \ANGLE_REG_reg_n_0_[7]\ : STD_LOGIC;
  signal \ANGLE_REG_reg_n_0_[8]\ : STD_LOGIC;
  signal CLK_IBUF : STD_LOGIC;
  signal CLK_IBUF_BUFG : STD_LOGIC;
  signal QUADRANT : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \QUADRANT[0]_i_2_n_0\ : STD_LOGIC;
  signal \QUADRANT[0]_i_3_n_0\ : STD_LOGIC;
  signal \QUADRANT[1]_i_2_n_0\ : STD_LOGIC;
  signal \QUADRANT[1]_i_3_n_0\ : STD_LOGIC;
  signal \QUADRANT_reg_n_0_[0]\ : STD_LOGIC;
  signal RESET_IBUF : STD_LOGIC;
  signal \SINE_FINAL[0]_i_2_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[0]_i_3_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[1]_i_4_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[1]_i_5_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[1]_i_6_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[1]_i_7_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[2]_i_4_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[2]_i_5_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[2]_i_6_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[2]_i_7_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[3]_i_4_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[3]_i_5_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[3]_i_6_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[3]_i_7_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[4]_i_4_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[4]_i_5_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[4]_i_6_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[4]_i_7_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[5]_i_1_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[5]_i_2_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[5]_i_3_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[6]_i_1_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[6]_i_2_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[6]_i_3_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[7]_i_1_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[7]_i_2_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[7]_i_3_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[7]_i_4_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[8]_i_1_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[8]_i_2_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[8]_i_3_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[9]_i_1_n_0\ : STD_LOGIC;
  signal \SINE_FINAL[9]_i_2_n_0\ : STD_LOGIC;
  signal \SINE_FINAL_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \SINE_FINAL_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \SINE_FINAL_reg[1]_i_2_n_0\ : STD_LOGIC;
  signal \SINE_FINAL_reg[1]_i_3_n_0\ : STD_LOGIC;
  signal \SINE_FINAL_reg[2]_i_1_n_0\ : STD_LOGIC;
  signal \SINE_FINAL_reg[2]_i_2_n_0\ : STD_LOGIC;
  signal \SINE_FINAL_reg[2]_i_3_n_0\ : STD_LOGIC;
  signal \SINE_FINAL_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \SINE_FINAL_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \SINE_FINAL_reg[3]_i_3_n_0\ : STD_LOGIC;
  signal \SINE_FINAL_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \SINE_FINAL_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \SINE_FINAL_reg[4]_i_3_n_0\ : STD_LOGIC;
  signal SINE_NEG : STD_LOGIC;
  signal SINE_OBUF : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \SUB_REG_MINUS_180/SUB_RCA/C_5\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ANGLE_ADJUSTED[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \ANGLE_ADJUSTED[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \ANGLE_ADJUSTED[4]_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \ANGLE_ADJUSTED[5]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \ANGLE_ADJUSTED[5]_i_3\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \ANGLE_ADJUSTED[5]_i_4\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \ANGLE_ADJUSTED[6]_i_4\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \QUADRANT[0]_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \SINE_FINAL[7]_i_3\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \SINE_FINAL[8]_i_2\ : label is "soft_lutpair1";
begin
\ANGLE_ADJUSTED[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => ANGLE_REG(1),
      I1 => ANGLE_REG(0),
      I2 => \QUADRANT_reg_n_0_[0]\,
      O => \ANGLE_ADJUSTED[1]_i_1_n_0\
    );
\ANGLE_ADJUSTED[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5655A9AA"
    )
        port map (
      I0 => ANGLE_REG(2),
      I1 => ANGLE_REG(0),
      I2 => ANGLE_REG(1),
      I3 => \QUADRANT_reg_n_0_[0]\,
      I4 => p_0_in,
      O => \ANGLE_ADJUSTED[2]_i_1_n_0\
    );
\ANGLE_ADJUSTED[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA9AA5556AAAAAA"
    )
        port map (
      I0 => ANGLE_REG(3),
      I1 => ANGLE_REG(1),
      I2 => ANGLE_REG(0),
      I3 => ANGLE_REG(2),
      I4 => \QUADRANT_reg_n_0_[0]\,
      I5 => p_0_in,
      O => \ANGLE_ADJUSTED[3]_i_1_n_0\
    );
\ANGLE_ADJUSTED[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"59AA555AAA65AAAA"
    )
        port map (
      I0 => ANGLE_REG(4),
      I1 => \ANGLE_ADJUSTED[4]_i_2_n_0\,
      I2 => ANGLE_REG(2),
      I3 => ANGLE_REG(3),
      I4 => \QUADRANT_reg_n_0_[0]\,
      I5 => p_0_in,
      O => \ANGLE_ADJUSTED[4]_i_1_n_0\
    );
\ANGLE_ADJUSTED[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ANGLE_REG(0),
      I1 => ANGLE_REG(1),
      O => \ANGLE_ADJUSTED[4]_i_2_n_0\
    );
\ANGLE_ADJUSTED[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3C3366CC3CCC66CC"
    )
        port map (
      I0 => \ANGLE_ADJUSTED[5]_i_2_n_0\,
      I1 => ANGLE_REG(5),
      I2 => \ANGLE_ADJUSTED[5]_i_3_n_0\,
      I3 => \QUADRANT_reg_n_0_[0]\,
      I4 => p_0_in,
      I5 => \SUB_REG_MINUS_180/SUB_RCA/C_5\,
      O => \ANGLE_ADJUSTED[5]_i_1_n_0\
    );
\ANGLE_ADJUSTED[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0057FFFF"
    )
        port map (
      I0 => ANGLE_REG(2),
      I1 => ANGLE_REG(1),
      I2 => ANGLE_REG(0),
      I3 => ANGLE_REG(3),
      I4 => ANGLE_REG(4),
      O => \ANGLE_ADJUSTED[5]_i_2_n_0\
    );
\ANGLE_ADJUSTED[5]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00005557"
    )
        port map (
      I0 => ANGLE_REG(3),
      I1 => ANGLE_REG(2),
      I2 => ANGLE_REG(0),
      I3 => ANGLE_REG(1),
      I4 => ANGLE_REG(4),
      O => \ANGLE_ADJUSTED[5]_i_3_n_0\
    );
\ANGLE_ADJUSTED[5]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => ANGLE_REG(2),
      I1 => ANGLE_REG(3),
      I2 => ANGLE_REG(4),
      O => \SUB_REG_MINUS_180/SUB_RCA/C_5\
    );
\ANGLE_ADJUSTED[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3CFF99CC3C0099CC"
    )
        port map (
      I0 => \ANGLE_ADJUSTED[6]_i_2_n_0\,
      I1 => ANGLE_REG(6),
      I2 => \ANGLE_ADJUSTED[6]_i_3_n_0\,
      I3 => \QUADRANT_reg_n_0_[0]\,
      I4 => p_0_in,
      I5 => \ANGLE_ADJUSTED[6]_i_4_n_0\,
      O => \ANGLE_ADJUSTED[6]_i_1_n_0\
    );
\ANGLE_ADJUSTED[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0057FFFFFFFFFFFF"
    )
        port map (
      I0 => ANGLE_REG(2),
      I1 => ANGLE_REG(1),
      I2 => ANGLE_REG(0),
      I3 => ANGLE_REG(3),
      I4 => ANGLE_REG(4),
      I5 => ANGLE_REG(5),
      O => \ANGLE_ADJUSTED[6]_i_2_n_0\
    );
\ANGLE_ADJUSTED[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00005557FFFFFFFF"
    )
        port map (
      I0 => ANGLE_REG(3),
      I1 => ANGLE_REG(2),
      I2 => ANGLE_REG(0),
      I3 => ANGLE_REG(1),
      I4 => ANGLE_REG(4),
      I5 => ANGLE_REG(5),
      O => \ANGLE_ADJUSTED[6]_i_3_n_0\
    );
\ANGLE_ADJUSTED[6]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A80057FF"
    )
        port map (
      I0 => ANGLE_REG(5),
      I1 => ANGLE_REG(2),
      I2 => ANGLE_REG(3),
      I3 => ANGLE_REG(4),
      I4 => ANGLE_REG(6),
      O => \ANGLE_ADJUSTED[6]_i_4_n_0\
    );
\ANGLE_ADJUSTED_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => RESET_IBUF,
      D => ANGLE_REG(0),
      Q => \ANGLE_ADJUSTED_reg_n_0_[0]\
    );
\ANGLE_ADJUSTED_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => RESET_IBUF,
      D => \ANGLE_ADJUSTED[1]_i_1_n_0\,
      Q => \ANGLE_ADJUSTED_reg_n_0_[1]\
    );
\ANGLE_ADJUSTED_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => RESET_IBUF,
      D => \ANGLE_ADJUSTED[2]_i_1_n_0\,
      Q => \ANGLE_ADJUSTED_reg_n_0_[2]\
    );
\ANGLE_ADJUSTED_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => RESET_IBUF,
      D => \ANGLE_ADJUSTED[3]_i_1_n_0\,
      Q => \ANGLE_ADJUSTED_reg_n_0_[3]\
    );
\ANGLE_ADJUSTED_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => RESET_IBUF,
      D => \ANGLE_ADJUSTED[4]_i_1_n_0\,
      Q => \ANGLE_ADJUSTED_reg_n_0_[4]\
    );
\ANGLE_ADJUSTED_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => RESET_IBUF,
      D => \ANGLE_ADJUSTED[5]_i_1_n_0\,
      Q => \ANGLE_ADJUSTED_reg_n_0_[5]\
    );
\ANGLE_ADJUSTED_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => RESET_IBUF,
      D => \ANGLE_ADJUSTED[6]_i_1_n_0\,
      Q => \ANGLE_ADJUSTED_reg_n_0_[6]\
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
\ANGLE_REG_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => RESET_IBUF,
      D => ANGLE_IBUF(0),
      Q => ANGLE_REG(0)
    );
\ANGLE_REG_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => RESET_IBUF,
      D => ANGLE_IBUF(1),
      Q => ANGLE_REG(1)
    );
\ANGLE_REG_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => RESET_IBUF,
      D => ANGLE_IBUF(2),
      Q => ANGLE_REG(2)
    );
\ANGLE_REG_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => RESET_IBUF,
      D => ANGLE_IBUF(3),
      Q => ANGLE_REG(3)
    );
\ANGLE_REG_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => RESET_IBUF,
      D => ANGLE_IBUF(4),
      Q => ANGLE_REG(4)
    );
\ANGLE_REG_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => RESET_IBUF,
      D => ANGLE_IBUF(5),
      Q => ANGLE_REG(5)
    );
\ANGLE_REG_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => RESET_IBUF,
      D => ANGLE_IBUF(6),
      Q => ANGLE_REG(6)
    );
\ANGLE_REG_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => RESET_IBUF,
      D => ANGLE_IBUF(7),
      Q => \ANGLE_REG_reg_n_0_[7]\
    );
\ANGLE_REG_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => RESET_IBUF,
      D => ANGLE_IBUF(8),
      Q => \ANGLE_REG_reg_n_0_[8]\
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
\QUADRANT[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFB0FFB0FFB000B0"
    )
        port map (
      I0 => \ANGLE_REG_reg_n_0_[7]\,
      I1 => \QUADRANT[1]_i_3_n_0\,
      I2 => \QUADRANT[1]_i_2_n_0\,
      I3 => \ANGLE_REG_reg_n_0_[8]\,
      I4 => \QUADRANT[0]_i_2_n_0\,
      I5 => \QUADRANT[0]_i_3_n_0\,
      O => QUADRANT(0)
    );
\QUADRANT[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ANGLE_REG(1),
      I1 => ANGLE_REG(3),
      I2 => ANGLE_REG(2),
      O => \QUADRANT[0]_i_2_n_0\
    );
\QUADRANT[0]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => ANGLE_REG(5),
      I1 => ANGLE_REG(4),
      I2 => \ANGLE_REG_reg_n_0_[7]\,
      I3 => ANGLE_REG(6),
      O => \QUADRANT[0]_i_3_n_0\
    );
\QUADRANT[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F4F5"
    )
        port map (
      I0 => \QUADRANT[1]_i_2_n_0\,
      I1 => \ANGLE_REG_reg_n_0_[7]\,
      I2 => \ANGLE_REG_reg_n_0_[8]\,
      I3 => \QUADRANT[1]_i_3_n_0\,
      O => QUADRANT(1)
    );
\QUADRANT[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"01555555FFFFFFFF"
    )
        port map (
      I0 => ANGLE_REG(6),
      I1 => ANGLE_REG(2),
      I2 => ANGLE_REG(3),
      I3 => ANGLE_REG(5),
      I4 => ANGLE_REG(4),
      I5 => \ANGLE_REG_reg_n_0_[7]\,
      O => \QUADRANT[1]_i_2_n_0\
    );
\QUADRANT[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"01555555FFFFFFFF"
    )
        port map (
      I0 => ANGLE_REG(5),
      I1 => ANGLE_REG(1),
      I2 => ANGLE_REG(2),
      I3 => ANGLE_REG(4),
      I4 => ANGLE_REG(3),
      I5 => ANGLE_REG(6),
      O => \QUADRANT[1]_i_3_n_0\
    );
\QUADRANT_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => RESET_IBUF,
      D => QUADRANT(0),
      Q => \QUADRANT_reg_n_0_[0]\
    );
\QUADRANT_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => RESET_IBUF,
      D => QUADRANT(1),
      Q => p_0_in
    );
RESET_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => RESET,
      O => RESET_IBUF
    );
\SINE_FINAL[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BABA653865EF7014"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[4]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[5]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[3]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      O => \SINE_FINAL[0]_i_2_n_0\
    );
\SINE_FINAL[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"01EE0111EE21FE30"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[4]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[5]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[3]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      O => \SINE_FINAL[0]_i_3_n_0\
    );
\SINE_FINAL[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EE33A2A2A7AEF16E"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[4]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[5]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[3]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      O => \SINE_FINAL[1]_i_4_n_0\
    );
\SINE_FINAL[1]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFE110011102131"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[4]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[5]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[3]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      O => \SINE_FINAL[1]_i_5_n_0\
    );
\SINE_FINAL[1]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"59CF59CDCF86460A"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[4]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[5]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[3]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      O => \SINE_FINAL[1]_i_6_n_0\
    );
\SINE_FINAL[1]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFEEFF110001"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[4]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[5]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[3]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      O => \SINE_FINAL[1]_i_7_n_0\
    );
\SINE_FINAL[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"014949D10126B6CE"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[4]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[5]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[3]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      O => \SINE_FINAL[2]_i_4_n_0\
    );
\SINE_FINAL[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFBBF6ABBB"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[4]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[3]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[5]\,
      O => \SINE_FINAL[2]_i_5_n_0\
    );
\SINE_FINAL[2]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAFAA658A65927D0"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[4]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[5]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[3]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      O => \SINE_FINAL[2]_i_6_n_0\
    );
\SINE_FINAL[2]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"050500053037F5FA"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[4]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[5]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[3]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      O => \SINE_FINAL[2]_i_7_n_0\
    );
\SINE_FINAL[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"41C141F7C1268828"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[4]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[5]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[3]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      O => \SINE_FINAL[3]_i_4_n_0\
    );
\SINE_FINAL[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFC8CCFFC"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[4]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[3]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[5]\,
      O => \SINE_FINAL[3]_i_5_n_0\
    );
\SINE_FINAL[3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BABA2E892E77D1F6"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[4]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[5]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[3]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      O => \SINE_FINAL[3]_i_6_n_0\
    );
\SINE_FINAL[3]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00001445"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[5]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[3]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[4]\,
      O => \SINE_FINAL[3]_i_7_n_0\
    );
\SINE_FINAL[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"49B649F7B6808088"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[4]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[5]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[3]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      O => \SINE_FINAL[4]_i_4_n_0\
    );
\SINE_FINAL[4]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFCBCFC"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[4]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[3]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[5]\,
      O => \SINE_FINAL[4]_i_5_n_0\
    );
\SINE_FINAL[4]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B2B25908597F7776"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[4]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[5]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[3]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      O => \SINE_FINAL[4]_i_6_n_0\
    );
\SINE_FINAL[4]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000015"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[5]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[3]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[4]\,
      O => \SINE_FINAL[4]_i_7_n_0\
    );
\SINE_FINAL[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3033BBBB30338888"
    )
        port map (
      I0 => \SINE_FINAL[5]_i_2_n_0\,
      I1 => SINE_NEG,
      I2 => \SINE_FINAL[7]_i_3_n_0\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[4]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[6]\,
      I5 => \SINE_FINAL[5]_i_3_n_0\,
      O => \SINE_FINAL[5]_i_1_n_0\
    );
\SINE_FINAL[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3D8F8F873D8F8F86"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[4]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[5]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[3]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      O => \SINE_FINAL[5]_i_2_n_0\
    );
\SINE_FINAL[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F03F3F3F3C000040"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[4]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[5]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[3]\,
      O => \SINE_FINAL[5]_i_3_n_0\
    );
\SINE_FINAL[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3033BBBB30338888"
    )
        port map (
      I0 => \SINE_FINAL[6]_i_2_n_0\,
      I1 => SINE_NEG,
      I2 => \SINE_FINAL[7]_i_3_n_0\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[4]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[6]\,
      I5 => \SINE_FINAL[6]_i_3_n_0\,
      O => \SINE_FINAL[6]_i_1_n_0\
    );
\SINE_FINAL[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555555FA5555554"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[4]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[3]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[5]\,
      O => \SINE_FINAL[6]_i_2_n_0\
    );
\SINE_FINAL[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCC83CCCCCCC"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[4]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[3]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[5]\,
      O => \SINE_FINAL[6]_i_3_n_0\
    );
\SINE_FINAL[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3033BBBB30338888"
    )
        port map (
      I0 => \SINE_FINAL[7]_i_2_n_0\,
      I1 => SINE_NEG,
      I2 => \SINE_FINAL[7]_i_3_n_0\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[4]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[6]\,
      I5 => \SINE_FINAL[7]_i_4_n_0\,
      O => \SINE_FINAL[7]_i_1_n_0\
    );
\SINE_FINAL[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000007FFF7FFE"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[4]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[3]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[5]\,
      O => \SINE_FINAL[7]_i_2_n_0\
    );
\SINE_FINAL[7]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFF7"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[3]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[5]\,
      O => \SINE_FINAL[7]_i_3_n_0\
    );
\SINE_FINAL[7]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8000"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[3]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[4]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[5]\,
      O => \SINE_FINAL[7]_i_4_n_0\
    );
\SINE_FINAL[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFF00FE00FE00"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[4]\,
      I1 => \SINE_FINAL[8]_i_2_n_0\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[5]\,
      I3 => SINE_NEG,
      I4 => \SINE_FINAL[8]_i_3_n_0\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[6]\,
      O => \SINE_FINAL[8]_i_1_n_0\
    );
\SINE_FINAL[8]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[3]\,
      O => \SINE_FINAL[8]_i_2_n_0\
    );
\SINE_FINAL[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0010000000000000"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[5]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[3]\,
      I5 => \ANGLE_ADJUSTED_reg_n_0_[4]\,
      O => \SINE_FINAL[8]_i_3_n_0\
    );
\SINE_FINAL[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000000"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[6]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[5]\,
      I2 => \SINE_FINAL[9]_i_2_n_0\,
      I3 => \ANGLE_ADJUSTED_reg_n_0_[3]\,
      I4 => \ANGLE_ADJUSTED_reg_n_0_[4]\,
      I5 => SINE_NEG,
      O => \SINE_FINAL[9]_i_1_n_0\
    );
\SINE_FINAL[9]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \ANGLE_ADJUSTED_reg_n_0_[2]\,
      I1 => \ANGLE_ADJUSTED_reg_n_0_[1]\,
      I2 => \ANGLE_ADJUSTED_reg_n_0_[0]\,
      O => \SINE_FINAL[9]_i_2_n_0\
    );
\SINE_FINAL_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => RESET_IBUF,
      D => \SINE_FINAL_reg[0]_i_1_n_0\,
      Q => SINE_OBUF(0)
    );
\SINE_FINAL_reg[0]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE_FINAL[0]_i_2_n_0\,
      I1 => \SINE_FINAL[0]_i_3_n_0\,
      O => \SINE_FINAL_reg[0]_i_1_n_0\,
      S => \ANGLE_ADJUSTED_reg_n_0_[6]\
    );
\SINE_FINAL_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => RESET_IBUF,
      D => \SINE_FINAL_reg[1]_i_1_n_0\,
      Q => SINE_OBUF(1)
    );
\SINE_FINAL_reg[1]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \SINE_FINAL_reg[1]_i_2_n_0\,
      I1 => \SINE_FINAL_reg[1]_i_3_n_0\,
      O => \SINE_FINAL_reg[1]_i_1_n_0\,
      S => SINE_NEG
    );
\SINE_FINAL_reg[1]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE_FINAL[1]_i_4_n_0\,
      I1 => \SINE_FINAL[1]_i_5_n_0\,
      O => \SINE_FINAL_reg[1]_i_2_n_0\,
      S => \ANGLE_ADJUSTED_reg_n_0_[6]\
    );
\SINE_FINAL_reg[1]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE_FINAL[1]_i_6_n_0\,
      I1 => \SINE_FINAL[1]_i_7_n_0\,
      O => \SINE_FINAL_reg[1]_i_3_n_0\,
      S => \ANGLE_ADJUSTED_reg_n_0_[6]\
    );
\SINE_FINAL_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => RESET_IBUF,
      D => \SINE_FINAL_reg[2]_i_1_n_0\,
      Q => SINE_OBUF(2)
    );
\SINE_FINAL_reg[2]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \SINE_FINAL_reg[2]_i_2_n_0\,
      I1 => \SINE_FINAL_reg[2]_i_3_n_0\,
      O => \SINE_FINAL_reg[2]_i_1_n_0\,
      S => SINE_NEG
    );
\SINE_FINAL_reg[2]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE_FINAL[2]_i_4_n_0\,
      I1 => \SINE_FINAL[2]_i_5_n_0\,
      O => \SINE_FINAL_reg[2]_i_2_n_0\,
      S => \ANGLE_ADJUSTED_reg_n_0_[6]\
    );
\SINE_FINAL_reg[2]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE_FINAL[2]_i_6_n_0\,
      I1 => \SINE_FINAL[2]_i_7_n_0\,
      O => \SINE_FINAL_reg[2]_i_3_n_0\,
      S => \ANGLE_ADJUSTED_reg_n_0_[6]\
    );
\SINE_FINAL_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => RESET_IBUF,
      D => \SINE_FINAL_reg[3]_i_1_n_0\,
      Q => SINE_OBUF(3)
    );
\SINE_FINAL_reg[3]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \SINE_FINAL_reg[3]_i_2_n_0\,
      I1 => \SINE_FINAL_reg[3]_i_3_n_0\,
      O => \SINE_FINAL_reg[3]_i_1_n_0\,
      S => SINE_NEG
    );
\SINE_FINAL_reg[3]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE_FINAL[3]_i_4_n_0\,
      I1 => \SINE_FINAL[3]_i_5_n_0\,
      O => \SINE_FINAL_reg[3]_i_2_n_0\,
      S => \ANGLE_ADJUSTED_reg_n_0_[6]\
    );
\SINE_FINAL_reg[3]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE_FINAL[3]_i_6_n_0\,
      I1 => \SINE_FINAL[3]_i_7_n_0\,
      O => \SINE_FINAL_reg[3]_i_3_n_0\,
      S => \ANGLE_ADJUSTED_reg_n_0_[6]\
    );
\SINE_FINAL_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => RESET_IBUF,
      D => \SINE_FINAL_reg[4]_i_1_n_0\,
      Q => SINE_OBUF(4)
    );
\SINE_FINAL_reg[4]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \SINE_FINAL_reg[4]_i_2_n_0\,
      I1 => \SINE_FINAL_reg[4]_i_3_n_0\,
      O => \SINE_FINAL_reg[4]_i_1_n_0\,
      S => SINE_NEG
    );
\SINE_FINAL_reg[4]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE_FINAL[4]_i_4_n_0\,
      I1 => \SINE_FINAL[4]_i_5_n_0\,
      O => \SINE_FINAL_reg[4]_i_2_n_0\,
      S => \ANGLE_ADJUSTED_reg_n_0_[6]\
    );
\SINE_FINAL_reg[4]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SINE_FINAL[4]_i_6_n_0\,
      I1 => \SINE_FINAL[4]_i_7_n_0\,
      O => \SINE_FINAL_reg[4]_i_3_n_0\,
      S => \ANGLE_ADJUSTED_reg_n_0_[6]\
    );
\SINE_FINAL_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => RESET_IBUF,
      D => \SINE_FINAL[5]_i_1_n_0\,
      Q => SINE_OBUF(5)
    );
\SINE_FINAL_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => RESET_IBUF,
      D => \SINE_FINAL[6]_i_1_n_0\,
      Q => SINE_OBUF(6)
    );
\SINE_FINAL_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => RESET_IBUF,
      D => \SINE_FINAL[7]_i_1_n_0\,
      Q => SINE_OBUF(7)
    );
\SINE_FINAL_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => RESET_IBUF,
      D => \SINE_FINAL[8]_i_1_n_0\,
      Q => SINE_OBUF(8)
    );
\SINE_FINAL_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => RESET_IBUF,
      D => \SINE_FINAL[9]_i_1_n_0\,
      Q => SINE_OBUF(9)
    );
SINE_NEG_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => RESET_IBUF,
      D => p_0_in,
      Q => SINE_NEG
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
end STRUCTURE;
