
//------> ./rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2011a.41 Production Release
//  HLS Date:       Thu Apr  7 20:28:55 PDT 2011
// 
//  Generated by:   ss@DESKTOP-UB05SU4
//  Generated date: Sat Apr 20 18:45:19 2019
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    Convolotion_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module Convolotion_core_fsm (
  clk, rst, fsm_output, st_for_for_for_1_for_1_tr0, st_for_for_tr0, st_for_tr0
);
  input clk;
  input rst;
  output [8:0] fsm_output;
  reg [8:0] fsm_output;
  input st_for_for_for_1_for_1_tr0;
  input st_for_for_tr0;
  input st_for_tr0;


  // FSM State Type Declaration for Convolotion_core_fsm_1
  parameter
    st_main = 4'd0,
    st_for_for_for_1_for = 4'd1,
    st_for_for_for_1_for_1 = 4'd2,
    st_for_for_for_2_for = 4'd3,
    st_for_for_for_2_for_1 = 4'd4,
    st_for_for_for_3_for = 4'd5,
    st_for_for_for_3_for_1 = 4'd6,
    st_for_for = 4'd7,
    st_for = 4'd8,
    state_x = 4'b0000;

  reg [3:0] state_var;
  reg [3:0] state_var_NS;

  always @(st_for_for_for_1_for_1_tr0 or st_for_for_tr0 or st_for_tr0 or state_var)
  begin : Convolotion_core_fsm_1
    case (state_var)
      st_main : begin
        fsm_output = 9'b1;
        state_var_NS = st_for_for_for_1_for;
      end
      st_for_for_for_1_for : begin
        fsm_output = 9'b10;
        state_var_NS = st_for_for_for_1_for_1;
      end
      st_for_for_for_1_for_1 : begin
        fsm_output = 9'b100;
        if ( st_for_for_for_1_for_1_tr0 ) begin
          state_var_NS = st_for_for_for_2_for;
        end
        else begin
          state_var_NS = st_for_for_for_1_for;
        end
      end
      st_for_for_for_2_for : begin
        fsm_output = 9'b1000;
        state_var_NS = st_for_for_for_2_for_1;
      end
      st_for_for_for_2_for_1 : begin
        fsm_output = 9'b10000;
        if ( st_for_for_for_1_for_1_tr0 ) begin
          state_var_NS = st_for_for_for_3_for;
        end
        else begin
          state_var_NS = st_for_for_for_2_for;
        end
      end
      st_for_for_for_3_for : begin
        fsm_output = 9'b100000;
        state_var_NS = st_for_for_for_3_for_1;
      end
      st_for_for_for_3_for_1 : begin
        fsm_output = 9'b1000000;
        if ( st_for_for_for_1_for_1_tr0 ) begin
          state_var_NS = st_for_for;
        end
        else begin
          state_var_NS = st_for_for_for_3_for;
        end
      end
      st_for_for : begin
        fsm_output = 9'b10000000;
        if ( st_for_for_tr0 ) begin
          state_var_NS = st_for;
        end
        else begin
          state_var_NS = st_for_for_for_1_for;
        end
      end
      st_for : begin
        fsm_output = 9'b100000000;
        if ( st_for_tr0 ) begin
          state_var_NS = st_main;
        end
        else begin
          state_var_NS = st_for_for_for_1_for;
        end
      end
      default : begin
        fsm_output = 9'b000000000;
        state_var_NS = st_main;
      end
    endcase
  end

  always @(posedge clk) begin
    if ( rst ) begin
      state_var <= st_main;
    end
    else begin
      state_var <= state_var_NS;
    end
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    Convolotion_core
// ------------------------------------------------------------------


