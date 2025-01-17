-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    2011a.41 Production Release
--  HLS Date:       Thu Apr  7 20:28:55 PDT 2011
-- 
--  Generated by:   ss@DESKTOP-UB05SU4
--  Generated date: Sat Apr 20 18:45:17 2019
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    Convolotion_core_fsm
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
LIBRARY mgc_hls;
USE mgc_hls.funcs.ALL;
USE work.convolotion_mux_pkg.ALL;


ENTITY Convolotion_core_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
    st_for_for_for_1_for_1_tr0 : IN STD_LOGIC;
    st_for_for_tr0 : IN STD_LOGIC;
    st_for_tr0 : IN STD_LOGIC
  );
END Convolotion_core_fsm;

ARCHITECTURE v14 OF Convolotion_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for Convolotion_core_fsm_1
  TYPE Convolotion_core_fsm_1_ST IS (st_main, st_for_for_for_1_for, st_for_for_for_1_for_1,
      st_for_for_for_2_for, st_for_for_for_2_for_1, st_for_for_for_3_for, st_for_for_for_3_for_1,
      st_for_for, st_for);

  SIGNAL state_var : Convolotion_core_fsm_1_ST;
  SIGNAL state_var_NS : Convolotion_core_fsm_1_ST;

BEGIN
  -- Default Constant Signal Assignments

  Convolotion_core_fsm_1 : PROCESS (st_for_for_for_1_for_1_tr0, st_for_for_tr0, st_for_tr0,
      state_var)
  BEGIN
    CASE state_var IS
      WHEN st_main =>
        fsm_output <= STD_LOGIC_VECTOR'("000000001");
        state_var_NS <= st_for_for_for_1_for;
      WHEN st_for_for_for_1_for =>
        fsm_output <= STD_LOGIC_VECTOR'("000000010");
        state_var_NS <= st_for_for_for_1_for_1;
      WHEN st_for_for_for_1_for_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000000100");
        IF ( st_for_for_for_1_for_1_tr0 = '1' ) THEN
          state_var_NS <= st_for_for_for_2_for;
        ELSE
          state_var_NS <= st_for_for_for_1_for;
        END IF;
      WHEN st_for_for_for_2_for =>
        fsm_output <= STD_LOGIC_VECTOR'("000001000");
        state_var_NS <= st_for_for_for_2_for_1;
      WHEN st_for_for_for_2_for_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("000010000");
        IF ( st_for_for_for_1_for_1_tr0 = '1' ) THEN
          state_var_NS <= st_for_for_for_3_for;
        ELSE
          state_var_NS <= st_for_for_for_2_for;
        END IF;
      WHEN st_for_for_for_3_for =>
        fsm_output <= STD_LOGIC_VECTOR'("000100000");
        state_var_NS <= st_for_for_for_3_for_1;
      WHEN st_for_for_for_3_for_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("001000000");
        IF ( st_for_for_for_1_for_1_tr0 = '1' ) THEN
          state_var_NS <= st_for_for;
        ELSE
          state_var_NS <= st_for_for_for_3_for;
        END IF;
      WHEN st_for_for =>
        fsm_output <= STD_LOGIC_VECTOR'("010000000");
        IF ( st_for_for_tr0 = '1' ) THEN
          state_var_NS <= st_for;
        ELSE
          state_var_NS <= st_for_for_for_1_for;
        END IF;
      WHEN st_for =>
        fsm_output <= STD_LOGIC_VECTOR'("100000000");
        IF ( st_for_tr0 = '1' ) THEN
          state_var_NS <= st_main;
        ELSE
          state_var_NS <= st_for_for_for_1_for;
        END IF;
      WHEN OTHERS =>
        fsm_output <= "000000000";
        state_var_NS <= st_main;
    END CASE;
  END PROCESS Convolotion_core_fsm_1;

  Convolotion_core_fsm_1_REG : PROCESS (clk)
  BEGIN
    IF clk'event AND ( clk = '1' ) THEN
      IF ( rst = '1' ) THEN
        state_var <= st_main;
      ELSE
        state_var <= state_var_NS;
      END IF;
    END IF;
  END PROCESS Convolotion_core_fsm_1_REG;

