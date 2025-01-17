-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    2011a.41 Production Release
--  HLS Date:       Thu Apr  7 20:28:55 PDT 2011
-- 
--  Generated by:   ss@DESKTOP-UB05SU4
--  Generated date: Tue Apr 09 16:01:41 2019
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    Adding_core_fsm
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
LIBRARY mgc_hls;
USE mgc_hls.funcs.ALL;
USE work.adding_mux_pkg.ALL;


ENTITY Adding_core_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    st_out_1_tr0 : IN STD_LOGIC
  );
END Adding_core_fsm;

ARCHITECTURE v6 OF Adding_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for Adding_core_fsm_1
  TYPE Adding_core_fsm_1_ST IS (st_main, st_out, st_out_1, st_main_1);

  SIGNAL state_var : Adding_core_fsm_1_ST;
  SIGNAL state_var_NS : Adding_core_fsm_1_ST;

BEGIN
  -- Default Constant Signal Assignments

  Adding_core_fsm_1 : PROCESS (st_out_1_tr0, state_var)
  BEGIN
    CASE state_var IS
      WHEN st_main =>
        fsm_output <= STD_LOGIC_VECTOR'("0001");
        state_var_NS <= st_out;
      WHEN st_out =>
        fsm_output <= STD_LOGIC_VECTOR'("0010");
        state_var_NS <= st_out_1;
      WHEN st_out_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("0100");
        IF ( st_out_1_tr0 = '1' ) THEN
          state_var_NS <= st_main_1;
        ELSE
          state_var_NS <= st_out;
        END IF;
      WHEN st_main_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("1000");
        state_var_NS <= st_main;
      WHEN OTHERS =>
        fsm_output <= "0000";
        state_var_NS <= st_main;
    END CASE;
  END PROCESS Adding_core_fsm_1;

  Adding_core_fsm_1_REG : PROCESS (clk)
  BEGIN
    IF clk'event AND ( clk = '1' ) THEN
      IF ( rst = '1' ) THEN
        state_var <= st_main;
      ELSE
        state_var <= state_var_NS;
      END IF;
    END IF;
  END PROCESS Adding_core_fsm_1_REG;

END v6;

-- ------------------------------------------------------------------
--  Design Unit:    Adding_core
-- ------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
LIBRARY mgc_hls;
USE mgc_hls.funcs.ALL;
USE work.adding_mux_pkg.ALL;


ENTITY Adding_core IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    A_rsc_mgc_in_wire_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    B_rsc_mgc_in_wire_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    C_rsc_mgc_in_wire_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    D_rsc_mgc_in_wire_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    E_rsc_mgc_in_wire_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    Temp_rsc_mgc_out_stdreg_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
  );
END Adding_core;

ARCHITECTURE v6 OF Adding_core IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL Temp_rsc_mgc_out_stdreg_d_drv : STD_LOGIC_VECTOR (63 DOWNTO 0);

  -- Interconnect Declarations
  SIGNAL fsm_output : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL or_dcpl_6 : STD_LOGIC;
  SIGNAL A_1_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL B_1_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL C_1_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL D_1_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL E_1_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL out_i_1_reg : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL Temp2_6_sva_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL in_acc_itm : STD_LOGIC_VECTOR (62 DOWNTO 0);
  SIGNAL out_mul_1_itm : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL out_slc_itm : STD_LOGIC;
  SIGNAL z_out : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL out_i_1_sva_1 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL in_5_acc_8_itm : STD_LOGIC_VECTOR (10 DOWNTO 0);

  SIGNAL mux_9_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL mux_8_nl : STD_LOGIC_VECTOR (63 DOWNTO 0);
  COMPONENT Adding_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
      st_out_1_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL Adding_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL Adding_core_fsm_inst_st_out_1_tr0 : STD_LOGIC;

