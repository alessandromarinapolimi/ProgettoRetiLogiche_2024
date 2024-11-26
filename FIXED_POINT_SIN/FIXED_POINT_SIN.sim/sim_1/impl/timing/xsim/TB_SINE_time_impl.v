// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Sun Nov 24 21:10:13 2024
// Host        : Laptop-ASH running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file {C:/Users/ultro/OneDrive/ALTRO/Desktop/PRL
//               OCT10/ProgettoRetiLogiche_2024/FIXED_POINT_SIN/FIXED_POINT_SIN.sim/sim_1/impl/timing/xsim/TB_SINE_time_impl.v}
// Design      : SINE_CALCULATOR
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ECO_CHECKSUM = "eeb82940" *) (* M = "9" *) (* N = "10" *) 
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
  wire \ANGLE_ADJUSTED[1]_i_1_n_0 ;
  wire \ANGLE_ADJUSTED[2]_i_1_n_0 ;
  wire \ANGLE_ADJUSTED[3]_i_1_n_0 ;
  wire \ANGLE_ADJUSTED[4]_i_1_n_0 ;
  wire \ANGLE_ADJUSTED[4]_i_2_n_0 ;
  wire \ANGLE_ADJUSTED[5]_i_1_n_0 ;
  wire \ANGLE_ADJUSTED[5]_i_2_n_0 ;
  wire \ANGLE_ADJUSTED[5]_i_3_n_0 ;
  wire \ANGLE_ADJUSTED[6]_i_1_n_0 ;
  wire \ANGLE_ADJUSTED[6]_i_2_n_0 ;
  wire \ANGLE_ADJUSTED[6]_i_3_n_0 ;
  wire \ANGLE_ADJUSTED[6]_i_4_n_0 ;
  wire \ANGLE_ADJUSTED_reg_n_0_[0] ;
  wire \ANGLE_ADJUSTED_reg_n_0_[1] ;
  wire \ANGLE_ADJUSTED_reg_n_0_[2] ;
  wire \ANGLE_ADJUSTED_reg_n_0_[3] ;
  wire \ANGLE_ADJUSTED_reg_n_0_[4] ;
  wire \ANGLE_ADJUSTED_reg_n_0_[5] ;
  wire \ANGLE_ADJUSTED_reg_n_0_[6] ;
  wire [8:0]ANGLE_IBUF;
  wire CLK;
  wire CLK_IBUF;
  wire CLK_IBUF_BUFG;
  wire [6:0]INPUT_ANGLE_REG;
  wire [8:7]INPUT_ANGLE_REG__0;
  wire [1:0]QUADRANT;
  wire \QUADRANT[0]_i_2_n_0 ;
  wire \QUADRANT[0]_i_3_n_0 ;
  wire \QUADRANT[1]_i_2_n_0 ;
  wire \QUADRANT[1]_i_3_n_0 ;
  wire \QUADRANT_reg_n_0_[0] ;
  wire RESET;
  wire RESET_IBUF;
  wire [9:0]SINE;
  wire \SINE_FINAL_RESULT[0]_i_2_n_0 ;
  wire \SINE_FINAL_RESULT[0]_i_3_n_0 ;
  wire \SINE_FINAL_RESULT[1]_i_4_n_0 ;
  wire \SINE_FINAL_RESULT[1]_i_5_n_0 ;
  wire \SINE_FINAL_RESULT[1]_i_6_n_0 ;
  wire \SINE_FINAL_RESULT[1]_i_7_n_0 ;
  wire \SINE_FINAL_RESULT[2]_i_4_n_0 ;
  wire \SINE_FINAL_RESULT[2]_i_5_n_0 ;
  wire \SINE_FINAL_RESULT[2]_i_6_n_0 ;
  wire \SINE_FINAL_RESULT[2]_i_7_n_0 ;
  wire \SINE_FINAL_RESULT[3]_i_4_n_0 ;
  wire \SINE_FINAL_RESULT[3]_i_5_n_0 ;
  wire \SINE_FINAL_RESULT[3]_i_6_n_0 ;
  wire \SINE_FINAL_RESULT[3]_i_7_n_0 ;
  wire \SINE_FINAL_RESULT[4]_i_4_n_0 ;
  wire \SINE_FINAL_RESULT[4]_i_5_n_0 ;
  wire \SINE_FINAL_RESULT[4]_i_6_n_0 ;
  wire \SINE_FINAL_RESULT[4]_i_7_n_0 ;
  wire \SINE_FINAL_RESULT[5]_i_1_n_0 ;
  wire \SINE_FINAL_RESULT[5]_i_2_n_0 ;
  wire \SINE_FINAL_RESULT[5]_i_3_n_0 ;
  wire \SINE_FINAL_RESULT[6]_i_1_n_0 ;
  wire \SINE_FINAL_RESULT[6]_i_2_n_0 ;
  wire \SINE_FINAL_RESULT[6]_i_3_n_0 ;
  wire \SINE_FINAL_RESULT[7]_i_1_n_0 ;
  wire \SINE_FINAL_RESULT[7]_i_2_n_0 ;
  wire \SINE_FINAL_RESULT[7]_i_3_n_0 ;
  wire \SINE_FINAL_RESULT[7]_i_4_n_0 ;
  wire \SINE_FINAL_RESULT[8]_i_1_n_0 ;
  wire \SINE_FINAL_RESULT[8]_i_2_n_0 ;
  wire \SINE_FINAL_RESULT[8]_i_3_n_0 ;
  wire \SINE_FINAL_RESULT[9]_i_1_n_0 ;
  wire \SINE_FINAL_RESULT[9]_i_2_n_0 ;
  wire \SINE_FINAL_RESULT_reg[0]_i_1_n_0 ;
  wire \SINE_FINAL_RESULT_reg[1]_i_1_n_0 ;
  wire \SINE_FINAL_RESULT_reg[1]_i_2_n_0 ;
  wire \SINE_FINAL_RESULT_reg[1]_i_3_n_0 ;
  wire \SINE_FINAL_RESULT_reg[2]_i_1_n_0 ;
  wire \SINE_FINAL_RESULT_reg[2]_i_2_n_0 ;
  wire \SINE_FINAL_RESULT_reg[2]_i_3_n_0 ;
  wire \SINE_FINAL_RESULT_reg[3]_i_1_n_0 ;
  wire \SINE_FINAL_RESULT_reg[3]_i_2_n_0 ;
  wire \SINE_FINAL_RESULT_reg[3]_i_3_n_0 ;
  wire \SINE_FINAL_RESULT_reg[4]_i_1_n_0 ;
  wire \SINE_FINAL_RESULT_reg[4]_i_2_n_0 ;
  wire \SINE_FINAL_RESULT_reg[4]_i_3_n_0 ;
  wire SINE_NEG_FLAG;
  wire [9:0]SINE_OBUF;
  wire \SUB_REG_MINUS_180/SUB_RCA/C_5 ;
  wire p_0_in;

