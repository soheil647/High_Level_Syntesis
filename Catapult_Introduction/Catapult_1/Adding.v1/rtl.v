// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2011a.41 Production Release
//  HLS Date:       Thu Apr  7 20:28:55 PDT 2011
// 
//  Generated by:   ss@DESKTOP-UB05SU4
//  Generated date: Tue Apr 09 15:46:22 2019
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    Adding_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module Adding_core_fsm (
  clk, rst, fsm_output, st_in_tr0, st_out_tr0
);
  input clk;
  input rst;
  output [3:0] fsm_output;
  reg [3:0] fsm_output;
  input st_in_tr0;
  input st_out_tr0;


  // FSM State Type Declaration for Adding_core_fsm_1
  parameter
    st_main = 2'd0,
    st_in = 2'd1,
    st_out = 2'd2,
    st_main_1 = 2'd3,
    state_x = 2'b00;

  reg [1:0] state_var;
  reg [1:0] state_var_NS;

  always @(st_in_tr0 or st_out_tr0 or state_var)
  begin : Adding_core_fsm_1
    case (state_var)
      st_main : begin
        fsm_output = 4'b1;
        state_var_NS = st_in;
      end
      st_in : begin
        fsm_output = 4'b10;
        if ( st_in_tr0 ) begin
          state_var_NS = st_out;
        end
        else begin
          state_var_NS = st_in;
        end
      end
      st_out : begin
        fsm_output = 4'b100;
        if ( st_out_tr0 ) begin
          state_var_NS = st_main_1;
        end
        else begin
          state_var_NS = st_in;
        end
      end
      st_main_1 : begin
        fsm_output = 4'b1000;
        state_var_NS = st_main;
      end
      default : begin
        fsm_output = 4'b0000;
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
//  Design Unit:    Adding_core
// ------------------------------------------------------------------