BEGIN
  -- Default Constant Signal Assignments

  -- Output Reader Assignments
  Temp_rsc_mgc_out_stdreg_d <= Temp_rsc_mgc_out_stdreg_d_drv;

  Adding_core_fsm_inst : adding_core_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      fsm_output => Adding_core_fsm_inst_fsm_output,
      st_out_1_tr0 => Adding_core_fsm_inst_st_out_1_tr0
    );
  fsm_output <= Adding_core_fsm_inst_fsm_output;
  Adding_core_fsm_inst_st_out_1_tr0 <= NOT out_slc_itm;

  out_i_1_sva_1 <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(out_i_1_reg) + CONV_UNSIGNED(CONV_UNSIGNED('1',
      1), 4), 4));
  in_5_acc_8_itm <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(A_1_sva),
      9) + CONV_UNSIGNED(UNSIGNED(B_1_sva(7 DOWNTO 1)), 9), 9)) & TO_STDLOGICVECTOR(B_1_sva(0))),
      11) + CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(C_1_sva), 9) + CONV_UNSIGNED(UNSIGNED(D_1_sva),
      9), 11), 11));
  or_dcpl_6 <= (fsm_output(1)) OR (fsm_output(2));
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        Temp2_6_sva_1 <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000000000000");
        Temp_rsc_mgc_out_stdreg_d_drv <= STD_LOGIC_VECTOR'("0000000000000000000000000000000000000000000000000000000000000000");
        out_i_1_reg <= STD_LOGIC_VECTOR'("0000");
        E_1_sva <= STD_LOGIC_VECTOR'("00000000");
        A_1_sva <= STD_LOGIC_VECTOR'("00000000");
        B_1_sva <= STD_LOGIC_VECTOR'("00000000");
        C_1_sva <= STD_LOGIC_VECTOR'("00000000");
        D_1_sva <= STD_LOGIC_VECTOR'("00000000");
        out_slc_itm <= '0';
        in_acc_itm <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000");
        out_mul_1_itm <= STD_LOGIC_VECTOR'("0000000000000000");
      ELSE
        Temp2_6_sva_1 <= MUX_v_64_2_2(Temp2_6_sva_1 & z_out, fsm_output(2));
        Temp_rsc_mgc_out_stdreg_d_drv <= MUX_v_64_2_2(z_out & Temp_rsc_mgc_out_stdreg_d_drv,
            out_slc_itm OR (NOT (fsm_output(2))));
        out_i_1_reg <= (MUX_v_4_2_2(out_i_1_sva_1 & out_i_1_reg, fsm_output(2)))
            AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT (fsm_output(0)), 1),4));
        E_1_sva <= MUX_v_8_2_2(E_rsc_mgc_in_wire_d & E_1_sva, or_dcpl_6);
        A_1_sva <= MUX_v_8_2_2(A_rsc_mgc_in_wire_d & A_1_sva, or_dcpl_6);
        B_1_sva <= MUX_v_8_2_2(B_rsc_mgc_in_wire_d & B_1_sva, or_dcpl_6);
        C_1_sva <= MUX_v_8_2_2(C_rsc_mgc_in_wire_d & C_1_sva, or_dcpl_6);
        D_1_sva <= MUX_v_8_2_2(D_rsc_mgc_in_wire_d & D_1_sva, or_dcpl_6);
        out_slc_itm <= readindex(STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(UNSIGNED(out_i_1_sva_1),
            5) + SIGNED'("10101"), 5)), 4);
        in_acc_itm <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(in_5_acc_8_itm(10
            DOWNTO 2)) + CONV_UNSIGNED(UNSIGNED(in_5_acc_8_itm(10 DOWNTO 3)), 9),
            9)) & TO_STDLOGICVECTOR(in_5_acc_8_itm(2))), 63) + UNSIGNED(Temp2_6_sva_1(63
            DOWNTO 1)), 63));
        out_mul_1_itm <= z_out(15 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS;
  mux_9_nl <= MUX_v_16_2_2((STD_LOGIC_VECTOR'("00000000") & E_1_sva) & out_mul_1_itm,
      fsm_output(2));
  mux_8_nl <= MUX_v_64_2_2((STD_LOGIC_VECTOR'("00000000000000000000000000000000000000000000000000000000")
      & E_1_sva) & (in_acc_itm & TO_STDLOGICVECTOR(Temp2_6_sva_1(0))), fsm_output(2));
  z_out <= STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED'(UNSIGNED(mux_9_nl) * UNSIGNED(mux_8_nl)),
      64));