module Convolotion_core (
  clk, rst, in_rsc_singleport_addr, in_rsc_singleport_re, in_rsc_singleport_data_out,
      out_rsc_singleport_data_in, out_rsc_singleport_addr, out_rsc_singleport_we
);
  input clk;
  input rst;
  output [17:0] in_rsc_singleport_addr;
  output in_rsc_singleport_re;
  input [7:0] in_rsc_singleport_data_out;
  output [7:0] out_rsc_singleport_data_in;
  output [17:0] out_rsc_singleport_addr;
  output out_rsc_singleport_we;


  // Interconnect Declarations
  wire [8:0] fsm_output;
  wire or_dcpl_11;
  wire and_dcpl_27;
  wire or_dcpl_25;
  reg [5:0] Result_sg1_sva_reg;
  reg Result_1_sva_reg;
  reg Result_sg2_sva_reg;
  reg [1:0] reg_1;
  reg for_for_for_for_reg;
  reg for_for_reg;
  reg for_for_for_for_else_or_itm;
  reg for_for_for_for_else_or_1_itm;
  reg [1:0] for_for_for_for_else_reg;
  reg [8:0] Dcolumn_1_sva_2;
  reg [8:0] Drow_1_sva_2;
  wire or_12_cse;
  wire [1:0] for_for_for_1_for_oelse_2_acc_2;
  wire [2:0] xfor_for_for_1_for_oelse_2_acc_2;
  wire [7:0] for_for_for_for_else_ac_fixed_cctor_1_sva;
  wire [11:0] z_out_1;
  wire [12:0] xz_out_1;
  wire [10:0] z_out_2;
  wire [11:0] xz_out_2;
  wire [10:0] z_out_3;
  wire [11:0] xz_out_3;
  wire [10:0] z_out_4;
  wire [11:0] xz_out_4;
  wire [3:0] z_out_5;
  wire [4:0] xz_out_5;
  wire [1:0] Krow_2_sva_1;
  wire [2:0] xKrow_2_sva_1;
  wire for_for_for_for_else_and_3_cse;
  wire for_for_for_for_else_and_6_cse;
  wire for_for_for_for_else_and_1_cse;
  wire or_35_cse;
  wire or_36_cse;
  wire or_39_cse;
  wire mux_26_cse;

  wire[8:0] mux_16_nl;
  wire[8:0] mux_17_nl;
  wire[0:0] mux_2_nl;
  wire[5:0] mux_1_nl;
  wire[0:0] mux_nl;
  wire[1:0] mux_9_nl;
  wire[8:0] mux_25_nl;
  wire[3:0] mux1h_28_nl;
  wire[0:0] mux1h_32_nl;
  wire[1:0] mux_11_nl;
  wire[0:0] mux_27_nl;
  Convolotion_core_fsm Convolotion_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .fsm_output(fsm_output),
      .st_for_for_for_1_for_1_tr0((~ for_for_reg)),
      .st_for_for_tr0((z_out_3[9])),
      .st_for_tr0((z_out_4[9]))
    );
  assign or_36_cse = (for_for_for_for_reg & (fsm_output[6])) | (~((~((~((fsm_output[2])
      | (fsm_output[4]))) | for_for_for_for_reg)) | (fsm_output[0]) | (fsm_output[8])
      | (fsm_output[7]) | (fsm_output[6])));
  assign xKrow_2_sva_1 = reg_1 + 2'b1;
  assign Krow_2_sva_1 = xKrow_2_sva_1[1:0];
  assign xfor_for_for_1_for_oelse_2_acc_2 = (~ (z_out_3[10:9])) + 2'b1;
  assign for_for_for_1_for_oelse_2_acc_2 = xfor_for_for_1_for_oelse_2_acc_2[1:0];
  assign for_for_for_for_else_ac_fixed_cctor_1_sva = (z_out_2[7:0]) | (signext_8_1(z_out_2[8]));
  assign for_for_for_for_else_and_3_cse = (z_out_5[1]) & (~((z_out_5[3]) | (z_out_5[2])));
  assign for_for_for_for_else_and_6_cse = (z_out_5[3]) & (z_out_5[2]) & (z_out_5[1]);
  assign for_for_for_for_else_and_1_cse = (z_out_5[3]) & (~((z_out_5[2]) | (z_out_5[1])));
  assign or_dcpl_11 = (fsm_output[0]) | (fsm_output[8]);
  assign or_12_cse = or_dcpl_11 | (fsm_output[7]);
  assign and_dcpl_27 = ~((fsm_output[0]) | (fsm_output[8]));
  assign or_dcpl_25 = (fsm_output[2]) | (fsm_output[4]);
  assign mux_16_nl = MUX_v_9_2_2({(z_out_2[8:0]) , (z_out_3[8:0])}, fsm_output[3]);
  assign mux_17_nl = MUX_v_9_2_2({(z_out_4[8:0]) , Dcolumn_1_sva_2}, fsm_output[3]);
  assign in_rsc_singleport_addr = {(mux_16_nl) , (mux_17_nl)};
  assign in_rsc_singleport_re = (~((~((~(((fsm_output[5]) & (~ (z_out_4[9]))) | ((fsm_output[1])
      & (~ (z_out_4[9]))))) | (for_for_for_1_for_oelse_2_acc_2[1]))) | ((fsm_output[3])
      & (~ (z_out_3[9]))))) | (z_out_3[10]);
  assign mux_2_nl = MUX_s_1_2_2({(for_for_for_for_else_ac_fixed_cctor_1_sva[7]) ,
      Result_sg2_sva_reg}, for_for_for_for_reg);
  assign mux_1_nl = MUX_v_6_2_2({(for_for_for_for_else_ac_fixed_cctor_1_sva[6:1])
      , Result_sg1_sva_reg}, for_for_for_for_reg);
  assign mux_nl = MUX_s_1_2_2({(for_for_for_for_else_ac_fixed_cctor_1_sva[0]) , Result_1_sva_reg},
      for_for_for_for_reg);
  assign out_rsc_singleport_data_in = {(mux_2_nl) , (mux_1_nl) , (mux_nl)};
  assign out_rsc_singleport_addr = {Drow_1_sva_2 , Dcolumn_1_sva_2};
  assign out_rsc_singleport_we = ~((fsm_output[6]) & (~ for_for_reg));
  assign or_35_cse = (fsm_output[2]) | (fsm_output[6]);
  always @(posedge clk) begin
    if ( rst ) begin
      Result_1_sva_reg <= 1'b0;
      Result_sg1_sva_reg <= 6'b0;
      Result_sg2_sva_reg <= 1'b0;
      Dcolumn_1_sva_2 <= 9'b0;
      Drow_1_sva_2 <= 9'b0;
      reg_1 <= 2'b0;
      for_for_reg <= 1'b0;
      for_for_for_for_reg <= 1'b0;
      for_for_for_for_else_reg <= 2'b0;
      for_for_for_for_else_or_1_itm <= 1'b0;
      for_for_for_for_else_or_itm <= 1'b0;
    end
    else begin
      Result_1_sva_reg <= (MUX_s_1_2_2({(for_for_for_for_else_ac_fixed_cctor_1_sva[0])
          , Result_1_sva_reg}, or_36_cse)) & (~ or_12_cse);
      Result_sg1_sva_reg <= (MUX_v_6_2_2({(for_for_for_for_else_ac_fixed_cctor_1_sva[6:1])
          , Result_sg1_sva_reg}, or_36_cse)) & (signext_6_1(~ or_12_cse));
      Result_sg2_sva_reg <= (MUX_s_1_2_2({(for_for_for_for_else_ac_fixed_cctor_1_sva[7])
          , Result_sg2_sva_reg}, or_36_cse)) & (~ or_12_cse);
      Dcolumn_1_sva_2 <= (MUX_v_9_2_2({(z_out_4[8:0]) , Dcolumn_1_sva_2}, and_dcpl_27))
          & (signext_9_1(~ (fsm_output[0])));
      Drow_1_sva_2 <= (MUX_v_9_2_2({(z_out_3[8:0]) , Drow_1_sva_2}, and_dcpl_27 &
          (~ (fsm_output[7])))) & (signext_9_1(~ or_dcpl_11));
      reg_1 <= (MUX_v_2_2_2({Krow_2_sva_1 , reg_1}, (or_dcpl_25 & for_for_reg) |
          (fsm_output[6]))) & (signext_2_1(~(or_12_cse | (or_dcpl_25 & (~ for_for_reg)))));
      for_for_reg <= readslicef_3_1_2((({1'b1 , Krow_2_sva_1}) + 3'b1));
      for_for_for_for_reg <= MUX_s_1_2_2({((for_for_for_1_for_oelse_2_acc_2[1]) |
          (z_out_3[10]) | (z_out_4[9])) , ((z_out_3[9]) | (z_out_3[10]))}, fsm_output[3]);
      for_for_for_for_else_reg <= MUX_v_2_8_2({2'b1 , 2'b10 , 2'b1 , 2'b10 , 2'b0
          , 2'b10 , 2'b1 , 2'b0}, {(MUX_v_2_2_2({(z_out_5[2:1]) , (z_out_5[1:0])},
          fsm_output[1])) , (reg_1[0])});
      for_for_for_for_else_or_1_itm <= (~(for_for_for_for_else_and_3_cse | for_for_for_for_else_and_6_cse))
          | for_for_for_for_else_and_1_cse;
      for_for_for_for_else_or_itm <= (~ for_for_for_for_else_and_1_cse) | for_for_for_for_else_and_3_cse
          | for_for_for_for_else_and_6_cse;
    end
  end
  assign mux_9_nl = MUX_v_2_2_2({for_for_for_for_else_reg , ({{1{for_for_for_for_else_or_1_itm}},
      for_for_for_for_else_or_1_itm})}, fsm_output[4]);
  assign xz_out_1 = conv_u2u_5_12({(for_for_for_for_else_or_itm & (fsm_output[4]))
      , 2'b0 , (mux_9_nl)}) * conv_u2u_8_12(in_rsc_singleport_data_out);
  assign z_out_1 = xz_out_1[11:0];
  assign or_39_cse = (fsm_output[1]) | (fsm_output[5]);
  assign mux_25_nl = MUX_v_9_2_2({({1'b0 , Result_sg2_sva_reg , Result_sg1_sva_reg
      , Result_1_sva_reg}) , (z_out_3[8:0])}, or_39_cse);
  assign mux1h_28_nl = MUX1HOT_v_4_3_2({(z_out_1[8:5]) , (z_out_1[11:8]) , (signext_4_1(z_out_4[9]))},
      {or_35_cse , (fsm_output[4]) , (fsm_output[1])});
  assign mux1h_32_nl = MUX1HOT_s_1_3_2({(z_out_1[4]) , (z_out_1[7]) , (z_out_4[9])},
      {or_35_cse , (fsm_output[4]) , or_39_cse});
  assign xz_out_2 = conv_u2u_9_11(mux_25_nl) + conv_s2u_6_11({((z_out_4[9]) & (~(or_35_cse
      | (fsm_output[4]) | (fsm_output[5])))) , ((mux1h_28_nl) & (signext_4_1(~ (fsm_output[5]))))
      , (mux1h_32_nl)});
  assign z_out_2 = xz_out_2[10:0];
  assign mux_11_nl = MUX_v_2_2_2({(reg_1 + 2'b11) , 2'b1}, fsm_output[7]);
  assign xz_out_3 = conv_u2u_9_11(Drow_1_sva_2) + conv_s2u_2_11(mux_11_nl);
  assign z_out_3 = xz_out_3[10:0];
  assign xz_out_4 = conv_u2u_9_11(Dcolumn_1_sva_2) + conv_s2u_2_11({(fsm_output[1])
      , 1'b1});
  assign z_out_4 = xz_out_4[10:0];
  assign mux_26_cse = MUX_s_1_2_2({(reg_1[1]) , (reg_1[0])}, fsm_output[3]);
  assign mux_27_nl = MUX_s_1_2_2({(reg_1[0]) , (reg_1[1])}, fsm_output[1]);
  assign xz_out_5 = ({(reg_1[1]) , mux_26_cse , ((mux_27_nl) & (~ (fsm_output[3])))
      , ((reg_1[0]) | (fsm_output[5]) | (fsm_output[3]))}) + conv_u2u_3_4({((reg_1[1])
      & (~((fsm_output[5]) | (fsm_output[1])))) , (mux_26_cse & (~ (fsm_output[1])))
      , ((reg_1[1]) | (fsm_output[5]) | (fsm_output[3]))});
  assign z_out_5 = xz_out_5[3:0];

  function [7:0] signext_8_1;
    input [0:0] vector;
  begin
    signext_8_1= {{7{vector[0]}}, vector};
  end
  endfunction


  function [8:0] MUX_v_9_2_2;
    input [17:0] inputs;
    input [0:0] sel;
    reg [8:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[17:9];
      end
      1'b1 : begin
        result = inputs[8:0];
      end
      default : begin
        result = inputs[17:9];
      end
    endcase
    MUX_v_9_2_2 = result;
  end
  endfunction


  function [0:0] MUX_s_1_2_2;
    input [1:0] inputs;
    input [0:0] sel;
    reg [0:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[1:1];
      end
      1'b1 : begin
        result = inputs[0:0];
      end
      default : begin
        result = inputs[1:1];
      end
    endcase
    MUX_s_1_2_2 = result;
  end
  endfunction


  function [5:0] MUX_v_6_2_2;
    input [11:0] inputs;
    input [0:0] sel;
    reg [5:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[11:6];
      end
      1'b1 : begin
        result = inputs[5:0];
      end
      default : begin
        result = inputs[11:6];
      end
    endcase
    MUX_v_6_2_2 = result;
  end
  endfunction


  function [5:0] signext_6_1;
    input [0:0] vector;
  begin
    signext_6_1= {{5{vector[0]}}, vector};
  end
  endfunction


  function [8:0] signext_9_1;
    input [0:0] vector;
  begin
    signext_9_1= {{8{vector[0]}}, vector};
  end
  endfunction


  function [1:0] MUX_v_2_2_2;
    input [3:0] inputs;
    input [0:0] sel;
    reg [1:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[3:2];
      end
      1'b1 : begin
        result = inputs[1:0];
      end
      default : begin
        result = inputs[3:2];
      end
    endcase
    MUX_v_2_2_2 = result;
  end
  endfunction


  function [1:0] signext_2_1;
    input [0:0] vector;
  begin
    signext_2_1= {{1{vector[0]}}, vector};
  end
  endfunction


  function [0:0] readslicef_3_1_2;
    input [2:0] vector;
    reg [2:0] tmp;
  begin
    tmp = vector >> 2;
    readslicef_3_1_2 = tmp[0:0];
  end
  endfunction


  function [1:0] MUX_v_2_8_2;
    input [15:0] inputs;
    input [2:0] sel;
    reg [1:0] result;
  begin
    case (sel)
      3'b000 : begin
        result = inputs[15:14];
      end
      3'b001 : begin
        result = inputs[13:12];
      end
      3'b010 : begin
        result = inputs[11:10];
      end
      3'b011 : begin
        result = inputs[9:8];
      end
      3'b100 : begin
        result = inputs[7:6];
      end
      3'b101 : begin
        result = inputs[5:4];
      end
      3'b110 : begin
        result = inputs[3:2];
      end
      3'b111 : begin
        result = inputs[1:0];
      end
      default : begin
        result = inputs[15:14];
      end
    endcase
    MUX_v_2_8_2 = result;
  end
  endfunction


  function [3:0] MUX1HOT_v_4_3_2;
    input [11:0] inputs;
    input [2:0] sel;
    reg [3:0] result;
    integer i;
  begin
    result = inputs[0+:4] & {4{sel[0]}};
    for( i = 1; i < 3; i = i + 1 )
      result = result | (inputs[i*4+:4] & {4{sel[i]}});
    MUX1HOT_v_4_3_2 = result;
  end
  endfunction


  function [3:0] signext_4_1;
    input [0:0] vector;
  begin
    signext_4_1= {{3{vector[0]}}, vector};
  end
  endfunction


  function [0:0] MUX1HOT_s_1_3_2;
    input [2:0] inputs;
    input [2:0] sel;
    reg [0:0] result;
    integer i;
  begin
    result = inputs[0+:1] & {1{sel[0]}};
    for( i = 1; i < 3; i = i + 1 )
      result = result | (inputs[i*1+:1] & {1{sel[i]}});
    MUX1HOT_s_1_3_2 = result;
  end
  endfunction


  function  [11:0] conv_u2u_5_12 ;
    input [4:0]  vector ;
  begin
    conv_u2u_5_12 = {{7{1'b0}}, vector};
  end
  endfunction


  function  [11:0] conv_u2u_8_12 ;
    input [7:0]  vector ;
  begin
    conv_u2u_8_12 = {{4{1'b0}}, vector};
  end
  endfunction


  function  [10:0] conv_u2u_9_11 ;
    input [8:0]  vector ;
  begin
    conv_u2u_9_11 = {{2{1'b0}}, vector};
  end
  endfunction


  function  [10:0] conv_s2u_6_11 ;
    input signed [5:0]  vector ;
  begin
    conv_s2u_6_11 = {{5{vector[5]}}, vector};
  end
  endfunction


  function  [10:0] conv_s2u_2_11 ;
    input signed [1:0]  vector ;
  begin
    conv_s2u_2_11 = {{9{vector[1]}}, vector};
  end
  endfunction


  function  [3:0] conv_u2u_3_4 ;
    input [2:0]  vector ;
  begin
    conv_u2u_3_4 = {1'b0, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    Convolotion
//  Generated from file(s):
//    2) $PROJECT_HOME/ESL_CA2.c
// ------------------------------------------------------------------


module Convolotion (
  clk, rst, in_rsc_singleport_data_in, in_rsc_singleport_addr, in_rsc_singleport_re,
      in_rsc_singleport_we, in_rsc_singleport_data_out, out_rsc_singleport_data_in,
      out_rsc_singleport_addr, out_rsc_singleport_re, out_rsc_singleport_we, out_rsc_singleport_data_out
);
  input clk;
  input rst;
  output [7:0] in_rsc_singleport_data_in;
  output [17:0] in_rsc_singleport_addr;
  output in_rsc_singleport_re;
  output in_rsc_singleport_we;
  input [7:0] in_rsc_singleport_data_out;
  output [7:0] out_rsc_singleport_data_in;
  output [17:0] out_rsc_singleport_addr;
  output out_rsc_singleport_re;
  output out_rsc_singleport_we;
  input [7:0] out_rsc_singleport_data_out;


  // Interconnect Declarations
  wire [17:0] in_rsc_singleport_addr_reg;
  wire in_rsc_singleport_re_reg;
  wire [7:0] out_rsc_singleport_data_in_reg;
  wire [17:0] out_rsc_singleport_addr_reg;
  wire out_rsc_singleport_we_reg;

  Convolotion_core Convolotion_core_inst (
      .clk(clk),
      .rst(rst),
      .in_rsc_singleport_addr(in_rsc_singleport_addr_reg),
      .in_rsc_singleport_re(in_rsc_singleport_re_reg),
      .in_rsc_singleport_data_out(in_rsc_singleport_data_out),
      .out_rsc_singleport_data_in(out_rsc_singleport_data_in_reg),
      .out_rsc_singleport_addr(out_rsc_singleport_addr_reg),
      .out_rsc_singleport_we(out_rsc_singleport_we_reg)
    );
  assign in_rsc_singleport_data_in = 8'b0;
  assign in_rsc_singleport_addr = in_rsc_singleport_addr_reg;
  assign in_rsc_singleport_re = in_rsc_singleport_re_reg;
  assign in_rsc_singleport_we = 1'b1;
  assign out_rsc_singleport_data_in = out_rsc_singleport_data_in_reg;
  assign out_rsc_singleport_addr = out_rsc_singleport_addr_reg;
  assign out_rsc_singleport_re = 1'b1;
  assign out_rsc_singleport_we = out_rsc_singleport_we_reg;
endmodule


