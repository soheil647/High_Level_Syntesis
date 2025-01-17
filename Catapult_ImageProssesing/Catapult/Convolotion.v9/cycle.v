// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2011a.41 Production Release
//  HLS Date:       Thu Apr  7 20:28:55 PDT 2011
// 
//  Generated by:   ss@DESKTOP-UB05SU4
//  Generated date: Sat Apr 20 18:31:10 2019
// ----------------------------------------------------------------------

// 
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
  reg in_rsc_singleport_re_reg;
  reg out_rsc_singleport_we_reg;
  reg [8:0] in_rsc_singleport_addr_reg_sg1;
  reg [8:0] in_rsc_singleport_addr_reg_1;
  reg out_rsc_singleport_data_in_reg_sg2;
  reg [5:0] out_rsc_singleport_data_in_reg_sg1;
  reg out_rsc_singleport_data_in_reg_1;
  reg [8:0] out_rsc_singleport_addr_reg_sg1;
  reg [8:0] out_rsc_singleport_addr_reg_1;

  always begin : core
    // Interconnect Declarations
    reg [5:0] Result_sg1_sva;
    reg Result_1_sva;
    reg Result_sg2_sva;
    reg [1:0] Kcolumn_1_sva;
    reg [5:0] Result_sg1_lpi_4;
    reg Result_1_lpi_4;
    reg Result_sg2_lpi_4;
    reg [1:0] Krow_1_sva;
    reg [10:0] conv1_sva;
    reg [10:0] conv2_sva;
    reg for_for_for_for_lor_1_lpi_4_dfm;
    reg for_for_for_for_lor_sva_1;
    reg for_for_for_for_lor_lpi_4_dfm;
    reg [8:0] slc_sat_sva;
    reg [7:0] for_for_for_for_else_ac_fixed_cctor_sva;
    reg Result_sg2_lpi_4_dfm;
    reg [5:0] Result_sg1_lpi_4_dfm;
    reg Result_1_lpi_4_dfm;
    reg [1:0] Krow_1_sva_1;
    reg [1:0] Kcolumn_1_sva_1;
    reg [9:0] Drow_1_sva_1;
    reg [9:0] Dcolumn_1_sva_1;
    reg exit_for_for_for_for;
    reg [1:0] for_for_for_for_else_mux_itm;
    reg for_for_for_for_else_mux_1_itm;
    reg [8:0] Dcolumn_1_sva_2;
    reg [8:0] Drow_1_sva_2;
    reg [2:0] for_for_for_for_else_acc_6_sdt;
    reg [2:0] for_for_for_for_else_acc_7_psp;
    reg for_for_for_not_tcond;

    begin : mainExit
      forever begin : main
        // C-Step 0 of Loop 'main'
        Dcolumn_1_sva_2 = 9'b0;
        in_rsc_singleport_addr_reg_1 <= 9'b0;
        in_rsc_singleport_addr_reg_sg1 <= 9'b0;
        in_rsc_singleport_re_reg <= 1'b1;
        out_rsc_singleport_data_in_reg_sg1 <= 6'b0;
        out_rsc_singleport_data_in_reg_1 <= 1'b0;
        out_rsc_singleport_data_in_reg_sg2 <= 1'b0;
        out_rsc_singleport_addr_reg_1 <= 9'b0;
        out_rsc_singleport_addr_reg_sg1 <= 9'b0;
        out_rsc_singleport_we_reg <= 1'b1;
        begin : waitLoop0Exit
          forever begin : waitLoop0
            @(posedge clk);
            if ( rst )
              disable mainExit;
            if ( clk )
              disable waitLoop0Exit;
          end
        end
        // C-Step 1 of Loop 'main'
        begin : for_0Exit
          forever begin : for_0
            // C-Step 0 of Loop 'for_0'
            Drow_1_sva_2 = 9'b0;
            begin : for_forExit
              forever begin : for_for
                // C-Step 0 of Loop 'for_for'
                Result_sg1_sva = 6'b0;
                Result_1_sva = 1'b0;
                Result_sg2_sva = 1'b0;
                Kcolumn_1_sva = 2'b0;
                begin : for_for_forExit
                  forever begin : for_for_for
                    // C-Step 0 of Loop 'for_for_for'
                    Result_sg2_lpi_4 = Result_sg2_sva;
                    Result_1_lpi_4 = Result_1_sva;
                    Result_sg1_lpi_4 = Result_sg1_sva;
                    Krow_1_sva = 2'b0;
                    begin : for_for_for_forExit
                      forever begin : for_for_for_for
                        // C-Step 0 of Loop 'for_for_for_for'
                        in_rsc_singleport_addr_reg_1 <= 9'b0;
                        in_rsc_singleport_addr_reg_sg1 <= 9'b0;
                        in_rsc_singleport_re_reg <= 1'b1;
                        out_rsc_singleport_data_in_reg_sg1 <= 6'b0;
                        out_rsc_singleport_data_in_reg_1 <= 1'b0;
                        out_rsc_singleport_data_in_reg_sg2 <= 1'b0;
                        out_rsc_singleport_addr_reg_1 <= 9'b0;
                        out_rsc_singleport_addr_reg_sg1 <= 9'b0;
                        out_rsc_singleport_we_reg <= 1'b1;
                        for_for_for_for_lor_sva_1 = 1'b0;
                        conv1_sva = conv_s2s_2_11(Kcolumn_1_sva + 2'b11) + conv_u2s_9_11(Dcolumn_1_sva_2);
                        conv2_sva = conv_s2s_2_11(Krow_1_sva + 2'b11) + conv_u2s_9_11(Drow_1_sva_2);
                        for_for_for_for_lor_1_lpi_4_dfm = (conv2_sva[10]) | (conv1_sva[9])
                            | (conv1_sva[10]);
                        if ( for_for_for_for_lor_1_lpi_4_dfm ) begin
                        end
                        else begin
                          for_for_for_for_lor_sva_1 = readslicef_2_1_1(((~ (conv2_sva[10:9]))
                              + 2'b1));
                        end
                        for_for_for_for_lor_lpi_4_dfm = for_for_for_for_lor_sva_1
                            | for_for_for_for_lor_1_lpi_4_dfm;
                        if ( for_for_for_for_lor_lpi_4_dfm ) begin
                        end
                        else begin
                          in_rsc_singleport_re_reg <= 1'b0;
                          in_rsc_singleport_addr_reg_1 <= conv1_sva[8:0];
                          in_rsc_singleport_addr_reg_sg1 <= (conv2_sva[8:0]) + conv_s2u_2_9(conv1_sva[10:9]);
                        end
                        begin : waitLoop1Exit
                          forever begin : waitLoop1
                            @(posedge clk);
                            if ( rst )
                              disable mainExit;
                            if ( clk )
                              disable waitLoop1Exit;
                          end
                        end
                        // C-Step 1 of Loop 'for_for_for_for'
                        if ( for_for_for_for_lor_lpi_4_dfm ) begin
                        end
                        else begin
                          for_for_for_for_else_acc_6_sdt = conv_u2u_2_3(Krow_1_sva)
                              + conv_u2u_2_3(Kcolumn_1_sva);
                          for_for_for_for_else_acc_7_psp = conv_u2u_2_3(for_for_for_for_else_acc_6_sdt[2:1])
                              + conv_u2u_2_3(Krow_1_sva);
                          for_for_for_for_else_mux_itm = MUX_v_2_16_2({2'b1 , 2'b10
                              , 2'b1 , 2'b10 , 2'b0 , 2'b10 , 2'b1 , 2'b10 , 2'b1
                              , 2'b0 , 2'b0 , 2'b0 , 2'b0 , 2'b0 , 2'b0 , 2'b0},
                              {for_for_for_for_else_acc_7_psp , (for_for_for_for_else_acc_6_sdt[0])});
                          for_for_for_for_else_mux_1_itm = MUX_s_1_16_2({1'b0 , 1'b0
                              , 1'b0 , 1'b0 , 1'b1 , 1'b0 , 1'b0 , 1'b0 , 1'b0 ,
                              1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0}, {for_for_for_for_else_acc_7_psp
                              , (for_for_for_for_else_acc_6_sdt[0])});
                        end
                        Krow_1_sva_1 = Krow_1_sva + 2'b1;
                        exit_for_for_for_for = ~ (readslicef_3_1_2((({1'b1 , Krow_1_sva_1})
                            + 3'b1)));
                        if ( exit_for_for_for_for ) begin
                        end
                        else begin
                          Krow_1_sva = Krow_1_sva_1;
                        end
                        in_rsc_singleport_addr_reg_1 <= 9'b0;
                        in_rsc_singleport_addr_reg_sg1 <= 9'b0;
                        in_rsc_singleport_re_reg <= 1'b1;
                        out_rsc_singleport_data_in_reg_sg1 <= 6'b0;
                        out_rsc_singleport_data_in_reg_1 <= 1'b0;
                        out_rsc_singleport_data_in_reg_sg2 <= 1'b0;
                        out_rsc_singleport_addr_reg_1 <= 9'b0;
                        out_rsc_singleport_addr_reg_sg1 <= 9'b0;
                        out_rsc_singleport_we_reg <= 1'b1;
                        begin : waitLoop2Exit
                          forever begin : waitLoop2
                            @(posedge clk);
                            if ( rst )
                              disable mainExit;
                            if ( clk )
                              disable waitLoop2Exit;
                          end
                        end
                        // C-Step 2 of Loop 'for_for_for_for'
                        if ( for_for_for_for_lor_lpi_4_dfm ) begin
                          Result_sg2_lpi_4_dfm = Result_sg2_lpi_4;
                          Result_sg1_lpi_4_dfm = Result_sg1_lpi_4;
                          Result_1_lpi_4_dfm = Result_1_lpi_4;
                        end
                        else begin
                          slc_sat_sva = conv_u2u_8_9({Result_sg2_lpi_4 , Result_sg1_lpi_4
                              , Result_1_lpi_4}) + conv_u2u_5_9(readslicef_12_5_7(conv_u2u_24_12(conv_u2u_8_12(in_rsc_singleport_data_out)
                              * conv_u2u_5_12({for_for_for_for_else_mux_itm , 1'b0
                              , ({{1{for_for_for_for_else_mux_1_itm}}, for_for_for_for_else_mux_1_itm})}))));
                          for_for_for_for_else_ac_fixed_cctor_sva = (slc_sat_sva[7:0])
                              | (signext_8_1(slc_sat_sva[8]));
                          Result_sg2_lpi_4_dfm = for_for_for_for_else_ac_fixed_cctor_sva[7];
                          Result_sg1_lpi_4_dfm = for_for_for_for_else_ac_fixed_cctor_sva[6:1];
                          Result_1_lpi_4_dfm = for_for_for_for_else_ac_fixed_cctor_sva[0];
                        end
                        if ( exit_for_for_for_for ) begin
                        end
                        else begin
                          Result_sg2_lpi_4 = Result_sg2_lpi_4_dfm;
                          Result_sg1_lpi_4 = Result_sg1_lpi_4_dfm;
                          Result_1_lpi_4 = Result_1_lpi_4_dfm;
                        end
                        if ( exit_for_for_for_for )
                          disable for_for_for_forExit;
                      end
                    end
                    in_rsc_singleport_addr_reg_1 <= 9'b0;
                    in_rsc_singleport_addr_reg_sg1 <= 9'b0;
                    in_rsc_singleport_re_reg <= 1'b1;
                    out_rsc_singleport_data_in_reg_sg1 <= 6'b0;
                    out_rsc_singleport_data_in_reg_1 <= 1'b0;
                    out_rsc_singleport_data_in_reg_sg2 <= 1'b0;
                    out_rsc_singleport_addr_reg_1 <= 9'b0;
                    out_rsc_singleport_addr_reg_sg1 <= 9'b0;
                    out_rsc_singleport_we_reg <= 1'b1;
                    Kcolumn_1_sva_1 = Kcolumn_1_sva + 2'b1;
                    for_for_for_not_tcond = ~ (readslicef_3_1_2((({1'b1 , Kcolumn_1_sva_1})
                        + 3'b1)));
                    if ( for_for_for_not_tcond ) begin
                      out_rsc_singleport_we_reg <= 1'b0;
                      out_rsc_singleport_addr_reg_1 <= Dcolumn_1_sva_2;
                      out_rsc_singleport_addr_reg_sg1 <= Drow_1_sva_2;
                      out_rsc_singleport_data_in_reg_sg1 <= Result_sg1_lpi_4_dfm;
                      out_rsc_singleport_data_in_reg_1 <= Result_1_lpi_4_dfm;
                      out_rsc_singleport_data_in_reg_sg2 <= Result_sg2_lpi_4_dfm;
                    end
                    begin : waitLoop3Exit
                      forever begin : waitLoop3
                        @(posedge clk);
                        if ( rst )
                          disable mainExit;
                        if ( clk )
                          disable waitLoop3Exit;
                      end
                    end
                    // C-Step 1 of Loop 'for_for_for'
                    if ( for_for_for_not_tcond )
                      disable for_for_forExit;
                    Result_sg2_sva = Result_sg2_lpi_4_dfm;
                    Result_sg1_sva = Result_sg1_lpi_4_dfm;
                    Result_1_sva = Result_1_lpi_4_dfm;
                    Kcolumn_1_sva = Kcolumn_1_sva_1;
                  end
                end
                in_rsc_singleport_addr_reg_1 <= 9'b0;
                in_rsc_singleport_addr_reg_sg1 <= 9'b0;
                in_rsc_singleport_re_reg <= 1'b1;
                out_rsc_singleport_data_in_reg_sg1 <= 6'b0;
                out_rsc_singleport_data_in_reg_1 <= 1'b0;
                out_rsc_singleport_data_in_reg_sg2 <= 1'b0;
                out_rsc_singleport_addr_reg_1 <= 9'b0;
                out_rsc_singleport_addr_reg_sg1 <= 9'b0;
                out_rsc_singleport_we_reg <= 1'b1;
                begin : waitLoop4Exit
                  forever begin : waitLoop4
                    @(posedge clk);
                    if ( rst )
                      disable mainExit;
                    if ( clk )
                      disable waitLoop4Exit;
                  end
                end
                // C-Step 1 of Loop 'for_for'
                Drow_1_sva_1 = conv_u2u_9_10(Drow_1_sva_2) + 10'b1;
                if ( Drow_1_sva_1[9] )
                  disable for_forExit;
                Drow_1_sva_2 = Drow_1_sva_1[8:0];
              end
            end
            in_rsc_singleport_addr_reg_1 <= 9'b0;
            in_rsc_singleport_addr_reg_sg1 <= 9'b0;
            in_rsc_singleport_re_reg <= 1'b1;
            out_rsc_singleport_data_in_reg_sg1 <= 6'b0;
            out_rsc_singleport_data_in_reg_1 <= 1'b0;
            out_rsc_singleport_data_in_reg_sg2 <= 1'b0;
            out_rsc_singleport_addr_reg_1 <= 9'b0;
            out_rsc_singleport_addr_reg_sg1 <= 9'b0;
            out_rsc_singleport_we_reg <= 1'b1;
            begin : waitLoop5Exit
              forever begin : waitLoop5
                @(posedge clk);
                if ( rst )
                  disable mainExit;
                if ( clk )
                  disable waitLoop5Exit;
              end
            end
            // C-Step 1 of Loop 'for_0'
            Dcolumn_1_sva_1 = conv_u2u_9_10(Dcolumn_1_sva_2) + 10'b1;
            if ( Dcolumn_1_sva_1[9] )
              disable for_0Exit;
            Dcolumn_1_sva_2 = Dcolumn_1_sva_1[8:0];
          end
        end
      end
    end
    for_for_for_for_else_mux_1_itm = 1'b0;
    for_for_for_for_else_mux_itm = 2'b0;
    out_rsc_singleport_we_reg <= 1'b0;
    out_rsc_singleport_addr_reg_1 <= 9'b0;
    out_rsc_singleport_addr_reg_sg1 <= 9'b0;
    out_rsc_singleport_data_in_reg_sg1 <= 6'b0;
    out_rsc_singleport_data_in_reg_1 <= 1'b0;
    out_rsc_singleport_data_in_reg_sg2 <= 1'b0;
    in_rsc_singleport_re_reg <= 1'b0;
    in_rsc_singleport_addr_reg_1 <= 9'b0;
    in_rsc_singleport_addr_reg_sg1 <= 9'b0;
    in_rsc_singleport_addr_reg_1 <= 9'b0;
    in_rsc_singleport_addr_reg_sg1 <= 9'b0;
    in_rsc_singleport_re_reg <= 1'b1;
    out_rsc_singleport_data_in_reg_sg1 <= 6'b0;
    out_rsc_singleport_data_in_reg_1 <= 1'b0;
    out_rsc_singleport_data_in_reg_sg2 <= 1'b0;
    out_rsc_singleport_addr_reg_1 <= 9'b0;
    out_rsc_singleport_addr_reg_sg1 <= 9'b0;
    out_rsc_singleport_we_reg <= 1'b1;
  end

  assign in_rsc_singleport_addr = {in_rsc_singleport_addr_reg_sg1 , in_rsc_singleport_addr_reg_1};
  assign in_rsc_singleport_re = in_rsc_singleport_re_reg;
  assign out_rsc_singleport_data_in = {out_rsc_singleport_data_in_reg_sg2 , out_rsc_singleport_data_in_reg_sg1
      , out_rsc_singleport_data_in_reg_1};
  assign out_rsc_singleport_addr = {out_rsc_singleport_addr_reg_sg1 , out_rsc_singleport_addr_reg_1};
  assign out_rsc_singleport_we = out_rsc_singleport_we_reg;

  function [0:0] readslicef_2_1_1;
    input [1:0] vector;
    reg [1:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_2_1_1 = tmp[0:0];
  end
  endfunction


  function [1:0] MUX_v_2_16_2;
    input [31:0] inputs;
    input [3:0] sel;
    reg [1:0] result;
  begin
    case (sel)
      4'b0000 : begin
        result = inputs[31:30];
      end
      4'b0001 : begin
        result = inputs[29:28];
      end
      4'b0010 : begin
        result = inputs[27:26];
      end
      4'b0011 : begin
        result = inputs[25:24];
      end
      4'b0100 : begin
        result = inputs[23:22];
      end
      4'b0101 : begin
        result = inputs[21:20];
      end
      4'b0110 : begin
        result = inputs[19:18];
      end
      4'b0111 : begin
        result = inputs[17:16];
      end
      4'b1000 : begin
        result = inputs[15:14];
      end
      4'b1001 : begin
        result = inputs[13:12];
      end
      4'b1010 : begin
        result = inputs[11:10];
      end
      4'b1011 : begin
        result = inputs[9:8];
      end
      4'b1100 : begin
        result = inputs[7:6];
      end
      4'b1101 : begin
        result = inputs[5:4];
      end
      4'b1110 : begin
        result = inputs[3:2];
      end
      4'b1111 : begin
        result = inputs[1:0];
      end
      default : begin
        result = inputs[31:30];
      end
    endcase
    MUX_v_2_16_2 = result;
  end
  endfunction


  function [0:0] MUX_s_1_16_2;
    input [15:0] inputs;
    input [3:0] sel;
    reg [0:0] result;
  begin
    case (sel)
      4'b0000 : begin
        result = inputs[15:15];
      end
      4'b0001 : begin
        result = inputs[14:14];
      end
      4'b0010 : begin
        result = inputs[13:13];
      end
      4'b0011 : begin
        result = inputs[12:12];
      end
      4'b0100 : begin
        result = inputs[11:11];
      end
      4'b0101 : begin
        result = inputs[10:10];
      end
      4'b0110 : begin
        result = inputs[9:9];
      end
      4'b0111 : begin
        result = inputs[8:8];
      end
      4'b1000 : begin
        result = inputs[7:7];
      end
      4'b1001 : begin
        result = inputs[6:6];
      end
      4'b1010 : begin
        result = inputs[5:5];
      end
      4'b1011 : begin
        result = inputs[4:4];
      end
      4'b1100 : begin
        result = inputs[3:3];
      end
      4'b1101 : begin
        result = inputs[2:2];
      end
      4'b1110 : begin
        result = inputs[1:1];
      end
      4'b1111 : begin
        result = inputs[0:0];
      end
      default : begin
        result = inputs[15:15];
      end
    endcase
    MUX_s_1_16_2 = result;
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


  function [4:0] readslicef_12_5_7;
    input [11:0] vector;
    reg [11:0] tmp;
  begin
    tmp = vector >> 7;
    readslicef_12_5_7 = tmp[4:0];
  end
  endfunction


  function [7:0] signext_8_1;
    input [0:0] vector;
  begin
    signext_8_1= {{7{vector[0]}}, vector};
  end
  endfunction


  function signed [10:0] conv_s2s_2_11 ;
    input signed [1:0]  vector ;
  begin
    conv_s2s_2_11 = {{9{vector[1]}}, vector};
  end
  endfunction


  function signed [10:0] conv_u2s_9_11 ;
    input [8:0]  vector ;
  begin
    conv_u2s_9_11 = {{2{1'b0}}, vector};
  end
  endfunction


  function  [8:0] conv_s2u_2_9 ;
    input signed [1:0]  vector ;
  begin
    conv_s2u_2_9 = {{7{vector[1]}}, vector};
  end
  endfunction


  function  [2:0] conv_u2u_2_3 ;
    input [1:0]  vector ;
  begin
    conv_u2u_2_3 = {1'b0, vector};
  end
  endfunction


  function  [8:0] conv_u2u_8_9 ;
    input [7:0]  vector ;
  begin
    conv_u2u_8_9 = {1'b0, vector};
  end
  endfunction


  function  [8:0] conv_u2u_5_9 ;
    input [4:0]  vector ;
  begin
    conv_u2u_5_9 = {{4{1'b0}}, vector};
  end
  endfunction


  function  [11:0] conv_u2u_24_12 ;
    input [23:0]  vector ;
  begin
    conv_u2u_24_12 = vector[11:0];
  end
  endfunction


  function  [11:0] conv_u2u_8_12 ;
    input [7:0]  vector ;
  begin
    conv_u2u_8_12 = {{4{1'b0}}, vector};
  end
  endfunction


  function  [11:0] conv_u2u_5_12 ;
    input [4:0]  vector ;
  begin
    conv_u2u_5_12 = {{7{1'b0}}, vector};
  end
  endfunction


  function  [9:0] conv_u2u_9_10 ;
    input [8:0]  vector ;
  begin
    conv_u2u_9_10 = {1'b0, vector};
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