END v6;

-- ------------------------------------------------------------------
--  Design Unit:    Adding
--  Generated from file(s):
--    2) $PROJECT_HOME/ESL.c
-- ------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
LIBRARY mgc_hls;
USE mgc_hls.funcs.ALL;
USE work.adding_mux_pkg.ALL;


ENTITY Adding IS
  PORT(
    A_rsc_z : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    B_rsc_z : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    C_rsc_z : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    D_rsc_z : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    E_rsc_z : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    Temp_rsc_z : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC
  );
END Adding;

ARCHITECTURE v6 OF Adding IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL A_rsc_mgc_in_wire_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL B_rsc_mgc_in_wire_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL C_rsc_mgc_in_wire_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL D_rsc_mgc_in_wire_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL E_rsc_mgc_in_wire_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL Temp_rsc_mgc_out_stdreg_d : STD_LOGIC_VECTOR (63 DOWNTO 0);

  SIGNAL A_rsc_mgc_in_wire_d_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL A_rsc_mgc_in_wire_z : STD_LOGIC_VECTOR (7 DOWNTO 0);

  SIGNAL B_rsc_mgc_in_wire_d_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL B_rsc_mgc_in_wire_z : STD_LOGIC_VECTOR (7 DOWNTO 0);

  SIGNAL C_rsc_mgc_in_wire_d_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL C_rsc_mgc_in_wire_z : STD_LOGIC_VECTOR (7 DOWNTO 0);

  SIGNAL D_rsc_mgc_in_wire_d_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL D_rsc_mgc_in_wire_z : STD_LOGIC_VECTOR (7 DOWNTO 0);

  SIGNAL E_rsc_mgc_in_wire_d_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL E_rsc_mgc_in_wire_z : STD_LOGIC_VECTOR (7 DOWNTO 0);

  SIGNAL Temp_rsc_mgc_out_stdreg_d_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL Temp_rsc_mgc_out_stdreg_z : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT Adding_core
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      A_rsc_mgc_in_wire_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      B_rsc_mgc_in_wire_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      C_rsc_mgc_in_wire_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      D_rsc_mgc_in_wire_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      E_rsc_mgc_in_wire_d : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      Temp_rsc_mgc_out_stdreg_d : OUT STD_LOGIC_VECTOR (63 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL Adding_core_inst_A_rsc_mgc_in_wire_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL Adding_core_inst_B_rsc_mgc_in_wire_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL Adding_core_inst_C_rsc_mgc_in_wire_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL Adding_core_inst_D_rsc_mgc_in_wire_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL Adding_core_inst_E_rsc_mgc_in_wire_d : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL Adding_core_inst_Temp_rsc_mgc_out_stdreg_d : STD_LOGIC_VECTOR (63 DOWNTO
      0);

BEGIN
  -- Default Constant Signal Assignments

  A_rsc_mgc_in_wire : mgc_hls.mgc_ioport_comps.mgc_in_wire
    GENERIC MAP(
      rscid => 1,
      width => 8
      )
    PORT MAP(
      d => A_rsc_mgc_in_wire_d_1,
      z => A_rsc_mgc_in_wire_z
    );
  A_rsc_mgc_in_wire_d <= A_rsc_mgc_in_wire_d_1;
  A_rsc_mgc_in_wire_z <= A_rsc_z;

  B_rsc_mgc_in_wire : mgc_hls.mgc_ioport_comps.mgc_in_wire
    GENERIC MAP(
      rscid => 2,
      width => 8
      )
    PORT MAP(
      d => B_rsc_mgc_in_wire_d_1,
      z => B_rsc_mgc_in_wire_z
    );
  B_rsc_mgc_in_wire_d <= B_rsc_mgc_in_wire_d_1;
  B_rsc_mgc_in_wire_z <= B_rsc_z;

  C_rsc_mgc_in_wire : mgc_hls.mgc_ioport_comps.mgc_in_wire
    GENERIC MAP(
      rscid => 3,
      width => 8
      )
    PORT MAP(
      d => C_rsc_mgc_in_wire_d_1,
      z => C_rsc_mgc_in_wire_z
    );
  C_rsc_mgc_in_wire_d <= C_rsc_mgc_in_wire_d_1;
  C_rsc_mgc_in_wire_z <= C_rsc_z;

  D_rsc_mgc_in_wire : mgc_hls.mgc_ioport_comps.mgc_in_wire
    GENERIC MAP(
      rscid => 4,
      width => 8
      )
    PORT MAP(
      d => D_rsc_mgc_in_wire_d_1,
      z => D_rsc_mgc_in_wire_z
    );
  D_rsc_mgc_in_wire_d <= D_rsc_mgc_in_wire_d_1;
  D_rsc_mgc_in_wire_z <= D_rsc_z;

  E_rsc_mgc_in_wire : mgc_hls.mgc_ioport_comps.mgc_in_wire
    GENERIC MAP(
      rscid => 5,
      width => 8
      )
    PORT MAP(
      d => E_rsc_mgc_in_wire_d_1,
      z => E_rsc_mgc_in_wire_z
    );
  E_rsc_mgc_in_wire_d <= E_rsc_mgc_in_wire_d_1;
  E_rsc_mgc_in_wire_z <= E_rsc_z;

  Temp_rsc_mgc_out_stdreg : mgc_hls.mgc_ioport_comps.mgc_out_stdreg
    GENERIC MAP(
      rscid => 6,
      width => 64
      )
    PORT MAP(
      d => Temp_rsc_mgc_out_stdreg_d_1,
      z => Temp_rsc_mgc_out_stdreg_z
    );
  Temp_rsc_mgc_out_stdreg_d_1 <= Temp_rsc_mgc_out_stdreg_d;
  Temp_rsc_z <= Temp_rsc_mgc_out_stdreg_z;

  Adding_core_inst : adding_core
    PORT MAP(
      clk => clk,
      rst => rst,
      A_rsc_mgc_in_wire_d => Adding_core_inst_A_rsc_mgc_in_wire_d,
      B_rsc_mgc_in_wire_d => Adding_core_inst_B_rsc_mgc_in_wire_d,
      C_rsc_mgc_in_wire_d => Adding_core_inst_C_rsc_mgc_in_wire_d,
      D_rsc_mgc_in_wire_d => Adding_core_inst_D_rsc_mgc_in_wire_d,
      E_rsc_mgc_in_wire_d => Adding_core_inst_E_rsc_mgc_in_wire_d,
      Temp_rsc_mgc_out_stdreg_d => Adding_core_inst_Temp_rsc_mgc_out_stdreg_d
    );
  Adding_core_inst_A_rsc_mgc_in_wire_d <= A_rsc_mgc_in_wire_d;
  Adding_core_inst_B_rsc_mgc_in_wire_d <= B_rsc_mgc_in_wire_d;
  Adding_core_inst_C_rsc_mgc_in_wire_d <= C_rsc_mgc_in_wire_d;
  Adding_core_inst_D_rsc_mgc_in_wire_d <= D_rsc_mgc_in_wire_d;
  Adding_core_inst_E_rsc_mgc_in_wire_d <= E_rsc_mgc_in_wire_d;
  Temp_rsc_mgc_out_stdreg_d <= Adding_core_inst_Temp_rsc_mgc_out_stdreg_d;

END v6;