module Adding_core (
  clk, rst, A_rsc_mgc_in_wire_d, B_rsc_mgc_in_wire_d, C_rsc_mgc_in_wire_d, D_rsc_mgc_in_wire_d,
      E_rsc_mgc_in_wire_d, Temp_rsc_mgc_out_stdreg_d
);
  input clk;
  input rst;
  input [7:0] A_rsc_mgc_in_wire_d;
  input [7:0] B_rsc_mgc_in_wire_d;
  input [7:0] C_rsc_mgc_in_wire_d;
  input [7:0] D_rsc_mgc_in_wire_d;
  input [7:0] E_rsc_mgc_in_wire_d;
  output [63:0] Temp_rsc_mgc_out_stdreg_d;
  reg [63:0] Temp_rsc_mgc_out_stdreg_d;


  // Interconnect Declarations
  wire [3:0] fsm_output;
  wire or_dcpl_6;
  reg [7:0] A_1_sva;
  reg [7:0] B_1_sva;
  reg [7:0] C_1_sva;
  reg [7:0] D_1_sva;
  reg [7:0] E_1_sva;
  reg [3:0] out_i_1_sva;
  reg [63:0] Temp2_reg;
  reg [2:0] in_i_1_sva;
  wire [4:0] out_acc_itm;
  wire [5:0] xout_acc_itm;
  wire [3:0] z_out;
  wire [4:0] xz_out;
  wire [63:0] Temp2_sva_2_mx0w0;
  wire [79:0] xTemp2_sva_2_mx0w0;
  wire nor_cse;

  wire[3:0] mux_8_nl;
  Adding_core_fsm Adding_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .fsm_output(fsm_output),
      .st_in_tr0((~ (readslicef_3_1_2((({1'b1 , (z_out[2:1])}) + 3'b1))))),
      .st_out_tr0((~ (out_acc_itm[4])))
    );
  assign nor_cse = ~((fsm_output[0]) | (fsm_output[2]));
  assign xTemp2_sva_2_mx0w0 = Temp2_reg * conv_u2u_16_64(conv_u2u_32_16(conv_u2u_8_16(E_1_sva)
      * conv_u2u_8_16(E_1_sva)));
  assign Temp2_sva_2_mx0w0 = xTemp2_sva_2_mx0w0[63:0];
  assign xout_acc_itm = conv_u2s_4_5(z_out) + 5'b10101;
  assign out_acc_itm = xout_acc_itm[4:0];
  assign or_dcpl_6 = (fsm_output[1]) | (fsm_output[2]);
  always @(posedge clk) begin
    if ( rst ) begin
      out_i_1_sva <= 4'b0;
      E_1_sva <= 8'b0;
      Temp_rsc_mgc_out_stdreg_d <= 64'b0;
      in_i_1_sva <= 3'b0;
      Temp2_reg <= 64'b0;
      A_1_sva <= 8'b0;
      B_1_sva <= 8'b0;
      C_1_sva <= 8'b0;
      D_1_sva <= 8'b0;
    end
    else begin
      out_i_1_sva <= (MUX_v_4_2_2({z_out , out_i_1_sva}, nor_cse)) & (signext_4_1(~
          (fsm_output[0])));
      E_1_sva <= MUX_v_8_2_2({E_rsc_mgc_in_wire_d , E_1_sva}, or_dcpl_6);
      Temp_rsc_mgc_out_stdreg_d <= MUX_v_64_2_2({Temp2_sva_2_mx0w0 , Temp_rsc_mgc_out_stdreg_d},
          (out_acc_itm[4]) | (~ (fsm_output[2])));
      in_i_1_sva <= (z_out[2:0]) & ({{2{nor_cse}}, nor_cse});
      Temp2_reg <= MUX1HOT_v_64_3_2({(Temp2_reg + conv_u2u_9_64(readslicef_11_9_2((conv_u2u_10_11({(conv_u2u_8_9(A_1_sva)
          + conv_u2u_7_9(B_1_sva[7:1])) , (B_1_sva[0])}) + conv_u2u_9_11(conv_u2u_8_9(C_1_sva)
          + conv_u2u_8_9(D_1_sva)))))) , Temp2_sva_2_mx0w0 , Temp2_reg}, {(fsm_output[1])
          , (fsm_output[2]) , (~((fsm_output[1]) | (fsm_output[2])))});
      A_1_sva <= MUX_v_8_2_2({A_rsc_mgc_in_wire_d , A_1_sva}, or_dcpl_6);
      B_1_sva <= MUX_v_8_2_2({B_rsc_mgc_in_wire_d , B_1_sva}, or_dcpl_6);
      C_1_sva <= MUX_v_8_2_2({C_rsc_mgc_in_wire_d , C_1_sva}, or_dcpl_6);
      D_1_sva <= MUX_v_8_2_2({D_rsc_mgc_in_wire_d , D_1_sva}, or_dcpl_6);
    end
  end
  assign mux_8_nl = MUX_v_4_2_2({out_i_1_sva , ({{1{in_i_1_sva[2]}}, in_i_1_sva})},
      fsm_output[1]);
  assign xz_out = (mux_8_nl) + 4'b1;
  assign z_out = xz_out[3:0];

  function [0:0] readslicef_3_1_2;
    input [2:0] vector;
    reg [2:0] tmp;
  begin
    tmp = vector >> 2;
    readslicef_3_1_2 = tmp[0:0];
  end
  endfunction


  function [3:0] MUX_v_4_2_2;
    input [7:0] inputs;
    input [0:0] sel;
    reg [3:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[7:4];
      end
      1'b1 : begin
        result = inputs[3:0];
      end
      default : begin
        result = inputs[7:4];
      end
    endcase
    MUX_v_4_2_2 = result;
  end
  endfunction


  function [3:0] signext_4_1;
    input [0:0] vector;
  begin
    signext_4_1= {{3{vector[0]}}, vector};
  end
  endfunction


  function [7:0] MUX_v_8_2_2;
    input [15:0] inputs;
    input [0:0] sel;
    reg [7:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[15:8];
      end
      1'b1 : begin
        result = inputs[7:0];
      end
      default : begin
        result = inputs[15:8];
      end
    endcase
    MUX_v_8_2_2 = result;
  end
  endfunction


  function [63:0] MUX_v_64_2_2;
    input [127:0] inputs;
    input [0:0] sel;
    reg [63:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[127:64];
      end
      1'b1 : begin
        result = inputs[63:0];
      end
      default : begin
        result = inputs[127:64];
      end
    endcase
    MUX_v_64_2_2 = result;
  end
  endfunction


  function [63:0] MUX1HOT_v_64_3_2;
    input [191:0] inputs;
    input [2:0] sel;
    reg [63:0] result;
    integer i;
  begin
    result = inputs[0+:64] & {64{sel[0]}};
    for( i = 1; i < 3; i = i + 1 )
      result = result | (inputs[i*64+:64] & {64{sel[i]}});
    MUX1HOT_v_64_3_2 = result;
  end
  endfunction


  function [8:0] readslicef_11_9_2;
    input [10:0] vector;
    reg [10:0] tmp;
  begin
    tmp = vector >> 2;
    readslicef_11_9_2 = tmp[8:0];
  end
  endfunction


  function  [63:0] conv_u2u_16_64 ;
    input [15:0]  vector ;
  begin
    conv_u2u_16_64 = {{48{1'b0}}, vector};
  end
  endfunction


  function  [15:0] conv_u2u_32_16 ;
    input [31:0]  vector ;
  begin
    conv_u2u_32_16 = vector[15:0];
  end
  endfunction


  function  [15:0] conv_u2u_8_16 ;
    input [7:0]  vector ;
  begin
    conv_u2u_8_16 = {{8{1'b0}}, vector};
  end
  endfunction


  function signed [4:0] conv_u2s_4_5 ;
    input [3:0]  vector ;
  begin
    conv_u2s_4_5 = {1'b0, vector};
  end
  endfunction


  function  [63:0] conv_u2u_9_64 ;
    input [8:0]  vector ;
  begin
    conv_u2u_9_64 = {{55{1'b0}}, vector};
  end
  endfunction


  function  [10:0] conv_u2u_10_11 ;
    input [9:0]  vector ;
  begin
    conv_u2u_10_11 = {1'b0, vector};
  end
  endfunction


  function  [8:0] conv_u2u_8_9 ;
    input [7:0]  vector ;
  begin
    conv_u2u_8_9 = {1'b0, vector};
  end
  endfunction


  function  [8:0] conv_u2u_7_9 ;
    input [6:0]  vector ;
  begin
    conv_u2u_7_9 = {{2{1'b0}}, vector};
  end
  endfunction


  function  [10:0] conv_u2u_9_11 ;
    input [8:0]  vector ;
  begin
    conv_u2u_9_11 = {{2{1'b0}}, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    Adding
//  Generated from file(s):
//    2) $PROJECT_HOME/ESL.c
// ------------------------------------------------------------------


module Adding (
  A_rsc_z, B_rsc_z, C_rsc_z, D_rsc_z, E_rsc_z, Temp_rsc_z, clk, rst
);
  input [7:0] A_rsc_z;
  input [7:0] B_rsc_z;
  input [7:0] C_rsc_z;
  input [7:0] D_rsc_z;
  input [7:0] E_rsc_z;
  output [63:0] Temp_rsc_z;
  input clk;
  input rst;


  // Interconnect Declarations
  wire [7:0] A_rsc_mgc_in_wire_d;
  wire [7:0] B_rsc_mgc_in_wire_d;
  wire [7:0] C_rsc_mgc_in_wire_d;
  wire [7:0] D_rsc_mgc_in_wire_d;
  wire [7:0] E_rsc_mgc_in_wire_d;
  wire [63:0] Temp_rsc_mgc_out_stdreg_d;

  mgc_in_wire #(.rscid(1),
  .width(8)) A_rsc_mgc_in_wire (
      .d(A_rsc_mgc_in_wire_d),
      .z(A_rsc_z)
    );
  mgc_in_wire #(.rscid(2),
  .width(8)) B_rsc_mgc_in_wire (
      .d(B_rsc_mgc_in_wire_d),
      .z(B_rsc_z)
    );
  mgc_in_wire #(.rscid(3),
  .width(8)) C_rsc_mgc_in_wire (
      .d(C_rsc_mgc_in_wire_d),
      .z(C_rsc_z)
    );
  mgc_in_wire #(.rscid(4),
  .width(8)) D_rsc_mgc_in_wire (
      .d(D_rsc_mgc_in_wire_d),
      .z(D_rsc_z)
    );
  mgc_in_wire #(.rscid(5),
  .width(8)) E_rsc_mgc_in_wire (
      .d(E_rsc_mgc_in_wire_d),
      .z(E_rsc_z)
    );
  mgc_out_stdreg #(.rscid(6),
  .width(64)) Temp_rsc_mgc_out_stdreg (
      .d(Temp_rsc_mgc_out_stdreg_d),
      .z(Temp_rsc_z)
    );
  Adding_core Adding_core_inst (
      .clk(clk),
      .rst(rst),
      .A_rsc_mgc_in_wire_d(A_rsc_mgc_in_wire_d),
      .B_rsc_mgc_in_wire_d(B_rsc_mgc_in_wire_d),
      .C_rsc_mgc_in_wire_d(C_rsc_mgc_in_wire_d),
      .D_rsc_mgc_in_wire_d(D_rsc_mgc_in_wire_d),
      .E_rsc_mgc_in_wire_d(E_rsc_mgc_in_wire_d),
      .Temp_rsc_mgc_out_stdreg_d(Temp_rsc_mgc_out_stdreg_d)
    );
endmodule



