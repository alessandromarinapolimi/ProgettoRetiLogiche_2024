// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Fri Jan 24 00:06:01 2025
// Host        : Laptop-ASH running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/ultro/OneDrive/ALTRO/Desktop/ProgettoRetiLogiche_2024/FIXEDPOINTSIN_/FIXEDPOINTSIN_.sim/sim_1/synth/timing/xsim/TB_SINE_time_synth.v
// Design      : SINE
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* M = "9" *) (* N = "10" *) 
(* NotValidForBitStream *)
module SINE
   (CLK,
    RESET,
    ANGLE,
    SINE);
  input CLK;
  input RESET;
  input [8:0]ANGLE;
  output [9:0]SINE;

  wire [8:0]ANGLE;
  wire \ANGLE_ADJUSTED[1]_i_1_n_0 ;
  wire \ANGLE_ADJUSTED[2]_i_1_n_0 ;
  wire \ANGLE_ADJUSTED[3]_i_1_n_0 ;
  wire \ANGLE_ADJUSTED[3]_i_2_n_0 ;
  wire \ANGLE_ADJUSTED[3]_i_3_n_0 ;
  wire \ANGLE_ADJUSTED[4]_i_1_n_0 ;
  wire \ANGLE_ADJUSTED[4]_i_2_n_0 ;
  wire \ANGLE_ADJUSTED[4]_i_3_n_0 ;
  wire \ANGLE_ADJUSTED[4]_i_4_n_0 ;
  wire \ANGLE_ADJUSTED[4]_i_5_n_0 ;
  wire \ANGLE_ADJUSTED[5]_i_1_n_0 ;
  wire \ANGLE_ADJUSTED[5]_i_2_n_0 ;
  wire \ANGLE_ADJUSTED[5]_i_4_n_0 ;
  wire \ANGLE_ADJUSTED[5]_i_5_n_0 ;
  wire \ANGLE_ADJUSTED[6]_i_1_n_0 ;
  wire \ANGLE_ADJUSTED[6]_i_2_n_0 ;
  wire \ANGLE_ADJUSTED[6]_i_3_n_0 ;
  wire \ANGLE_ADJUSTED[6]_i_4_n_0 ;
  wire \ANGLE_ADJUSTED[6]_i_5_n_0 ;
  wire \ANGLE_ADJUSTED[6]_i_6_n_0 ;
  wire \ANGLE_ADJUSTED[6]_i_7_n_0 ;
  wire \ANGLE_ADJUSTED[6]_i_8_n_0 ;
  wire \ANGLE_ADJUSTED_reg_n_0_[0] ;
  wire \ANGLE_ADJUSTED_reg_n_0_[1] ;
  wire \ANGLE_ADJUSTED_reg_n_0_[2] ;
  wire [8:0]ANGLE_IBUF;
  wire CLK;
  wire CLK_IBUF;
  wire CLK_IBUF_BUFG;
  wire GT_180;
  wire NEG_FLAG;
  wire NEG_FLAG_i_1_n_0;
  wire RESET;
  wire RESET_IBUF;
  wire [9:0]SINE;
  wire \SINE[0]_i_2_n_0 ;
  wire \SINE[0]_i_3_n_0 ;
  wire \SINE[1]_i_4_n_0 ;
  wire \SINE[1]_i_5_n_0 ;
  wire \SINE[1]_i_6_n_0 ;
  wire \SINE[1]_i_7_n_0 ;
  wire \SINE[2]_i_4_n_0 ;
  wire \SINE[2]_i_5_n_0 ;
  wire \SINE[2]_i_6_n_0 ;
  wire \SINE[2]_i_7_n_0 ;
  wire \SINE[3]_i_4_n_0 ;
  wire \SINE[3]_i_5_n_0 ;
  wire \SINE[3]_i_6_n_0 ;
  wire \SINE[3]_i_7_n_0 ;
  wire \SINE[4]_i_4_n_0 ;
  wire \SINE[4]_i_5_n_0 ;
  wire \SINE[4]_i_6_n_0 ;
  wire \SINE[4]_i_7_n_0 ;
  wire \SINE[5]_i_1_n_0 ;
  wire \SINE[5]_i_2_n_0 ;
  wire \SINE[5]_i_3_n_0 ;
  wire \SINE[6]_i_1_n_0 ;
  wire \SINE[6]_i_2_n_0 ;
  wire \SINE[6]_i_3_n_0 ;
  wire \SINE[6]_i_4_n_0 ;
  wire \SINE[7]_i_2_n_0 ;
  wire \SINE[7]_i_3_n_0 ;
  wire \SINE[7]_i_4_n_0 ;
  wire \SINE[7]_i_5_n_0 ;
  wire \SINE[7]_i_6_n_0 ;
  wire \SINE[8]_i_1_n_0 ;
  wire \SINE[8]_i_2_n_0 ;
  wire \SINE[8]_i_3_n_0 ;
  wire \SINE[9]_i_1_n_0 ;
  wire \SINE[9]_i_2_n_0 ;
  wire [9:0]SINE_OBUF;
  wire \SINE_reg[0]_i_1_n_0 ;
  wire \SINE_reg[1]_i_1_n_0 ;
  wire \SINE_reg[1]_i_2_n_0 ;
  wire \SINE_reg[1]_i_3_n_0 ;
  wire \SINE_reg[2]_i_1_n_0 ;
  wire \SINE_reg[2]_i_2_n_0 ;
  wire \SINE_reg[2]_i_3_n_0 ;
  wire \SINE_reg[3]_i_1_n_0 ;
  wire \SINE_reg[3]_i_2_n_0 ;
  wire \SINE_reg[3]_i_3_n_0 ;
  wire \SINE_reg[4]_i_1_n_0 ;
  wire \SINE_reg[4]_i_2_n_0 ;
  wire \SINE_reg[4]_i_3_n_0 ;
  wire \SINE_reg[7]_i_1_n_0 ;
  wire [3:0]sel0;

