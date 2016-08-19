// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.1 (win64) Build 1538259 Fri Apr  8 15:45:27 MDT 2016
// Date        : Thu Aug 18 13:15:29 2016
// Host        : STEVENHERBSC43A running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/sgherbst/ft232h_test_program/ft232h_test_program.sim/sim_1/impl/func/top_tb_func_impl.v
// Design      : top
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "570f66de" *) 
(* NotValidForBitStream *)
module top
   (CLK100MHZ,
    CIS_MODE,
    CIS_CLK,
    CIS_SP,
    CIS_LED_BLUE,
    CIS_LED_GREEN,
    CIS_LED_RED);
  input CLK100MHZ;
  output CIS_MODE;
  output CIS_CLK;
  output CIS_SP;
  output CIS_LED_BLUE;
  output CIS_LED_GREEN;
  output CIS_LED_RED;

  wire CIS_CLK;
  wire CIS_CLK_OBUF;
  wire CIS_CLK_i_1_n_0;
  wire CIS_LED_BLUE;
  wire CIS_LED_BLUE__0;
  wire CIS_LED_BLUE_i_1_n_0;
  wire CIS_LED_BLUE_i_3_n_0;
  wire CIS_LED_BLUE_i_4_n_0;
  wire CIS_LED_BLUE_i_5_n_0;
  wire CIS_LED_GREEN;
  wire CIS_LED_RED;
  wire CIS_LED_RED_OBUF;
  wire CIS_MODE;
  wire CIS_SP;
  wire CIS_SP_OBUF;
  wire CLK100MHZ;
  wire CLK100MHZ_IBUF;
  wire CLK100MHZ_IBUF_BUFG;
  wire [3:0]counter_100MHZ;
  wire \counter_100MHZ[0]_i_1_n_0 ;
  wire \counter_100MHZ[1]_i_1_n_0 ;
  wire \counter_100MHZ[2]_i_1_n_0 ;
  wire \counter_100MHZ[3]_i_1_n_0 ;
  wire [0:0]counter_cis;
  wire \counter_cis[11]_i_1_n_0 ;
  wire \counter_cis[11]_i_3_n_0 ;
  wire \counter_cis[11]_i_4_n_0 ;
  wire \counter_cis_reg[4]_i_1_n_0 ;
  wire \counter_cis_reg[8]_i_1_n_0 ;
  wire \counter_cis_reg_n_0_[0] ;
  wire \counter_cis_reg_n_0_[10] ;
  wire \counter_cis_reg_n_0_[11] ;
  wire \counter_cis_reg_n_0_[1] ;
  wire \counter_cis_reg_n_0_[2] ;
  wire \counter_cis_reg_n_0_[3] ;
  wire \counter_cis_reg_n_0_[4] ;
  wire \counter_cis_reg_n_0_[5] ;
  wire \counter_cis_reg_n_0_[6] ;
  wire \counter_cis_reg_n_0_[7] ;
  wire \counter_cis_reg_n_0_[8] ;
  wire \counter_cis_reg_n_0_[9] ;
  wire [11:1]data0;
  wire [3:0]\NLW_counter_cis_reg[11]_i_2_CO_UNCONNECTED ;
  wire [3:3]\NLW_counter_cis_reg[11]_i_2_O_UNCONNECTED ;
  wire [2:0]\NLW_counter_cis_reg[4]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_counter_cis_reg[8]_i_1_CO_UNCONNECTED ;

  OBUF CIS_CLK_OBUF_inst
       (.I(CIS_CLK_OBUF),
        .O(CIS_CLK));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFBF0040)) 
    CIS_CLK_i_1
       (.I0(counter_100MHZ[2]),
        .I1(counter_100MHZ[3]),
        .I2(counter_100MHZ[1]),
        .I3(counter_100MHZ[0]),
        .I4(CIS_CLK_OBUF),
        .O(CIS_CLK_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    CIS_CLK_reg
       (.C(CLK100MHZ_IBUF_BUFG),
        .CE(1'b1),
        .D(CIS_CLK_i_1_n_0),
        .Q(CIS_CLK_OBUF),
        .R(1'b0));
  OBUF CIS_LED_BLUE_OBUF_inst
       (.I(CIS_LED_RED_OBUF),
        .O(CIS_LED_BLUE));
  LUT5 #(
    .INIT(32'h00000002)) 
    CIS_LED_BLUE_i_1
       (.I0(CIS_LED_BLUE_i_3_n_0),
        .I1(\counter_cis_reg_n_0_[10] ),
        .I2(\counter_cis_reg_n_0_[0] ),
        .I3(\counter_cis_reg_n_0_[1] ),
        .I4(\counter_cis[11]_i_4_n_0 ),
        .O(CIS_LED_BLUE_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000004000000000)) 
    CIS_LED_BLUE_i_2
       (.I0(CIS_LED_BLUE_i_4_n_0),
        .I1(\counter_cis_reg_n_0_[2] ),
        .I2(\counter_cis_reg_n_0_[1] ),
        .I3(\counter_cis_reg_n_0_[4] ),
        .I4(\counter_cis_reg_n_0_[3] ),
        .I5(CIS_LED_BLUE_i_5_n_0),
        .O(CIS_LED_BLUE__0));
  LUT5 #(
    .INIT(32'h00000001)) 
    CIS_LED_BLUE_i_3
       (.I0(\counter_cis_reg_n_0_[4] ),
        .I1(\counter_cis_reg_n_0_[7] ),
        .I2(\counter_cis_reg_n_0_[8] ),
        .I3(\counter_cis_reg_n_0_[11] ),
        .I4(\counter_cis_reg_n_0_[9] ),
        .O(CIS_LED_BLUE_i_3_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    CIS_LED_BLUE_i_4
       (.I0(\counter_cis_reg_n_0_[0] ),
        .I1(\counter_cis_reg_n_0_[10] ),
        .O(CIS_LED_BLUE_i_4_n_0));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    CIS_LED_BLUE_i_5
       (.I0(\counter_cis_reg_n_0_[7] ),
        .I1(\counter_cis_reg_n_0_[8] ),
        .I2(\counter_cis_reg_n_0_[6] ),
        .I3(\counter_cis_reg_n_0_[5] ),
        .I4(\counter_cis_reg_n_0_[11] ),
        .I5(\counter_cis_reg_n_0_[9] ),
        .O(CIS_LED_BLUE_i_5_n_0));
  FDRE #(
    .INIT(1'b1)) 
    CIS_LED_BLUE_reg
       (.C(CIS_CLK_OBUF),
        .CE(CIS_LED_BLUE__0),
        .D(CIS_LED_BLUE__0),
        .Q(CIS_LED_RED_OBUF),
        .R(CIS_LED_BLUE_i_1_n_0));
  OBUF CIS_LED_GREEN_OBUF_inst
       (.I(CIS_LED_RED_OBUF),
        .O(CIS_LED_GREEN));
  OBUF CIS_LED_RED_OBUF_inst
       (.I(CIS_LED_RED_OBUF),
        .O(CIS_LED_RED));
  OBUF CIS_MODE_OBUF_inst
       (.I(1'b0),
        .O(CIS_MODE));
  OBUF CIS_SP_OBUF_inst
       (.I(CIS_SP_OBUF),
        .O(CIS_SP));
  FDRE #(
    .INIT(1'b1)) 
    CIS_SP_reg
       (.C(CIS_CLK_OBUF),
        .CE(1'b1),
        .D(\counter_cis[11]_i_1_n_0 ),
        .Q(CIS_SP_OBUF),
        .R(1'b0));
  BUFG CLK100MHZ_IBUF_BUFG_inst
       (.I(CLK100MHZ_IBUF),
        .O(CLK100MHZ_IBUF_BUFG));
  IBUF CLK100MHZ_IBUF_inst
       (.I(CLK100MHZ),
        .O(CLK100MHZ_IBUF));
  LUT1 #(
    .INIT(2'h1)) 
    \counter_100MHZ[0]_i_1 
       (.I0(counter_100MHZ[0]),
        .O(\counter_100MHZ[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0FB0)) 
    \counter_100MHZ[1]_i_1 
       (.I0(counter_100MHZ[2]),
        .I1(counter_100MHZ[3]),
        .I2(counter_100MHZ[1]),
        .I3(counter_100MHZ[0]),
        .O(\counter_100MHZ[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \counter_100MHZ[2]_i_1 
       (.I0(counter_100MHZ[2]),
        .I1(counter_100MHZ[1]),
        .I2(counter_100MHZ[0]),
        .O(\counter_100MHZ[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h6C8C)) 
    \counter_100MHZ[3]_i_1 
       (.I0(counter_100MHZ[2]),
        .I1(counter_100MHZ[3]),
        .I2(counter_100MHZ[1]),
        .I3(counter_100MHZ[0]),
        .O(\counter_100MHZ[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \counter_100MHZ_reg[0] 
       (.C(CLK100MHZ_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_100MHZ[0]_i_1_n_0 ),
        .Q(counter_100MHZ[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_100MHZ_reg[1] 
       (.C(CLK100MHZ_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_100MHZ[1]_i_1_n_0 ),
        .Q(counter_100MHZ[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_100MHZ_reg[2] 
       (.C(CLK100MHZ_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_100MHZ[2]_i_1_n_0 ),
        .Q(counter_100MHZ[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_100MHZ_reg[3] 
       (.C(CLK100MHZ_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_100MHZ[3]_i_1_n_0 ),
        .Q(counter_100MHZ[3]),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \counter_cis[0]_i_1 
       (.I0(\counter_cis_reg_n_0_[0] ),
        .O(counter_cis));
  LUT5 #(
    .INIT(32'h00000001)) 
    \counter_cis[11]_i_1 
       (.I0(\counter_cis[11]_i_3_n_0 ),
        .I1(\counter_cis_reg_n_0_[10] ),
        .I2(\counter_cis_reg_n_0_[0] ),
        .I3(\counter_cis_reg_n_0_[1] ),
        .I4(\counter_cis[11]_i_4_n_0 ),
        .O(\counter_cis[11]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \counter_cis[11]_i_3 
       (.I0(\counter_cis_reg_n_0_[4] ),
        .I1(\counter_cis_reg_n_0_[9] ),
        .I2(\counter_cis_reg_n_0_[11] ),
        .I3(\counter_cis_reg_n_0_[8] ),
        .I4(\counter_cis_reg_n_0_[7] ),
        .O(\counter_cis[11]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \counter_cis[11]_i_4 
       (.I0(\counter_cis_reg_n_0_[3] ),
        .I1(\counter_cis_reg_n_0_[2] ),
        .I2(\counter_cis_reg_n_0_[5] ),
        .I3(\counter_cis_reg_n_0_[6] ),
        .O(\counter_cis[11]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \counter_cis_reg[0] 
       (.C(CIS_CLK_OBUF),
        .CE(1'b1),
        .D(counter_cis),
        .Q(\counter_cis_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_cis_reg[10] 
       (.C(CIS_CLK_OBUF),
        .CE(1'b1),
        .D(data0[10]),
        .Q(\counter_cis_reg_n_0_[10] ),
        .R(\counter_cis[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_cis_reg[11] 
       (.C(CIS_CLK_OBUF),
        .CE(1'b1),
        .D(data0[11]),
        .Q(\counter_cis_reg_n_0_[11] ),
        .R(\counter_cis[11]_i_1_n_0 ));
  CARRY4 \counter_cis_reg[11]_i_2 
       (.CI(\counter_cis_reg[8]_i_1_n_0 ),
        .CO(\NLW_counter_cis_reg[11]_i_2_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_counter_cis_reg[11]_i_2_O_UNCONNECTED [3],data0[11:9]}),
        .S({1'b0,\counter_cis_reg_n_0_[11] ,\counter_cis_reg_n_0_[10] ,\counter_cis_reg_n_0_[9] }));
  FDRE #(
    .INIT(1'b0)) 
    \counter_cis_reg[1] 
       (.C(CIS_CLK_OBUF),
        .CE(1'b1),
        .D(data0[1]),
        .Q(\counter_cis_reg_n_0_[1] ),
        .R(\counter_cis[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_cis_reg[2] 
       (.C(CIS_CLK_OBUF),
        .CE(1'b1),
        .D(data0[2]),
        .Q(\counter_cis_reg_n_0_[2] ),
        .R(\counter_cis[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_cis_reg[3] 
       (.C(CIS_CLK_OBUF),
        .CE(1'b1),
        .D(data0[3]),
        .Q(\counter_cis_reg_n_0_[3] ),
        .R(\counter_cis[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_cis_reg[4] 
       (.C(CIS_CLK_OBUF),
        .CE(1'b1),
        .D(data0[4]),
        .Q(\counter_cis_reg_n_0_[4] ),
        .R(\counter_cis[11]_i_1_n_0 ));
  CARRY4 \counter_cis_reg[4]_i_1 
       (.CI(1'b0),
        .CO({\counter_cis_reg[4]_i_1_n_0 ,\NLW_counter_cis_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\counter_cis_reg_n_0_[0] ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S({\counter_cis_reg_n_0_[4] ,\counter_cis_reg_n_0_[3] ,\counter_cis_reg_n_0_[2] ,\counter_cis_reg_n_0_[1] }));
  FDRE #(
    .INIT(1'b0)) 
    \counter_cis_reg[5] 
       (.C(CIS_CLK_OBUF),
        .CE(1'b1),
        .D(data0[5]),
        .Q(\counter_cis_reg_n_0_[5] ),
        .R(\counter_cis[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_cis_reg[6] 
       (.C(CIS_CLK_OBUF),
        .CE(1'b1),
        .D(data0[6]),
        .Q(\counter_cis_reg_n_0_[6] ),
        .R(\counter_cis[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_cis_reg[7] 
       (.C(CIS_CLK_OBUF),
        .CE(1'b1),
        .D(data0[7]),
        .Q(\counter_cis_reg_n_0_[7] ),
        .R(\counter_cis[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_cis_reg[8] 
       (.C(CIS_CLK_OBUF),
        .CE(1'b1),
        .D(data0[8]),
        .Q(\counter_cis_reg_n_0_[8] ),
        .R(\counter_cis[11]_i_1_n_0 ));
  CARRY4 \counter_cis_reg[8]_i_1 
       (.CI(\counter_cis_reg[4]_i_1_n_0 ),
        .CO({\counter_cis_reg[8]_i_1_n_0 ,\NLW_counter_cis_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S({\counter_cis_reg_n_0_[8] ,\counter_cis_reg_n_0_[7] ,\counter_cis_reg_n_0_[6] ,\counter_cis_reg_n_0_[5] }));
  FDRE #(
    .INIT(1'b0)) 
    \counter_cis_reg[9] 
       (.C(CIS_CLK_OBUF),
        .CE(1'b1),
        .D(data0[9]),
        .Q(\counter_cis_reg_n_0_[9] ),
        .R(\counter_cis[11]_i_1_n_0 ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
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

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

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

endmodule
`endif
