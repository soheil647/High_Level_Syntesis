// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2011a.41 Production Release
//  HLS Date:       Thu Apr  7 20:28:55 PDT 2011
// 
//  Generated by:   ss@DESKTOP-UB05SU4
//  Generated date: Tue Apr 09 16:01:36 2019
// ----------------------------------------------------------------------

// 
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


  always begin : core
    // Interconnect Declarations
    reg [7:0] A_1_sva;
    reg [7:0] B_1_sva;
    reg [7:0] C_1_sva;
    reg [7:0] D_1_sva;
    reg [7:0] E_1_sva;
    reg [3:0] out_i_1_sva;
    reg [8:0] in_5_acc_8_cse_sg1_sva;
    reg [63:0] Temp2_6_sva_1;
    reg [3:0] out_i_1_sva_1;
    reg [62:0] in_acc_itm;
    reg [15:0] out_mul_1_itm;
    reg out_slc_itm;

    begin : mainExit
      forever begin : main
        // C-Step 0 of Loop 'main'
        out_i_1_sva = 4'b0;
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
        A_1_sva = A_rsc_mgc_in_wire_d;
        B_1_sva = B_rsc_mgc_in_wire_d;
        C_1_sva = C_rsc_mgc_in_wire_d;
        D_1_sva = D_rsc_mgc_in_wire_d;
        E_1_sva = E_rsc_mgc_in_wire_d;
        begin : out_0Exit
          forever begin : out_0
            // C-Step 0 of Loop 'out_0'
            begin : waitLoop1Exit
              forever begin : waitLoop1
                @(posedge clk);
                if ( rst )
                  disable mainExit;
                if ( clk )
                  disable waitLoop1Exit;
              end
            end
            // C-Step 1 of Loop 'out_0'
            in_5_acc_8_cse_sg1_sva = readslicef_11_9_2((conv_u2u_10_11({(conv_u2u_8_9(A_1_sva)
                + conv_u2u_7_9(B_1_sva[7:1])) , (B_1_sva[0])}) + conv_u2u_9_11(conv_u2u_8_9(C_1_sva)
                + conv_u2u_8_9(D_1_sva))));
            in_acc_itm = conv_u2u_10_63({(in_5_acc_8_cse_sg1_sva + conv_u2u_8_9(in_5_acc_8_cse_sg1_sva[8:1]))
                , (in_5_acc_8_cse_sg1_sva[0])}) + (Temp2_6_sva_1[63:1]);
            out_mul_1_itm = conv_u2u_32_16(conv_u2u_8_16(E_1_sva) * conv_u2u_8_16(E_1_sva));
            out_i_1_sva_1 = out_i_1_sva + 4'b1;
            out_slc_itm = readslicef_5_1_4((conv_u2s_4_5(out_i_1_sva_1) + 5'b10101));
            begin : waitLoop2Exit
              forever begin : waitLoop2
                @(posedge clk);
                if ( rst )
                  disable mainExit;
                if ( clk )
                  disable waitLoop2Exit;
              end
            end
            // C-Step 2 of Loop 'out_0'
            Temp2_6_sva_1 = conv_u2u_128_64(({in_acc_itm , (Temp2_6_sva_1[0])}) *
                conv_u2u_16_64(out_mul_1_itm));
            if ( ~ out_slc_itm )
              disable out_0Exit;
            out_i_1_sva = out_i_1_sva_1;
          end
        end
        Temp_rsc_mgc_out_stdreg_d <= Temp2_6_sva_1;
        begin : waitLoop3Exit
          forever begin : waitLoop3
            @(posedge clk);
            if ( rst )
              disable mainExit;
            if ( clk )
              disable waitLoop3Exit;
          end
        end
        // C-Step 2 of Loop 'main'
      end
    end
    out_slc_itm = 1'b0;
    out_mul_1_itm = 16'b0;
    in_acc_itm = 63'b0;
    out_i_1_sva_1 = 4'b0;
    Temp2_6_sva_1 = 64'b0;
    in_5_acc_8_cse_sg1_sva = 9'b0;
    out_i_1_sva = 4'b0;
    E_1_sva = 8'b0;
    D_1_sva = 8'b0;
    C_1_sva = 8'b0;
    B_1_sva = 8'b0;
    A_1_sva = 8'b0;
    Temp_rsc_mgc_out_stdreg_d <= 64'b0;
  end


  function [8:0] readslicef_11_9_2;
    input [10:0] vector;
    reg [10:0] tmp;
  begin
    tmp = vector >> 2;
    readslicef_11_9_2 = tmp[8:0];
  end
  endfunction


  function [0:0] readslicef_5_1_4;
    input [4:0] vector;
    reg [4:0] tmp;
  begin
    tmp = vector >> 4;
    readslicef_5_1_4 = tmp[0:0];
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


  function  [62:0] conv_u2u_10_63 ;
    input [9:0]  vector ;
  begin
    conv_u2u_10_63 = {{53{1'b0}}, vector};
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


  function  [63:0] conv_u2u_128_64 ;
    input [127:0]  vector ;
  begin
    conv_u2u_128_64 = vector[63:0];
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