initial begin
 $sdf_annotate("TB_SINE_time_synth.sdf",,,,"tool_control");
end
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hA857FF00)) 
    \ANGLE_ADJUSTED[1]_i_1 
       (.I0(\ANGLE_ADJUSTED[6]_i_3_n_0 ),
        .I1(\ANGLE_ADJUSTED[3]_i_2_n_0 ),
        .I2(GT_180),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[0]),
        .O(\ANGLE_ADJUSTED[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5050504FAFAFAFB0)) 
    \ANGLE_ADJUSTED[2]_i_1 
       (.I0(GT_180),
        .I1(\ANGLE_ADJUSTED[3]_i_2_n_0 ),
        .I2(\ANGLE_ADJUSTED[6]_i_3_n_0 ),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[0]),
        .I5(ANGLE_IBUF[2]),
        .O(\ANGLE_ADJUSTED[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF0050AFEF105FA0)) 
    \ANGLE_ADJUSTED[3]_i_1 
       (.I0(GT_180),
        .I1(\ANGLE_ADJUSTED[3]_i_2_n_0 ),
        .I2(\ANGLE_ADJUSTED[6]_i_3_n_0 ),
        .I3(ANGLE_IBUF[3]),
        .I4(ANGLE_IBUF[2]),
        .I5(\ANGLE_ADJUSTED[3]_i_3_n_0 ),
        .O(\ANGLE_ADJUSTED[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h1011)) 
    \ANGLE_ADJUSTED[3]_i_2 
       (.I0(ANGLE_IBUF[8]),
        .I1(ANGLE_IBUF[7]),
        .I2(\ANGLE_ADJUSTED[6]_i_7_n_0 ),
        .I3(ANGLE_IBUF[6]),
        .O(\ANGLE_ADJUSTED[3]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \ANGLE_ADJUSTED[3]_i_3 
       (.I0(ANGLE_IBUF[1]),
        .I1(ANGLE_IBUF[0]),
        .O(\ANGLE_ADJUSTED[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hB80074FFB8FF7400)) 
    \ANGLE_ADJUSTED[4]_i_1 
       (.I0(\ANGLE_ADJUSTED[4]_i_2_n_0 ),
        .I1(GT_180),
        .I2(\ANGLE_ADJUSTED[4]_i_3_n_0 ),
        .I3(\ANGLE_ADJUSTED[6]_i_3_n_0 ),
        .I4(ANGLE_IBUF[4]),
        .I5(\ANGLE_ADJUSTED[4]_i_4_n_0 ),
        .O(\ANGLE_ADJUSTED[4]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \ANGLE_ADJUSTED[4]_i_2 
       (.I0(ANGLE_IBUF[2]),
        .I1(ANGLE_IBUF[3]),
        .O(\ANGLE_ADJUSTED[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h1011EFEEFFFF0000)) 
    \ANGLE_ADJUSTED[4]_i_3 
       (.I0(ANGLE_IBUF[8]),
        .I1(ANGLE_IBUF[7]),
        .I2(\ANGLE_ADJUSTED[6]_i_7_n_0 ),
        .I3(ANGLE_IBUF[6]),
        .I4(ANGLE_IBUF[4]),
        .I5(\ANGLE_ADJUSTED[4]_i_5_n_0 ),
        .O(\ANGLE_ADJUSTED[4]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hAAA8)) 
    \ANGLE_ADJUSTED[4]_i_4 
       (.I0(ANGLE_IBUF[3]),
        .I1(ANGLE_IBUF[2]),
        .I2(ANGLE_IBUF[1]),
        .I3(ANGLE_IBUF[0]),
        .O(\ANGLE_ADJUSTED[4]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0155)) 
    \ANGLE_ADJUSTED[4]_i_5 
       (.I0(ANGLE_IBUF[3]),
        .I1(ANGLE_IBUF[1]),
        .I2(ANGLE_IBUF[0]),
        .I3(ANGLE_IBUF[2]),
        .O(\ANGLE_ADJUSTED[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hB80074FFB8FF7400)) 
    \ANGLE_ADJUSTED[5]_i_1 
       (.I0(\ANGLE_ADJUSTED[5]_i_2_n_0 ),
        .I1(GT_180),
        .I2(\ANGLE_ADJUSTED[5]_i_4_n_0 ),
        .I3(\ANGLE_ADJUSTED[6]_i_3_n_0 ),
        .I4(ANGLE_IBUF[5]),
        .I5(\ANGLE_ADJUSTED[6]_i_4_n_0 ),
        .O(\ANGLE_ADJUSTED[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h1F)) 
    \ANGLE_ADJUSTED[5]_i_2 
       (.I0(ANGLE_IBUF[3]),
        .I1(ANGLE_IBUF[2]),
        .I2(ANGLE_IBUF[4]),
        .O(\ANGLE_ADJUSTED[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFFA8)) 
    \ANGLE_ADJUSTED[5]_i_3 
       (.I0(ANGLE_IBUF[7]),
        .I1(\ANGLE_ADJUSTED[6]_i_6_n_0 ),
        .I2(ANGLE_IBUF[6]),
        .I3(ANGLE_IBUF[8]),
        .O(GT_180));
  LUT6 #(
    .INIT(64'hFFFF00001011EFEE)) 
    \ANGLE_ADJUSTED[5]_i_4 
       (.I0(ANGLE_IBUF[8]),
        .I1(ANGLE_IBUF[7]),
        .I2(\ANGLE_ADJUSTED[6]_i_7_n_0 ),
        .I3(ANGLE_IBUF[6]),
        .I4(ANGLE_IBUF[5]),
        .I5(\ANGLE_ADJUSTED[5]_i_5_n_0 ),
        .O(\ANGLE_ADJUSTED[5]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hAAAA8880)) 
    \ANGLE_ADJUSTED[5]_i_5 
       (.I0(ANGLE_IBUF[4]),
        .I1(ANGLE_IBUF[2]),
        .I2(ANGLE_IBUF[0]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[3]),
        .O(\ANGLE_ADJUSTED[5]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h8BB88B8B)) 
    \ANGLE_ADJUSTED[6]_i_1 
       (.I0(\ANGLE_ADJUSTED[6]_i_2_n_0 ),
        .I1(\ANGLE_ADJUSTED[6]_i_3_n_0 ),
        .I2(ANGLE_IBUF[6]),
        .I3(\ANGLE_ADJUSTED[6]_i_4_n_0 ),
        .I4(ANGLE_IBUF[5]),
        .O(\ANGLE_ADJUSTED[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAABB80AAAA8B80)) 
    \ANGLE_ADJUSTED[6]_i_2 
       (.I0(\ANGLE_ADJUSTED[6]_i_5_n_0 ),
        .I1(ANGLE_IBUF[7]),
        .I2(\ANGLE_ADJUSTED[6]_i_6_n_0 ),
        .I3(ANGLE_IBUF[6]),
        .I4(ANGLE_IBUF[8]),
        .I5(\ANGLE_ADJUSTED[6]_i_7_n_0 ),
        .O(\ANGLE_ADJUSTED[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h15555555FFFFFFFF)) 
    \ANGLE_ADJUSTED[6]_i_3 
       (.I0(\ANGLE_ADJUSTED[6]_i_8_n_0 ),
        .I1(ANGLE_IBUF[0]),
        .I2(ANGLE_IBUF[1]),
        .I3(ANGLE_IBUF[3]),
        .I4(ANGLE_IBUF[2]),
        .I5(ANGLE_IBUF[8]),
        .O(\ANGLE_ADJUSTED[6]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00015555)) 
    \ANGLE_ADJUSTED[6]_i_4 
       (.I0(ANGLE_IBUF[4]),
        .I1(ANGLE_IBUF[0]),
        .I2(ANGLE_IBUF[1]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[3]),
        .O(\ANGLE_ADJUSTED[6]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hA9555555)) 
    \ANGLE_ADJUSTED[6]_i_5 
       (.I0(ANGLE_IBUF[6]),
        .I1(ANGLE_IBUF[3]),
        .I2(ANGLE_IBUF[2]),
        .I3(ANGLE_IBUF[4]),
        .I4(ANGLE_IBUF[5]),
        .O(\ANGLE_ADJUSTED[6]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFEAA000000000000)) 
    \ANGLE_ADJUSTED[6]_i_6 
       (.I0(ANGLE_IBUF[3]),
        .I1(ANGLE_IBUF[1]),
        .I2(ANGLE_IBUF[0]),
        .I3(ANGLE_IBUF[2]),
        .I4(ANGLE_IBUF[4]),
        .I5(ANGLE_IBUF[5]),
        .O(\ANGLE_ADJUSTED[6]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0111555555555555)) 
    \ANGLE_ADJUSTED[6]_i_7 
       (.I0(ANGLE_IBUF[5]),
        .I1(ANGLE_IBUF[2]),
        .I2(ANGLE_IBUF[0]),
        .I3(ANGLE_IBUF[1]),
        .I4(ANGLE_IBUF[4]),
        .I5(ANGLE_IBUF[3]),
        .O(\ANGLE_ADJUSTED[6]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \ANGLE_ADJUSTED[6]_i_8 
       (.I0(ANGLE_IBUF[4]),
        .I1(ANGLE_IBUF[5]),
        .I2(ANGLE_IBUF[6]),
        .I3(ANGLE_IBUF[7]),
        .O(\ANGLE_ADJUSTED[6]_i_8_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ANGLE_ADJUSTED_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(ANGLE_IBUF[0]),
        .Q(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ANGLE_ADJUSTED_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\ANGLE_ADJUSTED[1]_i_1_n_0 ),
        .Q(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ANGLE_ADJUSTED_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\ANGLE_ADJUSTED[2]_i_1_n_0 ),
        .Q(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ANGLE_ADJUSTED_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\ANGLE_ADJUSTED[3]_i_1_n_0 ),
        .Q(sel0[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ANGLE_ADJUSTED_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\ANGLE_ADJUSTED[4]_i_1_n_0 ),
        .Q(sel0[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ANGLE_ADJUSTED_reg[5] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\ANGLE_ADJUSTED[5]_i_1_n_0 ),
        .Q(sel0[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ANGLE_ADJUSTED_reg[6] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\ANGLE_ADJUSTED[6]_i_1_n_0 ),
        .Q(sel0[3]),
        .R(1'b0));
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
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'hB)) 
    NEG_FLAG_i_1
       (.I0(GT_180),
        .I1(\ANGLE_ADJUSTED[6]_i_3_n_0 ),
        .O(NEG_FLAG_i_1_n_0));
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
    .INIT(64'hDCF4CFEF63587012)) 
    \SINE[0]_i_2 
       (.I0(sel0[2]),
        .I1(sel0[1]),
        .I2(sel0[0]),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .O(\SINE[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h01EEEE4111FE1150)) 
    \SINE[0]_i_3 
       (.I0(sel0[2]),
        .I1(sel0[1]),
        .I2(sel0[0]),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .O(\SINE[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hE65DC7CEC4C4F16E)) 
    \SINE[1]_i_4 
       (.I0(sel0[2]),
        .I1(sel0[1]),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I3(sel0[0]),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .O(\SINE[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFE01EF10114100FB)) 
    \SINE[1]_i_5 
       (.I0(sel0[2]),
        .I1(sel0[1]),
        .I2(sel0[0]),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .O(\SINE[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h399903ABAF26860C)) 
    \SINE[1]_i_6 
       (.I0(sel0[2]),
        .I1(sel0[1]),
        .I2(sel0[0]),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .O(\SINE[1]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFEFFEEEFF0011AB)) 
    \SINE[1]_i_7 
       (.I0(sel0[2]),
        .I1(sel0[1]),
        .I2(sel0[0]),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .O(\SINE[1]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h0A2B11917D4AE66E)) 
    \SINE[2]_i_4 
       (.I0(sel0[2]),
        .I1(sel0[1]),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I4(sel0[0]),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .O(\SINE[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFDFF365D)) 
    \SINE[2]_i_5 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .I5(sel0[2]),
        .O(\SINE[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFC6E8339C64738B0)) 
    \SINE[2]_i_6 
       (.I0(sel0[2]),
        .I1(sel0[1]),
        .I2(sel0[0]),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .O(\SINE[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h1100100101BEAF14)) 
    \SINE[2]_i_7 
       (.I0(sel0[2]),
        .I1(sel0[1]),
        .I2(sel0[0]),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .O(\SINE[2]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h2A5F11F7D484E688)) 
    \SINE[3]_i_4 
       (.I0(sel0[2]),
        .I1(sel0[1]),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I4(sel0[0]),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .O(\SINE[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFBFFA86E)) 
    \SINE[3]_i_5 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .I5(sel0[2]),
        .O(\SINE[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hDC31A0774EB189F6)) 
    \SINE[3]_i_6 
       (.I0(sel0[2]),
        .I1(sel0[1]),
        .I2(sel0[0]),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .O(\SINE[3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000000010444455)) 
    \SINE[3]_i_7 
       (.I0(sel0[1]),
        .I1(sel0[0]),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I5(sel0[2]),
        .O(\SINE[3]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h27FF9777D8886008)) 
    \SINE[4]_i_4 
       (.I0(sel0[2]),
        .I1(sel0[1]),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I4(sel0[0]),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .O(\SINE[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFDFFEAAA)) 
    \SINE[4]_i_5 
       (.I0(sel0[0]),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I4(sel0[1]),
        .I5(sel0[2]),
        .O(\SINE[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hD408880839777F76)) 
    \SINE[4]_i_6 
       (.I0(sel0[2]),
        .I1(sel0[1]),
        .I2(sel0[0]),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .O(\SINE[4]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000001555)) 
    \SINE[4]_i_7 
       (.I0(sel0[1]),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I4(sel0[0]),
        .I5(sel0[2]),
        .O(\SINE[4]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \SINE[5]_i_1 
       (.I0(\SINE[5]_i_2_n_0 ),
        .I1(NEG_FLAG),
        .I2(\SINE[6]_i_3_n_0 ),
        .I3(sel0[3]),
        .I4(\SINE[5]_i_3_n_0 ),
        .O(\SINE[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5B0F8F8F8F8F8786)) 
    \SINE[5]_i_2 
       (.I0(sel0[2]),
        .I1(sel0[1]),
        .I2(sel0[0]),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .O(\SINE[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hA7F7777760000008)) 
    \SINE[5]_i_3 
       (.I0(sel0[2]),
        .I1(sel0[1]),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I5(sel0[0]),
        .O(\SINE[5]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \SINE[6]_i_1 
       (.I0(\SINE[6]_i_2_n_0 ),
        .I1(NEG_FLAG),
        .I2(\SINE[6]_i_3_n_0 ),
        .I3(sel0[3]),
        .I4(\SINE[6]_i_4_n_0 ),
        .O(\SINE[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6333333333333B3A)) 
    \SINE[6]_i_2 
       (.I0(sel0[2]),
        .I1(sel0[1]),
        .I2(sel0[0]),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .O(\SINE[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFF7FFFF)) 
    \SINE[6]_i_3 
       (.I0(sel0[1]),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I4(sel0[0]),
        .I5(sel0[2]),
        .O(\SINE[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h9CCCCCCCCCCCCCC4)) 
    \SINE[6]_i_4 
       (.I0(sel0[2]),
        .I1(sel0[1]),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I5(sel0[0]),
        .O(\SINE[6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFBC8C8C8C)) 
    \SINE[7]_i_2 
       (.I0(\SINE[7]_i_4_n_0 ),
        .I1(sel0[3]),
        .I2(sel0[1]),
        .I3(\SINE[7]_i_5_n_0 ),
        .I4(sel0[0]),
        .I5(sel0[2]),
        .O(\SINE[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000045455550)) 
    \SINE[7]_i_3 
       (.I0(sel0[2]),
        .I1(\SINE[7]_i_6_n_0 ),
        .I2(sel0[1]),
        .I3(\SINE[9]_i_2_n_0 ),
        .I4(sel0[0]),
        .I5(sel0[3]),
        .O(\SINE[7]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hFDFF)) 
    \SINE[7]_i_4 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I3(sel0[0]),
        .O(\SINE[7]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \SINE[7]_i_5 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .O(\SINE[7]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \SINE[7]_i_6 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .O(\SINE[7]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFF00FE00FE00)) 
    \SINE[8]_i_1 
       (.I0(sel0[2]),
        .I1(\SINE[8]_i_2_n_0 ),
        .I2(sel0[1]),
        .I3(NEG_FLAG),
        .I4(\SINE[8]_i_3_n_0 ),
        .I5(sel0[3]),
        .O(\SINE[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \SINE[8]_i_2 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I3(sel0[0]),
        .O(\SINE[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000080000)) 
    \SINE[8]_i_3 
       (.I0(sel0[1]),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I4(sel0[0]),
        .I5(sel0[2]),
        .O(\SINE[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    \SINE[9]_i_1 
       (.I0(sel0[3]),
        .I1(sel0[1]),
        .I2(\SINE[9]_i_2_n_0 ),
        .I3(sel0[0]),
        .I4(sel0[2]),
        .I5(NEG_FLAG),
        .O(\SINE[9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \SINE[9]_i_2 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .O(\SINE[9]_i_2_n_0 ));
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
        .D(\SINE_reg[0]_i_1_n_0 ),
        .Q(SINE_OBUF[0]),
        .R(RESET_IBUF));
  MUXF7 \SINE_reg[0]_i_1 
       (.I0(\SINE[0]_i_2_n_0 ),
        .I1(\SINE[0]_i_3_n_0 ),
        .O(\SINE_reg[0]_i_1_n_0 ),
        .S(sel0[3]));
  FDRE #(
    .INIT(1'b0)) 
    \SINE_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\SINE_reg[1]_i_1_n_0 ),
        .Q(SINE_OBUF[1]),
        .R(RESET_IBUF));
  MUXF8 \SINE_reg[1]_i_1 
       (.I0(\SINE_reg[1]_i_2_n_0 ),
        .I1(\SINE_reg[1]_i_3_n_0 ),
        .O(\SINE_reg[1]_i_1_n_0 ),
        .S(NEG_FLAG));
  MUXF7 \SINE_reg[1]_i_2 
       (.I0(\SINE[1]_i_4_n_0 ),
        .I1(\SINE[1]_i_5_n_0 ),
        .O(\SINE_reg[1]_i_2_n_0 ),
        .S(sel0[3]));
  MUXF7 \SINE_reg[1]_i_3 
       (.I0(\SINE[1]_i_6_n_0 ),
        .I1(\SINE[1]_i_7_n_0 ),
        .O(\SINE_reg[1]_i_3_n_0 ),
        .S(sel0[3]));
  FDRE #(
    .INIT(1'b0)) 
    \SINE_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\SINE_reg[2]_i_1_n_0 ),
        .Q(SINE_OBUF[2]),
        .R(RESET_IBUF));
  MUXF8 \SINE_reg[2]_i_1 
       (.I0(\SINE_reg[2]_i_2_n_0 ),
        .I1(\SINE_reg[2]_i_3_n_0 ),
        .O(\SINE_reg[2]_i_1_n_0 ),
        .S(NEG_FLAG));
  MUXF7 \SINE_reg[2]_i_2 
       (.I0(\SINE[2]_i_4_n_0 ),
        .I1(\SINE[2]_i_5_n_0 ),
        .O(\SINE_reg[2]_i_2_n_0 ),
        .S(sel0[3]));
  MUXF7 \SINE_reg[2]_i_3 
       (.I0(\SINE[2]_i_6_n_0 ),
        .I1(\SINE[2]_i_7_n_0 ),
        .O(\SINE_reg[2]_i_3_n_0 ),
        .S(sel0[3]));
  FDRE #(
    .INIT(1'b0)) 
    \SINE_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\SINE_reg[3]_i_1_n_0 ),
        .Q(SINE_OBUF[3]),
        .R(RESET_IBUF));
  MUXF8 \SINE_reg[3]_i_1 
       (.I0(\SINE_reg[3]_i_2_n_0 ),
        .I1(\SINE_reg[3]_i_3_n_0 ),
        .O(\SINE_reg[3]_i_1_n_0 ),
        .S(NEG_FLAG));
  MUXF7 \SINE_reg[3]_i_2 
       (.I0(\SINE[3]_i_4_n_0 ),
        .I1(\SINE[3]_i_5_n_0 ),
        .O(\SINE_reg[3]_i_2_n_0 ),
        .S(sel0[3]));
  MUXF7 \SINE_reg[3]_i_3 
       (.I0(\SINE[3]_i_6_n_0 ),
        .I1(\SINE[3]_i_7_n_0 ),
        .O(\SINE_reg[3]_i_3_n_0 ),
        .S(sel0[3]));
  FDRE #(
    .INIT(1'b0)) 
    \SINE_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\SINE_reg[4]_i_1_n_0 ),
        .Q(SINE_OBUF[4]),
        .R(RESET_IBUF));
  MUXF8 \SINE_reg[4]_i_1 
       (.I0(\SINE_reg[4]_i_2_n_0 ),
        .I1(\SINE_reg[4]_i_3_n_0 ),
        .O(\SINE_reg[4]_i_1_n_0 ),
        .S(NEG_FLAG));
  MUXF7 \SINE_reg[4]_i_2 
       (.I0(\SINE[4]_i_4_n_0 ),
        .I1(\SINE[4]_i_5_n_0 ),
        .O(\SINE_reg[4]_i_2_n_0 ),
        .S(sel0[3]));
  MUXF7 \SINE_reg[4]_i_3 
       (.I0(\SINE[4]_i_6_n_0 ),
        .I1(\SINE[4]_i_7_n_0 ),
        .O(\SINE_reg[4]_i_3_n_0 ),
        .S(sel0[3]));
  FDRE #(
    .INIT(1'b0)) 
    \SINE_reg[5] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\SINE[5]_i_1_n_0 ),
        .Q(SINE_OBUF[5]),
        .R(RESET_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \SINE_reg[6] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\SINE[6]_i_1_n_0 ),
        .Q(SINE_OBUF[6]),
        .R(RESET_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \SINE_reg[7] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\SINE_reg[7]_i_1_n_0 ),
        .Q(SINE_OBUF[7]),
        .R(RESET_IBUF));
  MUXF7 \SINE_reg[7]_i_1 
       (.I0(\SINE[7]_i_2_n_0 ),
        .I1(\SINE[7]_i_3_n_0 ),
        .O(\SINE_reg[7]_i_1_n_0 ),
        .S(NEG_FLAG));
  FDRE #(
    .INIT(1'b0)) 
    \SINE_reg[8] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\SINE[8]_i_1_n_0 ),
        .Q(SINE_OBUF[8]),
        .R(RESET_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \SINE_reg[9] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\SINE[9]_i_1_n_0 ),
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