END v14;

-- ------------------------------------------------------------------
--  Design Unit:    Convolotion_core
-- ------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
LIBRARY mgc_hls;
USE mgc_hls.funcs.ALL;
USE work.convolotion_mux_pkg.ALL;


ENTITY Convolotion_core IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    in_rsc_singleport_addr : OUT STD_LOGIC_VECTOR (17 DOWNTO 0);
    in_rsc_singleport_re : OUT STD_LOGIC;
    in_rsc_singleport_data_out : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    out_rsc_singleport_data_in : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    out_rsc_singleport_addr : OUT STD_LOGIC_VECTOR (17 DOWNTO 0);
    out_rsc_singleport_we : OUT STD_LOGIC
  );
END Convolotion_core;

ARCHITECTURE v14 OF Convolotion_core IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL fsm_output : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL or_dcpl_11 : STD_LOGIC;
  SIGNAL and_dcpl_27 : STD_LOGIC;
  SIGNAL or_dcpl_25 : STD_LOGIC;
  SIGNAL Result_sg1_sva_reg : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL Result_1_sva_reg : STD_LOGIC;
  SIGNAL Result_sg2_sva_reg : STD_LOGIC;
  SIGNAL reg_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL for_for_for_for_reg : STD_LOGIC;
  SIGNAL for_for_reg : STD_LOGIC;
  SIGNAL for_for_for_for_else_or_itm : STD_LOGIC;
  SIGNAL for_for_for_for_else_or_1_itm : STD_LOGIC;
  SIGNAL for_for_for_for_else_reg : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL Dcolumn_1_sva_2 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL Drow_1_sva_2 : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL or_12_cse : STD_LOGIC;
  SIGNAL for_for_for_1_for_oelse_2_acc_2 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL for_for_for_for_else_ac_fixed_cctor_1_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL z_out_1 : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL z_out_2 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL z_out_3 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL z_out_4 : STD_LOGIC_VECTOR (10 DOWNTO 0);
  SIGNAL z_out_5 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL Krow_2_sva_1 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL for_for_for_for_else_and_3_cse : STD_LOGIC;
  SIGNAL for_for_for_for_else_and_6_cse : STD_LOGIC;
  SIGNAL for_for_for_for_else_and_1_cse : STD_LOGIC;
  SIGNAL or_35_cse : STD_LOGIC;
  SIGNAL or_36_cse : STD_LOGIC;
  SIGNAL or_39_cse : STD_LOGIC;
  SIGNAL mux_26_cse : STD_LOGIC;

  SIGNAL mux_16_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL mux_17_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL mux_2_nl : STD_LOGIC;
  SIGNAL mux_1_nl : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL mux_nl : STD_LOGIC;
  SIGNAL mux_9_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL mux_25_nl : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL mux1h_28_nl : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL mux1h_32_nl : STD_LOGIC;
  SIGNAL mux_11_nl : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL mux_27_nl : STD_LOGIC;
  COMPONENT Convolotion_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
      st_for_for_for_1_for_1_tr0 : IN STD_LOGIC;
      st_for_for_tr0 : IN STD_LOGIC;
      st_for_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL Convolotion_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (8 DOWNTO 0);
  SIGNAL Convolotion_core_fsm_inst_st_for_for_for_1_for_1_tr0 : STD_LOGIC;
  SIGNAL Convolotion_core_fsm_inst_st_for_for_tr0 : STD_LOGIC;
  SIGNAL Convolotion_core_fsm_inst_st_for_tr0 : STD_LOGIC;

