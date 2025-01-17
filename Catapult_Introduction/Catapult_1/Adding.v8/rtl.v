// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2011a.41 Production Release
//  HLS Date:       Thu Apr  7 20:28:55 PDT 2011
// 
//  Generated by:   ss@DESKTOP-UB05SU4
//  Generated date: Tue Apr 09 16:40:16 2019
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    Adding_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module Adding_core_fsm (
  clk, rst, fsm_output
);
  input clk;
  input rst;
  output [1:0] fsm_output;
  reg [1:0] fsm_output;


  // FSM State Type Declaration for Adding_core_fsm_1
  parameter
    st_main = 1'd0,
    st_main_1 = 1'd1,
    state_x = 1'b0;

  reg [0:0] state_var;
  reg [0:0] state_var_NS;

  always @(state_var)
  begin : Adding_core_fsm_1
    case (state_var)
      st_main : begin
        fsm_output = 2'b1;
        state_var_NS = st_main_1;
      end
      st_main_1 : begin
        fsm_output = 2'b10;
        state_var_NS = st_main;
      end
      default : begin
        fsm_output = 2'b00;
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
  wire [1:0] fsm_output;
  wire and_dcpl;
  wire and_dcpl_1;
  reg [3:0] out_i_1_lpi;
  reg [2:0] in_i_1_lpi;
  reg exit_out_1_lpi;
  reg [7:0] A_1_lpi_dfm;
  reg [7:0] B_1_lpi_dfm;
  reg [7:0] C_1_lpi_dfm;
  reg [7:0] D_1_lpi_dfm;
  reg [7:0] E_1_lpi_dfm;
  reg exit_in_sva;
  reg [63:0] Temp2_reg;
  reg [15:0] out_mul_1_itm;
  wire and_4_cse;
  wire nand_tmp;
  wire [2:0] in_i_1_sva_1;
  wire [3:0] xin_i_1_sva_1;
  wire [4:0] out_acc_itm;
  wire [5:0] xout_acc_itm;
  wire [2:0] in_acc_itm;
  wire [3:0] xin_acc_itm;
  wire [63:0] z_out;
  wire [79:0] xz_out;
  wire [7:0] E_1_lpi_dfm_mx0;
  wire [7:0] B_1_lpi_dfm_mx0;
  wire [3:0] out_i_1_sva_1;
  wire [4:0] xout_i_1_sva_1;
  wire [3:0] out_i_1_lpi_dfm;
  wire and_16_cse;

  wire[15:0] mux_16_nl;
  wire[63:0] mux_15_nl;
  Adding_core_fsm Adding_core_fsm_inst (
      .clk(clk),
      .rst(rst),
      .fsm_output(fsm_output)
    );
  assign and_16_cse = exit_out_1_lpi & (~ (fsm_output[1]));
  assign nand_tmp = ~((fsm_output[1]) & exit_out_1_lpi);
  assign and_4_cse = (fsm_output[1]) & exit_in_sva;
  assign E_1_lpi_dfm_mx0 = MUX_v_8_2_2({E_1_lpi_dfm , E_rsc_mgc_in_wire_d}, exit_out_1_lpi);
  assign B_1_lpi_dfm_mx0 = MUX_v_8_2_2({B_1_lpi_dfm , B_rsc_mgc_in_wire_d}, exit_out_1_lpi);
  assign xout_acc_itm = conv_u2s_4_5(out_i_1_sva_1) + 5'b10101;
  assign out_acc_itm = xout_acc_itm[4:0];
  assign xout_i_1_sva_1 = out_i_1_lpi_dfm + 4'b1;
  assign out_i_1_sva_1 = xout_i_1_sva_1[3:0];
  assign out_i_1_lpi_dfm = out_i_1_lpi & (signext_4_1(~ exit_out_1_lpi));
  assign xin_acc_itm = ({1'b1 , (in_i_1_sva_1[2:1])}) + 3'b1;
  assign in_acc_itm = xin_acc_itm[2:0];
  assign xin_i_1_sva_1 = (in_i_1_lpi & (signext_3_1(~ exit_out_1_lpi))) + 3'b1;
  assign in_i_1_sva_1 = xin_i_1_sva_1[2:0];
  assign and_dcpl = (fsm_output[0]) & (~ (in_acc_itm[2]));
  assign and_dcpl_1 = (fsm_output[0]) & (in_acc_itm[2]);
  always @(posedge clk) begin
    if ( rst ) begin
      E_1_lpi_dfm <= 8'b0;
      D_1_lpi_dfm <= 8'b0;
      C_1_lpi_dfm <= 8'b0;
      B_1_lpi_dfm <= 8'b0;
      A_1_lpi_dfm <= 8'b0;
      out_mul_1_itm <= 16'b0;
      exit_out_1_lpi <= 1'b1;
      Temp_rsc_mgc_out_stdreg_d <= 64'b0;
      exit_in_sva <= 1'b0;
      in_i_1_lpi <= 3'b0;
      Temp2_reg <= 64'b0;
      out_i_1_lpi <= 4'b0;
    end
    else begin
      E_1_lpi_dfm <= MUX_v_8_2_2({E_1_lpi_dfm , E_rsc_mgc_in_wire_d}, and_16_cse);
      D_1_lpi_dfm <= MUX_v_8_2_2({D_1_lpi_dfm , D_rsc_mgc_in_wire_d}, and_16_cse);
      C_1_lpi_dfm <= MUX_v_8_2_2({C_1_lpi_dfm , C_rsc_mgc_in_wire_d}, and_16_cse);
      B_1_lpi_dfm <= MUX_v_8_2_2({B_1_lpi_dfm , B_rsc_mgc_in_wire_d}, and_16_cse);
      A_1_lpi_dfm <= MUX_v_8_2_2({A_1_lpi_dfm , A_rsc_mgc_in_wire_d}, and_16_cse);
      out_mul_1_itm <= z_out[15:0];
      exit_out_1_lpi <= MUX_s_1_2_2({exit_out_1_lpi , (~((in_acc_itm[2]) | (out_acc_itm[4])))},
          fsm_output[0]);
      Temp_rsc_mgc_out_stdreg_d <= MUX1HOT_v_64_3_2({Temp2_reg , z_out , Temp_rsc_mgc_out_stdreg_d},
          {(~(exit_in_sva | nand_tmp)) , (exit_in_sva & (~ nand_tmp)) , nand_tmp});
      exit_in_sva <= ~ (in_acc_itm[2]);
      in_i_1_lpi <= (MUX_v_3_2_2({(in_i_1_lpi | ({{2{and_dcpl}}, and_dcpl})) , in_i_1_sva_1},
          (and_dcpl & (~ (out_acc_itm[4]))) | and_dcpl_1)) & (signext_3_1(~(and_dcpl
          & (out_acc_itm[4]))));
      Temp2_reg <= MUX1HOT_v_64_3_2({(Temp2_reg + conv_u2u_9_64(readslicef_11_9_2((conv_u2u_10_11({(conv_u2u_8_9(MUX_v_8_2_2({A_1_lpi_dfm
          , A_rsc_mgc_in_wire_d}, exit_out_1_lpi)) + conv_u2u_7_9(B_1_lpi_dfm_mx0[7:1]))
          , (B_1_lpi_dfm_mx0[0])}) + conv_u2u_9_11(conv_u2u_8_9(MUX_v_8_2_2({C_1_lpi_dfm
          , C_rsc_mgc_in_wire_d}, exit_out_1_lpi)) + conv_u2u_8_9(MUX_v_8_2_2({D_1_lpi_dfm
          , D_rsc_mgc_in_wire_d}, exit_out_1_lpi))))))) , z_out , Temp2_reg}, {(fsm_output[0])
          , and_4_cse , (~(and_4_cse | (fsm_output[0])))});
      out_i_1_lpi <= MUX1HOT_v_4_3_2({out_i_1_sva_1 , out_i_1_lpi_dfm , out_i_1_lpi},
          {and_dcpl , and_dcpl_1 , (~ (fsm_output[0]))});
    end
  end
  assign mux_16_nl = MUX_v_16_2_2({({8'b0 , E_1_lpi_dfm_mx0}) , out_mul_1_itm}, fsm_output[1]);
  assign mux_15_nl = MUX_v_64_2_2({({56'b0 , E_1_lpi_dfm_mx0}) , Temp2_reg}, fsm_output[1]);
  assign xz_out = conv_u2u_16_64(mux_16_nl) * (mux_15_nl);
  assign z_out = xz_out[63:0];

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


  function [3:0] signext_4_1;
    input [0:0] vector;
  begin
    signext_4_1= {{3{vector[0]}}, vector};
  end
  endfunction


  function [2:0] signext_3_1;
    input [0:0] vector;
  begin
    signext_3_1= {{2{vector[0]}}, vector};
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


  function [2:0] MUX_v_3_2_2;
    input [5:0] inputs;
    input [0:0] sel;
    reg [2:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[5:3];
      end
      1'b1 : begin
        result = inputs[2:0];
      end
      default : begin
        result = inputs[5:3];
      end
    endcase
    MUX_v_3_2_2 = result;
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


  function [15:0] MUX_v_16_2_2;
    input [31:0] inputs;
    input [0:0] sel;
    reg [15:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[31:16];
      end
      1'b1 : begin
        result = inputs[15:0];
      end
      default : begin
        result = inputs[31:16];
      end
    endcase
    MUX_v_16_2_2 = result;
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


  function  [63:0] conv_u2u_16_64 ;
    input [15:0]  vector ;
  begin
    conv_u2u_16_64 = {{48{1'b0}}, vector};
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



