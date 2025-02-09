// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Mon Jan 27 16:30:30 2025
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

(* ECO_CHECKSUM = "3f4a92a6" *) (* M = "9" *) (* N = "10" *) 
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
  wire \SINE[1]_i_10_n_0 ;
  wire \SINE[1]_i_11_n_0 ;
  wire \SINE[1]_i_2_n_0 ;
  wire \SINE[1]_i_6_n_0 ;
  wire \SINE[1]_i_7_n_0 ;
  wire \SINE[1]_i_8_n_0 ;
  wire \SINE[1]_i_9_n_0 ;
  wire \SINE[2]_i_10_n_0 ;
  wire \SINE[2]_i_11_n_0 ;
  wire \SINE[2]_i_2_n_0 ;
  wire \SINE[2]_i_6_n_0 ;
  wire \SINE[2]_i_7_n_0 ;
  wire \SINE[2]_i_8_n_0 ;
  wire \SINE[2]_i_9_n_0 ;
  wire \SINE[3]_i_10_n_0 ;
  wire \SINE[3]_i_11_n_0 ;
  wire \SINE[3]_i_2_n_0 ;
  wire \SINE[3]_i_6_n_0 ;
  wire \SINE[3]_i_7_n_0 ;
  wire \SINE[3]_i_8_n_0 ;
  wire \SINE[3]_i_9_n_0 ;
  wire \SINE[4]_i_2_n_0 ;
  wire \SINE[4]_i_3_n_0 ;
  wire \SINE[4]_i_6_n_0 ;
  wire \SINE[4]_i_7_n_0 ;
  wire \SINE[4]_i_8_n_0 ;
  wire \SINE[4]_i_9_n_0 ;
  wire \SINE[5]_i_2_n_0 ;
  wire \SINE[5]_i_3_n_0 ;
  wire \SINE[5]_i_6_n_0 ;
  wire \SINE[5]_i_7_n_0 ;
  wire \SINE[5]_i_8_n_0 ;
  wire \SINE[5]_i_9_n_0 ;
  wire \SINE[6]_i_2_n_0 ;
  wire \SINE[6]_i_3_n_0 ;
  wire \SINE[6]_i_6_n_0 ;
  wire \SINE[6]_i_7_n_0 ;
  wire \SINE[6]_i_8_n_0 ;
  wire \SINE[6]_i_9_n_0 ;
  wire \SINE[7]_i_2_n_0 ;
  wire \SINE[7]_i_3_n_0 ;
  wire \SINE[7]_i_4_n_0 ;
  wire \SINE[7]_i_5_n_0 ;
  wire \SINE[8]_i_2_n_0 ;
  wire \SINE[8]_i_3_n_0 ;
  wire \SINE[8]_i_4_n_0 ;
  wire \SINE[8]_i_5_n_0 ;
  wire \SINE[9]_i_2_n_0 ;
  wire \SINE[9]_i_3_n_0 ;
  wire \SINE[9]_i_4_n_0 ;
  wire [9:0]SINE_NEXT;
  wire [9:0]SINE_OBUF;
  wire \SINE_reg[0]_i_3_n_0 ;
  wire \SINE_reg[0]_i_4_n_0 ;
  wire \SINE_reg[0]_i_5_n_0 ;
  wire \SINE_reg[1]_i_3_n_0 ;
  wire \SINE_reg[1]_i_4_n_0 ;
  wire \SINE_reg[1]_i_5_n_0 ;
  wire \SINE_reg[2]_i_3_n_0 ;
  wire \SINE_reg[2]_i_4_n_0 ;
  wire \SINE_reg[2]_i_5_n_0 ;
  wire \SINE_reg[3]_i_3_n_0 ;
  wire \SINE_reg[3]_i_4_n_0 ;
  wire \SINE_reg[3]_i_5_n_0 ;
  wire \SINE_reg[4]_i_4_n_0 ;
  wire \SINE_reg[4]_i_5_n_0 ;
  wire \SINE_reg[5]_i_4_n_0 ;
  wire \SINE_reg[5]_i_5_n_0 ;
  wire \SINE_reg[6]_i_4_n_0 ;
  wire \SINE_reg[6]_i_5_n_0 ;

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
  IBUF RESET_IBUF_inst
       (.I(RESET),
        .O(RESET_IBUF));
  (* \PinAttr:I2:HOLD_DETOUR  = "2402" *) 
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
    .INIT(64'hFECFDD4BC1D8E2DA)) 
    \SINE[0]_i_10 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[0]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h63D2C124C9F8785B)) 
    \SINE[0]_i_11 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[3]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[0]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h5BB555B10FB404F2)) 
    \SINE[0]_i_2 
       (.I0(ANGLE_IBUF[5]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h32CC31F11E01E0ED)) 
    \SINE[0]_i_6 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[1]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[0]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h939C6D39)) 
    \SINE[0]_i_7 
       (.I0(ANGLE_IBUF[4]),
        .I1(ANGLE_IBUF[2]),
        .I2(ANGLE_IBUF[0]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[3]),
        .O(\SINE[0]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hE633AE5F9E1B49C8)) 
    \SINE[0]_i_8 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[1]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[0]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h4A994CFE5297C90B)) 
    \SINE[0]_i_9 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[3]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[0]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SINE[1]_i_1 
       (.I0(\SINE[1]_i_2_n_0 ),
        .I1(\SINE_reg[1]_i_3_n_0 ),
        .I2(ANGLE_IBUF[8]),
        .I3(\SINE_reg[1]_i_4_n_0 ),
        .I4(ANGLE_IBUF[6]),
        .I5(\SINE_reg[1]_i_5_n_0 ),
        .O(SINE_NEXT[1]));
  (* \PinAttr:I0:HOLD_DETOUR  = "1336" *) 
  (* \PinAttr:I1:HOLD_DETOUR  = "1406" *) 
  LUT6 #(
    .INIT(64'hCECDCF49DCE6FEE4)) 
    \SINE[1]_i_10 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[1]_i_10_n_0 ));
  (* \PinAttr:I1:HOLD_DETOUR  = "1404" *) 
  LUT6 #(
    .INIT(64'h5E3B6D2886474327)) 
    \SINE[1]_i_11 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[1]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[1]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h0A5BAEFA0E5AACB8)) 
    \SINE[1]_i_2 
       (.I0(ANGLE_IBUF[5]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[3]),
        .I4(ANGLE_IBUF[1]),
        .I5(ANGLE_IBUF[0]),
        .O(\SINE[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0C3F10FFE2F3EEE2)) 
    \SINE[1]_i_6 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[0]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[3]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[1]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h72B73768)) 
    \SINE[1]_i_7 
       (.I0(ANGLE_IBUF[4]),
        .I1(ANGLE_IBUF[1]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[3]),
        .O(\SINE[1]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h95E3C0F24CB15D21)) 
    \SINE[1]_i_8 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[3]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[1]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFDE2E86821D35E4A)) 
    \SINE[1]_i_9 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[0]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[3]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[1]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SINE[2]_i_1 
       (.I0(\SINE[2]_i_2_n_0 ),
        .I1(\SINE_reg[2]_i_3_n_0 ),
        .I2(ANGLE_IBUF[8]),
        .I3(\SINE_reg[2]_i_4_n_0 ),
        .I4(ANGLE_IBUF[6]),
        .I5(\SINE_reg[2]_i_5_n_0 ),
        .O(SINE_NEXT[2]));
  LUT6 #(
    .INIT(64'h02310313FCEC78EC)) 
    \SINE[2]_i_10 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[3]),
        .I4(ANGLE_IBUF[1]),
        .I5(ANGLE_IBUF[0]),
        .O(\SINE[2]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h239875CF0C738837)) 
    \SINE[2]_i_11 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[1]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[2]_i_11_n_0 ));
  (* \PinAttr:I2:HOLD_DETOUR  = "1464" *) 
  LUT6 #(
    .INIT(64'hB115E040F5548323)) 
    \SINE[2]_i_2 
       (.I0(ANGLE_IBUF[5]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hC00C00CCEF111100)) 
    \SINE[2]_i_6 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[0]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[1]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[2]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h29782C7F)) 
    \SINE[2]_i_7 
       (.I0(ANGLE_IBUF[4]),
        .I1(ANGLE_IBUF[2]),
        .I2(ANGLE_IBUF[0]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[3]),
        .O(\SINE[2]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h67C96FD4EE54FD57)) 
    \SINE[2]_i_8 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[1]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[2]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h3C805AE5FF3319F7)) 
    \SINE[2]_i_9 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[2]),
        .O(\SINE[2]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SINE[3]_i_1 
       (.I0(\SINE[3]_i_2_n_0 ),
        .I1(\SINE_reg[3]_i_3_n_0 ),
        .I2(ANGLE_IBUF[8]),
        .I3(\SINE_reg[3]_i_4_n_0 ),
        .I4(ANGLE_IBUF[6]),
        .I5(\SINE_reg[3]_i_5_n_0 ),
        .O(SINE_NEXT[3]));
  LUT6 #(
    .INIT(64'hA899FFDD56648422)) 
    \SINE[3]_i_10 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[3]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[3]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h152227FBE8D9C844)) 
    \SINE[3]_i_11 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[3]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[3]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h4422002015545577)) 
    \SINE[3]_i_2 
       (.I0(ANGLE_IBUF[5]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[3]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF000F000C0000005)) 
    \SINE[3]_i_6 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[0]),
        .I2(ANGLE_IBUF[4]),
        .I3(ANGLE_IBUF[3]),
        .I4(ANGLE_IBUF[1]),
        .I5(ANGLE_IBUF[2]),
        .O(\SINE[3]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hE74819B3)) 
    \SINE[3]_i_7 
       (.I0(ANGLE_IBUF[4]),
        .I1(ANGLE_IBUF[2]),
        .I2(ANGLE_IBUF[0]),
        .I3(ANGLE_IBUF[3]),
        .I4(ANGLE_IBUF[1]),
        .O(\SINE[3]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h7560DE4EE5F55F6E)) 
    \SINE[3]_i_8 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[0]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[1]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[3]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hF7AA98504FA5B75F)) 
    \SINE[3]_i_9 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[0]),
        .I2(ANGLE_IBUF[4]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[3]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SINE[4]_i_1 
       (.I0(\SINE[4]_i_2_n_0 ),
        .I1(\SINE[4]_i_3_n_0 ),
        .I2(ANGLE_IBUF[8]),
        .I3(\SINE_reg[4]_i_4_n_0 ),
        .I4(ANGLE_IBUF[6]),
        .I5(\SINE_reg[4]_i_5_n_0 ),
        .O(SINE_NEXT[4]));
  LUT6 #(
    .INIT(64'h5070507045240507)) 
    \SINE[4]_i_2 
       (.I0(ANGLE_IBUF[5]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[3]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[1]),
        .O(\SINE[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hDB22336E00000000)) 
    \SINE[4]_i_3 
       (.I0(ANGLE_IBUF[1]),
        .I1(ANGLE_IBUF[3]),
        .I2(ANGLE_IBUF[0]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[4]),
        .I5(ANGLE_IBUF[5]),
        .O(\SINE[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hDFFF75155EEEE444)) 
    \SINE[4]_i_6 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[1]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[4]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h00EF55A577A5FF05)) 
    \SINE[4]_i_7 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[0]),
        .I2(ANGLE_IBUF[4]),
        .I3(ANGLE_IBUF[3]),
        .I4(ANGLE_IBUF[1]),
        .I5(ANGLE_IBUF[2]),
        .O(\SINE[4]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hA558B478F05AF078)) 
    \SINE[4]_i_8 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[3]),
        .I5(ANGLE_IBUF[0]),
        .O(\SINE[4]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hB4E1F692B4B0D61E)) 
    \SINE[4]_i_9 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[3]),
        .I4(ANGLE_IBUF[1]),
        .I5(ANGLE_IBUF[0]),
        .O(\SINE[4]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SINE[5]_i_1 
       (.I0(\SINE[5]_i_2_n_0 ),
        .I1(\SINE[5]_i_3_n_0 ),
        .I2(ANGLE_IBUF[8]),
        .I3(\SINE_reg[5]_i_4_n_0 ),
        .I4(ANGLE_IBUF[6]),
        .I5(\SINE_reg[5]_i_5_n_0 ),
        .O(SINE_NEXT[5]));
  LUT6 #(
    .INIT(64'h0000050577777370)) 
    \SINE[5]_i_2 
       (.I0(ANGLE_IBUF[5]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[1]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[5]_i_2_n_0 ));
  (* \PinAttr:I4:HOLD_DETOUR  = "1499" *) 
  LUT6 #(
    .INIT(64'h1333CC8000000000)) 
    \SINE[5]_i_3 
       (.I0(ANGLE_IBUF[0]),
        .I1(ANGLE_IBUF[3]),
        .I2(ANGLE_IBUF[1]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[4]),
        .I5(ANGLE_IBUF[5]),
        .O(\SINE[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7F7D6D7D5F7D7D7D)) 
    \SINE[5]_i_6 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[2]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[4]),
        .O(\SINE[5]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h01111313FDFDDDDD)) 
    \SINE[5]_i_7 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[3]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[1]),
        .I5(ANGLE_IBUF[4]),
        .O(\SINE[5]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h0F5FFFFFE2A20000)) 
    \SINE[5]_i_8 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[1]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[5]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h5153BBBBB8A00004)) 
    \SINE[5]_i_9 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[1]),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[3]),
        .O(\SINE[5]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \SINE[6]_i_1 
       (.I0(\SINE[6]_i_2_n_0 ),
        .I1(\SINE[6]_i_3_n_0 ),
        .I2(ANGLE_IBUF[8]),
        .I3(\SINE_reg[6]_i_4_n_0 ),
        .I4(ANGLE_IBUF[6]),
        .I5(\SINE_reg[6]_i_5_n_0 ),
        .O(SINE_NEXT[6]));
  (* \PinAttr:I2:HOLD_DETOUR  = "1648" *) 
  LUT5 #(
    .INIT(32'h44413333)) 
    \SINE[6]_i_2 
       (.I0(ANGLE_IBUF[5]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[3]),
        .O(\SINE[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA800000000000)) 
    \SINE[6]_i_3 
       (.I0(ANGLE_IBUF[4]),
        .I1(ANGLE_IBUF[1]),
        .I2(ANGLE_IBUF[0]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[3]),
        .I5(ANGLE_IBUF[5]),
        .O(\SINE[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFDEDFD55575757)) 
    \SINE[6]_i_6 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[2]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[4]),
        .O(\SINE[6]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h0015FFFF)) 
    \SINE[6]_i_7 
       (.I0(ANGLE_IBUF[4]),
        .I1(ANGLE_IBUF[1]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[3]),
        .I4(ANGLE_IBUF[7]),
        .O(\SINE[6]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h9CCCCC44CC66CC66)) 
    \SINE[6]_i_8 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[0]),
        .I3(ANGLE_IBUF[3]),
        .I4(ANGLE_IBUF[1]),
        .I5(ANGLE_IBUF[2]),
        .O(\SINE[6]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFDDFFD4002A002A)) 
    \SINE[6]_i_9 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[2]),
        .I2(ANGLE_IBUF[1]),
        .I3(ANGLE_IBUF[3]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[4]),
        .O(\SINE[6]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h30FFBBBB30FF8888)) 
    \SINE[7]_i_2 
       (.I0(\SINE[7]_i_4_n_0 ),
        .I1(ANGLE_IBUF[6]),
        .I2(\SINE[9]_i_3_n_0 ),
        .I3(ANGLE_IBUF[7]),
        .I4(ANGLE_IBUF[5]),
        .I5(\SINE[7]_i_5_n_0 ),
        .O(\SINE[7]_i_2_n_0 ));
  (* \PinAttr:I0:HOLD_DETOUR  = "1914" *) 
  (* \PinAttr:I2:HOLD_DETOUR  = "1916" *) 
  (* \PinAttr:I3:HOLD_DETOUR  = "1921" *) 
  LUT6 #(
    .INIT(64'h0505FAEA00000000)) 
    \SINE[7]_i_3 
       (.I0(ANGLE_IBUF[4]),
        .I1(ANGLE_IBUF[2]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[5]),
        .I5(ANGLE_IBUF[6]),
        .O(\SINE[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h55574757FFFFFFFF)) 
    \SINE[7]_i_4 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[2]),
        .I2(ANGLE_IBUF[3]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[4]),
        .O(\SINE[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h402A002AAAAAAAAA)) 
    \SINE[7]_i_5 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[2]),
        .I2(ANGLE_IBUF[1]),
        .I3(ANGLE_IBUF[3]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[4]),
        .O(\SINE[7]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \SINE[8]_i_1 
       (.I0(\SINE[9]_i_2_n_0 ),
        .I1(ANGLE_IBUF[8]),
        .I2(\SINE[8]_i_2_n_0 ),
        .I3(ANGLE_IBUF[6]),
        .I4(\SINE[8]_i_3_n_0 ),
        .O(SINE_NEXT[8]));
  (* \PinAttr:I1:HOLD_DETOUR  = "1718" *) 
  (* \PinAttr:I4:HOLD_DETOUR  = "1687" *) 
  LUT6 #(
    .INIT(64'hFFFFFFFF00000400)) 
    \SINE[8]_i_2 
       (.I0(ANGLE_IBUF[5]),
        .I1(ANGLE_IBUF[4]),
        .I2(ANGLE_IBUF[0]),
        .I3(\SINE[8]_i_4_n_0 ),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[7]),
        .O(\SINE[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hA808000000000000)) 
    \SINE[8]_i_3 
       (.I0(ANGLE_IBUF[7]),
        .I1(ANGLE_IBUF[3]),
        .I2(ANGLE_IBUF[2]),
        .I3(\SINE[8]_i_5_n_0 ),
        .I4(ANGLE_IBUF[4]),
        .I5(ANGLE_IBUF[5]),
        .O(\SINE[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \SINE[8]_i_4 
       (.I0(ANGLE_IBUF[3]),
        .I1(ANGLE_IBUF[1]),
        .O(\SINE[8]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \SINE[8]_i_5 
       (.I0(ANGLE_IBUF[1]),
        .I1(ANGLE_IBUF[3]),
        .I2(ANGLE_IBUF[0]),
        .O(\SINE[8]_i_5_n_0 ));
  (* \PinAttr:I4:HOLD_DETOUR  = "400" *) 
  (* \PinAttr:I5:HOLD_DETOUR  = "1965" *) 
  LUT6 #(
    .INIT(64'hBB88B888B888B888)) 
    \SINE[9]_i_1 
       (.I0(\SINE[9]_i_2_n_0 ),
        .I1(ANGLE_IBUF[8]),
        .I2(ANGLE_IBUF[6]),
        .I3(ANGLE_IBUF[7]),
        .I4(\SINE[9]_i_3_n_0 ),
        .I5(ANGLE_IBUF[5]),
        .O(SINE_NEXT[9]));
  LUT6 #(
    .INIT(64'hFFFFFFFDFFFFFFFF)) 
    \SINE[9]_i_2 
       (.I0(ANGLE_IBUF[5]),
        .I1(ANGLE_IBUF[2]),
        .I2(\SINE[9]_i_4_n_0 ),
        .I3(ANGLE_IBUF[0]),
        .I4(ANGLE_IBUF[4]),
        .I5(ANGLE_IBUF[6]),
        .O(\SINE[9]_i_2_n_0 ));
  (* \PinAttr:I4:HOLD_DETOUR  = "1650" *) 
  LUT5 #(
    .INIT(32'hEEEA0000)) 
    \SINE[9]_i_3 
       (.I0(ANGLE_IBUF[3]),
        .I1(ANGLE_IBUF[2]),
        .I2(ANGLE_IBUF[0]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[4]),
        .O(\SINE[9]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \SINE[9]_i_4 
       (.I0(ANGLE_IBUF[1]),
        .I1(ANGLE_IBUF[3]),
        .O(\SINE[9]_i_4_n_0 ));
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
  MUXF7 \SINE_reg[1]_i_3 
       (.I0(\SINE[1]_i_6_n_0 ),
        .I1(\SINE[1]_i_7_n_0 ),
        .O(\SINE_reg[1]_i_3_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[1]_i_4 
       (.I0(\SINE[1]_i_8_n_0 ),
        .I1(\SINE[1]_i_9_n_0 ),
        .O(\SINE_reg[1]_i_4_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[1]_i_5 
       (.I0(\SINE[1]_i_10_n_0 ),
        .I1(\SINE[1]_i_11_n_0 ),
        .O(\SINE_reg[1]_i_5_n_0 ),
        .S(ANGLE_IBUF[5]));
  FDRE #(
    .INIT(1'b0)) 
    \SINE_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(SINE_NEXT[2]),
        .Q(SINE_OBUF[2]),
        .R(RESET_IBUF));
  MUXF7 \SINE_reg[2]_i_3 
       (.I0(\SINE[2]_i_6_n_0 ),
        .I1(\SINE[2]_i_7_n_0 ),
        .O(\SINE_reg[2]_i_3_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[2]_i_4 
       (.I0(\SINE[2]_i_8_n_0 ),
        .I1(\SINE[2]_i_9_n_0 ),
        .O(\SINE_reg[2]_i_4_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[2]_i_5 
       (.I0(\SINE[2]_i_10_n_0 ),
        .I1(\SINE[2]_i_11_n_0 ),
        .O(\SINE_reg[2]_i_5_n_0 ),
        .S(ANGLE_IBUF[5]));
  FDRE #(
    .INIT(1'b0)) 
    \SINE_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(SINE_NEXT[3]),
        .Q(SINE_OBUF[3]),
        .R(RESET_IBUF));
  MUXF7 \SINE_reg[3]_i_3 
       (.I0(\SINE[3]_i_6_n_0 ),
        .I1(\SINE[3]_i_7_n_0 ),
        .O(\SINE_reg[3]_i_3_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[3]_i_4 
       (.I0(\SINE[3]_i_8_n_0 ),
        .I1(\SINE[3]_i_9_n_0 ),
        .O(\SINE_reg[3]_i_4_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[3]_i_5 
       (.I0(\SINE[3]_i_10_n_0 ),
        .I1(\SINE[3]_i_11_n_0 ),
        .O(\SINE_reg[3]_i_5_n_0 ),
        .S(ANGLE_IBUF[5]));
  FDRE #(
    .INIT(1'b0)) 
    \SINE_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(SINE_NEXT[4]),
        .Q(SINE_OBUF[4]),
        .R(RESET_IBUF));
  MUXF7 \SINE_reg[4]_i_4 
       (.I0(\SINE[4]_i_6_n_0 ),
        .I1(\SINE[4]_i_7_n_0 ),
        .O(\SINE_reg[4]_i_4_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[4]_i_5 
       (.I0(\SINE[4]_i_8_n_0 ),
        .I1(\SINE[4]_i_9_n_0 ),
        .O(\SINE_reg[4]_i_5_n_0 ),
        .S(ANGLE_IBUF[5]));
  FDRE #(
    .INIT(1'b0)) 
    \SINE_reg[5] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(SINE_NEXT[5]),
        .Q(SINE_OBUF[5]),
        .R(RESET_IBUF));
  MUXF7 \SINE_reg[5]_i_4 
       (.I0(\SINE[5]_i_6_n_0 ),
        .I1(\SINE[5]_i_7_n_0 ),
        .O(\SINE_reg[5]_i_4_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[5]_i_5 
       (.I0(\SINE[5]_i_8_n_0 ),
        .I1(\SINE[5]_i_9_n_0 ),
        .O(\SINE_reg[5]_i_5_n_0 ),
        .S(ANGLE_IBUF[5]));
  FDRE #(
    .INIT(1'b0)) 
    \SINE_reg[6] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(SINE_NEXT[6]),
        .Q(SINE_OBUF[6]),
        .R(RESET_IBUF));
  MUXF7 \SINE_reg[6]_i_4 
       (.I0(\SINE[6]_i_6_n_0 ),
        .I1(\SINE[6]_i_7_n_0 ),
        .O(\SINE_reg[6]_i_4_n_0 ),
        .S(ANGLE_IBUF[5]));
  MUXF7 \SINE_reg[6]_i_5 
       (.I0(\SINE[6]_i_8_n_0 ),
        .I1(\SINE[6]_i_9_n_0 ),
        .O(\SINE_reg[6]_i_5_n_0 ),
        .S(ANGLE_IBUF[5]));
  FDRE #(
    .INIT(1'b0)) 
    \SINE_reg[7] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(SINE_NEXT[7]),
        .Q(SINE_OBUF[7]),
        .R(RESET_IBUF));
  MUXF7 \SINE_reg[7]_i_1 
       (.I0(\SINE[7]_i_2_n_0 ),
        .I1(\SINE[7]_i_3_n_0 ),
        .O(SINE_NEXT[7]),
        .S(ANGLE_IBUF[8]));
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