BEGIN
  -- Default Constant Signal Assignments

  Convolotion_core_fsm_inst : convolotion_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      fsm_output => Convolotion_core_fsm_inst_fsm_output,
      st_for_for_for_1_for_1_tr0 => Convolotion_core_fsm_inst_st_for_for_for_1_for_1_tr0,
      st_for_for_tr0 => Convolotion_core_fsm_inst_st_for_for_tr0,
      st_for_tr0 => Convolotion_core_fsm_inst_st_for_tr0
    );
  fsm_output <= Convolotion_core_fsm_inst_fsm_output;
  Convolotion_core_fsm_inst_st_for_for_for_1_for_1_tr0 <= NOT for_for_reg;
  Convolotion_core_fsm_inst_st_for_for_tr0 <= z_out_3(9);
  Convolotion_core_fsm_inst_st_for_tr0 <= z_out_4(9);

  or_36_cse <= (for_for_for_for_reg AND (fsm_output(6))) OR (NOT((NOT((NOT((fsm_output(2))
      OR (fsm_output(4)))) OR for_for_for_for_reg)) OR (fsm_output(0)) OR (fsm_output(8))
      OR (fsm_output(7)) OR (fsm_output(6))));
  Krow_2_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(reg_1) + CONV_UNSIGNED(CONV_UNSIGNED('1',
      1), 2), 2));
  for_for_for_1_for_oelse_2_acc_2 <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(NOT (z_out_3(10
      DOWNTO 9))) + CONV_SIGNED(CONV_UNSIGNED('1', 1), 2), 2));
  for_for_for_for_else_ac_fixed_cctor_1_sva <= (z_out_2(7 DOWNTO 0)) OR STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(z_out_2(8),
      1),8));
  for_for_for_for_else_and_3_cse <= (z_out_5(1)) AND (NOT((z_out_5(3)) OR (z_out_5(2))));
  for_for_for_for_else_and_6_cse <= (z_out_5(3)) AND (z_out_5(2)) AND (z_out_5(1));
  for_for_for_for_else_and_1_cse <= (z_out_5(3)) AND (NOT((z_out_5(2)) OR (z_out_5(1))));
  or_dcpl_11 <= (fsm_output(0)) OR (fsm_output(8));
  or_12_cse <= or_dcpl_11 OR (fsm_output(7));
  and_dcpl_27 <= NOT((fsm_output(0)) OR (fsm_output(8)));
  or_dcpl_25 <= (fsm_output(2)) OR (fsm_output(4));
  mux_16_nl <= MUX_v_9_2_2((z_out_2(8 DOWNTO 0)) & (z_out_3(8 DOWNTO 0)), fsm_output(3));
  mux_17_nl <= MUX_v_9_2_2((z_out_4(8 DOWNTO 0)) & Dcolumn_1_sva_2, fsm_output(3));
  in_rsc_singleport_addr <= (mux_16_nl) & (mux_17_nl);
  in_rsc_singleport_re <= (NOT((NOT((NOT(((fsm_output(5)) AND (NOT (z_out_4(9))))
      OR ((fsm_output(1)) AND (NOT (z_out_4(9)))))) OR (for_for_for_1_for_oelse_2_acc_2(1))))
      OR ((fsm_output(3)) AND (NOT (z_out_3(9)))))) OR (z_out_3(10));
  mux_2_nl <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((for_for_for_for_else_ac_fixed_cctor_1_sva(7))
      & Result_sg2_sva_reg), for_for_for_for_reg);
  mux_1_nl <= MUX_v_6_2_2((for_for_for_for_else_ac_fixed_cctor_1_sva(6 DOWNTO 1))
      & Result_sg1_sva_reg, for_for_for_for_reg);
  mux_nl <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((for_for_for_for_else_ac_fixed_cctor_1_sva(0))
      & Result_1_sva_reg), for_for_for_for_reg);
  out_rsc_singleport_data_in <= TO_STDLOGICVECTOR(mux_2_nl) & (mux_1_nl) & TO_STDLOGICVECTOR(mux_nl);
  out_rsc_singleport_addr <= Drow_1_sva_2 & Dcolumn_1_sva_2;
  out_rsc_singleport_we <= NOT((fsm_output(6)) AND (NOT for_for_reg));
  or_35_cse <= (fsm_output(2)) OR (fsm_output(6));
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        Result_1_sva_reg <= '0';
        Result_sg1_sva_reg <= STD_LOGIC_VECTOR'("000000");
        Result_sg2_sva_reg <= '0';
        Dcolumn_1_sva_2 <= STD_LOGIC_VECTOR'("000000000");
        Drow_1_sva_2 <= STD_LOGIC_VECTOR'("000000000");
        reg_1 <= STD_LOGIC_VECTOR'("00");
        for_for_reg <= '0';
        for_for_for_for_reg <= '0';
        for_for_for_for_else_reg <= STD_LOGIC_VECTOR'("00");
        for_for_for_for_else_or_1_itm <= '0';
        for_for_for_for_else_or_itm <= '0';
      ELSE
        Result_1_sva_reg <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'((for_for_for_for_else_ac_fixed_cctor_1_sva(0))
            & Result_1_sva_reg), or_36_cse)) AND (NOT or_12_cse);
        Result_sg1_sva_reg <= (MUX_v_6_2_2((for_for_for_for_else_ac_fixed_cctor_1_sva(6
            DOWNTO 1)) & Result_sg1_sva_reg, or_36_cse)) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            or_12_cse, 1),6));
        Result_sg2_sva_reg <= (MUX_s_1_2_2(STD_LOGIC_VECTOR'((for_for_for_for_else_ac_fixed_cctor_1_sva(7))
            & Result_sg2_sva_reg), or_36_cse)) AND (NOT or_12_cse);
        Dcolumn_1_sva_2 <= (MUX_v_9_2_2((z_out_4(8 DOWNTO 0)) & Dcolumn_1_sva_2,
            and_dcpl_27)) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT (fsm_output(0)),
            1),9));
        Drow_1_sva_2 <= (MUX_v_9_2_2((z_out_3(8 DOWNTO 0)) & Drow_1_sva_2, and_dcpl_27
            AND (NOT (fsm_output(7))))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            or_dcpl_11, 1),9));
        reg_1 <= (MUX_v_2_2_2(Krow_2_sva_1 & reg_1, (or_dcpl_25 AND for_for_reg)
            OR (fsm_output(6)))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT(or_12_cse
            OR (or_dcpl_25 AND (NOT for_for_reg))), 1),2));
        for_for_reg <= readindex(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(TO_STDLOGICVECTOR('1')
            & Krow_2_sva_1) + CONV_SIGNED(CONV_UNSIGNED('1', 1), 3), 3)), 2);
        for_for_for_for_reg <= MUX_s_1_2_2(STD_LOGIC_VECTOR'(((for_for_for_1_for_oelse_2_acc_2(1))
            OR (z_out_3(10)) OR (z_out_4(9))) & ((z_out_3(9)) OR (z_out_3(10)))),
            fsm_output(3));
        for_for_for_for_else_reg <= MUX_v_2_8_2(STD_LOGIC_VECTOR'("01") & STD_LOGIC_VECTOR'("10")
            & STD_LOGIC_VECTOR'("01") & STD_LOGIC_VECTOR'("10") & STD_LOGIC_VECTOR'("00")
            & STD_LOGIC_VECTOR'("10") & STD_LOGIC_VECTOR'("01") & STD_LOGIC_VECTOR'("00"),
            (MUX_v_2_2_2((z_out_5(2 DOWNTO 1)) & (z_out_5(1 DOWNTO 0)), fsm_output(1)))
            & TO_STDLOGICVECTOR(reg_1(0)));
        for_for_for_for_else_or_1_itm <= (NOT(for_for_for_for_else_and_3_cse OR for_for_for_for_else_and_6_cse))
            OR for_for_for_for_else_and_1_cse;
        for_for_for_for_else_or_itm <= (NOT for_for_for_for_else_and_1_cse) OR for_for_for_for_else_and_3_cse
            OR for_for_for_for_else_and_6_cse;
      END IF;
    END IF;
  END PROCESS;
  mux_9_nl <= MUX_v_2_2_2(for_for_for_for_else_reg & STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(for_for_for_for_else_or_1_itm,
      1),2)), fsm_output(4));
  z_out_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(UNSIGNED(TO_STDLOGICVECTOR(for_for_for_for_else_or_itm
      AND (fsm_output(4))) & STD_LOGIC_VECTOR'("00") & (mux_9_nl)) * UNSIGNED(in_rsc_singleport_data_out)),
      12));
  or_39_cse <= (fsm_output(1)) OR (fsm_output(5));
  mux_25_nl <= MUX_v_9_2_2((TO_STDLOGICVECTOR('0') & TO_STDLOGICVECTOR(Result_sg2_sva_reg)
      & Result_sg1_sva_reg & TO_STDLOGICVECTOR(Result_1_sva_reg)) & (z_out_3(8 DOWNTO
      0)), or_39_cse);
  mux1h_28_nl <= MUX1HOT_v_4_3_2((z_out_1(8 DOWNTO 5)) & (z_out_1(11 DOWNTO 8)) &
      STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(z_out_4(9), 1),4)), STD_LOGIC_VECTOR'(or_35_cse
      & (fsm_output(4)) & (fsm_output(1))));
  mux1h_32_nl <= MUX1HOT_s_1_3_2(STD_LOGIC_VECTOR'((z_out_1(4)) & (z_out_1(7)) &
      (z_out_4(9))), STD_LOGIC_VECTOR'(or_35_cse & (fsm_output(4)) & or_39_cse));
  z_out_2 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(mux_25_nl), 11)
      + CONV_UNSIGNED(SIGNED(TO_STDLOGICVECTOR((z_out_4(9)) AND (NOT(or_35_cse OR
      (fsm_output(4)) OR (fsm_output(5))))) & ((mux1h_28_nl) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
      (fsm_output(5)), 1),4))) & TO_STDLOGICVECTOR(mux1h_32_nl)), 11), 11));
  mux_11_nl <= MUX_v_2_2_2(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(reg_1) + CONV_SIGNED(CONV_SIGNED('1',
      1), 2), 2)) & STD_LOGIC_VECTOR'("01"), fsm_output(7));
  z_out_3 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(Drow_1_sva_2),
      11) + CONV_UNSIGNED(SIGNED(mux_11_nl), 11), 11));
  z_out_4 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(Dcolumn_1_sva_2),
      11) + CONV_UNSIGNED(SIGNED'((fsm_output(1)) & '1'), 11), 11));
  mux_26_cse <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((reg_1(1)) & (reg_1(0))), fsm_output(3));
  mux_27_nl <= MUX_s_1_2_2(STD_LOGIC_VECTOR'((reg_1(0)) & (reg_1(1))), fsm_output(1));
  z_out_5 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'((reg_1(1)) & mux_26_cse & ((mux_27_nl)
      AND (NOT (fsm_output(3)))) & ((reg_1(0)) OR (fsm_output(5)) OR (fsm_output(3))))
      + CONV_UNSIGNED(UNSIGNED'(((reg_1(1)) AND (NOT((fsm_output(5)) OR (fsm_output(1)))))
      & (mux_26_cse AND (NOT (fsm_output(1)))) & ((reg_1(1)) OR (fsm_output(5)) OR
      (fsm_output(3)))), 4), 4));
