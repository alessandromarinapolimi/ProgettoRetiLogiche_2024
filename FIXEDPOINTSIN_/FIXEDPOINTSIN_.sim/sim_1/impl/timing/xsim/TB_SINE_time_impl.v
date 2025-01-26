// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Mon Jan 27 00:26:28 2025
// Host        : Laptop-ASH running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/ultro/OneDrive/ALTRO/Desktop/ProgettoRetiLogiche_2024/FIXEDPOINTSIN_/FIXEDPOINTSIN_.sim/sim_1/impl/timing/xsim/TB_SINE_time_impl.v
// Design      : SINE_CALCULATOR
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ECO_CHECKSUM = "d9774654" *) (* M = "9" *) (* N = "10" *) 
(* NotValidForBitStream *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
module SINE_CALCULATOR
   (CLK,
    RESET,
    ANGLE,
    SINE);
  input CLK;
  input RESET;
  input [8:0]ANGLE;
  output [9:0]SINE;

  wire [8:0]ANGLE;
  wire [8:0]ANGLE_IBUF;
  wire CLK;
  wire CLK_IBUF;
  wire CLK_IBUF_BUFG;
  wire NEG_FLAG;
  wire NEG_FLAG_i_1_n_0;
  wire NEG_FLAG_i_2_n_0;
  wire NEG_FLAG_i_3_n_0;
  wire RESET;
  wire RESET_IBUF;
  wire [9:0]SINE;
  wire \SINE[0]_i_10_n_0 ;
  wire \SINE[0]_i_11_n_0 ;
  wire \SINE[0]_i_2_n_0 ;
  wire \SINE[0]_i_6_n_0 ;
  wire \SINE[0]_i_7_n_0 ;
  wire \SINE[0]_i_8_n_0 ;
  wire \SINE[0]_i_9_n_0 ;
  wire \SINE[1]_i_12_n_0 ;
  wire \SINE[1]_i_13_n_0 ;
  wire \SINE[1]_i_14_n_0 ;
  wire \SINE[1]_i_15_n_0 ;
  wire \SINE[1]_i_16_n_0 ;
  wire \SINE[1]_i_17_n_0 ;
  wire \SINE[1]_i_18_n_0 ;
  wire \SINE[1]_i_19_n_0 ;
  wire \SINE[1]_i_20_n_0 ;
  wire \SINE[1]_i_21_n_0 ;
  wire \SINE[1]_i_22_n_0 ;
  wire \SINE[1]_i_23_n_0 ;
  wire \SINE[1]_i_2_n_0 ;
  wire \SINE[1]_i_3_n_0 ;
  wire \SINE[1]_i_4_n_0 ;
  wire \SINE[1]_i_8_n_0 ;
  wire \SINE[2]_i_12_n_0 ;
  wire \SINE[2]_i_13_n_0 ;
  wire \SINE[2]_i_14_n_0 ;
  wire \SINE[2]_i_15_n_0 ;
  wire \SINE[2]_i_16_n_0 ;
  wire \SINE[2]_i_17_n_0 ;
  wire \SINE[2]_i_18_n_0 ;
  wire \SINE[2]_i_19_n_0 ;
  wire \SINE[2]_i_20_n_0 ;
  wire \SINE[2]_i_21_n_0 ;
  wire \SINE[2]_i_22_n_0 ;
  wire \SINE[2]_i_23_n_0 ;
  wire \SINE[2]_i_2_n_0 ;
  wire \SINE[2]_i_3_n_0 ;
  wire \SINE[2]_i_4_n_0 ;
  wire \SINE[2]_i_8_n_0 ;
  wire \SINE[3]_i_12_n_0 ;
  wire \SINE[3]_i_13_n_0 ;
  wire \SINE[3]_i_14_n_0 ;
  wire \SINE[3]_i_15_n_0 ;
  wire \SINE[3]_i_16_n_0 ;
  wire \SINE[3]_i_17_n_0 ;
  wire \SINE[3]_i_18_n_0 ;
  wire \SINE[3]_i_19_n_0 ;
  wire \SINE[3]_i_20_n_0 ;
  wire \SINE[3]_i_21_n_0 ;
  wire \SINE[3]_i_22_n_0 ;
  wire \SINE[3]_i_23_n_0 ;
  wire \SINE[3]_i_2_n_0 ;
  wire \SINE[3]_i_3_n_0 ;
  wire \SINE[3]_i_4_n_0 ;
  wire \SINE[3]_i_8_n_0 ;
  wire \SINE[4]_i_10_n_0 ;
  wire \SINE[4]_i_11_n_0 ;
  wire \SINE[4]_i_14_n_0 ;
  wire \SINE[4]_i_15_n_0 ;
  wire \SINE[4]_i_16_n_0 ;
  wire \SINE[4]_i_17_n_0 ;
  wire \SINE[4]_i_18_n_0 ;
  wire \SINE[4]_i_19_n_0 ;
  wire \SINE[4]_i_20_n_0 ;
  wire \SINE[4]_i_21_n_0 ;
  wire \SINE[4]_i_6_n_0 ;
  wire \SINE[4]_i_7_n_0 ;
  wire \SINE[5]_i_10_n_0 ;
  wire \SINE[5]_i_11_n_0 ;
  wire \SINE[5]_i_14_n_0 ;
  wire \SINE[5]_i_15_n_0 ;
  wire \SINE[5]_i_16_n_0 ;
  wire \SINE[5]_i_17_n_0 ;
  wire \SINE[5]_i_18_n_0 ;
  wire \SINE[5]_i_19_n_0 ;
  wire \SINE[5]_i_20_n_0 ;
  wire \SINE[5]_i_21_n_0 ;
  wire \SINE[5]_i_6_n_0 ;
  wire \SINE[5]_i_7_n_0 ;
  wire \SINE[6]_i_10_n_0 ;
  wire \SINE[6]_i_11_n_0 ;
  wire \SINE[6]_i_14_n_0 ;
  wire \SINE[6]_i_15_n_0 ;
  wire \SINE[6]_i_16_n_0 ;
  wire \SINE[6]_i_17_n_0 ;
  wire \SINE[6]_i_18_n_0 ;
  wire \SINE[6]_i_19_n_0 ;
  wire \SINE[6]_i_20_n_0 ;
  wire \SINE[6]_i_21_n_0 ;
  wire \SINE[6]_i_2_n_0 ;
  wire \SINE[6]_i_6_n_0 ;
  wire \SINE[6]_i_7_n_0 ;
  wire \SINE[7]_i_10_n_0 ;
  wire \SINE[7]_i_11_n_0 ;
  wire \SINE[7]_i_12_n_0 ;
  wire \SINE[7]_i_2_n_0 ;
  wire \SINE[7]_i_3_n_0 ;
  wire \SINE[7]_i_5_n_0 ;
  wire \SINE[7]_i_6_n_0 ;
  wire \SINE[7]_i_7_n_0 ;
  wire \SINE[7]_i_8_n_0 ;
  wire \SINE[7]_i_9_n_0 ;
  wire \SINE[8]_i_2_n_0 ;
  wire \SINE[8]_i_3_n_0 ;
  wire \SINE[8]_i_4_n_0 ;
  wire \SINE[9]_i_2_n_0 ;
  wire \SINE[9]_i_3_n_0 ;
  wire \SINE[9]_i_4_n_0 ;
  wire \SINE[9]_i_5_n_0 ;
  wire [9:0]SINE_NEXT;
  wire [9:0]SINE_OBUF;
  wire \SINE_reg[0]_i_3_n_0 ;
  wire \SINE_reg[0]_i_4_n_0 ;
  wire \SINE_reg[0]_i_5_n_0 ;
  wire \SINE_reg[1]_i_10_n_0 ;
  wire \SINE_reg[1]_i_11_n_0 ;
  wire \SINE_reg[1]_i_5_n_0 ;
  wire \SINE_reg[1]_i_6_n_0 ;
  wire \SINE_reg[1]_i_7_n_0 ;
  wire \SINE_reg[1]_i_9_n_0 ;
  wire \SINE_reg[2]_i_10_n_0 ;
  wire \SINE_reg[2]_i_11_n_0 ;
  wire \SINE_reg[2]_i_5_n_0 ;
  wire \SINE_reg[2]_i_6_n_0 ;
  wire \SINE_reg[2]_i_7_n_0 ;
  wire \SINE_reg[2]_i_9_n_0 ;
  wire \SINE_reg[3]_i_10_n_0 ;
  wire \SINE_reg[3]_i_11_n_0 ;
  wire \SINE_reg[3]_i_5_n_0 ;
  wire \SINE_reg[3]_i_6_n_0 ;
  wire \SINE_reg[3]_i_7_n_0 ;
  wire \SINE_reg[3]_i_9_n_0 ;
  wire \SINE_reg[4]_i_12_n_0 ;
  wire \SINE_reg[4]_i_13_n_0 ;
  wire \SINE_reg[4]_i_2_n_0 ;
  wire \SINE_reg[4]_i_3_n_0 ;
  wire \SINE_reg[4]_i_4_n_0 ;
  wire \SINE_reg[4]_i_5_n_0 ;
  wire \SINE_reg[4]_i_8_n_0 ;
  wire \SINE_reg[4]_i_9_n_0 ;
  wire \SINE_reg[5]_i_12_n_0 ;
  wire \SINE_reg[5]_i_13_n_0 ;
  wire \SINE_reg[5]_i_2_n_0 ;
  wire \SINE_reg[5]_i_3_n_0 ;
  wire \SINE_reg[5]_i_4_n_0 ;
  wire \SINE_reg[5]_i_5_n_0 ;
  wire \SINE_reg[5]_i_8_n_0 ;
  wire \SINE_reg[5]_i_9_n_0 ;
  wire \SINE_reg[6]_i_12_n_0 ;
  wire \SINE_reg[6]_i_13_n_0 ;
  wire \SINE_reg[6]_i_3_n_0 ;
  wire \SINE_reg[6]_i_4_n_0 ;
  wire \SINE_reg[6]_i_5_n_0 ;
  wire \SINE_reg[6]_i_8_n_0 ;
  wire \SINE_reg[6]_i_9_n_0 ;
  wire \SINE_reg[7]_i_4_n_0 ;

initial begin
 $sdf_annotate("TB_SINE_time_impl.sdf",,,,"tool_control");
end
  IBUF \ANGLE_IBUF[0]_inst 
       (.I(ANGLE[0]),
        .O(ANGLE_IBUF[0]));
  IBUF \ANGLE_IBUF[1]_inst 
       (.I(ANGLE[1]),
        .O(ANGLE_IBUF[1]));
  IBUF \ANGLE_IBUF[2]_inst 
       (.I(ANGLE[2]),
        .O(ANGLE_IBUF[2]));
  IBUF \ANGLE_IBUF[3]_inst 
       (.I(ANGLE[3]),
        .O(ANGLE_IBUF[3]));
  IBUF \ANGLE_IBUF[4]_inst 
       (.I(ANGLE[4]),
        .O(ANGLE_IBUF[4]));
  IBUF \ANGLE_IBUF[5]_inst 
       (.I(ANGLE[5]),
        .O(ANGLE_IBUF[5]));
  IBUF \ANGLE_IBUF[6]_inst 
       (.I(ANGLE[6]),
        .O(ANGLE_IBUF[6]));
  IBUF \ANGLE_IBUF[7]_inst 
       (.I(ANGLE[7]),
        .O(ANGLE_IBUF[7]));
  IBUF \ANGLE_IBUF[8]_inst 
       (.I(ANGLE[8]),
        .O(ANGLE_IBUF[8]));
  BUFG CLK_IBUF_BUFG_inst
       (.I(CLK_IBUF),
        .O(CLK_IBUF_BUFG));
  IBUF CLK_IBUF_inst
       (.I(CLK),
        .O(CLK_IBUF));
  LUT3 #(
    .INIT(8'h0E)) 
    NEG_FLAG_i_1
       (.I0(ANGLE_IBUF[8]),
        .I1(NEG_FLAG_i_2_n_0),
        .I2(RESET_IBUF),
        .O(NEG_FLAG_i_1_n_0));
  LUT6 #(
    .INIT(64'hCCC8888888888888)) 
    NEG_FLAG_i_2
       (.I0(ANGLE_IBUF[6]),
        .I1(ANGLE_IBUF[7]),
        .I2(ANGLE_IBUF[3]),
        .I3(NEG_FLAG_i_3_n_0),
        .I4(ANGLE_IBUF[4]),
        .I5(ANGLE_IBUF[5]),
        .O(NEG_FLAG_i_2_n_0));
  LUT3 #(
    .INIT(8'hE0)) 
    NEG_FLAG_i_3
       (.I0(ANGLE_IBUF[0]),
        .I1(ANGLE_IBUF[1]),
        .I2(ANGLE_IBUF[2]),
        .O(NEG_FLAG_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    NEG_FLAG_reg
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(NEG_FLAG_i_1_n_0),
        .Q(NEG_FLAG),
        .R(1'b0));
  IBUF RESET_IBUF_inst
       (.I(RESET),
        .O(RESET_IBUF));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SINE[0]_i_1 
       (.I0(\SINE[0]_i_2_n_0 ),
        .I1(\SINE_reg[0]_i_3_n_0 ),
        .I2(ANGLE_IBUF[8]),
        .I3(\SINE_reg[0]_i_4_n_0 ),
        .I4(ANGLE_IBUF[6]),
        .I5(\SINE_reg[0]_i_5_n_0 ),
        .O(SINE_NEXT[0]));
  LUT6 #(
    .INIT(64'hFCE1CDF8DED24DBA)) 
    \SINE[0]_i_10 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[1]),
        .I5(ANGLE_IBUF[0]),
        .O(\SINE[0]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h6C31D224C798F58B)) 
    \SINE[0]_i_11 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[0]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h55BBB55100BFF442)) 
    \SINE[0]_i_2 
       (.I0(ANGLE_IBUF[5]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[0]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h313E2E10C0FEC11D)) 
    \SINE[0]_i_6 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[0]),
        .O(\SINE[0]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h963D87E1)) 
    \SINE[0]_i_7 
       (.I0(ANGLE_IBUF[4]),
        .I1(ANGLE_IBUF[3]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[1]),
        .O(\SINE[0]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hE96E313BA4E95CF8)) 
    \SINE[0]_i_8 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[0]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h449FAC9E5C90297B)) 
    \SINE[0]_i_9 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[0]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h30D000D011EE3E2F)) 
    \SINE[1]_i_12 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[2]),
        .O(\SINE[1]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'hD77CAB0D)) 
    \SINE[1]_i_13 
       (.I0(ANGLE_IBUF[4]),
        .I1(ANGLE_IBUF[3]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[0]),
        .O(\SINE[1]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h3679EF28EB695A79)) 
    \SINE[1]_i_14 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[1]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hFE2D529E4EFCA210)) 
    \SINE[1]_i_15 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[2]),
        .O(\SINE[1]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'hCCDFEFCEC4EED964)) 
    \SINE[1]_i_16 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[0]),
        .I3(ANGLE_IBUF[3]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[1]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'h50E4B4A2E653B707)) 
    \SINE[1]_i_17 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[2]),
        .O(\SINE[1]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'h01C03FFFEE2EFE32)) 
    \SINE[1]_i_18 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[1]_i_18_n_0 ));
  LUT5 #(
    .INIT(32'h4F1B9E6C)) 
    \SINE[1]_i_19 
       (.I0(ANGLE_IBUF[4]),
        .I1(ANGLE_IBUF[3]),
        .I2(ANGLE_IBUF[1]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[0]),
        .O(\SINE[1]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SINE[1]_i_2 
       (.I0(\SINE[1]_i_4_n_0 ),
        .I1(\SINE_reg[1]_i_5_n_0 ),
        .I2(ANGLE_IBUF[8]),
        .I3(\SINE_reg[1]_i_6_n_0 ),
        .I4(ANGLE_IBUF[6]),
        .I5(\SINE_reg[1]_i_7_n_0 ),
        .O(\SINE[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hDF174F80DE130681)) 
    \SINE[1]_i_20 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[1]),
        .I5(ANGLE_IBUF[0]),
        .O(\SINE[1]_i_20_n_0 ));
  LUT6 #(
    .INIT(64'hBACDE23C710ED56B)) 
    \SINE[1]_i_21 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[1]_i_21_n_0 ));
  LUT6 #(
    .INIT(64'h311103030D2C2E2E)) 
    \SINE[1]_i_22 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[1]),
        .I5(ANGLE_IBUF[2]),
        .O(\SINE[1]_i_22_n_0 ));
  LUT6 #(
    .INIT(64'h3CD723CB6693578C)) 
    \SINE[1]_i_23 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[1]),
        .I5(ANGLE_IBUF[0]),
        .O(\SINE[1]_i_23_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SINE[1]_i_3 
       (.I0(\SINE[1]_i_8_n_0 ),
        .I1(\SINE_reg[1]_i_9_n_0 ),
        .I2(ANGLE_IBUF[8]),
        .I3(\SINE_reg[1]_i_10_n_0 ),
        .I4(ANGLE_IBUF[6]),
        .I5(\SINE_reg[1]_i_11_n_0 ),
        .O(\SINE[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h550527BD555072EA)) 
    \SINE[1]_i_4 
       (.I0(ANGLE_IBUF[5]),
        .I1(ANGLE_IBUF[0]),
        .I2(ANGLE_IBUF[4]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0AAE0EAC5BFA5AB8)) 
    \SINE[1]_i_8 
       (.I0(ANGLE_IBUF[5]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[1]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFCFFF3E3E3EFF)) 
    \SINE[2]_i_12 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[2]),
        .O(\SINE[2]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'hD0DBA50E)) 
    \SINE[2]_i_13 
       (.I0(ANGLE_IBUF[4]),
        .I1(ANGLE_IBUF[3]),
        .I2(ANGLE_IBUF[0]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[1]),
        .O(\SINE[2]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hC46F54BEC5DF55EF)) 
    \SINE[2]_i_14 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[2]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h96A8D06F559BB3DD)) 
    \SINE[2]_i_15 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[2]),
        .O(\SINE[2]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h02033113FC78ECEC)) 
    \SINE[2]_i_16 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[3]),
        .I5(ANGLE_IBUF[0]),
        .O(\SINE[2]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'h2BFD8C8810477337)) 
    \SINE[2]_i_17 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[3]),
        .I5(ANGLE_IBUF[0]),
        .O(\SINE[2]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'hC00C00CCE110F110)) 
    \SINE[2]_i_18 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[1]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[2]_i_18_n_0 ));
  LUT5 #(
    .INIT(32'h0BA45BF3)) 
    \SINE[2]_i_19 
       (.I0(ANGLE_IBUF[4]),
        .I1(ANGLE_IBUF[3]),
        .I2(ANGLE_IBUF[0]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[1]),
        .O(\SINE[2]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SINE[2]_i_2 
       (.I0(\SINE[2]_i_4_n_0 ),
        .I1(\SINE_reg[2]_i_5_n_0 ),
        .I2(ANGLE_IBUF[8]),
        .I3(\SINE_reg[2]_i_6_n_0 ),
        .I4(ANGLE_IBUF[6]),
        .I5(\SINE_reg[2]_i_7_n_0 ),
        .O(\SINE[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h3B902B852A81BC16)) 
    \SINE[2]_i_20 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[2]_i_20_n_0 ));
  LUT6 #(
    .INIT(64'h680FBB0DD5F166A6)) 
    \SINE[2]_i_21 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[2]_i_21_n_0 ));
  LUT6 #(
    .INIT(64'hFECC2132CECD3132)) 
    \SINE[2]_i_22 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[2]_i_22_n_0 ));
  LUT6 #(
    .INIT(64'h541F4B03E1B4B4F8)) 
    \SINE[2]_i_23 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[0]),
        .O(\SINE[2]_i_23_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SINE[2]_i_3 
       (.I0(\SINE[2]_i_8_n_0 ),
        .I1(\SINE_reg[2]_i_9_n_0 ),
        .I2(ANGLE_IBUF[8]),
        .I3(\SINE_reg[2]_i_10_n_0 ),
        .I4(ANGLE_IBUF[6]),
        .I5(\SINE_reg[2]_i_11_n_0 ),
        .O(\SINE[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAABFFEDDD5)) 
    \SINE[2]_i_4 
       (.I0(ANGLE_IBUF[5]),
        .I1(ANGLE_IBUF[3]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[4]),
        .I5(ANGLE_IBUF[0]),
        .O(\SINE[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hBF151554E8034203)) 
    \SINE[2]_i_8 
       (.I0(ANGLE_IBUF[5]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[1]),
        .I5(ANGLE_IBUF[0]),
        .O(\SINE[2]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h3F0F3F3FFFFFFFFE)) 
    \SINE[3]_i_12 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[1]),
        .I5(ANGLE_IBUF[2]),
        .O(\SINE[3]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'h0D73D788)) 
    \SINE[3]_i_13 
       (.I0(ANGLE_IBUF[4]),
        .I1(ANGLE_IBUF[3]),
        .I2(ANGLE_IBUF[0]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[1]),
        .O(\SINE[3]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hD4FF45AF7F65EE44)) 
    \SINE[3]_i_14 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[3]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h5F0032FAE5071DF5)) 
    \SINE[3]_i_15 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[0]),
        .I2(ANGLE_IBUF[4]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[3]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'hA8FF99DD56846422)) 
    \SINE[3]_i_16 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[3]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[3]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'h1DA2AFFB60594044)) 
    \SINE[3]_i_17 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[3]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[3]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'hF0C0F00000000005)) 
    \SINE[3]_i_18 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[0]),
        .I2(ANGLE_IBUF[4]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[1]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[3]_i_18_n_0 ));
  LUT5 #(
    .INIT(32'hD68C2877)) 
    \SINE[3]_i_19 
       (.I0(ANGLE_IBUF[4]),
        .I1(ANGLE_IBUF[3]),
        .I2(ANGLE_IBUF[0]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[1]),
        .O(\SINE[3]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SINE[3]_i_2 
       (.I0(\SINE[3]_i_4_n_0 ),
        .I1(\SINE_reg[3]_i_5_n_0 ),
        .I2(ANGLE_IBUF[8]),
        .I3(\SINE_reg[3]_i_6_n_0 ),
        .I4(ANGLE_IBUF[6]),
        .I5(\SINE_reg[3]_i_7_n_0 ),
        .O(\SINE[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h202288229D37CB23)) 
    \SINE[3]_i_20 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[1]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[3]),
        .I5(ANGLE_IBUF[4]),
        .O(\SINE[3]_i_20_n_0 ));
  LUT6 #(
    .INIT(64'h83A6FCFCFC5A1212)) 
    \SINE[3]_i_21 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[1]),
        .I5(ANGLE_IBUF[2]),
        .O(\SINE[3]_i_21_n_0 ));
  LUT6 #(
    .INIT(64'h56640203999BFDFC)) 
    \SINE[3]_i_22 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[3]_i_22_n_0 ));
  LUT6 #(
    .INIT(64'h662D584C9AD2B3FB)) 
    \SINE[3]_i_23 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[3]_i_23_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SINE[3]_i_3 
       (.I0(\SINE[3]_i_8_n_0 ),
        .I1(\SINE_reg[3]_i_9_n_0 ),
        .I2(ANGLE_IBUF[8]),
        .I3(\SINE_reg[3]_i_10_n_0 ),
        .I4(ANGLE_IBUF[6]),
        .I5(\SINE_reg[3]_i_11_n_0 ),
        .O(\SINE[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hBFFFDDFFAAABAA80)) 
    \SINE[3]_i_4 
       (.I0(ANGLE_IBUF[5]),
        .I1(ANGLE_IBUF[3]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[4]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h4242020015545757)) 
    \SINE[3]_i_8 
       (.I0(ANGLE_IBUF[5]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[3]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SINE[4]_i_1 
       (.I0(\SINE_reg[4]_i_2_n_0 ),
        .I1(\SINE_reg[4]_i_3_n_0 ),
        .I2(NEG_FLAG),
        .I3(\SINE_reg[4]_i_4_n_0 ),
        .I4(ANGLE_IBUF[8]),
        .I5(\SINE_reg[4]_i_5_n_0 ),
        .O(SINE_NEXT[4]));
  LUT6 #(
    .INIT(64'h555DDFDFDD9DD757)) 
    \SINE[4]_i_10 
       (.I0(ANGLE_IBUF[5]),
        .I1(ANGLE_IBUF[3]),
        .I2(ANGLE_IBUF[1]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[4]),
        .O(\SINE[4]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFC00FFFFFDFFFA00)) 
    \SINE[4]_i_11 
       (.I0(ANGLE_IBUF[0]),
        .I1(ANGLE_IBUF[3]),
        .I2(ANGLE_IBUF[4]),
        .I3(ANGLE_IBUF[5]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[4]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h540088A8B9FF7756)) 
    \SINE[4]_i_14 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[1]),
        .I5(ANGLE_IBUF[2]),
        .O(\SINE[4]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hC88ECCA63E393F11)) 
    \SINE[4]_i_15 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[2]),
        .O(\SINE[4]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h8AAA20000BBBB111)) 
    \SINE[4]_i_16 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[3]),
        .I2(ANGLE_IBUF[1]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[4]),
        .O(\SINE[4]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'h550022AABAF0F050)) 
    \SINE[4]_i_17 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[0]),
        .I2(ANGLE_IBUF[4]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[4]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'hAF55BF77508A4088)) 
    \SINE[4]_i_18 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[0]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[3]),
        .I5(ANGLE_IBUF[2]),
        .O(\SINE[4]_i_18_n_0 ));
  LUT6 #(
    .INIT(64'hB6C133C071E251EE)) 
    \SINE[4]_i_19 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[4]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'h755F5B5FF44E4E4E)) 
    \SINE[4]_i_20 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[4]_i_20_n_0 ));
  LUT6 #(
    .INIT(64'hAADDFF55450F07AF)) 
    \SINE[4]_i_21 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[0]),
        .I2(ANGLE_IBUF[4]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[1]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[4]_i_21_n_0 ));
  LUT6 #(
    .INIT(64'hC68E1E3E00000000)) 
    \SINE[4]_i_6 
       (.I0(ANGLE_IBUF[1]),
        .I1(ANGLE_IBUF[2]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[4]),
        .I5(ANGLE_IBUF[5]),
        .O(\SINE[4]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h5700570042540057)) 
    \SINE[4]_i_7 
       (.I0(ANGLE_IBUF[5]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[4]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SINE[5]_i_1 
       (.I0(\SINE_reg[5]_i_2_n_0 ),
        .I1(\SINE_reg[5]_i_3_n_0 ),
        .I2(NEG_FLAG),
        .I3(\SINE_reg[5]_i_4_n_0 ),
        .I4(ANGLE_IBUF[8]),
        .I5(\SINE_reg[5]_i_5_n_0 ),
        .O(SINE_NEXT[5]));
  LUT6 #(
    .INIT(64'hDDDDDDDD77377FFF)) 
    \SINE[5]_i_10 
       (.I0(ANGLE_IBUF[5]),
        .I1(ANGLE_IBUF[3]),
        .I2(ANGLE_IBUF[1]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[4]),
        .O(\SINE[5]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFFC0FFC0FFC0E0DF)) 
    \SINE[5]_i_11 
       (.I0(ANGLE_IBUF[0]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[5]),
        .I3(ANGLE_IBUF[3]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[5]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hF1A52D0D0D0F0F0E)) 
    \SINE[5]_i_14 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[1]),
        .I5(ANGLE_IBUF[2]),
        .O(\SINE[5]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h0F3FC080FFBC3FFF)) 
    \SINE[5]_i_15 
       (.I0(ANGLE_IBUF[0]),
        .I1(ANGLE_IBUF[7]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[4]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[5]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h55EA15EA00000000)) 
    \SINE[5]_i_16 
       (.I0(ANGLE_IBUF[2]),
        .I1(ANGLE_IBUF[1]),
        .I2(ANGLE_IBUF[0]),
        .I3(ANGLE_IBUF[3]),
        .I4(ANGLE_IBUF[4]),
        .I5(ANGLE_IBUF[7]),
        .O(\SINE[5]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'h54444466AA888888)) 
    \SINE[5]_i_17 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[3]),
        .I2(ANGLE_IBUF[0]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[4]),
        .O(\SINE[5]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'h0F5FFFFFE0A02020)) 
    \SINE[5]_i_18 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[1]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[5]_i_18_n_0 ));
  LUT6 #(
    .INIT(64'hD393D3B330002004)) 
    \SINE[5]_i_19 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[5]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'hDDDDD737DDDDD777)) 
    \SINE[5]_i_20 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[3]),
        .I2(ANGLE_IBUF[1]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[4]),
        .O(\SINE[5]_i_20_n_0 ));
  LUT6 #(
    .INIT(64'hABBBB9B955577777)) 
    \SINE[5]_i_21 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[3]),
        .I2(ANGLE_IBUF[1]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[4]),
        .O(\SINE[5]_i_21_n_0 ));
  LUT6 #(
    .INIT(64'h1555AA8000000000)) 
    \SINE[5]_i_6 
       (.I0(ANGLE_IBUF[3]),
        .I1(ANGLE_IBUF[0]),
        .I2(ANGLE_IBUF[1]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[4]),
        .I5(ANGLE_IBUF[5]),
        .O(\SINE[5]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0707070707075350)) 
    \SINE[5]_i_7 
       (.I0(ANGLE_IBUF[5]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[1]),
        .I5(ANGLE_IBUF[2]),
        .O(\SINE[5]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SINE[6]_i_1 
       (.I0(\SINE[6]_i_2_n_0 ),
        .I1(\SINE_reg[6]_i_3_n_0 ),
        .I2(NEG_FLAG),
        .I3(\SINE_reg[6]_i_4_n_0 ),
        .I4(ANGLE_IBUF[8]),
        .I5(\SINE_reg[6]_i_5_n_0 ),
        .O(SINE_NEXT[6]));
  LUT6 #(
    .INIT(64'h77777777FFBFFFFF)) 
    \SINE[6]_i_10 
       (.I0(ANGLE_IBUF[5]),
        .I1(ANGLE_IBUF[3]),
        .I2(ANGLE_IBUF[1]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[4]),
        .O(\SINE[6]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hCFCFCFF8F0F0F0F0)) 
    \SINE[6]_i_11 
       (.I0(ANGLE_IBUF[0]),
        .I1(ANGLE_IBUF[5]),
        .I2(ANGLE_IBUF[4]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[6]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h63333B3B3B393938)) 
    \SINE[6]_i_14 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[1]),
        .I5(ANGLE_IBUF[2]),
        .O(\SINE[6]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hCCC8CCCFFFF3F3F3)) 
    \SINE[6]_i_15 
       (.I0(ANGLE_IBUF[0]),
        .I1(ANGLE_IBUF[7]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[4]),
        .O(\SINE[6]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'hFFEA001500000000)) 
    \SINE[6]_i_16 
       (.I0(ANGLE_IBUF[3]),
        .I1(ANGLE_IBUF[1]),
        .I2(ANGLE_IBUF[0]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[4]),
        .I5(ANGLE_IBUF[7]),
        .O(\SINE[6]_i_16_n_0 ));
  LUT5 #(
    .INIT(32'h00150000)) 
    \SINE[6]_i_17 
       (.I0(ANGLE_IBUF[4]),
        .I1(ANGLE_IBUF[2]),
        .I2(ANGLE_IBUF[1]),
        .I3(ANGLE_IBUF[3]),
        .I4(ANGLE_IBUF[7]),
        .O(\SINE[6]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'h9CCCCCCCC646C646)) 
    \SINE[6]_i_18 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[6]_i_18_n_0 ));
  LUT6 #(
    .INIT(64'h5555555400222222)) 
    \SINE[6]_i_19 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[3]),
        .I2(ANGLE_IBUF[0]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[4]),
        .O(\SINE[6]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'h30303C0C48480C0C)) 
    \SINE[6]_i_2 
       (.I0(\SINE[6]_i_6_n_0 ),
        .I1(ANGLE_IBUF[6]),
        .I2(ANGLE_IBUF[4]),
        .I3(\SINE[6]_i_7_n_0 ),
        .I4(ANGLE_IBUF[3]),
        .I5(ANGLE_IBUF[5]),
        .O(\SINE[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h55555737FFFFFDDD)) 
    \SINE[6]_i_20 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[3]),
        .I2(ANGLE_IBUF[1]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[4]),
        .O(\SINE[6]_i_20_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEEEAFFFFFFFF)) 
    \SINE[6]_i_21 
       (.I0(ANGLE_IBUF[4]),
        .I1(ANGLE_IBUF[2]),
        .I2(ANGLE_IBUF[1]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[3]),
        .I5(ANGLE_IBUF[7]),
        .O(\SINE[6]_i_21_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \SINE[6]_i_6 
       (.I0(ANGLE_IBUF[1]),
        .I1(ANGLE_IBUF[2]),
        .O(\SINE[6]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \SINE[6]_i_7 
       (.I0(ANGLE_IBUF[0]),
        .I1(ANGLE_IBUF[1]),
        .I2(ANGLE_IBUF[2]),
        .O(\SINE[6]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SINE[7]_i_1 
       (.I0(\SINE[7]_i_2_n_0 ),
        .I1(\SINE[7]_i_3_n_0 ),
        .I2(NEG_FLAG),
        .I3(\SINE_reg[7]_i_4_n_0 ),
        .I4(ANGLE_IBUF[8]),
        .I5(\SINE[7]_i_5_n_0 ),
        .O(SINE_NEXT[7]));
  LUT6 #(
    .INIT(64'hCCCCCCCCC3C3C3B3)) 
    \SINE[7]_i_10 
       (.I0(ANGLE_IBUF[0]),
        .I1(ANGLE_IBUF[5]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[4]),
        .O(\SINE[7]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFD9D55555555)) 
    \SINE[7]_i_11 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[3]),
        .I2(ANGLE_IBUF[1]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[4]),
        .O(\SINE[7]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h40222222AAAAAAAA)) 
    \SINE[7]_i_12 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[3]),
        .I2(ANGLE_IBUF[0]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[4]),
        .O(\SINE[7]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h0055FEAA00000000)) 
    \SINE[7]_i_2 
       (.I0(ANGLE_IBUF[4]),
        .I1(ANGLE_IBUF[1]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[3]),
        .I4(ANGLE_IBUF[5]),
        .I5(ANGLE_IBUF[6]),
        .O(\SINE[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h3000BBBB30008888)) 
    \SINE[7]_i_3 
       (.I0(\SINE[7]_i_6_n_0 ),
        .I1(ANGLE_IBUF[6]),
        .I2(\SINE[7]_i_7_n_0 ),
        .I3(ANGLE_IBUF[7]),
        .I4(ANGLE_IBUF[5]),
        .I5(\SINE[7]_i_8_n_0 ),
        .O(\SINE[7]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hCFBBCF88)) 
    \SINE[7]_i_5 
       (.I0(\SINE[7]_i_11_n_0 ),
        .I1(ANGLE_IBUF[6]),
        .I2(ANGLE_IBUF[7]),
        .I3(ANGLE_IBUF[5]),
        .I4(\SINE[7]_i_12_n_0 ),
        .O(\SINE[7]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h5555577700000000)) 
    \SINE[7]_i_6 
       (.I0(ANGLE_IBUF[4]),
        .I1(ANGLE_IBUF[2]),
        .I2(ANGLE_IBUF[0]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[3]),
        .I5(ANGLE_IBUF[7]),
        .O(\SINE[7]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFEFFFFFF)) 
    \SINE[7]_i_7 
       (.I0(ANGLE_IBUF[3]),
        .I1(ANGLE_IBUF[0]),
        .I2(ANGLE_IBUF[1]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[4]),
        .O(\SINE[7]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h9DDDDDDDD555D554)) 
    \SINE[7]_i_8 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[7]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFBFFFFFF)) 
    \SINE[7]_i_9 
       (.I0(ANGLE_IBUF[4]),
        .I1(ANGLE_IBUF[2]),
        .I2(ANGLE_IBUF[0]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[3]),
        .I5(ANGLE_IBUF[5]),
        .O(\SINE[7]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h88BB8888B888B888)) 
    \SINE[8]_i_1 
       (.I0(\SINE[9]_i_2_n_0 ),
        .I1(NEG_FLAG),
        .I2(\SINE[8]_i_2_n_0 ),
        .I3(ANGLE_IBUF[8]),
        .I4(\SINE[8]_i_3_n_0 ),
        .I5(ANGLE_IBUF[6]),
        .O(SINE_NEXT[8]));
  LUT6 #(
    .INIT(64'h0000000000400000)) 
    \SINE[8]_i_2 
       (.I0(ANGLE_IBUF[4]),
        .I1(ANGLE_IBUF[2]),
        .I2(ANGLE_IBUF[1]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[3]),
        .I5(ANGLE_IBUF[5]),
        .O(\SINE[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000400000)) 
    \SINE[8]_i_3 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[3]),
        .I2(\SINE[8]_i_4_n_0 ),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[4]),
        .I5(ANGLE_IBUF[5]),
        .O(\SINE[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \SINE[8]_i_4 
       (.I0(ANGLE_IBUF[1]),
        .I1(ANGLE_IBUF[0]),
        .O(\SINE[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \SINE[9]_i_1 
       (.I0(\SINE[9]_i_2_n_0 ),
        .I1(NEG_FLAG),
        .O(SINE_NEXT[9]));
  LUT6 #(
    .INIT(64'hBBBBBBBBFFFCCCFC)) 
    \SINE[9]_i_2 
       (.I0(\SINE[9]_i_3_n_0 ),
        .I1(ANGLE_IBUF[8]),
        .I2(\SINE[9]_i_4_n_0 ),
        .I3(ANGLE_IBUF[5]),
        .I4(\SINE[9]_i_5_n_0 ),
        .I5(ANGLE_IBUF[6]),
        .O(\SINE[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFFFFFFFFFFFF)) 
    \SINE[9]_i_3 
       (.I0(ANGLE_IBUF[4]),
        .I1(ANGLE_IBUF[2]),
        .I2(ANGLE_IBUF[1]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[3]),
        .I5(ANGLE_IBUF[5]),
        .O(\SINE[9]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \SINE[9]_i_4 
       (.I0(ANGLE_IBUF[4]),
        .I1(ANGLE_IBUF[2]),
        .I2(ANGLE_IBUF[1]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[3]),
        .I5(ANGLE_IBUF[7]),
        .O(\SINE[9]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFF7FFFFFFFF)) 
    \SINE[9]_i_5 
       (.I0(ANGLE_IBUF[4]),
        .I1(ANGLE_IBUF[2]),
        .I2(ANGLE_IBUF[1]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[3]),
        .I5(ANGLE_IBUF[7]),
        .O(\SINE[9]_i_5_n_0 ));
  OBUF \SINE_OBUF[0]_inst 
       (.I(SINE_OBUF[0]),
        .O(SINE[0]));
  OBUF \SINE_OBUF[1]_inst 
       (.I(SINE_OBUF[1]),
        .O(SINE[1]));
  OBUF \SINE_OBUF[2]_inst 
       (.I(SINE_OBUF[2]),
        .O(SINE[2]));
  OBUF \SINE_OBUF[3]_inst 
       (.I(SINE_OBUF[3]),
        .O(SINE[3]));
  OBUF \SINE_OBUF[4]_inst 
       (.I(SINE_OBUF[4]),
        .O(SINE[4]));
  OBUF \SINE_OBUF[5]_inst 
       (.I(SINE_OBUF[5]),
        .O(SINE[5]));
  OBUF \SINE_OBUF[6]_inst 
       (.I(SINE_OBUF[6]),
        .O(SINE[6]));
  OBUF \SINE_OBUF[7]_inst 
       (.I(SINE_OBUF[7]),
        .O(SINE[7]));
  OBUF \SINE_OBUF[8]_inst 
       (.I(SINE_OBUF[8]),
        .O(SINE[8]));
  OBUF \SINE_OBUF[9]_inst 
       (.I(SINE_OBUF[9]),
        .O(SINE[9]));
  FDRE #(
    .INIT(1'b0)) 
    \SINE_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(SINE_NEXT[0]),
        .Q(SINE_OBUF[0]),
        .R(RESET_IBUF));
  MUXF7 \SINE_reg[0]_i_3 
       (.I0(\SINE[0]_i_6_n_0 ),
        .I1(\SINE[0]_i_7_n_0 ),
        .O(\SINE_reg[0]_i_3_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[0]_i_4 
       (.I0(\SINE[0]_i_8_n_0 ),
        .I1(\SINE[0]_i_9_n_0 ),
        .O(\SINE_reg[0]_i_4_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[0]_i_5 
       (.I0(\SINE[0]_i_10_n_0 ),
        .I1(\SINE[0]_i_11_n_0 ),
        .O(\SINE_reg[0]_i_5_n_0 ),
        .S(ANGLE_IBUF[5]));
  FDRE #(
    .INIT(1'b0)) 
    \SINE_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(SINE_NEXT[1]),
        .Q(SINE_OBUF[1]),
        .R(RESET_IBUF));
  MUXF7 \SINE_reg[1]_i_1 
       (.I0(\SINE[1]_i_2_n_0 ),
        .I1(\SINE[1]_i_3_n_0 ),
        .O(SINE_NEXT[1]),
        .S(NEG_FLAG));
  MUXF7 \SINE_reg[1]_i_10 
       (.I0(\SINE[1]_i_20_n_0 ),
        .I1(\SINE[1]_i_21_n_0 ),
        .O(\SINE_reg[1]_i_10_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[1]_i_11 
       (.I0(\SINE[1]_i_22_n_0 ),
        .I1(\SINE[1]_i_23_n_0 ),
        .O(\SINE_reg[1]_i_11_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[1]_i_5 
       (.I0(\SINE[1]_i_12_n_0 ),
        .I1(\SINE[1]_i_13_n_0 ),
        .O(\SINE_reg[1]_i_5_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[1]_i_6 
       (.I0(\SINE[1]_i_14_n_0 ),
        .I1(\SINE[1]_i_15_n_0 ),
        .O(\SINE_reg[1]_i_6_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[1]_i_7 
       (.I0(\SINE[1]_i_16_n_0 ),
        .I1(\SINE[1]_i_17_n_0 ),
        .O(\SINE_reg[1]_i_7_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[1]_i_9 
       (.I0(\SINE[1]_i_18_n_0 ),
        .I1(\SINE[1]_i_19_n_0 ),
        .O(\SINE_reg[1]_i_9_n_0 ),
        .S(ANGLE_IBUF[5]));
  FDRE #(
    .INIT(1'b0)) 
    \SINE_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(SINE_NEXT[2]),
        .Q(SINE_OBUF[2]),
        .R(RESET_IBUF));
  MUXF7 \SINE_reg[2]_i_1 
       (.I0(\SINE[2]_i_2_n_0 ),
        .I1(\SINE[2]_i_3_n_0 ),
        .O(SINE_NEXT[2]),
        .S(NEG_FLAG));
  MUXF7 \SINE_reg[2]_i_10 
       (.I0(\SINE[2]_i_20_n_0 ),
        .I1(\SINE[2]_i_21_n_0 ),
        .O(\SINE_reg[2]_i_10_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[2]_i_11 
       (.I0(\SINE[2]_i_22_n_0 ),
        .I1(\SINE[2]_i_23_n_0 ),
        .O(\SINE_reg[2]_i_11_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[2]_i_5 
       (.I0(\SINE[2]_i_12_n_0 ),
        .I1(\SINE[2]_i_13_n_0 ),
        .O(\SINE_reg[2]_i_5_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[2]_i_6 
       (.I0(\SINE[2]_i_14_n_0 ),
        .I1(\SINE[2]_i_15_n_0 ),
        .O(\SINE_reg[2]_i_6_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[2]_i_7 
       (.I0(\SINE[2]_i_16_n_0 ),
        .I1(\SINE[2]_i_17_n_0 ),
        .O(\SINE_reg[2]_i_7_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[2]_i_9 
       (.I0(\SINE[2]_i_18_n_0 ),
        .I1(\SINE[2]_i_19_n_0 ),
        .O(\SINE_reg[2]_i_9_n_0 ),
        .S(ANGLE_IBUF[5]));
  FDRE #(
    .INIT(1'b0)) 
    \SINE_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(SINE_NEXT[3]),
        .Q(SINE_OBUF[3]),
        .R(RESET_IBUF));
  MUXF7 \SINE_reg[3]_i_1 
       (.I0(\SINE[3]_i_2_n_0 ),
        .I1(\SINE[3]_i_3_n_0 ),
        .O(SINE_NEXT[3]),
        .S(NEG_FLAG));
  MUXF7 \SINE_reg[3]_i_10 
       (.I0(\SINE[3]_i_20_n_0 ),
        .I1(\SINE[3]_i_21_n_0 ),
        .O(\SINE_reg[3]_i_10_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[3]_i_11 
       (.I0(\SINE[3]_i_22_n_0 ),
        .I1(\SINE[3]_i_23_n_0 ),
        .O(\SINE_reg[3]_i_11_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[3]_i_5 
       (.I0(\SINE[3]_i_12_n_0 ),
        .I1(\SINE[3]_i_13_n_0 ),
        .O(\SINE_reg[3]_i_5_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[3]_i_6 
       (.I0(\SINE[3]_i_14_n_0 ),
        .I1(\SINE[3]_i_15_n_0 ),
        .O(\SINE_reg[3]_i_6_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[3]_i_7 
       (.I0(\SINE[3]_i_16_n_0 ),
        .I1(\SINE[3]_i_17_n_0 ),
        .O(\SINE_reg[3]_i_7_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[3]_i_9 
       (.I0(\SINE[3]_i_18_n_0 ),
        .I1(\SINE[3]_i_19_n_0 ),
        .O(\SINE_reg[3]_i_9_n_0 ),
        .S(ANGLE_IBUF[5]));
  FDRE #(
    .INIT(1'b0)) 
    \SINE_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(SINE_NEXT[4]),
        .Q(SINE_OBUF[4]),
        .R(RESET_IBUF));
  MUXF7 \SINE_reg[4]_i_12 
       (.I0(\SINE[4]_i_18_n_0 ),
        .I1(\SINE[4]_i_19_n_0 ),
        .O(\SINE_reg[4]_i_12_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[4]_i_13 
       (.I0(\SINE[4]_i_20_n_0 ),
        .I1(\SINE[4]_i_21_n_0 ),
        .O(\SINE_reg[4]_i_13_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[4]_i_2 
       (.I0(\SINE[4]_i_6_n_0 ),
        .I1(\SINE[4]_i_7_n_0 ),
        .O(\SINE_reg[4]_i_2_n_0 ),
        .S(ANGLE_IBUF[6]));
  MUXF8 \SINE_reg[4]_i_3 
       (.I0(\SINE_reg[4]_i_8_n_0 ),
        .I1(\SINE_reg[4]_i_9_n_0 ),
        .O(\SINE_reg[4]_i_3_n_0 ),
        .S(ANGLE_IBUF[6]));
  MUXF7 \SINE_reg[4]_i_4 
       (.I0(\SINE[4]_i_10_n_0 ),
        .I1(\SINE[4]_i_11_n_0 ),
        .O(\SINE_reg[4]_i_4_n_0 ),
        .S(ANGLE_IBUF[6]));
  MUXF8 \SINE_reg[4]_i_5 
       (.I0(\SINE_reg[4]_i_12_n_0 ),
        .I1(\SINE_reg[4]_i_13_n_0 ),
        .O(\SINE_reg[4]_i_5_n_0 ),
        .S(ANGLE_IBUF[6]));
  MUXF7 \SINE_reg[4]_i_8 
       (.I0(\SINE[4]_i_14_n_0 ),
        .I1(\SINE[4]_i_15_n_0 ),
        .O(\SINE_reg[4]_i_8_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[4]_i_9 
       (.I0(\SINE[4]_i_16_n_0 ),
        .I1(\SINE[4]_i_17_n_0 ),
        .O(\SINE_reg[4]_i_9_n_0 ),
        .S(ANGLE_IBUF[5]));
  FDRE #(
    .INIT(1'b0)) 
    \SINE_reg[5] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(SINE_NEXT[5]),
        .Q(SINE_OBUF[5]),
        .R(RESET_IBUF));
  MUXF7 \SINE_reg[5]_i_12 
       (.I0(\SINE[5]_i_18_n_0 ),
        .I1(\SINE[5]_i_19_n_0 ),
        .O(\SINE_reg[5]_i_12_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[5]_i_13 
       (.I0(\SINE[5]_i_20_n_0 ),
        .I1(\SINE[5]_i_21_n_0 ),
        .O(\SINE_reg[5]_i_13_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[5]_i_2 
       (.I0(\SINE[5]_i_6_n_0 ),
        .I1(\SINE[5]_i_7_n_0 ),
        .O(\SINE_reg[5]_i_2_n_0 ),
        .S(ANGLE_IBUF[6]));
  MUXF8 \SINE_reg[5]_i_3 
       (.I0(\SINE_reg[5]_i_8_n_0 ),
        .I1(\SINE_reg[5]_i_9_n_0 ),
        .O(\SINE_reg[5]_i_3_n_0 ),
        .S(ANGLE_IBUF[6]));
  MUXF7 \SINE_reg[5]_i_4 
       (.I0(\SINE[5]_i_10_n_0 ),
        .I1(\SINE[5]_i_11_n_0 ),
        .O(\SINE_reg[5]_i_4_n_0 ),
        .S(ANGLE_IBUF[6]));
  MUXF8 \SINE_reg[5]_i_5 
       (.I0(\SINE_reg[5]_i_12_n_0 ),
        .I1(\SINE_reg[5]_i_13_n_0 ),
        .O(\SINE_reg[5]_i_5_n_0 ),
        .S(ANGLE_IBUF[6]));
  MUXF7 \SINE_reg[5]_i_8 
       (.I0(\SINE[5]_i_14_n_0 ),
        .I1(\SINE[5]_i_15_n_0 ),
        .O(\SINE_reg[5]_i_8_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[5]_i_9 
       (.I0(\SINE[5]_i_16_n_0 ),
        .I1(\SINE[5]_i_17_n_0 ),
        .O(\SINE_reg[5]_i_9_n_0 ),
        .S(ANGLE_IBUF[5]));
  FDRE #(
    .INIT(1'b0)) 
    \SINE_reg[6] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(SINE_NEXT[6]),
        .Q(SINE_OBUF[6]),
        .R(RESET_IBUF));
  MUXF7 \SINE_reg[6]_i_12 
       (.I0(\SINE[6]_i_18_n_0 ),
        .I1(\SINE[6]_i_19_n_0 ),
        .O(\SINE_reg[6]_i_12_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[6]_i_13 
       (.I0(\SINE[6]_i_20_n_0 ),
        .I1(\SINE[6]_i_21_n_0 ),
        .O(\SINE_reg[6]_i_13_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF8 \SINE_reg[6]_i_3 
       (.I0(\SINE_reg[6]_i_8_n_0 ),
        .I1(\SINE_reg[6]_i_9_n_0 ),
        .O(\SINE_reg[6]_i_3_n_0 ),
        .S(ANGLE_IBUF[6]));
  MUXF7 \SINE_reg[6]_i_4 
       (.I0(\SINE[6]_i_10_n_0 ),
        .I1(\SINE[6]_i_11_n_0 ),
        .O(\SINE_reg[6]_i_4_n_0 ),
        .S(ANGLE_IBUF[6]));
  MUXF8 \SINE_reg[6]_i_5 
       (.I0(\SINE_reg[6]_i_12_n_0 ),
        .I1(\SINE_reg[6]_i_13_n_0 ),
        .O(\SINE_reg[6]_i_5_n_0 ),
        .S(ANGLE_IBUF[6]));
  MUXF7 \SINE_reg[6]_i_8 
       (.I0(\SINE[6]_i_14_n_0 ),
        .I1(\SINE[6]_i_15_n_0 ),
        .O(\SINE_reg[6]_i_8_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[6]_i_9 
       (.I0(\SINE[6]_i_16_n_0 ),
        .I1(\SINE[6]_i_17_n_0 ),
        .O(\SINE_reg[6]_i_9_n_0 ),
        .S(ANGLE_IBUF[5]));
  FDRE #(
    .INIT(1'b0)) 
    \SINE_reg[7] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(SINE_NEXT[7]),
        .Q(SINE_OBUF[7]),
        .R(RESET_IBUF));
  MUXF7 \SINE_reg[7]_i_4 
       (.I0(\SINE[7]_i_9_n_0 ),
        .I1(\SINE[7]_i_10_n_0 ),
        .O(\SINE_reg[7]_i_4_n_0 ),
        .S(ANGLE_IBUF[6]));
  FDRE #(
    .INIT(1'b0)) 
    \SINE_reg[8] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(SINE_NEXT[8]),
        .Q(SINE_OBUF[8]),
        .R(RESET_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \SINE_reg[9] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(SINE_NEXT[9]),
        .Q(SINE_OBUF[9]),
        .R(RESET_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