initial begin
 $sdf_annotate("TB_SINE_time_impl.sdf",,,,"tool_control");
end
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \ANGLE_ADJUSTED[1]_i_1 
       (.I0(INPUT_ANGLE_REG[1]),
        .I1(INPUT_ANGLE_REG[0]),
        .I2(\QUADRANT_reg_n_0_[0] ),
        .O(\ANGLE_ADJUSTED[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h5655A9AA)) 
    \ANGLE_ADJUSTED[2]_i_1 
       (.I0(INPUT_ANGLE_REG[2]),
        .I1(INPUT_ANGLE_REG[0]),
        .I2(INPUT_ANGLE_REG[1]),
        .I3(\QUADRANT_reg_n_0_[0] ),
        .I4(p_0_in),
        .O(\ANGLE_ADJUSTED[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAA9AA5556AAAAAA)) 
    \ANGLE_ADJUSTED[3]_i_1 
       (.I0(INPUT_ANGLE_REG[3]),
        .I1(INPUT_ANGLE_REG[1]),
        .I2(INPUT_ANGLE_REG[0]),
        .I3(INPUT_ANGLE_REG[2]),
        .I4(\QUADRANT_reg_n_0_[0] ),
        .I5(p_0_in),
        .O(\ANGLE_ADJUSTED[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h59AA555AAA65AAAA)) 
    \ANGLE_ADJUSTED[4]_i_1 
       (.I0(INPUT_ANGLE_REG[4]),
        .I1(\ANGLE_ADJUSTED[4]_i_2_n_0 ),
        .I2(INPUT_ANGLE_REG[2]),
        .I3(INPUT_ANGLE_REG[3]),
        .I4(\QUADRANT_reg_n_0_[0] ),
        .I5(p_0_in),
        .O(\ANGLE_ADJUSTED[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \ANGLE_ADJUSTED[4]_i_2 
       (.I0(INPUT_ANGLE_REG[0]),
        .I1(INPUT_ANGLE_REG[1]),
        .O(\ANGLE_ADJUSTED[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h3C3366CC3CCC66CC)) 
    \ANGLE_ADJUSTED[5]_i_1 
       (.I0(\ANGLE_ADJUSTED[5]_i_2_n_0 ),
        .I1(INPUT_ANGLE_REG[5]),
        .I2(\ANGLE_ADJUSTED[5]_i_3_n_0 ),
        .I3(\QUADRANT_reg_n_0_[0] ),
        .I4(p_0_in),
        .I5(\SUB_REG_MINUS_180/SUB_RCA/C_5 ),
        .O(\ANGLE_ADJUSTED[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h0057FFFF)) 
    \ANGLE_ADJUSTED[5]_i_2 
       (.I0(INPUT_ANGLE_REG[2]),
        .I1(INPUT_ANGLE_REG[1]),
        .I2(INPUT_ANGLE_REG[0]),
        .I3(INPUT_ANGLE_REG[3]),
        .I4(INPUT_ANGLE_REG[4]),
        .O(\ANGLE_ADJUSTED[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00005557)) 
    \ANGLE_ADJUSTED[5]_i_3 
       (.I0(INPUT_ANGLE_REG[3]),
        .I1(INPUT_ANGLE_REG[2]),
        .I2(INPUT_ANGLE_REG[0]),
        .I3(INPUT_ANGLE_REG[1]),
        .I4(INPUT_ANGLE_REG[4]),
        .O(\ANGLE_ADJUSTED[5]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \ANGLE_ADJUSTED[5]_i_4 
       (.I0(INPUT_ANGLE_REG[2]),
        .I1(INPUT_ANGLE_REG[3]),
        .I2(INPUT_ANGLE_REG[4]),
        .O(\SUB_REG_MINUS_180/SUB_RCA/C_5 ));
  LUT6 #(
    .INIT(64'h3CFF99CC3C0099CC)) 
    \ANGLE_ADJUSTED[6]_i_1 
       (.I0(\ANGLE_ADJUSTED[6]_i_2_n_0 ),
        .I1(INPUT_ANGLE_REG[6]),
        .I2(\ANGLE_ADJUSTED[6]_i_3_n_0 ),
        .I3(\QUADRANT_reg_n_0_[0] ),
        .I4(p_0_in),
        .I5(\ANGLE_ADJUSTED[6]_i_4_n_0 ),
        .O(\ANGLE_ADJUSTED[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0057FFFFFFFFFFFF)) 
    \ANGLE_ADJUSTED[6]_i_2 
       (.I0(INPUT_ANGLE_REG[2]),
        .I1(INPUT_ANGLE_REG[1]),
        .I2(INPUT_ANGLE_REG[0]),
        .I3(INPUT_ANGLE_REG[3]),
        .I4(INPUT_ANGLE_REG[4]),
        .I5(INPUT_ANGLE_REG[5]),
        .O(\ANGLE_ADJUSTED[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00005557FFFFFFFF)) 
    \ANGLE_ADJUSTED[6]_i_3 
       (.I0(INPUT_ANGLE_REG[3]),
        .I1(INPUT_ANGLE_REG[2]),
        .I2(INPUT_ANGLE_REG[0]),
        .I3(INPUT_ANGLE_REG[1]),
        .I4(INPUT_ANGLE_REG[4]),
        .I5(INPUT_ANGLE_REG[5]),
        .O(\ANGLE_ADJUSTED[6]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hA80057FF)) 
    \ANGLE_ADJUSTED[6]_i_4 
       (.I0(INPUT_ANGLE_REG[5]),
        .I1(INPUT_ANGLE_REG[2]),
        .I2(INPUT_ANGLE_REG[3]),
        .I3(INPUT_ANGLE_REG[4]),
        .I4(INPUT_ANGLE_REG[6]),
        .O(\ANGLE_ADJUSTED[6]_i_4_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \ANGLE_ADJUSTED_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(RESET_IBUF),
        .D(INPUT_ANGLE_REG[0]),
        .Q(\ANGLE_ADJUSTED_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \ANGLE_ADJUSTED_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(RESET_IBUF),
        .D(\ANGLE_ADJUSTED[1]_i_1_n_0 ),
        .Q(\ANGLE_ADJUSTED_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \ANGLE_ADJUSTED_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(RESET_IBUF),
        .D(\ANGLE_ADJUSTED[2]_i_1_n_0 ),
        .Q(\ANGLE_ADJUSTED_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \ANGLE_ADJUSTED_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(RESET_IBUF),
        .D(\ANGLE_ADJUSTED[3]_i_1_n_0 ),
        .Q(\ANGLE_ADJUSTED_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \ANGLE_ADJUSTED_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(RESET_IBUF),
        .D(\ANGLE_ADJUSTED[4]_i_1_n_0 ),
        .Q(\ANGLE_ADJUSTED_reg_n_0_[4] ));
  FDCE #(
    .INIT(1'b0)) 
    \ANGLE_ADJUSTED_reg[5] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(RESET_IBUF),
        .D(\ANGLE_ADJUSTED[5]_i_1_n_0 ),
        .Q(\ANGLE_ADJUSTED_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \ANGLE_ADJUSTED_reg[6] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(RESET_IBUF),
        .D(\ANGLE_ADJUSTED[6]_i_1_n_0 ),
        .Q(\ANGLE_ADJUSTED_reg_n_0_[6] ));
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
  FDCE #(
    .INIT(1'b0)) 
    \INPUT_ANGLE_REG_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(RESET_IBUF),
        .D(ANGLE_IBUF[0]),
        .Q(INPUT_ANGLE_REG[0]));
  FDCE #(
    .INIT(1'b0)) 
    \INPUT_ANGLE_REG_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(RESET_IBUF),
        .D(ANGLE_IBUF[1]),
        .Q(INPUT_ANGLE_REG[1]));
  FDCE #(
    .INIT(1'b0)) 
    \INPUT_ANGLE_REG_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(RESET_IBUF),
        .D(ANGLE_IBUF[2]),
        .Q(INPUT_ANGLE_REG[2]));
  FDCE #(
    .INIT(1'b0)) 
    \INPUT_ANGLE_REG_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(RESET_IBUF),
        .D(ANGLE_IBUF[3]),
        .Q(INPUT_ANGLE_REG[3]));
  FDCE #(
    .INIT(1'b0)) 
    \INPUT_ANGLE_REG_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(RESET_IBUF),
        .D(ANGLE_IBUF[4]),
        .Q(INPUT_ANGLE_REG[4]));
  FDCE #(
    .INIT(1'b0)) 
    \INPUT_ANGLE_REG_reg[5] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(RESET_IBUF),
        .D(ANGLE_IBUF[5]),
        .Q(INPUT_ANGLE_REG[5]));
  FDCE #(
    .INIT(1'b0)) 
    \INPUT_ANGLE_REG_reg[6] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(RESET_IBUF),
        .D(ANGLE_IBUF[6]),
        .Q(INPUT_ANGLE_REG[6]));
  FDCE #(
    .INIT(1'b0)) 
    \INPUT_ANGLE_REG_reg[7] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(RESET_IBUF),
        .D(ANGLE_IBUF[7]),
        .Q(INPUT_ANGLE_REG__0[7]));
  FDCE #(
    .INIT(1'b0)) 
    \INPUT_ANGLE_REG_reg[8] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(RESET_IBUF),
        .D(ANGLE_IBUF[8]),
        .Q(INPUT_ANGLE_REG__0[8]));
  LUT6 #(
    .INIT(64'hFFB0FFB0FFB000B0)) 
    \QUADRANT[0]_i_1 
       (.I0(INPUT_ANGLE_REG__0[7]),
        .I1(\QUADRANT[1]_i_3_n_0 ),
        .I2(\QUADRANT[1]_i_2_n_0 ),
        .I3(INPUT_ANGLE_REG__0[8]),
        .I4(\QUADRANT[0]_i_2_n_0 ),
        .I5(\QUADRANT[0]_i_3_n_0 ),
        .O(QUADRANT[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \QUADRANT[0]_i_2 
       (.I0(INPUT_ANGLE_REG[1]),
        .I1(INPUT_ANGLE_REG[3]),
        .I2(INPUT_ANGLE_REG[2]),
        .O(\QUADRANT[0]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \QUADRANT[0]_i_3 
       (.I0(INPUT_ANGLE_REG[5]),
        .I1(INPUT_ANGLE_REG[4]),
        .I2(INPUT_ANGLE_REG__0[7]),
        .I3(INPUT_ANGLE_REG[6]),
        .O(\QUADRANT[0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF4F5)) 
    \QUADRANT[1]_i_1 
       (.I0(\QUADRANT[1]_i_2_n_0 ),
        .I1(INPUT_ANGLE_REG__0[7]),
        .I2(INPUT_ANGLE_REG__0[8]),
        .I3(\QUADRANT[1]_i_3_n_0 ),
        .O(QUADRANT[1]));
  LUT6 #(
    .INIT(64'h01555555FFFFFFFF)) 
    \QUADRANT[1]_i_2 
       (.I0(INPUT_ANGLE_REG[6]),
        .I1(INPUT_ANGLE_REG[2]),
        .I2(INPUT_ANGLE_REG[3]),
        .I3(INPUT_ANGLE_REG[5]),
        .I4(INPUT_ANGLE_REG[4]),
        .I5(INPUT_ANGLE_REG__0[7]),
        .O(\QUADRANT[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h01555555FFFFFFFF)) 
    \QUADRANT[1]_i_3 
       (.I0(INPUT_ANGLE_REG[5]),
        .I1(INPUT_ANGLE_REG[1]),
        .I2(INPUT_ANGLE_REG[2]),
        .I3(INPUT_ANGLE_REG[4]),
        .I4(INPUT_ANGLE_REG[3]),
        .I5(INPUT_ANGLE_REG[6]),
        .O(\QUADRANT[1]_i_3_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \QUADRANT_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(RESET_IBUF),
        .D(QUADRANT[0]),
        .Q(\QUADRANT_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \QUADRANT_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(RESET_IBUF),
        .D(QUADRANT[1]),
        .Q(p_0_in));
  IBUF RESET_IBUF_inst
       (.I(RESET),
        .O(RESET_IBUF));
  LUT6 #(
    .INIT(64'hBABA653865EF7014)) 
    \SINE_FINAL_RESULT[0]_i_2 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[4] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[5] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[3] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .O(\SINE_FINAL_RESULT[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h01EE0111EE21FE30)) 
    \SINE_FINAL_RESULT[0]_i_3 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[4] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[5] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[3] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .O(\SINE_FINAL_RESULT[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hEE33A2A2A7AEF16E)) 
    \SINE_FINAL_RESULT[1]_i_4 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[4] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[5] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[3] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .O(\SINE_FINAL_RESULT[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFEFE110011102131)) 
    \SINE_FINAL_RESULT[1]_i_5 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[4] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[5] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[3] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .O(\SINE_FINAL_RESULT[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h59CF59CDCF86460A)) 
    \SINE_FINAL_RESULT[1]_i_6 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[4] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[5] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[3] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .O(\SINE_FINAL_RESULT[1]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFEEFF110001)) 
    \SINE_FINAL_RESULT[1]_i_7 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[4] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[5] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[3] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .O(\SINE_FINAL_RESULT[1]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h014949D10126B6CE)) 
    \SINE_FINAL_RESULT[2]_i_4 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[4] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[5] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[3] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .O(\SINE_FINAL_RESULT[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFBBF6ABBB)) 
    \SINE_FINAL_RESULT[2]_i_5 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[4] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[3] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[5] ),
        .O(\SINE_FINAL_RESULT[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFAFAA658A65927D0)) 
    \SINE_FINAL_RESULT[2]_i_6 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[4] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[5] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[3] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .O(\SINE_FINAL_RESULT[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h050500053037F5FA)) 
    \SINE_FINAL_RESULT[2]_i_7 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[4] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[5] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[3] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .O(\SINE_FINAL_RESULT[2]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h41C141F7C1268828)) 
    \SINE_FINAL_RESULT[3]_i_4 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[4] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[5] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[3] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .O(\SINE_FINAL_RESULT[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFC8CCFFC)) 
    \SINE_FINAL_RESULT[3]_i_5 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[4] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[3] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[5] ),
        .O(\SINE_FINAL_RESULT[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hBABA2E892E77D1F6)) 
    \SINE_FINAL_RESULT[3]_i_6 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[4] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[5] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[3] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .O(\SINE_FINAL_RESULT[3]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00001445)) 
    \SINE_FINAL_RESULT[3]_i_7 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[5] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[3] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[4] ),
        .O(\SINE_FINAL_RESULT[3]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h49B649F7B6808088)) 
    \SINE_FINAL_RESULT[4]_i_4 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[4] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[5] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[3] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .O(\SINE_FINAL_RESULT[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFCBCFC)) 
    \SINE_FINAL_RESULT[4]_i_5 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[4] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[3] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[5] ),
        .O(\SINE_FINAL_RESULT[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hB2B25908597F7776)) 
    \SINE_FINAL_RESULT[4]_i_6 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[4] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[5] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[3] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .O(\SINE_FINAL_RESULT[4]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00000015)) 
    \SINE_FINAL_RESULT[4]_i_7 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[5] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[3] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[4] ),
        .O(\SINE_FINAL_RESULT[4]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h3033BBBB30338888)) 
    \SINE_FINAL_RESULT[5]_i_1 
       (.I0(\SINE_FINAL_RESULT[5]_i_2_n_0 ),
        .I1(SINE_NEG_FLAG),
        .I2(\SINE_FINAL_RESULT[7]_i_3_n_0 ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[4] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[6] ),
        .I5(\SINE_FINAL_RESULT[5]_i_3_n_0 ),
        .O(\SINE_FINAL_RESULT[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h3D8F8F873D8F8F86)) 
    \SINE_FINAL_RESULT[5]_i_2 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[4] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[5] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[3] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .O(\SINE_FINAL_RESULT[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF03F3F3F3C000040)) 
    \SINE_FINAL_RESULT[5]_i_3 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[4] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[5] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[3] ),
        .O(\SINE_FINAL_RESULT[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h3033BBBB30338888)) 
    \SINE_FINAL_RESULT[6]_i_1 
       (.I0(\SINE_FINAL_RESULT[6]_i_2_n_0 ),
        .I1(SINE_NEG_FLAG),
        .I2(\SINE_FINAL_RESULT[7]_i_3_n_0 ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[4] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[6] ),
        .I5(\SINE_FINAL_RESULT[6]_i_3_n_0 ),
        .O(\SINE_FINAL_RESULT[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5555555FA5555554)) 
    \SINE_FINAL_RESULT[6]_i_2 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[4] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[3] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[5] ),
        .O(\SINE_FINAL_RESULT[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCCCCCCC83CCCCCCC)) 
    \SINE_FINAL_RESULT[6]_i_3 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[4] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[3] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[5] ),
        .O(\SINE_FINAL_RESULT[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h3033BBBB30338888)) 
    \SINE_FINAL_RESULT[7]_i_1 
       (.I0(\SINE_FINAL_RESULT[7]_i_2_n_0 ),
        .I1(SINE_NEG_FLAG),
        .I2(\SINE_FINAL_RESULT[7]_i_3_n_0 ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[4] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[6] ),
        .I5(\SINE_FINAL_RESULT[7]_i_4_n_0 ),
        .O(\SINE_FINAL_RESULT[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000007FFF7FFE)) 
    \SINE_FINAL_RESULT[7]_i_2 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[4] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[3] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[5] ),
        .O(\SINE_FINAL_RESULT[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFFFFFF7)) 
    \SINE_FINAL_RESULT[7]_i_3 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[3] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[5] ),
        .O(\SINE_FINAL_RESULT[7]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF8000)) 
    \SINE_FINAL_RESULT[7]_i_4 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[3] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[4] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[5] ),
        .O(\SINE_FINAL_RESULT[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFF00FE00FE00)) 
    \SINE_FINAL_RESULT[8]_i_1 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[4] ),
        .I1(\SINE_FINAL_RESULT[8]_i_2_n_0 ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[5] ),
        .I3(SINE_NEG_FLAG),
        .I4(\SINE_FINAL_RESULT[8]_i_3_n_0 ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[6] ),
        .O(\SINE_FINAL_RESULT[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \SINE_FINAL_RESULT[8]_i_2 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[3] ),
        .O(\SINE_FINAL_RESULT[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0010000000000000)) 
    \SINE_FINAL_RESULT[8]_i_3 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[5] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[3] ),
        .I5(\ANGLE_ADJUSTED_reg_n_0_[4] ),
        .O(\SINE_FINAL_RESULT[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000)) 
    \SINE_FINAL_RESULT[9]_i_1 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[6] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[5] ),
        .I2(\SINE_FINAL_RESULT[9]_i_2_n_0 ),
        .I3(\ANGLE_ADJUSTED_reg_n_0_[3] ),
        .I4(\ANGLE_ADJUSTED_reg_n_0_[4] ),
        .I5(SINE_NEG_FLAG),
        .O(\SINE_FINAL_RESULT[9]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \SINE_FINAL_RESULT[9]_i_2 
       (.I0(\ANGLE_ADJUSTED_reg_n_0_[2] ),
        .I1(\ANGLE_ADJUSTED_reg_n_0_[1] ),
        .I2(\ANGLE_ADJUSTED_reg_n_0_[0] ),
        .O(\SINE_FINAL_RESULT[9]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \SINE_FINAL_RESULT_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(RESET_IBUF),
        .D(\SINE_FINAL_RESULT_reg[0]_i_1_n_0 ),
        .Q(SINE_OBUF[0]));
  MUXF7 \SINE_FINAL_RESULT_reg[0]_i_1 
       (.I0(\SINE_FINAL_RESULT[0]_i_2_n_0 ),
        .I1(\SINE_FINAL_RESULT[0]_i_3_n_0 ),
        .O(\SINE_FINAL_RESULT_reg[0]_i_1_n_0 ),
        .S(\ANGLE_ADJUSTED_reg_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \SINE_FINAL_RESULT_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(RESET_IBUF),
        .D(\SINE_FINAL_RESULT_reg[1]_i_1_n_0 ),
        .Q(SINE_OBUF[1]));
  MUXF8 \SINE_FINAL_RESULT_reg[1]_i_1 
       (.I0(\SINE_FINAL_RESULT_reg[1]_i_2_n_0 ),
        .I1(\SINE_FINAL_RESULT_reg[1]_i_3_n_0 ),
        .O(\SINE_FINAL_RESULT_reg[1]_i_1_n_0 ),
        .S(SINE_NEG_FLAG));
  MUXF7 \SINE_FINAL_RESULT_reg[1]_i_2 
       (.I0(\SINE_FINAL_RESULT[1]_i_4_n_0 ),
        .I1(\SINE_FINAL_RESULT[1]_i_5_n_0 ),
        .O(\SINE_FINAL_RESULT_reg[1]_i_2_n_0 ),
        .S(\ANGLE_ADJUSTED_reg_n_0_[6] ));
  MUXF7 \SINE_FINAL_RESULT_reg[1]_i_3 
       (.I0(\SINE_FINAL_RESULT[1]_i_6_n_0 ),
        .I1(\SINE_FINAL_RESULT[1]_i_7_n_0 ),
        .O(\SINE_FINAL_RESULT_reg[1]_i_3_n_0 ),
        .S(\ANGLE_ADJUSTED_reg_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \SINE_FINAL_RESULT_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(RESET_IBUF),
        .D(\SINE_FINAL_RESULT_reg[2]_i_1_n_0 ),
        .Q(SINE_OBUF[2]));
  MUXF8 \SINE_FINAL_RESULT_reg[2]_i_1 
       (.I0(\SINE_FINAL_RESULT_reg[2]_i_2_n_0 ),
        .I1(\SINE_FINAL_RESULT_reg[2]_i_3_n_0 ),
        .O(\SINE_FINAL_RESULT_reg[2]_i_1_n_0 ),
        .S(SINE_NEG_FLAG));
  MUXF7 \SINE_FINAL_RESULT_reg[2]_i_2 
       (.I0(\SINE_FINAL_RESULT[2]_i_4_n_0 ),
        .I1(\SINE_FINAL_RESULT[2]_i_5_n_0 ),
        .O(\SINE_FINAL_RESULT_reg[2]_i_2_n_0 ),
        .S(\ANGLE_ADJUSTED_reg_n_0_[6] ));
  MUXF7 \SINE_FINAL_RESULT_reg[2]_i_3 
       (.I0(\SINE_FINAL_RESULT[2]_i_6_n_0 ),
        .I1(\SINE_FINAL_RESULT[2]_i_7_n_0 ),
        .O(\SINE_FINAL_RESULT_reg[2]_i_3_n_0 ),
        .S(\ANGLE_ADJUSTED_reg_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \SINE_FINAL_RESULT_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(RESET_IBUF),
        .D(\SINE_FINAL_RESULT_reg[3]_i_1_n_0 ),
        .Q(SINE_OBUF[3]));
  MUXF8 \SINE_FINAL_RESULT_reg[3]_i_1 
       (.I0(\SINE_FINAL_RESULT_reg[3]_i_2_n_0 ),
        .I1(\SINE_FINAL_RESULT_reg[3]_i_3_n_0 ),
        .O(\SINE_FINAL_RESULT_reg[3]_i_1_n_0 ),
        .S(SINE_NEG_FLAG));
  MUXF7 \SINE_FINAL_RESULT_reg[3]_i_2 
       (.I0(\SINE_FINAL_RESULT[3]_i_4_n_0 ),
        .I1(\SINE_FINAL_RESULT[3]_i_5_n_0 ),
        .O(\SINE_FINAL_RESULT_reg[3]_i_2_n_0 ),
        .S(\ANGLE_ADJUSTED_reg_n_0_[6] ));
  MUXF7 \SINE_FINAL_RESULT_reg[3]_i_3 
       (.I0(\SINE_FINAL_RESULT[3]_i_6_n_0 ),
        .I1(\SINE_FINAL_RESULT[3]_i_7_n_0 ),
        .O(\SINE_FINAL_RESULT_reg[3]_i_3_n_0 ),
        .S(\ANGLE_ADJUSTED_reg_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \SINE_FINAL_RESULT_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(RESET_IBUF),
        .D(\SINE_FINAL_RESULT_reg[4]_i_1_n_0 ),
        .Q(SINE_OBUF[4]));
  MUXF8 \SINE_FINAL_RESULT_reg[4]_i_1 
       (.I0(\SINE_FINAL_RESULT_reg[4]_i_2_n_0 ),
        .I1(\SINE_FINAL_RESULT_reg[4]_i_3_n_0 ),
        .O(\SINE_FINAL_RESULT_reg[4]_i_1_n_0 ),
        .S(SINE_NEG_FLAG));
  MUXF7 \SINE_FINAL_RESULT_reg[4]_i_2 
       (.I0(\SINE_FINAL_RESULT[4]_i_4_n_0 ),
        .I1(\SINE_FINAL_RESULT[4]_i_5_n_0 ),
        .O(\SINE_FINAL_RESULT_reg[4]_i_2_n_0 ),
        .S(\ANGLE_ADJUSTED_reg_n_0_[6] ));
  MUXF7 \SINE_FINAL_RESULT_reg[4]_i_3 
       (.I0(\SINE_FINAL_RESULT[4]_i_6_n_0 ),
        .I1(\SINE_FINAL_RESULT[4]_i_7_n_0 ),
        .O(\SINE_FINAL_RESULT_reg[4]_i_3_n_0 ),
        .S(\ANGLE_ADJUSTED_reg_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \SINE_FINAL_RESULT_reg[5] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(RESET_IBUF),
        .D(\SINE_FINAL_RESULT[5]_i_1_n_0 ),
        .Q(SINE_OBUF[5]));
  FDCE #(
    .INIT(1'b0)) 
    \SINE_FINAL_RESULT_reg[6] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(RESET_IBUF),
        .D(\SINE_FINAL_RESULT[6]_i_1_n_0 ),
        .Q(SINE_OBUF[6]));
  FDCE #(
    .INIT(1'b0)) 
    \SINE_FINAL_RESULT_reg[7] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(RESET_IBUF),
        .D(\SINE_FINAL_RESULT[7]_i_1_n_0 ),
        .Q(SINE_OBUF[7]));
  FDCE #(
    .INIT(1'b0)) 
    \SINE_FINAL_RESULT_reg[8] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(RESET_IBUF),
        .D(\SINE_FINAL_RESULT[8]_i_1_n_0 ),
        .Q(SINE_OBUF[8]));
  FDCE #(
    .INIT(1'b0)) 
    \SINE_FINAL_RESULT_reg[9] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(RESET_IBUF),
        .D(\SINE_FINAL_RESULT[9]_i_1_n_0 ),
        .Q(SINE_OBUF[9]));
  FDCE #(
    .INIT(1'b0)) 
    SINE_NEG_FLAG_reg
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(RESET_IBUF),
        .D(p_0_in),
        .Q(SINE_NEG_FLAG));
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