END v14;

-- ------------------------------------------------------------------
--  Design Unit:    Convolotion
--  Generated from file(s):
--    2) $PROJECT_HOME/ESL_CA2.c
-- ------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
LIBRARY mgc_hls;
USE mgc_hls.funcs.ALL;
USE work.convolotion_mux_pkg.ALL;


ENTITY Convolotion IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    in_rsc_singleport_data_in : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    in_rsc_singleport_addr : OUT STD_LOGIC_VECTOR (17 DOWNTO 0);
    in_rsc_singleport_re : OUT STD_LOGIC;
    in_rsc_singleport_we : OUT STD_LOGIC;
    in_rsc_singleport_data_out : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    out_rsc_singleport_data_in : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    out_rsc_singleport_addr : OUT STD_LOGIC_VECTOR (17 DOWNTO 0);
    out_rsc_singleport_re : OUT STD_LOGIC;
    out_rsc_singleport_we : OUT STD_LOGIC;
    out_rsc_singleport_data_out : IN STD_LOGIC_VECTOR (7 DOWNTO 0)
  );
END Convolotion;

ARCHITECTURE v14 OF Convolotion IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL in_rsc_singleport_addr_reg : STD_LOGIC_VECTOR (17 DOWNTO 0);
  SIGNAL in_rsc_singleport_re_reg : STD_LOGIC;
  SIGNAL out_rsc_singleport_data_in_reg : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL out_rsc_singleport_addr_reg : STD_LOGIC_VECTOR (17 DOWNTO 0);
  SIGNAL out_rsc_singleport_we_reg : STD_LOGIC;

  COMPONENT Convolotion_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      in_rsc_singleport_addr : OUT STD_LOGIC_VECTOR (17 DOWNTO 0);
      in_rsc_singleport_re : OUT STD_LOGIC;
      in_rsc_singleport_data_out : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      out_rsc_singleport_data_in : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      out_rsc_singleport_addr : OUT STD_LOGIC_VECTOR (17 DOWNTO 0);
      out_rsc_singleport_we : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL Convolotion_core_inst_in_rsc_singleport_addr : STD_LOGIC_VECTOR (17 DOWNTO
      0);
  SIGNAL Convolotion_core_inst_in_rsc_singleport_data_out : STD_LOGIC_VECTOR (7 DOWNTO
      0);
  SIGNAL Convolotion_core_inst_out_rsc_singleport_data_in : STD_LOGIC_VECTOR (7 DOWNTO
      0);
  SIGNAL Convolotion_core_inst_out_rsc_singleport_addr : STD_LOGIC_VECTOR (17 DOWNTO
      0);

BEGIN
  -- Default Constant Signal Assignments

  Convolotion_core_inst : convolotion_core
    PORT MAP(
      clk => clk,
      rst => rst,
      in_rsc_singleport_addr => Convolotion_core_inst_in_rsc_singleport_addr,
      in_rsc_singleport_re => in_rsc_singleport_re_reg,
      in_rsc_singleport_data_out => Convolotion_core_inst_in_rsc_singleport_data_out,
      out_rsc_singleport_data_in => Convolotion_core_inst_out_rsc_singleport_data_in,
      out_rsc_singleport_addr => Convolotion_core_inst_out_rsc_singleport_addr,
      out_rsc_singleport_we => out_rsc_singleport_we_reg
    );
  in_rsc_singleport_addr_reg <= Convolotion_core_inst_in_rsc_singleport_addr;
  Convolotion_core_inst_in_rsc_singleport_data_out <= in_rsc_singleport_data_out;
  out_rsc_singleport_data_in_reg <= Convolotion_core_inst_out_rsc_singleport_data_in;
  out_rsc_singleport_addr_reg <= Convolotion_core_inst_out_rsc_singleport_addr;

  in_rsc_singleport_data_in <= STD_LOGIC_VECTOR'("00000000");
  in_rsc_singleport_addr <= in_rsc_singleport_addr_reg;
  in_rsc_singleport_re <= in_rsc_singleport_re_reg;
  in_rsc_singleport_we <= '1';
  out_rsc_singleport_data_in <= out_rsc_singleport_data_in_reg;
  out_rsc_singleport_addr <= out_rsc_singleport_addr_reg;
  out_rsc_singleport_re <= '1';
  out_rsc_singleport_we <= out_rsc_singleport_we_reg;
END v14;



