-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 19.1 (Release Build #670)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2019 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from fir_filt_rtl_core
-- VHDL created on Sun Nov 16 14:36:16 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity fir_filt_rtl_core is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- sfix1
        xIn_c : in std_logic_vector(7 downto 0);  -- sfix8
        xIn_0 : in std_logic_vector(15 downto 0);  -- sfix16
        xOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        xOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        xOut_0 : out std_logic_vector(29 downto 0);  -- sfix30
        clk : in std_logic;
        areset : in std_logic
    );
end fir_filt_rtl_core;

architecture normal of fir_filt_rtl_core is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_in0_m0_wi0_wo0_assign_id1_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_count : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_run_preEnaQ : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_out : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_enableQ : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_ctrl : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_memread_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_compute_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_20_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_21_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_22_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_count0_lutreg_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_count0_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_count0_i : UNSIGNED (2 downto 0);
    attribute preserve : boolean;
    attribute preserve of u0_m0_wo0_wi0_r0_ra0_count0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_ra0_count0_eq : std_logic;
    attribute preserve of u0_m0_wo0_wi0_r0_ra0_count0_eq : signal is true;
    signal u0_m0_wo0_wi0_r0_wa0_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_wa0_i : UNSIGNED (1 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_wa0_eq : std_logic;
    attribute preserve of u0_m0_wo0_wi0_r0_wa0_eq : signal is true;
    signal u0_m0_wo0_wi0_r0_memr0_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr0_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_memr0_q_16_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr1_q_15_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr2_q_15_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr3_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr4_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr5_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr6_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr7_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr8_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr9_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr10_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr12_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr13_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr14_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr15_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr17_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr18_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_ca18_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_ca18_i : UNSIGNED (0 downto 0);
    attribute preserve of u0_m0_wo0_ca18_i : signal is true;
    signal d_u0_m0_wo0_ca18_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_ca18_q_15_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm4_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm5_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm6_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm7_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm8_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm9_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm10_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm11_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm12_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm13_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm14_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm15_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm16_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm17_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm18_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_18_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_18_q_19_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_18_q_20_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_17_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_17_q_18_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_17_q_19_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_16_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_16_q_18_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_16_q_19_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_15_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_15_q_16_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_15_q_17_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_14_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_14_q_16_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_14_q_17_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_13_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_13_q_16_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_13_q_17_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_12_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_12_q_16_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_12_q_17_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_11_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_11_q_16_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_11_q_17_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_10_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_10_q_16_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_10_q_17_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_9_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_9_q_16_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_9_q_17_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_8_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_8_q_16_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_8_q_17_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_7_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_7_q_16_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_7_q_17_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_6_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_6_q_16_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_6_q_17_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_5_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_5_q_16_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_5_q_17_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_4_q_16_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_4_q_17_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_3_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_3_q_16_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_3_q_17_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_2_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_2_q_16_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_2_q_17_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_1_q_16_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_1_q_17_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_b0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_0_q_16_q : STD_LOGIC_VECTOR (23 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_0_q_17_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_aseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_aseq_eq : std_logic;
    signal d_u0_m0_wo0_aseq_q_21_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_aseq_q_22_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_eq : std_logic;
    signal u0_m0_wo0_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_0_p1_of_3_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_0_p1_of_3_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_0_p1_of_3_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_0_p1_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_0_p1_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_0_p2_of_3_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_0_p2_of_3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_0_p2_of_3_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_0_p2_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_0_p2_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_0_p2_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_0_p3_of_3_a : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add0_0_p3_of_3_b : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add0_0_p3_of_3_o : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add0_0_p3_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_0_p3_of_3_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_mtree_add0_1_p1_of_3_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_1_p1_of_3_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_1_p1_of_3_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_1_p1_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_1_p1_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_1_p2_of_3_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_1_p2_of_3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_1_p2_of_3_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_1_p2_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_1_p2_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_1_p2_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_1_p3_of_3_a : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add0_1_p3_of_3_b : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add0_1_p3_of_3_o : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add0_1_p3_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_1_p3_of_3_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_mtree_add0_2_p1_of_3_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_2_p1_of_3_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_2_p1_of_3_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_2_p1_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_2_p1_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_2_p2_of_3_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_2_p2_of_3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_2_p2_of_3_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_2_p2_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_2_p2_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_2_p2_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_2_p3_of_3_a : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add0_2_p3_of_3_b : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add0_2_p3_of_3_o : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add0_2_p3_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_2_p3_of_3_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_mtree_add0_3_p1_of_3_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_3_p1_of_3_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_3_p1_of_3_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_3_p1_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_3_p1_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_3_p2_of_3_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_3_p2_of_3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_3_p2_of_3_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_3_p2_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_3_p2_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_3_p2_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_3_p3_of_3_a : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add0_3_p3_of_3_b : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add0_3_p3_of_3_o : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add0_3_p3_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_3_p3_of_3_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_mtree_add0_4_p1_of_3_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_4_p1_of_3_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_4_p1_of_3_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_4_p1_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_4_p1_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_4_p2_of_3_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_4_p2_of_3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_4_p2_of_3_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_4_p2_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_4_p2_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_4_p2_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_4_p3_of_3_a : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add0_4_p3_of_3_b : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add0_4_p3_of_3_o : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add0_4_p3_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_4_p3_of_3_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_mtree_add0_5_p1_of_3_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_5_p1_of_3_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_5_p1_of_3_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_5_p1_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_5_p1_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_5_p2_of_3_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_5_p2_of_3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_5_p2_of_3_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_5_p2_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_5_p2_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_5_p2_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_5_p3_of_3_a : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add0_5_p3_of_3_b : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add0_5_p3_of_3_o : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add0_5_p3_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_5_p3_of_3_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_mtree_add0_6_p1_of_3_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_6_p1_of_3_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_6_p1_of_3_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_6_p1_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_6_p1_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_6_p2_of_3_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_6_p2_of_3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_6_p2_of_3_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_6_p2_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_6_p2_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_6_p2_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_6_p3_of_3_a : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add0_6_p3_of_3_b : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add0_6_p3_of_3_o : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add0_6_p3_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_6_p3_of_3_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_mtree_add0_7_p1_of_3_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_7_p1_of_3_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_7_p1_of_3_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_7_p1_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_7_p1_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_7_p2_of_3_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_7_p2_of_3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_7_p2_of_3_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_7_p2_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_7_p2_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_7_p2_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_7_p3_of_3_a : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add0_7_p3_of_3_b : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add0_7_p3_of_3_o : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add0_7_p3_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_7_p3_of_3_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_mtree_add0_8_p1_of_3_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_8_p1_of_3_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_8_p1_of_3_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_8_p1_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_8_p1_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_8_p2_of_3_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_8_p2_of_3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_8_p2_of_3_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_8_p2_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_8_p2_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_8_p2_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_8_p3_of_3_a : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add0_8_p3_of_3_b : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add0_8_p3_of_3_o : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add0_8_p3_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_8_p3_of_3_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_mtree_add1_0_p1_of_3_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add1_0_p1_of_3_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add1_0_p1_of_3_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add1_0_p1_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add1_0_p1_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add1_0_p2_of_3_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add1_0_p2_of_3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add1_0_p2_of_3_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add1_0_p2_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add1_0_p2_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add1_0_p2_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add1_0_p3_of_3_a : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_mtree_add1_0_p3_of_3_b : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_mtree_add1_0_p3_of_3_o : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_mtree_add1_0_p3_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add1_0_p3_of_3_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_mtree_add1_1_p1_of_3_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add1_1_p1_of_3_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add1_1_p1_of_3_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add1_1_p1_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add1_1_p1_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add1_1_p2_of_3_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add1_1_p2_of_3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add1_1_p2_of_3_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add1_1_p2_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add1_1_p2_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add1_1_p2_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add1_1_p3_of_3_a : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_mtree_add1_1_p3_of_3_b : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_mtree_add1_1_p3_of_3_o : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_mtree_add1_1_p3_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add1_1_p3_of_3_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_mtree_add1_2_p1_of_3_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add1_2_p1_of_3_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add1_2_p1_of_3_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add1_2_p1_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add1_2_p1_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add1_2_p2_of_3_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add1_2_p2_of_3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add1_2_p2_of_3_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add1_2_p2_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add1_2_p2_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add1_2_p2_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add1_2_p3_of_3_a : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_mtree_add1_2_p3_of_3_b : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_mtree_add1_2_p3_of_3_o : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_mtree_add1_2_p3_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add1_2_p3_of_3_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_mtree_add1_3_p1_of_3_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add1_3_p1_of_3_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add1_3_p1_of_3_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add1_3_p1_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add1_3_p1_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add1_3_p2_of_3_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add1_3_p2_of_3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add1_3_p2_of_3_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add1_3_p2_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add1_3_p2_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add1_3_p2_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add1_3_p3_of_3_a : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_mtree_add1_3_p3_of_3_b : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_mtree_add1_3_p3_of_3_o : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_mtree_add1_3_p3_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add1_3_p3_of_3_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_mtree_add1_4_p1_of_3_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add1_4_p1_of_3_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add1_4_p1_of_3_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add1_4_p1_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add1_4_p1_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add1_4_p2_of_3_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add1_4_p2_of_3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add1_4_p2_of_3_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add1_4_p2_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add1_4_p2_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add1_4_p2_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add1_4_p3_of_3_a : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_mtree_add1_4_p3_of_3_b : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_mtree_add1_4_p3_of_3_o : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_mtree_add1_4_p3_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add1_4_p3_of_3_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_mtree_add2_0_p1_of_3_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add2_0_p1_of_3_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add2_0_p1_of_3_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add2_0_p1_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add2_0_p1_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add2_0_p2_of_3_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add2_0_p2_of_3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add2_0_p2_of_3_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add2_0_p2_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add2_0_p2_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add2_0_p2_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add2_0_p3_of_3_a : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_mtree_add2_0_p3_of_3_b : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_mtree_add2_0_p3_of_3_o : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_mtree_add2_0_p3_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add2_0_p3_of_3_q : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add2_1_p1_of_3_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add2_1_p1_of_3_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add2_1_p1_of_3_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add2_1_p1_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add2_1_p1_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add2_1_p2_of_3_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add2_1_p2_of_3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add2_1_p2_of_3_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add2_1_p2_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add2_1_p2_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add2_1_p2_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add2_1_p3_of_3_a : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_mtree_add2_1_p3_of_3_b : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_mtree_add2_1_p3_of_3_o : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_mtree_add2_1_p3_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add2_1_p3_of_3_q : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add3_0_p1_of_3_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add3_0_p1_of_3_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add3_0_p1_of_3_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add3_0_p1_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add3_0_p1_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add3_0_p2_of_3_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add3_0_p2_of_3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add3_0_p2_of_3_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add3_0_p2_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add3_0_p2_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add3_0_p2_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add3_0_p3_of_3_a : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_add3_0_p3_of_3_b : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_add3_0_p3_of_3_o : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_add3_0_p3_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add3_0_p3_of_3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_mtree_add4_0_p1_of_3_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add4_0_p1_of_3_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add4_0_p1_of_3_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add4_0_p1_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add4_0_p1_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add4_0_p2_of_3_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add4_0_p2_of_3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add4_0_p2_of_3_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add4_0_p2_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add4_0_p2_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add4_0_p2_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add4_0_p3_of_3_a : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_add4_0_p3_of_3_b : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_add4_0_p3_of_3_o : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_add4_0_p3_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add4_0_p3_of_3_q : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_accum_p1_of_3_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_accum_p1_of_3_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_accum_p1_of_3_i : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_accum_p1_of_3_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_accum_p1_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_accum_p1_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal d_u0_m0_wo0_accum_p1_of_3_q_23_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_accum_p2_of_3_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_accum_p2_of_3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_accum_p2_of_3_i : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_accum_p2_of_3_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_accum_p2_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_accum_p2_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_accum_p2_of_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal d_u0_m0_wo0_accum_p2_of_3_q_23_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_accum_p3_of_3_a : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_accum_p3_of_3_b : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_accum_p3_of_3_i : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_accum_p3_of_3_o : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_accum_p3_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_accum_p3_of_3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_oseq_gated_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_count0_lut_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_add1_4_BitSelect_for_b_tessel0_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add1_4_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add1_4_BitSelect_for_b_tessel2_0_b : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_add1_4_BitSelect_for_b_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_8_BitSelect_for_b_tessel0_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_8_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_8_BitSelect_for_b_tessel2_0_b : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_add0_8_BitSelect_for_b_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_8_BitSelect_for_a_tessel0_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_8_BitSelect_for_a_tessel1_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_8_BitSelect_for_a_tessel2_0_b : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_add0_8_BitSelect_for_a_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_7_BitSelect_for_b_tessel0_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_7_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_7_BitSelect_for_b_tessel2_0_b : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_add0_7_BitSelect_for_b_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_7_BitSelect_for_a_tessel0_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_7_BitSelect_for_a_tessel1_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_7_BitSelect_for_a_tessel2_0_b : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_add0_7_BitSelect_for_a_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_6_BitSelect_for_b_tessel0_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_6_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_6_BitSelect_for_b_tessel2_0_b : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_add0_6_BitSelect_for_b_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_6_BitSelect_for_a_tessel0_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_6_BitSelect_for_a_tessel1_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_6_BitSelect_for_a_tessel2_0_b : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_add0_6_BitSelect_for_a_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_5_BitSelect_for_b_tessel0_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_5_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_5_BitSelect_for_b_tessel2_0_b : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_add0_5_BitSelect_for_b_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_5_BitSelect_for_a_tessel0_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_5_BitSelect_for_a_tessel1_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_5_BitSelect_for_a_tessel2_0_b : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_add0_5_BitSelect_for_a_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_4_BitSelect_for_b_tessel0_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_4_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_4_BitSelect_for_b_tessel2_0_b : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_add0_4_BitSelect_for_b_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_4_BitSelect_for_a_tessel0_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_4_BitSelect_for_a_tessel1_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_4_BitSelect_for_a_tessel2_0_b : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_add0_4_BitSelect_for_a_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_3_BitSelect_for_b_tessel0_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_3_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_3_BitSelect_for_b_tessel2_0_b : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_add0_3_BitSelect_for_b_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_3_BitSelect_for_a_tessel0_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_3_BitSelect_for_a_tessel1_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_3_BitSelect_for_a_tessel2_0_b : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_add0_3_BitSelect_for_a_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_2_BitSelect_for_b_tessel0_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_2_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_2_BitSelect_for_b_tessel2_0_b : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_add0_2_BitSelect_for_b_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_2_BitSelect_for_a_tessel0_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_2_BitSelect_for_a_tessel1_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_2_BitSelect_for_a_tessel2_0_b : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_add0_2_BitSelect_for_a_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_1_BitSelect_for_b_tessel0_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_1_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_1_BitSelect_for_b_tessel2_0_b : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_add0_1_BitSelect_for_b_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_1_BitSelect_for_a_tessel0_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_1_BitSelect_for_a_tessel1_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_1_BitSelect_for_a_tessel2_0_b : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_add0_1_BitSelect_for_a_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_0_BitSelect_for_b_tessel0_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_0_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_0_BitSelect_for_b_tessel2_0_b : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_add0_0_BitSelect_for_b_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_0_BitSelect_for_a_tessel0_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_0_BitSelect_for_a_tessel1_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_add0_0_BitSelect_for_a_tessel2_0_b : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_add0_0_BitSelect_for_a_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add1_0_BitSelect_for_a_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add1_0_BitSelect_for_a_BitJoin_for_d_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_mtree_add1_0_BitSelect_for_b_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add1_0_BitSelect_for_b_BitJoin_for_d_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_mtree_add1_1_BitSelect_for_a_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add1_1_BitSelect_for_a_BitJoin_for_d_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_mtree_add1_1_BitSelect_for_b_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add1_1_BitSelect_for_b_BitJoin_for_d_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_mtree_add1_2_BitSelect_for_a_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add1_2_BitSelect_for_a_BitJoin_for_d_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_mtree_add1_2_BitSelect_for_b_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add1_2_BitSelect_for_b_BitJoin_for_d_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_mtree_add1_3_BitSelect_for_a_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add1_3_BitSelect_for_a_BitJoin_for_d_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_mtree_add1_3_BitSelect_for_b_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add1_3_BitSelect_for_b_BitJoin_for_d_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_mtree_add1_4_BitSelect_for_a_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add1_4_BitSelect_for_a_BitJoin_for_d_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_mtree_add2_0_BitSelect_for_a_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add2_0_BitSelect_for_a_BitJoin_for_d_q : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add2_0_BitSelect_for_b_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add2_0_BitSelect_for_b_BitJoin_for_d_q : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add2_1_BitSelect_for_a_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add2_1_BitSelect_for_a_BitJoin_for_d_q : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add2_1_BitSelect_for_b_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add2_1_BitSelect_for_b_BitJoin_for_d_q : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add4_0_BitSelect_for_b_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add4_0_BitSelect_for_b_BitJoin_for_d_q : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_mtree_add3_0_BitSelect_for_a_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add3_0_BitSelect_for_a_BitJoin_for_d_q : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_mtree_add3_0_BitSelect_for_b_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add3_0_BitSelect_for_b_BitJoin_for_d_q : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_mtree_add4_0_BitSelect_for_a_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add4_0_BitSelect_for_a_BitJoin_for_d_q : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_accum_BitSelect_for_a_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_accum_BitSelect_for_a_BitJoin_for_d_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_accum_BitJoin_for_q_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add1_4_BitSelect_for_b_BitJoin_for_d_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_mtree_add0_8_BitSelect_for_b_BitJoin_for_d_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_mtree_add0_8_BitSelect_for_a_BitJoin_for_d_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_mtree_add0_7_BitSelect_for_b_BitJoin_for_d_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_mtree_add0_7_BitSelect_for_a_BitJoin_for_d_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_mtree_add0_6_BitSelect_for_b_BitJoin_for_d_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_mtree_add0_6_BitSelect_for_a_BitJoin_for_d_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_mtree_add0_5_BitSelect_for_b_BitJoin_for_d_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_mtree_add0_5_BitSelect_for_a_BitJoin_for_d_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_mtree_add0_4_BitSelect_for_b_BitJoin_for_d_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_mtree_add0_4_BitSelect_for_a_BitJoin_for_d_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_mtree_add0_3_BitSelect_for_b_BitJoin_for_d_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_mtree_add0_3_BitSelect_for_a_BitJoin_for_d_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_mtree_add0_2_BitSelect_for_b_BitJoin_for_d_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_mtree_add0_2_BitSelect_for_a_BitJoin_for_d_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_mtree_add0_1_BitSelect_for_b_BitJoin_for_d_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_mtree_add0_1_BitSelect_for_a_BitJoin_for_d_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_mtree_add0_0_BitSelect_for_b_BitJoin_for_d_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_mtree_add0_0_BitSelect_for_a_BitJoin_for_d_q : STD_LOGIC_VECTOR (2 downto 0);

begin


    -- VCC(CONSTANT,1)@0
    VCC_q <= "1";

    -- u0_m0_wo0_run(ENABLEGENERATOR,13)@10 + 2
    u0_m0_wo0_run_ctrl <= u0_m0_wo0_run_out & xIn_v & u0_m0_wo0_run_enableQ;
    u0_m0_wo0_run_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_run_enable_c : SIGNED(0 downto 0);
        variable u0_m0_wo0_run_inc : SIGNED(1 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_run_q <= "0";
            u0_m0_wo0_run_enable_c := TO_SIGNED(0, 1);
            u0_m0_wo0_run_enableQ <= "0";
            u0_m0_wo0_run_count <= "00";
            u0_m0_wo0_run_inc := (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_run_out = "1") THEN
                IF (u0_m0_wo0_run_enable_c(0) = '1') THEN
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c - (-1);
                ELSE
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c + (-1);
                END IF;
                u0_m0_wo0_run_enableQ <= STD_LOGIC_VECTOR(u0_m0_wo0_run_enable_c(0 downto 0));
            ELSE
                u0_m0_wo0_run_enableQ <= "0";
            END IF;
            CASE (u0_m0_wo0_run_ctrl) IS
                WHEN "000" | "001" => u0_m0_wo0_run_inc := "00";
                WHEN "010" | "011" => u0_m0_wo0_run_inc := "11";
                WHEN "100" => u0_m0_wo0_run_inc := "00";
                WHEN "101" => u0_m0_wo0_run_inc := "01";
                WHEN "110" => u0_m0_wo0_run_inc := "11";
                WHEN "111" => u0_m0_wo0_run_inc := "00";
                WHEN OTHERS => 
            END CASE;
            u0_m0_wo0_run_count <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_run_count) + SIGNED(u0_m0_wo0_run_inc));
            u0_m0_wo0_run_q <= u0_m0_wo0_run_out;
        END IF;
    END PROCESS;
    u0_m0_wo0_run_preEnaQ <= u0_m0_wo0_run_count(1 downto 1);
    u0_m0_wo0_run_out <= u0_m0_wo0_run_preEnaQ and VCC_q;

    -- u0_m0_wo0_memread(DELAY,14)@12
    u0_m0_wo0_memread : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_run_q, xout => u0_m0_wo0_memread_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_compute(DELAY,16)@12
    u0_m0_wo0_compute : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_memread_q, xout => u0_m0_wo0_compute_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_13(DELAY,619)@12 + 1
    d_u0_m0_wo0_compute_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_compute_q, xout => d_u0_m0_wo0_compute_q_13_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_19(DELAY,620)@13 + 6
    d_u0_m0_wo0_compute_q_19 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_13_q, xout => d_u0_m0_wo0_compute_q_19_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_aseq(SEQUENCE,102)@19 + 1
    u0_m0_wo0_aseq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_aseq_c : SIGNED(3 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_aseq_c := "0000";
            u0_m0_wo0_aseq_q <= "0";
            u0_m0_wo0_aseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_19_q = "1") THEN
                IF (u0_m0_wo0_aseq_c = "0000") THEN
                    u0_m0_wo0_aseq_eq <= '1';
                ELSE
                    u0_m0_wo0_aseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_aseq_eq = '1') THEN
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c + 1;
                ELSE
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c - 1;
                END IF;
                u0_m0_wo0_aseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_aseq_c(3 downto 3));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_compute_q_20(DELAY,621)@19 + 1
    d_u0_m0_wo0_compute_q_20 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_19_q, xout => d_u0_m0_wo0_compute_q_20_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_memread_q_13(DELAY,618)@12 + 1
    d_u0_m0_wo0_memread_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_memread_q, xout => d_u0_m0_wo0_memread_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_ra0_count0(COUNTER,21)@13
    -- low=0, high=5, step=1, init=1
    u0_m0_wo0_wi0_r0_ra0_count0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra0_count0_i <= TO_UNSIGNED(1, 3);
            u0_m0_wo0_wi0_r0_ra0_count0_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_ra0_count0_i = TO_UNSIGNED(4, 3)) THEN
                    u0_m0_wo0_wi0_r0_ra0_count0_eq <= '1';
                ELSE
                    u0_m0_wo0_wi0_r0_ra0_count0_eq <= '0';
                END IF;
                IF (u0_m0_wo0_wi0_r0_ra0_count0_eq = '1') THEN
                    u0_m0_wo0_wi0_r0_ra0_count0_i <= u0_m0_wo0_wi0_r0_ra0_count0_i + 3;
                ELSE
                    u0_m0_wo0_wi0_r0_ra0_count0_i <= u0_m0_wo0_wi0_r0_ra0_count0_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra0_count0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra0_count0_i, 3)));

    -- u0_m0_wo0_wi0_r0_ra0_count0_lut(LOOKUP,19)@13
    u0_m0_wo0_wi0_r0_ra0_count0_lut_combproc: PROCESS (u0_m0_wo0_wi0_r0_ra0_count0_q)
    BEGIN
        -- Begin reserved scope level
        CASE (u0_m0_wo0_wi0_r0_ra0_count0_q) IS
            WHEN "000" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "00";
            WHEN "001" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "01";
            WHEN "010" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "01";
            WHEN "011" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "10";
            WHEN "100" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "10";
            WHEN "101" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "00";
            WHEN OTHERS => -- unreachable
                           u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra0_count0_lutreg(REG,20)@13
    u0_m0_wo0_wi0_r0_ra0_count0_lutreg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra0_count0_lutreg_q <= "00";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra0_count0_lutreg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra0_count0_lut_q);
            END IF;
        END IF;
    END PROCESS;

    -- d_xIn_0_13(DELAY,616)@10 + 3
    d_xIn_0_13 : dspba_delay
    GENERIC MAP ( width => 16, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_0, xout => d_xIn_0_13_q, clk => clk, aclr => areset );

    -- d_in0_m0_wi0_wo0_assign_id1_q_13(DELAY,617)@10 + 3
    d_in0_m0_wi0_wo0_assign_id1_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_v, xout => d_in0_m0_wi0_wo0_assign_id1_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_wa0(COUNTER,22)@13
    -- low=0, high=2, step=1, init=1
    u0_m0_wo0_wi0_r0_wa0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa0_i <= TO_UNSIGNED(1, 2);
            u0_m0_wo0_wi0_r0_wa0_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_id1_q_13_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_wa0_i = TO_UNSIGNED(1, 2)) THEN
                    u0_m0_wo0_wi0_r0_wa0_eq <= '1';
                ELSE
                    u0_m0_wo0_wi0_r0_wa0_eq <= '0';
                END IF;
                IF (u0_m0_wo0_wi0_r0_wa0_eq = '1') THEN
                    u0_m0_wo0_wi0_r0_wa0_i <= u0_m0_wo0_wi0_r0_wa0_i + 2;
                ELSE
                    u0_m0_wo0_wi0_r0_wa0_i <= u0_m0_wo0_wi0_r0_wa0_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa0_i, 2)));

    -- u0_m0_wo0_wi0_r0_memr0(DUALMEM,23)@13
    u0_m0_wo0_wi0_r0_memr0_ia <= STD_LOGIC_VECTOR(d_xIn_0_13_q);
    u0_m0_wo0_wi0_r0_memr0_aa <= u0_m0_wo0_wi0_r0_wa0_q;
    u0_m0_wo0_wi0_r0_memr0_ab <= u0_m0_wo0_wi0_r0_ra0_count0_lutreg_q;
    u0_m0_wo0_wi0_r0_memr0_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 16,
        widthad_b => 2,
        numwords_b => 3,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr0_aa,
        data_a => u0_m0_wo0_wi0_r0_memr0_ia,
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_13_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr0_ab,
        q_b => u0_m0_wo0_wi0_r0_memr0_iq
    );
    u0_m0_wo0_wi0_r0_memr0_q <= u0_m0_wo0_wi0_r0_memr0_iq(15 downto 0);

    -- d_u0_m0_wo0_wi0_r0_memr0_q_16(DELAY,624)@13 + 3
    d_u0_m0_wo0_wi0_r0_memr0_q_16 : dspba_delay
    GENERIC MAP ( width => 16, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_memr0_q, xout => d_u0_m0_wo0_wi0_r0_memr0_q_16_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_ca18(COUNTER,42)@12
    -- low=0, high=1, step=1, init=0
    u0_m0_wo0_ca18_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_ca18_i <= TO_UNSIGNED(0, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                u0_m0_wo0_ca18_i <= u0_m0_wo0_ca18_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_ca18_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_ca18_i, 1)));

    -- d_u0_m0_wo0_ca18_q_14(DELAY,627)@12 + 2
    d_u0_m0_wo0_ca18_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_ca18_q, xout => d_u0_m0_wo0_ca18_q_14_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_ca18_q_15(DELAY,628)@14 + 1
    d_u0_m0_wo0_ca18_q_15 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_ca18_q_14_q, xout => d_u0_m0_wo0_ca18_q_15_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_cm0(LOOKUP,46)@15 + 1
    u0_m0_wo0_cm0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm0_q <= "00000110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (d_u0_m0_wo0_ca18_q_15_q) IS
                WHEN "0" => u0_m0_wo0_cm0_q <= "00000110";
                WHEN "1" => u0_m0_wo0_cm0_q <= "00001000";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm0_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_18(MULT,65)@16 + 2
    u0_m0_wo0_mtree_mult1_18_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm0_q);
    u0_m0_wo0_mtree_mult1_18_b0 <= STD_LOGIC_VECTOR(d_u0_m0_wo0_wi0_r0_memr0_q_16_q);
    u0_m0_wo0_mtree_mult1_18_reset <= areset;
    u0_m0_wo0_mtree_mult1_18_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 16,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_18_a0,
        datab => u0_m0_wo0_mtree_mult1_18_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_18_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_18_s1
    );
    u0_m0_wo0_mtree_mult1_18_q <= u0_m0_wo0_mtree_mult1_18_s1;

    -- u0_m0_wo0_mtree_add1_4_BitSelect_for_b_tessel0_0(BITSELECT,530)@18
    u0_m0_wo0_mtree_add1_4_BitSelect_for_b_tessel0_0_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_18_q(10 downto 0));

    -- u0_m0_wo0_wi0_r0_delayr1(DELAY,24)@13
    u0_m0_wo0_wi0_r0_delayr1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_memr0_q, xout => u0_m0_wo0_wi0_r0_delayr1_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr1_q_15(DELAY,625)@13 + 2
    d_u0_m0_wo0_wi0_r0_delayr1_q_15 : dspba_delay
    GENERIC MAP ( width => 16, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr1_q, xout => d_u0_m0_wo0_wi0_r0_delayr1_q_15_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_cm1(LOOKUP,47)@14 + 1
    u0_m0_wo0_cm1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm1_q <= "11111001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (d_u0_m0_wo0_ca18_q_14_q) IS
                WHEN "0" => u0_m0_wo0_cm1_q <= "11111001";
                WHEN "1" => u0_m0_wo0_cm1_q <= "00000000";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm1_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_17(MULT,66)@15 + 2
    u0_m0_wo0_mtree_mult1_17_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm1_q);
    u0_m0_wo0_mtree_mult1_17_b0 <= STD_LOGIC_VECTOR(d_u0_m0_wo0_wi0_r0_delayr1_q_15_q);
    u0_m0_wo0_mtree_mult1_17_reset <= areset;
    u0_m0_wo0_mtree_mult1_17_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 16,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_17_a0,
        datab => u0_m0_wo0_mtree_mult1_17_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_17_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_17_s1
    );
    u0_m0_wo0_mtree_mult1_17_q <= u0_m0_wo0_mtree_mult1_17_s1;

    -- u0_m0_wo0_mtree_add0_8_BitSelect_for_b_tessel0_0(BITSELECT,460)@17
    u0_m0_wo0_mtree_add0_8_BitSelect_for_b_tessel0_0_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_17_q(10 downto 0));

    -- u0_m0_wo0_wi0_r0_delayr2(DELAY,25)@13
    u0_m0_wo0_wi0_r0_delayr2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr1_q, xout => u0_m0_wo0_wi0_r0_delayr2_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr2_q_15(DELAY,626)@13 + 2
    d_u0_m0_wo0_wi0_r0_delayr2_q_15 : dspba_delay
    GENERIC MAP ( width => 16, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr2_q, xout => d_u0_m0_wo0_wi0_r0_delayr2_q_15_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_cm2(LOOKUP,48)@14 + 1
    u0_m0_wo0_cm2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm2_q <= "11111000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (d_u0_m0_wo0_ca18_q_14_q) IS
                WHEN "0" => u0_m0_wo0_cm2_q <= "11111000";
                WHEN "1" => u0_m0_wo0_cm2_q <= "11110101";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm2_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_16(MULT,67)@15 + 2
    u0_m0_wo0_mtree_mult1_16_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm2_q);
    u0_m0_wo0_mtree_mult1_16_b0 <= STD_LOGIC_VECTOR(d_u0_m0_wo0_wi0_r0_delayr2_q_15_q);
    u0_m0_wo0_mtree_mult1_16_reset <= areset;
    u0_m0_wo0_mtree_mult1_16_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 16,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_16_a0,
        datab => u0_m0_wo0_mtree_mult1_16_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_16_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_16_s1
    );
    u0_m0_wo0_mtree_mult1_16_q <= u0_m0_wo0_mtree_mult1_16_s1;

    -- u0_m0_wo0_mtree_add0_8_BitSelect_for_a_tessel0_0(BITSELECT,453)@17
    u0_m0_wo0_mtree_add0_8_BitSelect_for_a_tessel0_0_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_16_q(10 downto 0));

    -- u0_m0_wo0_mtree_add0_8_p1_of_3(ADD,216)@17 + 1
    u0_m0_wo0_mtree_add0_8_p1_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_8_BitSelect_for_a_tessel0_0_b);
    u0_m0_wo0_mtree_add0_8_p1_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_8_BitSelect_for_b_tessel0_0_b);
    u0_m0_wo0_mtree_add0_8_p1_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_8_p1_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_8_p1_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add0_8_p1_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add0_8_p1_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_8_p1_of_3_c(0) <= u0_m0_wo0_mtree_add0_8_p1_of_3_o(11);
    u0_m0_wo0_mtree_add0_8_p1_of_3_q <= u0_m0_wo0_mtree_add0_8_p1_of_3_o(10 downto 0);

    -- u0_m0_wo0_mtree_add1_4_p1_of_3(ADD,276)@18 + 1
    u0_m0_wo0_mtree_add1_4_p1_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_8_p1_of_3_q);
    u0_m0_wo0_mtree_add1_4_p1_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add1_4_BitSelect_for_b_tessel0_0_b);
    u0_m0_wo0_mtree_add1_4_p1_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_4_p1_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_4_p1_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add1_4_p1_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add1_4_p1_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_4_p1_of_3_c(0) <= u0_m0_wo0_mtree_add1_4_p1_of_3_o(11);
    u0_m0_wo0_mtree_add1_4_p1_of_3_q <= u0_m0_wo0_mtree_add1_4_p1_of_3_o(10 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr3(DELAY,26)@13
    u0_m0_wo0_wi0_r0_delayr3 : dspba_delay
    GENERIC MAP ( width => 16, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr2_q, xout => u0_m0_wo0_wi0_r0_delayr3_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm3(LOOKUP,49)@12 + 1
    u0_m0_wo0_cm3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm3_q <= "00001010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca18_q) IS
                WHEN "0" => u0_m0_wo0_cm3_q <= "00001010";
                WHEN "1" => u0_m0_wo0_cm3_q <= "00000000";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm3_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_15(MULT,68)@13 + 2
    u0_m0_wo0_mtree_mult1_15_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm3_q);
    u0_m0_wo0_mtree_mult1_15_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr3_q);
    u0_m0_wo0_mtree_mult1_15_reset <= areset;
    u0_m0_wo0_mtree_mult1_15_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 16,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_15_a0,
        datab => u0_m0_wo0_mtree_mult1_15_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_15_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_15_s1
    );
    u0_m0_wo0_mtree_mult1_15_q <= u0_m0_wo0_mtree_mult1_15_s1;

    -- u0_m0_wo0_mtree_add0_7_BitSelect_for_b_tessel0_0(BITSELECT,446)@15
    u0_m0_wo0_mtree_add0_7_BitSelect_for_b_tessel0_0_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_15_q(10 downto 0));

    -- u0_m0_wo0_wi0_r0_delayr4(DELAY,27)@13
    u0_m0_wo0_wi0_r0_delayr4 : dspba_delay
    GENERIC MAP ( width => 16, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr3_q, xout => u0_m0_wo0_wi0_r0_delayr4_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm4(LOOKUP,50)@12 + 1
    u0_m0_wo0_cm4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm4_q <= "00001100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca18_q) IS
                WHEN "0" => u0_m0_wo0_cm4_q <= "00001100";
                WHEN "1" => u0_m0_wo0_cm4_q <= "00010000";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm4_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_14(MULT,69)@13 + 2
    u0_m0_wo0_mtree_mult1_14_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm4_q);
    u0_m0_wo0_mtree_mult1_14_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr4_q);
    u0_m0_wo0_mtree_mult1_14_reset <= areset;
    u0_m0_wo0_mtree_mult1_14_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 16,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_14_a0,
        datab => u0_m0_wo0_mtree_mult1_14_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_14_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_14_s1
    );
    u0_m0_wo0_mtree_mult1_14_q <= u0_m0_wo0_mtree_mult1_14_s1;

    -- u0_m0_wo0_mtree_add0_7_BitSelect_for_a_tessel0_0(BITSELECT,439)@15
    u0_m0_wo0_mtree_add0_7_BitSelect_for_a_tessel0_0_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_14_q(10 downto 0));

    -- u0_m0_wo0_mtree_add0_7_p1_of_3(ADD,204)@15 + 1
    u0_m0_wo0_mtree_add0_7_p1_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_7_BitSelect_for_a_tessel0_0_b);
    u0_m0_wo0_mtree_add0_7_p1_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_7_BitSelect_for_b_tessel0_0_b);
    u0_m0_wo0_mtree_add0_7_p1_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_7_p1_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_7_p1_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add0_7_p1_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add0_7_p1_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_7_p1_of_3_c(0) <= u0_m0_wo0_mtree_add0_7_p1_of_3_o(11);
    u0_m0_wo0_mtree_add0_7_p1_of_3_q <= u0_m0_wo0_mtree_add0_7_p1_of_3_o(10 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr5(DELAY,28)@13
    u0_m0_wo0_wi0_r0_delayr5 : dspba_delay
    GENERIC MAP ( width => 16, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr4_q, xout => u0_m0_wo0_wi0_r0_delayr5_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm5(LOOKUP,51)@12 + 1
    u0_m0_wo0_cm5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm5_q <= "11110000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca18_q) IS
                WHEN "0" => u0_m0_wo0_cm5_q <= "11110000";
                WHEN "1" => u0_m0_wo0_cm5_q <= "00000000";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm5_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_13(MULT,70)@13 + 2
    u0_m0_wo0_mtree_mult1_13_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm5_q);
    u0_m0_wo0_mtree_mult1_13_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr5_q);
    u0_m0_wo0_mtree_mult1_13_reset <= areset;
    u0_m0_wo0_mtree_mult1_13_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 16,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_13_a0,
        datab => u0_m0_wo0_mtree_mult1_13_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_13_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_13_s1
    );
    u0_m0_wo0_mtree_mult1_13_q <= u0_m0_wo0_mtree_mult1_13_s1;

    -- u0_m0_wo0_mtree_add0_6_BitSelect_for_b_tessel0_0(BITSELECT,432)@15
    u0_m0_wo0_mtree_add0_6_BitSelect_for_b_tessel0_0_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_13_q(10 downto 0));

    -- u0_m0_wo0_wi0_r0_delayr6(DELAY,29)@13
    u0_m0_wo0_wi0_r0_delayr6 : dspba_delay
    GENERIC MAP ( width => 16, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr5_q, xout => u0_m0_wo0_wi0_r0_delayr6_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm6(LOOKUP,52)@12 + 1
    u0_m0_wo0_cm6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm6_q <= "11101010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca18_q) IS
                WHEN "0" => u0_m0_wo0_cm6_q <= "11101010";
                WHEN "1" => u0_m0_wo0_cm6_q <= "11100110";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm6_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_12(MULT,71)@13 + 2
    u0_m0_wo0_mtree_mult1_12_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm6_q);
    u0_m0_wo0_mtree_mult1_12_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr6_q);
    u0_m0_wo0_mtree_mult1_12_reset <= areset;
    u0_m0_wo0_mtree_mult1_12_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 16,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_12_a0,
        datab => u0_m0_wo0_mtree_mult1_12_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_12_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_12_s1
    );
    u0_m0_wo0_mtree_mult1_12_q <= u0_m0_wo0_mtree_mult1_12_s1;

    -- u0_m0_wo0_mtree_add0_6_BitSelect_for_a_tessel0_0(BITSELECT,425)@15
    u0_m0_wo0_mtree_add0_6_BitSelect_for_a_tessel0_0_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_12_q(10 downto 0));

    -- u0_m0_wo0_mtree_add0_6_p1_of_3(ADD,192)@15 + 1
    u0_m0_wo0_mtree_add0_6_p1_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_6_BitSelect_for_a_tessel0_0_b);
    u0_m0_wo0_mtree_add0_6_p1_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_6_BitSelect_for_b_tessel0_0_b);
    u0_m0_wo0_mtree_add0_6_p1_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_6_p1_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_6_p1_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add0_6_p1_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add0_6_p1_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_6_p1_of_3_c(0) <= u0_m0_wo0_mtree_add0_6_p1_of_3_o(11);
    u0_m0_wo0_mtree_add0_6_p1_of_3_q <= u0_m0_wo0_mtree_add0_6_p1_of_3_o(10 downto 0);

    -- u0_m0_wo0_mtree_add1_3_p1_of_3(ADD,264)@16 + 1
    u0_m0_wo0_mtree_add1_3_p1_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_6_p1_of_3_q);
    u0_m0_wo0_mtree_add1_3_p1_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_7_p1_of_3_q);
    u0_m0_wo0_mtree_add1_3_p1_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_3_p1_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_3_p1_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add1_3_p1_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add1_3_p1_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_3_p1_of_3_c(0) <= u0_m0_wo0_mtree_add1_3_p1_of_3_o(11);
    u0_m0_wo0_mtree_add1_3_p1_of_3_q <= u0_m0_wo0_mtree_add1_3_p1_of_3_o(10 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr7(DELAY,30)@13
    u0_m0_wo0_wi0_r0_delayr7 : dspba_delay
    GENERIC MAP ( width => 16, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr6_q, xout => u0_m0_wo0_wi0_r0_delayr7_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm7(LOOKUP,53)@12 + 1
    u0_m0_wo0_cm7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm7_q <= "00100110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca18_q) IS
                WHEN "0" => u0_m0_wo0_cm7_q <= "00100110";
                WHEN "1" => u0_m0_wo0_cm7_q <= "00000000";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm7_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_11(MULT,72)@13 + 2
    u0_m0_wo0_mtree_mult1_11_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm7_q);
    u0_m0_wo0_mtree_mult1_11_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr7_q);
    u0_m0_wo0_mtree_mult1_11_reset <= areset;
    u0_m0_wo0_mtree_mult1_11_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 16,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_11_a0,
        datab => u0_m0_wo0_mtree_mult1_11_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_11_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_11_s1
    );
    u0_m0_wo0_mtree_mult1_11_q <= u0_m0_wo0_mtree_mult1_11_s1;

    -- u0_m0_wo0_mtree_add0_5_BitSelect_for_b_tessel0_0(BITSELECT,418)@15
    u0_m0_wo0_mtree_add0_5_BitSelect_for_b_tessel0_0_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_11_q(10 downto 0));

    -- u0_m0_wo0_wi0_r0_delayr8(DELAY,31)@13
    u0_m0_wo0_wi0_r0_delayr8 : dspba_delay
    GENERIC MAP ( width => 16, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr7_q, xout => u0_m0_wo0_wi0_r0_delayr8_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm8(LOOKUP,54)@12 + 1
    u0_m0_wo0_cm8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm8_q <= "01110010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca18_q) IS
                WHEN "0" => u0_m0_wo0_cm8_q <= "01110010";
                WHEN "1" => u0_m0_wo0_cm8_q <= "01010000";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm8_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_10(MULT,73)@13 + 2
    u0_m0_wo0_mtree_mult1_10_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm8_q);
    u0_m0_wo0_mtree_mult1_10_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr8_q);
    u0_m0_wo0_mtree_mult1_10_reset <= areset;
    u0_m0_wo0_mtree_mult1_10_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 16,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_10_a0,
        datab => u0_m0_wo0_mtree_mult1_10_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_10_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_10_s1
    );
    u0_m0_wo0_mtree_mult1_10_q <= u0_m0_wo0_mtree_mult1_10_s1;

    -- u0_m0_wo0_mtree_add0_5_BitSelect_for_a_tessel0_0(BITSELECT,411)@15
    u0_m0_wo0_mtree_add0_5_BitSelect_for_a_tessel0_0_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_10_q(10 downto 0));

    -- u0_m0_wo0_mtree_add0_5_p1_of_3(ADD,180)@15 + 1
    u0_m0_wo0_mtree_add0_5_p1_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_5_BitSelect_for_a_tessel0_0_b);
    u0_m0_wo0_mtree_add0_5_p1_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_5_BitSelect_for_b_tessel0_0_b);
    u0_m0_wo0_mtree_add0_5_p1_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_5_p1_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_5_p1_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add0_5_p1_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add0_5_p1_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_5_p1_of_3_c(0) <= u0_m0_wo0_mtree_add0_5_p1_of_3_o(11);
    u0_m0_wo0_mtree_add0_5_p1_of_3_q <= u0_m0_wo0_mtree_add0_5_p1_of_3_o(10 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr9(DELAY,32)@13
    u0_m0_wo0_wi0_r0_delayr9 : dspba_delay
    GENERIC MAP ( width => 16, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr8_q, xout => u0_m0_wo0_wi0_r0_delayr9_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm9(LOOKUP,55)@12 + 1
    u0_m0_wo0_cm9_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm9_q <= "01110010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca18_q) IS
                WHEN "0" => u0_m0_wo0_cm9_q <= "01110010";
                WHEN "1" => u0_m0_wo0_cm9_q <= "01111111";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm9_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_9(MULT,74)@13 + 2
    u0_m0_wo0_mtree_mult1_9_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm9_q);
    u0_m0_wo0_mtree_mult1_9_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr9_q);
    u0_m0_wo0_mtree_mult1_9_reset <= areset;
    u0_m0_wo0_mtree_mult1_9_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 16,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_9_a0,
        datab => u0_m0_wo0_mtree_mult1_9_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_9_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_9_s1
    );
    u0_m0_wo0_mtree_mult1_9_q <= u0_m0_wo0_mtree_mult1_9_s1;

    -- u0_m0_wo0_mtree_add0_4_BitSelect_for_b_tessel0_0(BITSELECT,404)@15
    u0_m0_wo0_mtree_add0_4_BitSelect_for_b_tessel0_0_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_9_q(10 downto 0));

    -- u0_m0_wo0_wi0_r0_delayr10(DELAY,33)@13
    u0_m0_wo0_wi0_r0_delayr10 : dspba_delay
    GENERIC MAP ( width => 16, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr9_q, xout => u0_m0_wo0_wi0_r0_delayr10_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm10(LOOKUP,56)@12 + 1
    u0_m0_wo0_cm10_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm10_q <= "00100110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca18_q) IS
                WHEN "0" => u0_m0_wo0_cm10_q <= "00100110";
                WHEN "1" => u0_m0_wo0_cm10_q <= "01010000";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm10_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_8(MULT,75)@13 + 2
    u0_m0_wo0_mtree_mult1_8_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm10_q);
    u0_m0_wo0_mtree_mult1_8_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr10_q);
    u0_m0_wo0_mtree_mult1_8_reset <= areset;
    u0_m0_wo0_mtree_mult1_8_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 16,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_8_a0,
        datab => u0_m0_wo0_mtree_mult1_8_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_8_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_8_s1
    );
    u0_m0_wo0_mtree_mult1_8_q <= u0_m0_wo0_mtree_mult1_8_s1;

    -- u0_m0_wo0_mtree_add0_4_BitSelect_for_a_tessel0_0(BITSELECT,397)@15
    u0_m0_wo0_mtree_add0_4_BitSelect_for_a_tessel0_0_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_8_q(10 downto 0));

    -- u0_m0_wo0_mtree_add0_4_p1_of_3(ADD,168)@15 + 1
    u0_m0_wo0_mtree_add0_4_p1_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_4_BitSelect_for_a_tessel0_0_b);
    u0_m0_wo0_mtree_add0_4_p1_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_4_BitSelect_for_b_tessel0_0_b);
    u0_m0_wo0_mtree_add0_4_p1_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_4_p1_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_4_p1_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add0_4_p1_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add0_4_p1_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_4_p1_of_3_c(0) <= u0_m0_wo0_mtree_add0_4_p1_of_3_o(11);
    u0_m0_wo0_mtree_add0_4_p1_of_3_q <= u0_m0_wo0_mtree_add0_4_p1_of_3_o(10 downto 0);

    -- u0_m0_wo0_mtree_add1_2_p1_of_3(ADD,252)@16 + 1
    u0_m0_wo0_mtree_add1_2_p1_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_4_p1_of_3_q);
    u0_m0_wo0_mtree_add1_2_p1_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_5_p1_of_3_q);
    u0_m0_wo0_mtree_add1_2_p1_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_2_p1_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_2_p1_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add1_2_p1_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add1_2_p1_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_2_p1_of_3_c(0) <= u0_m0_wo0_mtree_add1_2_p1_of_3_o(11);
    u0_m0_wo0_mtree_add1_2_p1_of_3_q <= u0_m0_wo0_mtree_add1_2_p1_of_3_o(10 downto 0);

    -- u0_m0_wo0_mtree_add2_1_p1_of_3(ADD,300)@17 + 1
    u0_m0_wo0_mtree_add2_1_p1_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add1_2_p1_of_3_q);
    u0_m0_wo0_mtree_add2_1_p1_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add1_3_p1_of_3_q);
    u0_m0_wo0_mtree_add2_1_p1_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_1_p1_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_1_p1_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add2_1_p1_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add2_1_p1_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_1_p1_of_3_c(0) <= u0_m0_wo0_mtree_add2_1_p1_of_3_o(11);
    u0_m0_wo0_mtree_add2_1_p1_of_3_q <= u0_m0_wo0_mtree_add2_1_p1_of_3_o(10 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr11(DELAY,34)@13
    u0_m0_wo0_wi0_r0_delayr11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr10_q, xout => u0_m0_wo0_wi0_r0_delayr11_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm11(LOOKUP,57)@12 + 1
    u0_m0_wo0_cm11_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm11_q <= "11101010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca18_q) IS
                WHEN "0" => u0_m0_wo0_cm11_q <= "11101010";
                WHEN "1" => u0_m0_wo0_cm11_q <= "00000000";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm11_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_7(MULT,76)@13 + 2
    u0_m0_wo0_mtree_mult1_7_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm11_q);
    u0_m0_wo0_mtree_mult1_7_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr11_q);
    u0_m0_wo0_mtree_mult1_7_reset <= areset;
    u0_m0_wo0_mtree_mult1_7_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 16,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_7_a0,
        datab => u0_m0_wo0_mtree_mult1_7_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_7_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_7_s1
    );
    u0_m0_wo0_mtree_mult1_7_q <= u0_m0_wo0_mtree_mult1_7_s1;

    -- u0_m0_wo0_mtree_add0_3_BitSelect_for_b_tessel0_0(BITSELECT,390)@15
    u0_m0_wo0_mtree_add0_3_BitSelect_for_b_tessel0_0_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_7_q(10 downto 0));

    -- u0_m0_wo0_wi0_r0_delayr12(DELAY,35)@13
    u0_m0_wo0_wi0_r0_delayr12 : dspba_delay
    GENERIC MAP ( width => 16, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr11_q, xout => u0_m0_wo0_wi0_r0_delayr12_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm12(LOOKUP,58)@12 + 1
    u0_m0_wo0_cm12_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm12_q <= "11110000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca18_q) IS
                WHEN "0" => u0_m0_wo0_cm12_q <= "11110000";
                WHEN "1" => u0_m0_wo0_cm12_q <= "11100110";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm12_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_6(MULT,77)@13 + 2
    u0_m0_wo0_mtree_mult1_6_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm12_q);
    u0_m0_wo0_mtree_mult1_6_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr12_q);
    u0_m0_wo0_mtree_mult1_6_reset <= areset;
    u0_m0_wo0_mtree_mult1_6_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 16,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_6_a0,
        datab => u0_m0_wo0_mtree_mult1_6_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_6_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_6_s1
    );
    u0_m0_wo0_mtree_mult1_6_q <= u0_m0_wo0_mtree_mult1_6_s1;

    -- u0_m0_wo0_mtree_add0_3_BitSelect_for_a_tessel0_0(BITSELECT,383)@15
    u0_m0_wo0_mtree_add0_3_BitSelect_for_a_tessel0_0_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_6_q(10 downto 0));

    -- u0_m0_wo0_mtree_add0_3_p1_of_3(ADD,156)@15 + 1
    u0_m0_wo0_mtree_add0_3_p1_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_3_BitSelect_for_a_tessel0_0_b);
    u0_m0_wo0_mtree_add0_3_p1_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_3_BitSelect_for_b_tessel0_0_b);
    u0_m0_wo0_mtree_add0_3_p1_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_3_p1_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_3_p1_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add0_3_p1_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add0_3_p1_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_3_p1_of_3_c(0) <= u0_m0_wo0_mtree_add0_3_p1_of_3_o(11);
    u0_m0_wo0_mtree_add0_3_p1_of_3_q <= u0_m0_wo0_mtree_add0_3_p1_of_3_o(10 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr13(DELAY,36)@13
    u0_m0_wo0_wi0_r0_delayr13 : dspba_delay
    GENERIC MAP ( width => 16, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr12_q, xout => u0_m0_wo0_wi0_r0_delayr13_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm13(LOOKUP,59)@12 + 1
    u0_m0_wo0_cm13_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm13_q <= "00001100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca18_q) IS
                WHEN "0" => u0_m0_wo0_cm13_q <= "00001100";
                WHEN "1" => u0_m0_wo0_cm13_q <= "00000000";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm13_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_5(MULT,78)@13 + 2
    u0_m0_wo0_mtree_mult1_5_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm13_q);
    u0_m0_wo0_mtree_mult1_5_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr13_q);
    u0_m0_wo0_mtree_mult1_5_reset <= areset;
    u0_m0_wo0_mtree_mult1_5_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 16,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_5_a0,
        datab => u0_m0_wo0_mtree_mult1_5_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_5_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_5_s1
    );
    u0_m0_wo0_mtree_mult1_5_q <= u0_m0_wo0_mtree_mult1_5_s1;

    -- u0_m0_wo0_mtree_add0_2_BitSelect_for_b_tessel0_0(BITSELECT,376)@15
    u0_m0_wo0_mtree_add0_2_BitSelect_for_b_tessel0_0_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_5_q(10 downto 0));

    -- u0_m0_wo0_wi0_r0_delayr14(DELAY,37)@13
    u0_m0_wo0_wi0_r0_delayr14 : dspba_delay
    GENERIC MAP ( width => 16, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr13_q, xout => u0_m0_wo0_wi0_r0_delayr14_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm14(LOOKUP,60)@12 + 1
    u0_m0_wo0_cm14_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm14_q <= "00001010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca18_q) IS
                WHEN "0" => u0_m0_wo0_cm14_q <= "00001010";
                WHEN "1" => u0_m0_wo0_cm14_q <= "00010000";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm14_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_4(MULT,79)@13 + 2
    u0_m0_wo0_mtree_mult1_4_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm14_q);
    u0_m0_wo0_mtree_mult1_4_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr14_q);
    u0_m0_wo0_mtree_mult1_4_reset <= areset;
    u0_m0_wo0_mtree_mult1_4_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 16,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_4_a0,
        datab => u0_m0_wo0_mtree_mult1_4_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_4_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_4_s1
    );
    u0_m0_wo0_mtree_mult1_4_q <= u0_m0_wo0_mtree_mult1_4_s1;

    -- u0_m0_wo0_mtree_add0_2_BitSelect_for_a_tessel0_0(BITSELECT,369)@15
    u0_m0_wo0_mtree_add0_2_BitSelect_for_a_tessel0_0_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_4_q(10 downto 0));

    -- u0_m0_wo0_mtree_add0_2_p1_of_3(ADD,144)@15 + 1
    u0_m0_wo0_mtree_add0_2_p1_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_2_BitSelect_for_a_tessel0_0_b);
    u0_m0_wo0_mtree_add0_2_p1_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_2_BitSelect_for_b_tessel0_0_b);
    u0_m0_wo0_mtree_add0_2_p1_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_2_p1_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_2_p1_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add0_2_p1_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add0_2_p1_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_2_p1_of_3_c(0) <= u0_m0_wo0_mtree_add0_2_p1_of_3_o(11);
    u0_m0_wo0_mtree_add0_2_p1_of_3_q <= u0_m0_wo0_mtree_add0_2_p1_of_3_o(10 downto 0);

    -- u0_m0_wo0_mtree_add1_1_p1_of_3(ADD,240)@16 + 1
    u0_m0_wo0_mtree_add1_1_p1_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_2_p1_of_3_q);
    u0_m0_wo0_mtree_add1_1_p1_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_3_p1_of_3_q);
    u0_m0_wo0_mtree_add1_1_p1_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_1_p1_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_1_p1_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add1_1_p1_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add1_1_p1_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_1_p1_of_3_c(0) <= u0_m0_wo0_mtree_add1_1_p1_of_3_o(11);
    u0_m0_wo0_mtree_add1_1_p1_of_3_q <= u0_m0_wo0_mtree_add1_1_p1_of_3_o(10 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr15(DELAY,38)@13
    u0_m0_wo0_wi0_r0_delayr15 : dspba_delay
    GENERIC MAP ( width => 16, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr14_q, xout => u0_m0_wo0_wi0_r0_delayr15_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm15(LOOKUP,61)@12 + 1
    u0_m0_wo0_cm15_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm15_q <= "11111000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca18_q) IS
                WHEN "0" => u0_m0_wo0_cm15_q <= "11111000";
                WHEN "1" => u0_m0_wo0_cm15_q <= "00000000";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm15_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_3(MULT,80)@13 + 2
    u0_m0_wo0_mtree_mult1_3_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm15_q);
    u0_m0_wo0_mtree_mult1_3_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr15_q);
    u0_m0_wo0_mtree_mult1_3_reset <= areset;
    u0_m0_wo0_mtree_mult1_3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 16,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_3_a0,
        datab => u0_m0_wo0_mtree_mult1_3_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_3_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_3_s1
    );
    u0_m0_wo0_mtree_mult1_3_q <= u0_m0_wo0_mtree_mult1_3_s1;

    -- u0_m0_wo0_mtree_add0_1_BitSelect_for_b_tessel0_0(BITSELECT,362)@15
    u0_m0_wo0_mtree_add0_1_BitSelect_for_b_tessel0_0_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_3_q(10 downto 0));

    -- u0_m0_wo0_wi0_r0_delayr16(DELAY,39)@13
    u0_m0_wo0_wi0_r0_delayr16 : dspba_delay
    GENERIC MAP ( width => 16, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr15_q, xout => u0_m0_wo0_wi0_r0_delayr16_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm16(LOOKUP,62)@12 + 1
    u0_m0_wo0_cm16_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm16_q <= "11111001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca18_q) IS
                WHEN "0" => u0_m0_wo0_cm16_q <= "11111001";
                WHEN "1" => u0_m0_wo0_cm16_q <= "11110101";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm16_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_2(MULT,81)@13 + 2
    u0_m0_wo0_mtree_mult1_2_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm16_q);
    u0_m0_wo0_mtree_mult1_2_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr16_q);
    u0_m0_wo0_mtree_mult1_2_reset <= areset;
    u0_m0_wo0_mtree_mult1_2_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 16,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_2_a0,
        datab => u0_m0_wo0_mtree_mult1_2_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_2_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_2_s1
    );
    u0_m0_wo0_mtree_mult1_2_q <= u0_m0_wo0_mtree_mult1_2_s1;

    -- u0_m0_wo0_mtree_add0_1_BitSelect_for_a_tessel0_0(BITSELECT,355)@15
    u0_m0_wo0_mtree_add0_1_BitSelect_for_a_tessel0_0_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_2_q(10 downto 0));

    -- u0_m0_wo0_mtree_add0_1_p1_of_3(ADD,132)@15 + 1
    u0_m0_wo0_mtree_add0_1_p1_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_1_BitSelect_for_a_tessel0_0_b);
    u0_m0_wo0_mtree_add0_1_p1_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_1_BitSelect_for_b_tessel0_0_b);
    u0_m0_wo0_mtree_add0_1_p1_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_1_p1_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_1_p1_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add0_1_p1_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add0_1_p1_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_1_p1_of_3_c(0) <= u0_m0_wo0_mtree_add0_1_p1_of_3_o(11);
    u0_m0_wo0_mtree_add0_1_p1_of_3_q <= u0_m0_wo0_mtree_add0_1_p1_of_3_o(10 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr17(DELAY,40)@13
    u0_m0_wo0_wi0_r0_delayr17 : dspba_delay
    GENERIC MAP ( width => 16, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr16_q, xout => u0_m0_wo0_wi0_r0_delayr17_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm17(LOOKUP,63)@12 + 1
    u0_m0_wo0_cm17_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm17_q <= "00000110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca18_q) IS
                WHEN "0" => u0_m0_wo0_cm17_q <= "00000110";
                WHEN "1" => u0_m0_wo0_cm17_q <= "00000000";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm17_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_1(MULT,82)@13 + 2
    u0_m0_wo0_mtree_mult1_1_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm17_q);
    u0_m0_wo0_mtree_mult1_1_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr17_q);
    u0_m0_wo0_mtree_mult1_1_reset <= areset;
    u0_m0_wo0_mtree_mult1_1_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 16,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_1_a0,
        datab => u0_m0_wo0_mtree_mult1_1_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_1_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_1_s1
    );
    u0_m0_wo0_mtree_mult1_1_q <= u0_m0_wo0_mtree_mult1_1_s1;

    -- u0_m0_wo0_mtree_add0_0_BitSelect_for_b_tessel0_0(BITSELECT,348)@15
    u0_m0_wo0_mtree_add0_0_BitSelect_for_b_tessel0_0_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_1_q(10 downto 0));

    -- u0_m0_wo0_wi0_r0_delayr18(DELAY,41)@13
    u0_m0_wo0_wi0_r0_delayr18 : dspba_delay
    GENERIC MAP ( width => 16, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr17_q, xout => u0_m0_wo0_wi0_r0_delayr18_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm18(LOOKUP,64)@12 + 1
    u0_m0_wo0_cm18_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm18_q <= "00000000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca18_q) IS
                WHEN "0" => u0_m0_wo0_cm18_q <= "00000000";
                WHEN "1" => u0_m0_wo0_cm18_q <= "00001000";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm18_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_0(MULT,83)@13 + 2
    u0_m0_wo0_mtree_mult1_0_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm18_q);
    u0_m0_wo0_mtree_mult1_0_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr18_q);
    u0_m0_wo0_mtree_mult1_0_reset <= areset;
    u0_m0_wo0_mtree_mult1_0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 16,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_0_a0,
        datab => u0_m0_wo0_mtree_mult1_0_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_0_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_0_s1
    );
    u0_m0_wo0_mtree_mult1_0_q <= u0_m0_wo0_mtree_mult1_0_s1;

    -- u0_m0_wo0_mtree_add0_0_BitSelect_for_a_tessel0_0(BITSELECT,341)@15
    u0_m0_wo0_mtree_add0_0_BitSelect_for_a_tessel0_0_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_q(10 downto 0));

    -- u0_m0_wo0_mtree_add0_0_p1_of_3(ADD,120)@15 + 1
    u0_m0_wo0_mtree_add0_0_p1_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_0_BitSelect_for_a_tessel0_0_b);
    u0_m0_wo0_mtree_add0_0_p1_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_0_BitSelect_for_b_tessel0_0_b);
    u0_m0_wo0_mtree_add0_0_p1_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_0_p1_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_0_p1_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add0_0_p1_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add0_0_p1_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_0_p1_of_3_c(0) <= u0_m0_wo0_mtree_add0_0_p1_of_3_o(11);
    u0_m0_wo0_mtree_add0_0_p1_of_3_q <= u0_m0_wo0_mtree_add0_0_p1_of_3_o(10 downto 0);

    -- u0_m0_wo0_mtree_add1_0_p1_of_3(ADD,228)@16 + 1
    u0_m0_wo0_mtree_add1_0_p1_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_0_p1_of_3_q);
    u0_m0_wo0_mtree_add1_0_p1_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_1_p1_of_3_q);
    u0_m0_wo0_mtree_add1_0_p1_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_0_p1_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_0_p1_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add1_0_p1_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add1_0_p1_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_0_p1_of_3_c(0) <= u0_m0_wo0_mtree_add1_0_p1_of_3_o(11);
    u0_m0_wo0_mtree_add1_0_p1_of_3_q <= u0_m0_wo0_mtree_add1_0_p1_of_3_o(10 downto 0);

    -- u0_m0_wo0_mtree_add2_0_p1_of_3(ADD,288)@17 + 1
    u0_m0_wo0_mtree_add2_0_p1_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add1_0_p1_of_3_q);
    u0_m0_wo0_mtree_add2_0_p1_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add1_1_p1_of_3_q);
    u0_m0_wo0_mtree_add2_0_p1_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_0_p1_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_0_p1_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add2_0_p1_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add2_0_p1_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_0_p1_of_3_c(0) <= u0_m0_wo0_mtree_add2_0_p1_of_3_o(11);
    u0_m0_wo0_mtree_add2_0_p1_of_3_q <= u0_m0_wo0_mtree_add2_0_p1_of_3_o(10 downto 0);

    -- u0_m0_wo0_mtree_add3_0_p1_of_3(ADD,312)@18 + 1
    u0_m0_wo0_mtree_add3_0_p1_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add2_0_p1_of_3_q);
    u0_m0_wo0_mtree_add3_0_p1_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add2_1_p1_of_3_q);
    u0_m0_wo0_mtree_add3_0_p1_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add3_0_p1_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add3_0_p1_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add3_0_p1_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add3_0_p1_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add3_0_p1_of_3_c(0) <= u0_m0_wo0_mtree_add3_0_p1_of_3_o(11);
    u0_m0_wo0_mtree_add3_0_p1_of_3_q <= u0_m0_wo0_mtree_add3_0_p1_of_3_o(10 downto 0);

    -- u0_m0_wo0_mtree_add4_0_p1_of_3(ADD,324)@19 + 1
    u0_m0_wo0_mtree_add4_0_p1_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add3_0_p1_of_3_q);
    u0_m0_wo0_mtree_add4_0_p1_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add1_4_p1_of_3_q);
    u0_m0_wo0_mtree_add4_0_p1_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add4_0_p1_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add4_0_p1_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add4_0_p1_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add4_0_p1_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add4_0_p1_of_3_c(0) <= u0_m0_wo0_mtree_add4_0_p1_of_3_o(11);
    u0_m0_wo0_mtree_add4_0_p1_of_3_q <= u0_m0_wo0_mtree_add4_0_p1_of_3_o(10 downto 0);

    -- u0_m0_wo0_accum_p1_of_3(ADD,337)@20 + 1
    u0_m0_wo0_accum_p1_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add4_0_p1_of_3_q);
    u0_m0_wo0_accum_p1_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_accum_p1_of_3_q);
    u0_m0_wo0_accum_p1_of_3_i <= u0_m0_wo0_accum_p1_of_3_a;
    u0_m0_wo0_accum_p1_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_accum_p1_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_20_q = "1") THEN
                IF (u0_m0_wo0_aseq_q = "1") THEN
                    u0_m0_wo0_accum_p1_of_3_o <= u0_m0_wo0_accum_p1_of_3_i;
                ELSE
                    u0_m0_wo0_accum_p1_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_accum_p1_of_3_a) + UNSIGNED(u0_m0_wo0_accum_p1_of_3_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_accum_p1_of_3_c(0) <= u0_m0_wo0_accum_p1_of_3_o(11);
    u0_m0_wo0_accum_p1_of_3_q <= u0_m0_wo0_accum_p1_of_3_o(10 downto 0);

    -- d_u0_m0_wo0_aseq_q_21(DELAY,667)@20 + 1
    d_u0_m0_wo0_aseq_q_21 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_aseq_q, xout => d_u0_m0_wo0_aseq_q_21_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_21(DELAY,622)@20 + 1
    d_u0_m0_wo0_compute_q_21 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_20_q, xout => d_u0_m0_wo0_compute_q_21_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_mtree_mult1_18_q_19(DELAY,629)@18 + 1
    d_u0_m0_wo0_mtree_mult1_18_q_19 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_18_q, xout => d_u0_m0_wo0_mtree_mult1_18_q_19_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add1_4_BitSelect_for_b_tessel1_0(BITSELECT,532)@19
    u0_m0_wo0_mtree_add1_4_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_18_q_19_q(21 downto 11));

    -- d_u0_m0_wo0_mtree_mult1_17_q_18(DELAY,631)@17 + 1
    d_u0_m0_wo0_mtree_mult1_17_q_18 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_17_q, xout => d_u0_m0_wo0_mtree_mult1_17_q_18_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_8_BitSelect_for_b_tessel1_0(BITSELECT,462)@18
    u0_m0_wo0_mtree_add0_8_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_17_q_18_q(21 downto 11));

    -- d_u0_m0_wo0_mtree_mult1_16_q_18(DELAY,633)@17 + 1
    d_u0_m0_wo0_mtree_mult1_16_q_18 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_16_q, xout => d_u0_m0_wo0_mtree_mult1_16_q_18_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_8_BitSelect_for_a_tessel1_0(BITSELECT,455)@18
    u0_m0_wo0_mtree_add0_8_BitSelect_for_a_tessel1_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_16_q_18_q(21 downto 11));

    -- u0_m0_wo0_mtree_add0_8_p2_of_3(ADD,217)@18 + 1
    u0_m0_wo0_mtree_add0_8_p2_of_3_cin <= u0_m0_wo0_mtree_add0_8_p1_of_3_c;
    u0_m0_wo0_mtree_add0_8_p2_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_8_BitSelect_for_a_tessel1_0_b) & '1';
    u0_m0_wo0_mtree_add0_8_p2_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_8_BitSelect_for_b_tessel1_0_b) & u0_m0_wo0_mtree_add0_8_p2_of_3_cin(0);
    u0_m0_wo0_mtree_add0_8_p2_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_8_p2_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_8_p2_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add0_8_p2_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add0_8_p2_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_8_p2_of_3_c(0) <= u0_m0_wo0_mtree_add0_8_p2_of_3_o(12);
    u0_m0_wo0_mtree_add0_8_p2_of_3_q <= u0_m0_wo0_mtree_add0_8_p2_of_3_o(11 downto 1);

    -- u0_m0_wo0_mtree_add1_4_p2_of_3(ADD,277)@19 + 1
    u0_m0_wo0_mtree_add1_4_p2_of_3_cin <= u0_m0_wo0_mtree_add1_4_p1_of_3_c;
    u0_m0_wo0_mtree_add1_4_p2_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_8_p2_of_3_q) & '1';
    u0_m0_wo0_mtree_add1_4_p2_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add1_4_BitSelect_for_b_tessel1_0_b) & u0_m0_wo0_mtree_add1_4_p2_of_3_cin(0);
    u0_m0_wo0_mtree_add1_4_p2_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_4_p2_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_4_p2_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add1_4_p2_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add1_4_p2_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_4_p2_of_3_c(0) <= u0_m0_wo0_mtree_add1_4_p2_of_3_o(12);
    u0_m0_wo0_mtree_add1_4_p2_of_3_q <= u0_m0_wo0_mtree_add1_4_p2_of_3_o(11 downto 1);

    -- d_u0_m0_wo0_mtree_mult1_15_q_16(DELAY,635)@15 + 1
    d_u0_m0_wo0_mtree_mult1_15_q_16 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_15_q, xout => d_u0_m0_wo0_mtree_mult1_15_q_16_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_7_BitSelect_for_b_tessel1_0(BITSELECT,448)@16
    u0_m0_wo0_mtree_add0_7_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_15_q_16_q(21 downto 11));

    -- d_u0_m0_wo0_mtree_mult1_14_q_16(DELAY,637)@15 + 1
    d_u0_m0_wo0_mtree_mult1_14_q_16 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_14_q, xout => d_u0_m0_wo0_mtree_mult1_14_q_16_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_7_BitSelect_for_a_tessel1_0(BITSELECT,441)@16
    u0_m0_wo0_mtree_add0_7_BitSelect_for_a_tessel1_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_14_q_16_q(21 downto 11));

    -- u0_m0_wo0_mtree_add0_7_p2_of_3(ADD,205)@16 + 1
    u0_m0_wo0_mtree_add0_7_p2_of_3_cin <= u0_m0_wo0_mtree_add0_7_p1_of_3_c;
    u0_m0_wo0_mtree_add0_7_p2_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_7_BitSelect_for_a_tessel1_0_b) & '1';
    u0_m0_wo0_mtree_add0_7_p2_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_7_BitSelect_for_b_tessel1_0_b) & u0_m0_wo0_mtree_add0_7_p2_of_3_cin(0);
    u0_m0_wo0_mtree_add0_7_p2_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_7_p2_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_7_p2_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add0_7_p2_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add0_7_p2_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_7_p2_of_3_c(0) <= u0_m0_wo0_mtree_add0_7_p2_of_3_o(12);
    u0_m0_wo0_mtree_add0_7_p2_of_3_q <= u0_m0_wo0_mtree_add0_7_p2_of_3_o(11 downto 1);

    -- d_u0_m0_wo0_mtree_mult1_13_q_16(DELAY,639)@15 + 1
    d_u0_m0_wo0_mtree_mult1_13_q_16 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_13_q, xout => d_u0_m0_wo0_mtree_mult1_13_q_16_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_6_BitSelect_for_b_tessel1_0(BITSELECT,434)@16
    u0_m0_wo0_mtree_add0_6_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_13_q_16_q(21 downto 11));

    -- d_u0_m0_wo0_mtree_mult1_12_q_16(DELAY,641)@15 + 1
    d_u0_m0_wo0_mtree_mult1_12_q_16 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_12_q, xout => d_u0_m0_wo0_mtree_mult1_12_q_16_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_6_BitSelect_for_a_tessel1_0(BITSELECT,427)@16
    u0_m0_wo0_mtree_add0_6_BitSelect_for_a_tessel1_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_12_q_16_q(21 downto 11));

    -- u0_m0_wo0_mtree_add0_6_p2_of_3(ADD,193)@16 + 1
    u0_m0_wo0_mtree_add0_6_p2_of_3_cin <= u0_m0_wo0_mtree_add0_6_p1_of_3_c;
    u0_m0_wo0_mtree_add0_6_p2_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_6_BitSelect_for_a_tessel1_0_b) & '1';
    u0_m0_wo0_mtree_add0_6_p2_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_6_BitSelect_for_b_tessel1_0_b) & u0_m0_wo0_mtree_add0_6_p2_of_3_cin(0);
    u0_m0_wo0_mtree_add0_6_p2_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_6_p2_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_6_p2_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add0_6_p2_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add0_6_p2_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_6_p2_of_3_c(0) <= u0_m0_wo0_mtree_add0_6_p2_of_3_o(12);
    u0_m0_wo0_mtree_add0_6_p2_of_3_q <= u0_m0_wo0_mtree_add0_6_p2_of_3_o(11 downto 1);

    -- u0_m0_wo0_mtree_add1_3_p2_of_3(ADD,265)@17 + 1
    u0_m0_wo0_mtree_add1_3_p2_of_3_cin <= u0_m0_wo0_mtree_add1_3_p1_of_3_c;
    u0_m0_wo0_mtree_add1_3_p2_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_6_p2_of_3_q) & '1';
    u0_m0_wo0_mtree_add1_3_p2_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_7_p2_of_3_q) & u0_m0_wo0_mtree_add1_3_p2_of_3_cin(0);
    u0_m0_wo0_mtree_add1_3_p2_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_3_p2_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_3_p2_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add1_3_p2_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add1_3_p2_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_3_p2_of_3_c(0) <= u0_m0_wo0_mtree_add1_3_p2_of_3_o(12);
    u0_m0_wo0_mtree_add1_3_p2_of_3_q <= u0_m0_wo0_mtree_add1_3_p2_of_3_o(11 downto 1);

    -- d_u0_m0_wo0_mtree_mult1_11_q_16(DELAY,643)@15 + 1
    d_u0_m0_wo0_mtree_mult1_11_q_16 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_11_q, xout => d_u0_m0_wo0_mtree_mult1_11_q_16_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_5_BitSelect_for_b_tessel1_0(BITSELECT,420)@16
    u0_m0_wo0_mtree_add0_5_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_11_q_16_q(21 downto 11));

    -- d_u0_m0_wo0_mtree_mult1_10_q_16(DELAY,645)@15 + 1
    d_u0_m0_wo0_mtree_mult1_10_q_16 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_10_q, xout => d_u0_m0_wo0_mtree_mult1_10_q_16_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_5_BitSelect_for_a_tessel1_0(BITSELECT,413)@16
    u0_m0_wo0_mtree_add0_5_BitSelect_for_a_tessel1_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_10_q_16_q(21 downto 11));

    -- u0_m0_wo0_mtree_add0_5_p2_of_3(ADD,181)@16 + 1
    u0_m0_wo0_mtree_add0_5_p2_of_3_cin <= u0_m0_wo0_mtree_add0_5_p1_of_3_c;
    u0_m0_wo0_mtree_add0_5_p2_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_5_BitSelect_for_a_tessel1_0_b) & '1';
    u0_m0_wo0_mtree_add0_5_p2_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_5_BitSelect_for_b_tessel1_0_b) & u0_m0_wo0_mtree_add0_5_p2_of_3_cin(0);
    u0_m0_wo0_mtree_add0_5_p2_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_5_p2_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_5_p2_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add0_5_p2_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add0_5_p2_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_5_p2_of_3_c(0) <= u0_m0_wo0_mtree_add0_5_p2_of_3_o(12);
    u0_m0_wo0_mtree_add0_5_p2_of_3_q <= u0_m0_wo0_mtree_add0_5_p2_of_3_o(11 downto 1);

    -- d_u0_m0_wo0_mtree_mult1_9_q_16(DELAY,647)@15 + 1
    d_u0_m0_wo0_mtree_mult1_9_q_16 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_9_q, xout => d_u0_m0_wo0_mtree_mult1_9_q_16_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_4_BitSelect_for_b_tessel1_0(BITSELECT,406)@16
    u0_m0_wo0_mtree_add0_4_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_9_q_16_q(21 downto 11));

    -- d_u0_m0_wo0_mtree_mult1_8_q_16(DELAY,649)@15 + 1
    d_u0_m0_wo0_mtree_mult1_8_q_16 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_8_q, xout => d_u0_m0_wo0_mtree_mult1_8_q_16_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_4_BitSelect_for_a_tessel1_0(BITSELECT,399)@16
    u0_m0_wo0_mtree_add0_4_BitSelect_for_a_tessel1_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_8_q_16_q(21 downto 11));

    -- u0_m0_wo0_mtree_add0_4_p2_of_3(ADD,169)@16 + 1
    u0_m0_wo0_mtree_add0_4_p2_of_3_cin <= u0_m0_wo0_mtree_add0_4_p1_of_3_c;
    u0_m0_wo0_mtree_add0_4_p2_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_4_BitSelect_for_a_tessel1_0_b) & '1';
    u0_m0_wo0_mtree_add0_4_p2_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_4_BitSelect_for_b_tessel1_0_b) & u0_m0_wo0_mtree_add0_4_p2_of_3_cin(0);
    u0_m0_wo0_mtree_add0_4_p2_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_4_p2_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_4_p2_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add0_4_p2_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add0_4_p2_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_4_p2_of_3_c(0) <= u0_m0_wo0_mtree_add0_4_p2_of_3_o(12);
    u0_m0_wo0_mtree_add0_4_p2_of_3_q <= u0_m0_wo0_mtree_add0_4_p2_of_3_o(11 downto 1);

    -- u0_m0_wo0_mtree_add1_2_p2_of_3(ADD,253)@17 + 1
    u0_m0_wo0_mtree_add1_2_p2_of_3_cin <= u0_m0_wo0_mtree_add1_2_p1_of_3_c;
    u0_m0_wo0_mtree_add1_2_p2_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_4_p2_of_3_q) & '1';
    u0_m0_wo0_mtree_add1_2_p2_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_5_p2_of_3_q) & u0_m0_wo0_mtree_add1_2_p2_of_3_cin(0);
    u0_m0_wo0_mtree_add1_2_p2_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_2_p2_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_2_p2_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add1_2_p2_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add1_2_p2_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_2_p2_of_3_c(0) <= u0_m0_wo0_mtree_add1_2_p2_of_3_o(12);
    u0_m0_wo0_mtree_add1_2_p2_of_3_q <= u0_m0_wo0_mtree_add1_2_p2_of_3_o(11 downto 1);

    -- u0_m0_wo0_mtree_add2_1_p2_of_3(ADD,301)@18 + 1
    u0_m0_wo0_mtree_add2_1_p2_of_3_cin <= u0_m0_wo0_mtree_add2_1_p1_of_3_c;
    u0_m0_wo0_mtree_add2_1_p2_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add1_2_p2_of_3_q) & '1';
    u0_m0_wo0_mtree_add2_1_p2_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add1_3_p2_of_3_q) & u0_m0_wo0_mtree_add2_1_p2_of_3_cin(0);
    u0_m0_wo0_mtree_add2_1_p2_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_1_p2_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_1_p2_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add2_1_p2_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add2_1_p2_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_1_p2_of_3_c(0) <= u0_m0_wo0_mtree_add2_1_p2_of_3_o(12);
    u0_m0_wo0_mtree_add2_1_p2_of_3_q <= u0_m0_wo0_mtree_add2_1_p2_of_3_o(11 downto 1);

    -- d_u0_m0_wo0_mtree_mult1_7_q_16(DELAY,651)@15 + 1
    d_u0_m0_wo0_mtree_mult1_7_q_16 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_7_q, xout => d_u0_m0_wo0_mtree_mult1_7_q_16_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_3_BitSelect_for_b_tessel1_0(BITSELECT,392)@16
    u0_m0_wo0_mtree_add0_3_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_7_q_16_q(21 downto 11));

    -- d_u0_m0_wo0_mtree_mult1_6_q_16(DELAY,653)@15 + 1
    d_u0_m0_wo0_mtree_mult1_6_q_16 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_6_q, xout => d_u0_m0_wo0_mtree_mult1_6_q_16_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_3_BitSelect_for_a_tessel1_0(BITSELECT,385)@16
    u0_m0_wo0_mtree_add0_3_BitSelect_for_a_tessel1_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_6_q_16_q(21 downto 11));

    -- u0_m0_wo0_mtree_add0_3_p2_of_3(ADD,157)@16 + 1
    u0_m0_wo0_mtree_add0_3_p2_of_3_cin <= u0_m0_wo0_mtree_add0_3_p1_of_3_c;
    u0_m0_wo0_mtree_add0_3_p2_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_3_BitSelect_for_a_tessel1_0_b) & '1';
    u0_m0_wo0_mtree_add0_3_p2_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_3_BitSelect_for_b_tessel1_0_b) & u0_m0_wo0_mtree_add0_3_p2_of_3_cin(0);
    u0_m0_wo0_mtree_add0_3_p2_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_3_p2_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_3_p2_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add0_3_p2_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add0_3_p2_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_3_p2_of_3_c(0) <= u0_m0_wo0_mtree_add0_3_p2_of_3_o(12);
    u0_m0_wo0_mtree_add0_3_p2_of_3_q <= u0_m0_wo0_mtree_add0_3_p2_of_3_o(11 downto 1);

    -- d_u0_m0_wo0_mtree_mult1_5_q_16(DELAY,655)@15 + 1
    d_u0_m0_wo0_mtree_mult1_5_q_16 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_5_q, xout => d_u0_m0_wo0_mtree_mult1_5_q_16_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_2_BitSelect_for_b_tessel1_0(BITSELECT,378)@16
    u0_m0_wo0_mtree_add0_2_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_5_q_16_q(21 downto 11));

    -- d_u0_m0_wo0_mtree_mult1_4_q_16(DELAY,657)@15 + 1
    d_u0_m0_wo0_mtree_mult1_4_q_16 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_4_q, xout => d_u0_m0_wo0_mtree_mult1_4_q_16_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_2_BitSelect_for_a_tessel1_0(BITSELECT,371)@16
    u0_m0_wo0_mtree_add0_2_BitSelect_for_a_tessel1_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_4_q_16_q(21 downto 11));

    -- u0_m0_wo0_mtree_add0_2_p2_of_3(ADD,145)@16 + 1
    u0_m0_wo0_mtree_add0_2_p2_of_3_cin <= u0_m0_wo0_mtree_add0_2_p1_of_3_c;
    u0_m0_wo0_mtree_add0_2_p2_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_2_BitSelect_for_a_tessel1_0_b) & '1';
    u0_m0_wo0_mtree_add0_2_p2_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_2_BitSelect_for_b_tessel1_0_b) & u0_m0_wo0_mtree_add0_2_p2_of_3_cin(0);
    u0_m0_wo0_mtree_add0_2_p2_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_2_p2_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_2_p2_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add0_2_p2_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add0_2_p2_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_2_p2_of_3_c(0) <= u0_m0_wo0_mtree_add0_2_p2_of_3_o(12);
    u0_m0_wo0_mtree_add0_2_p2_of_3_q <= u0_m0_wo0_mtree_add0_2_p2_of_3_o(11 downto 1);

    -- u0_m0_wo0_mtree_add1_1_p2_of_3(ADD,241)@17 + 1
    u0_m0_wo0_mtree_add1_1_p2_of_3_cin <= u0_m0_wo0_mtree_add1_1_p1_of_3_c;
    u0_m0_wo0_mtree_add1_1_p2_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_2_p2_of_3_q) & '1';
    u0_m0_wo0_mtree_add1_1_p2_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_3_p2_of_3_q) & u0_m0_wo0_mtree_add1_1_p2_of_3_cin(0);
    u0_m0_wo0_mtree_add1_1_p2_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_1_p2_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_1_p2_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add1_1_p2_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add1_1_p2_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_1_p2_of_3_c(0) <= u0_m0_wo0_mtree_add1_1_p2_of_3_o(12);
    u0_m0_wo0_mtree_add1_1_p2_of_3_q <= u0_m0_wo0_mtree_add1_1_p2_of_3_o(11 downto 1);

    -- d_u0_m0_wo0_mtree_mult1_3_q_16(DELAY,659)@15 + 1
    d_u0_m0_wo0_mtree_mult1_3_q_16 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_3_q, xout => d_u0_m0_wo0_mtree_mult1_3_q_16_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_1_BitSelect_for_b_tessel1_0(BITSELECT,364)@16
    u0_m0_wo0_mtree_add0_1_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_3_q_16_q(21 downto 11));

    -- d_u0_m0_wo0_mtree_mult1_2_q_16(DELAY,661)@15 + 1
    d_u0_m0_wo0_mtree_mult1_2_q_16 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_2_q, xout => d_u0_m0_wo0_mtree_mult1_2_q_16_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_1_BitSelect_for_a_tessel1_0(BITSELECT,357)@16
    u0_m0_wo0_mtree_add0_1_BitSelect_for_a_tessel1_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_2_q_16_q(21 downto 11));

    -- u0_m0_wo0_mtree_add0_1_p2_of_3(ADD,133)@16 + 1
    u0_m0_wo0_mtree_add0_1_p2_of_3_cin <= u0_m0_wo0_mtree_add0_1_p1_of_3_c;
    u0_m0_wo0_mtree_add0_1_p2_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_1_BitSelect_for_a_tessel1_0_b) & '1';
    u0_m0_wo0_mtree_add0_1_p2_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_1_BitSelect_for_b_tessel1_0_b) & u0_m0_wo0_mtree_add0_1_p2_of_3_cin(0);
    u0_m0_wo0_mtree_add0_1_p2_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_1_p2_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_1_p2_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add0_1_p2_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add0_1_p2_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_1_p2_of_3_c(0) <= u0_m0_wo0_mtree_add0_1_p2_of_3_o(12);
    u0_m0_wo0_mtree_add0_1_p2_of_3_q <= u0_m0_wo0_mtree_add0_1_p2_of_3_o(11 downto 1);

    -- d_u0_m0_wo0_mtree_mult1_1_q_16(DELAY,663)@15 + 1
    d_u0_m0_wo0_mtree_mult1_1_q_16 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_1_q, xout => d_u0_m0_wo0_mtree_mult1_1_q_16_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_0_BitSelect_for_b_tessel1_0(BITSELECT,350)@16
    u0_m0_wo0_mtree_add0_0_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_1_q_16_q(21 downto 11));

    -- d_u0_m0_wo0_mtree_mult1_0_q_16(DELAY,665)@15 + 1
    d_u0_m0_wo0_mtree_mult1_0_q_16 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_0_q, xout => d_u0_m0_wo0_mtree_mult1_0_q_16_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_0_BitSelect_for_a_tessel1_0(BITSELECT,343)@16
    u0_m0_wo0_mtree_add0_0_BitSelect_for_a_tessel1_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_0_q_16_q(21 downto 11));

    -- u0_m0_wo0_mtree_add0_0_p2_of_3(ADD,121)@16 + 1
    u0_m0_wo0_mtree_add0_0_p2_of_3_cin <= u0_m0_wo0_mtree_add0_0_p1_of_3_c;
    u0_m0_wo0_mtree_add0_0_p2_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_0_BitSelect_for_a_tessel1_0_b) & '1';
    u0_m0_wo0_mtree_add0_0_p2_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_0_BitSelect_for_b_tessel1_0_b) & u0_m0_wo0_mtree_add0_0_p2_of_3_cin(0);
    u0_m0_wo0_mtree_add0_0_p2_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_0_p2_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_0_p2_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add0_0_p2_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add0_0_p2_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_0_p2_of_3_c(0) <= u0_m0_wo0_mtree_add0_0_p2_of_3_o(12);
    u0_m0_wo0_mtree_add0_0_p2_of_3_q <= u0_m0_wo0_mtree_add0_0_p2_of_3_o(11 downto 1);

    -- u0_m0_wo0_mtree_add1_0_p2_of_3(ADD,229)@17 + 1
    u0_m0_wo0_mtree_add1_0_p2_of_3_cin <= u0_m0_wo0_mtree_add1_0_p1_of_3_c;
    u0_m0_wo0_mtree_add1_0_p2_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_0_p2_of_3_q) & '1';
    u0_m0_wo0_mtree_add1_0_p2_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_1_p2_of_3_q) & u0_m0_wo0_mtree_add1_0_p2_of_3_cin(0);
    u0_m0_wo0_mtree_add1_0_p2_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_0_p2_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_0_p2_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add1_0_p2_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add1_0_p2_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_0_p2_of_3_c(0) <= u0_m0_wo0_mtree_add1_0_p2_of_3_o(12);
    u0_m0_wo0_mtree_add1_0_p2_of_3_q <= u0_m0_wo0_mtree_add1_0_p2_of_3_o(11 downto 1);

    -- u0_m0_wo0_mtree_add2_0_p2_of_3(ADD,289)@18 + 1
    u0_m0_wo0_mtree_add2_0_p2_of_3_cin <= u0_m0_wo0_mtree_add2_0_p1_of_3_c;
    u0_m0_wo0_mtree_add2_0_p2_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add1_0_p2_of_3_q) & '1';
    u0_m0_wo0_mtree_add2_0_p2_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add1_1_p2_of_3_q) & u0_m0_wo0_mtree_add2_0_p2_of_3_cin(0);
    u0_m0_wo0_mtree_add2_0_p2_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_0_p2_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_0_p2_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add2_0_p2_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add2_0_p2_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_0_p2_of_3_c(0) <= u0_m0_wo0_mtree_add2_0_p2_of_3_o(12);
    u0_m0_wo0_mtree_add2_0_p2_of_3_q <= u0_m0_wo0_mtree_add2_0_p2_of_3_o(11 downto 1);

    -- u0_m0_wo0_mtree_add3_0_p2_of_3(ADD,313)@19 + 1
    u0_m0_wo0_mtree_add3_0_p2_of_3_cin <= u0_m0_wo0_mtree_add3_0_p1_of_3_c;
    u0_m0_wo0_mtree_add3_0_p2_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add2_0_p2_of_3_q) & '1';
    u0_m0_wo0_mtree_add3_0_p2_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add2_1_p2_of_3_q) & u0_m0_wo0_mtree_add3_0_p2_of_3_cin(0);
    u0_m0_wo0_mtree_add3_0_p2_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add3_0_p2_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add3_0_p2_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add3_0_p2_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add3_0_p2_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add3_0_p2_of_3_c(0) <= u0_m0_wo0_mtree_add3_0_p2_of_3_o(12);
    u0_m0_wo0_mtree_add3_0_p2_of_3_q <= u0_m0_wo0_mtree_add3_0_p2_of_3_o(11 downto 1);

    -- u0_m0_wo0_mtree_add4_0_p2_of_3(ADD,325)@20 + 1
    u0_m0_wo0_mtree_add4_0_p2_of_3_cin <= u0_m0_wo0_mtree_add4_0_p1_of_3_c;
    u0_m0_wo0_mtree_add4_0_p2_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add3_0_p2_of_3_q) & '1';
    u0_m0_wo0_mtree_add4_0_p2_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add1_4_p2_of_3_q) & u0_m0_wo0_mtree_add4_0_p2_of_3_cin(0);
    u0_m0_wo0_mtree_add4_0_p2_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add4_0_p2_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add4_0_p2_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add4_0_p2_of_3_a) + UNSIGNED(u0_m0_wo0_mtree_add4_0_p2_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add4_0_p2_of_3_c(0) <= u0_m0_wo0_mtree_add4_0_p2_of_3_o(12);
    u0_m0_wo0_mtree_add4_0_p2_of_3_q <= u0_m0_wo0_mtree_add4_0_p2_of_3_o(11 downto 1);

    -- u0_m0_wo0_accum_p2_of_3(ADD,338)@21 + 1
    u0_m0_wo0_accum_p2_of_3_cin <= u0_m0_wo0_accum_p1_of_3_c;
    u0_m0_wo0_accum_p2_of_3_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add4_0_p2_of_3_q) & '1';
    u0_m0_wo0_accum_p2_of_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_accum_p2_of_3_q) & u0_m0_wo0_accum_p2_of_3_cin(0);
    u0_m0_wo0_accum_p2_of_3_i <= u0_m0_wo0_accum_p2_of_3_a;
    u0_m0_wo0_accum_p2_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_accum_p2_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_21_q = "1") THEN
                IF (d_u0_m0_wo0_aseq_q_21_q = "1") THEN
                    u0_m0_wo0_accum_p2_of_3_o <= u0_m0_wo0_accum_p2_of_3_i;
                ELSE
                    u0_m0_wo0_accum_p2_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_accum_p2_of_3_a) + UNSIGNED(u0_m0_wo0_accum_p2_of_3_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_accum_p2_of_3_c(0) <= u0_m0_wo0_accum_p2_of_3_o(12);
    u0_m0_wo0_accum_p2_of_3_q <= u0_m0_wo0_accum_p2_of_3_o(11 downto 1);

    -- d_u0_m0_wo0_aseq_q_22(DELAY,668)@21 + 1
    d_u0_m0_wo0_aseq_q_22 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_aseq_q_21_q, xout => d_u0_m0_wo0_aseq_q_22_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_22(DELAY,623)@21 + 1
    d_u0_m0_wo0_compute_q_22 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_21_q, xout => d_u0_m0_wo0_compute_q_22_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_accum_BitSelect_for_a_tessel2_1(BITSELECT,601)@22
    u0_m0_wo0_accum_BitSelect_for_a_tessel2_1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_add4_0_p3_of_3_q(6 downto 6));

    -- u0_m0_wo0_mtree_add4_0_BitSelect_for_b_tessel2_1(BITSELECT,592)@21
    u0_m0_wo0_mtree_add4_0_BitSelect_for_b_tessel2_1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_add1_4_p3_of_3_q(3 downto 3));

    -- d_u0_m0_wo0_mtree_mult1_18_q_20(DELAY,630)@19 + 1
    d_u0_m0_wo0_mtree_mult1_18_q_20 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_mtree_mult1_18_q_19_q, xout => d_u0_m0_wo0_mtree_mult1_18_q_20_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add1_4_BitSelect_for_b_tessel2_1(BITSELECT,535)@20
    u0_m0_wo0_mtree_add1_4_BitSelect_for_b_tessel2_1_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_18_q_20_q(23 downto 23));

    -- u0_m0_wo0_mtree_add1_4_BitSelect_for_b_tessel2_0(BITSELECT,534)@20
    u0_m0_wo0_mtree_add1_4_BitSelect_for_b_tessel2_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_18_q_20_q(23 downto 22));

    -- u0_m0_wo0_mtree_add1_4_BitSelect_for_b_BitJoin_for_d(BITJOIN,537)@20
    u0_m0_wo0_mtree_add1_4_BitSelect_for_b_BitJoin_for_d_q <= u0_m0_wo0_mtree_add1_4_BitSelect_for_b_tessel2_1_b & u0_m0_wo0_mtree_add1_4_BitSelect_for_b_tessel2_1_b & u0_m0_wo0_mtree_add1_4_BitSelect_for_b_tessel2_0_b;

    -- u0_m0_wo0_mtree_add1_4_BitSelect_for_a_tessel2_1(BITSELECT,528)@20
    u0_m0_wo0_mtree_add1_4_BitSelect_for_a_tessel2_1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_add0_8_p3_of_3_q(2 downto 2));

    -- d_u0_m0_wo0_mtree_mult1_17_q_19(DELAY,632)@18 + 1
    d_u0_m0_wo0_mtree_mult1_17_q_19 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_mtree_mult1_17_q_18_q, xout => d_u0_m0_wo0_mtree_mult1_17_q_19_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_8_BitSelect_for_b_tessel2_1(BITSELECT,465)@19
    u0_m0_wo0_mtree_add0_8_BitSelect_for_b_tessel2_1_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_17_q_19_q(23 downto 23));

    -- u0_m0_wo0_mtree_add0_8_BitSelect_for_b_tessel2_0(BITSELECT,464)@19
    u0_m0_wo0_mtree_add0_8_BitSelect_for_b_tessel2_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_17_q_19_q(23 downto 22));

    -- u0_m0_wo0_mtree_add0_8_BitSelect_for_b_BitJoin_for_d(BITJOIN,466)@19
    u0_m0_wo0_mtree_add0_8_BitSelect_for_b_BitJoin_for_d_q <= u0_m0_wo0_mtree_add0_8_BitSelect_for_b_tessel2_1_b & u0_m0_wo0_mtree_add0_8_BitSelect_for_b_tessel2_0_b;

    -- d_u0_m0_wo0_mtree_mult1_16_q_19(DELAY,634)@18 + 1
    d_u0_m0_wo0_mtree_mult1_16_q_19 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_mtree_mult1_16_q_18_q, xout => d_u0_m0_wo0_mtree_mult1_16_q_19_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_8_BitSelect_for_a_tessel2_1(BITSELECT,458)@19
    u0_m0_wo0_mtree_add0_8_BitSelect_for_a_tessel2_1_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_16_q_19_q(23 downto 23));

    -- u0_m0_wo0_mtree_add0_8_BitSelect_for_a_tessel2_0(BITSELECT,457)@19
    u0_m0_wo0_mtree_add0_8_BitSelect_for_a_tessel2_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_16_q_19_q(23 downto 22));

    -- u0_m0_wo0_mtree_add0_8_BitSelect_for_a_BitJoin_for_d(BITJOIN,459)@19
    u0_m0_wo0_mtree_add0_8_BitSelect_for_a_BitJoin_for_d_q <= u0_m0_wo0_mtree_add0_8_BitSelect_for_a_tessel2_1_b & u0_m0_wo0_mtree_add0_8_BitSelect_for_a_tessel2_0_b;

    -- u0_m0_wo0_mtree_add0_8_p3_of_3(ADD,218)@19 + 1
    u0_m0_wo0_mtree_add0_8_p3_of_3_cin <= u0_m0_wo0_mtree_add0_8_p2_of_3_c;
    u0_m0_wo0_mtree_add0_8_p3_of_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 3 => u0_m0_wo0_mtree_add0_8_BitSelect_for_a_BitJoin_for_d_q(2)) & u0_m0_wo0_mtree_add0_8_BitSelect_for_a_BitJoin_for_d_q) & '1');
    u0_m0_wo0_mtree_add0_8_p3_of_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 3 => u0_m0_wo0_mtree_add0_8_BitSelect_for_b_BitJoin_for_d_q(2)) & u0_m0_wo0_mtree_add0_8_BitSelect_for_b_BitJoin_for_d_q) & u0_m0_wo0_mtree_add0_8_p3_of_3_cin(0));
    u0_m0_wo0_mtree_add0_8_p3_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_8_p3_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_8_p3_of_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_8_p3_of_3_a) + SIGNED(u0_m0_wo0_mtree_add0_8_p3_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_8_p3_of_3_q <= u0_m0_wo0_mtree_add0_8_p3_of_3_o(3 downto 1);

    -- u0_m0_wo0_mtree_add1_4_BitSelect_for_a_BitJoin_for_d(BITJOIN,529)@20
    u0_m0_wo0_mtree_add1_4_BitSelect_for_a_BitJoin_for_d_q <= u0_m0_wo0_mtree_add1_4_BitSelect_for_a_tessel2_1_b & u0_m0_wo0_mtree_add0_8_p3_of_3_q;

    -- u0_m0_wo0_mtree_add1_4_p3_of_3(ADD,278)@20 + 1
    u0_m0_wo0_mtree_add1_4_p3_of_3_cin <= u0_m0_wo0_mtree_add1_4_p2_of_3_c;
    u0_m0_wo0_mtree_add1_4_p3_of_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((4 downto 4 => u0_m0_wo0_mtree_add1_4_BitSelect_for_a_BitJoin_for_d_q(3)) & u0_m0_wo0_mtree_add1_4_BitSelect_for_a_BitJoin_for_d_q) & '1');
    u0_m0_wo0_mtree_add1_4_p3_of_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((4 downto 4 => u0_m0_wo0_mtree_add1_4_BitSelect_for_b_BitJoin_for_d_q(3)) & u0_m0_wo0_mtree_add1_4_BitSelect_for_b_BitJoin_for_d_q) & u0_m0_wo0_mtree_add1_4_p3_of_3_cin(0));
    u0_m0_wo0_mtree_add1_4_p3_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_4_p3_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_4_p3_of_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_4_p3_of_3_a) + SIGNED(u0_m0_wo0_mtree_add1_4_p3_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_4_p3_of_3_q <= u0_m0_wo0_mtree_add1_4_p3_of_3_o(4 downto 1);

    -- u0_m0_wo0_mtree_add4_0_BitSelect_for_b_BitJoin_for_d(BITJOIN,595)@21
    u0_m0_wo0_mtree_add4_0_BitSelect_for_b_BitJoin_for_d_q <= u0_m0_wo0_mtree_add4_0_BitSelect_for_b_tessel2_1_b & u0_m0_wo0_mtree_add4_0_BitSelect_for_b_tessel2_1_b & u0_m0_wo0_mtree_add4_0_BitSelect_for_b_tessel2_1_b & u0_m0_wo0_mtree_add1_4_p3_of_3_q;

    -- u0_m0_wo0_mtree_add4_0_BitSelect_for_a_tessel2_1(BITSELECT,585)@21
    u0_m0_wo0_mtree_add4_0_BitSelect_for_a_tessel2_1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_add3_0_p3_of_3_q(5 downto 5));

    -- u0_m0_wo0_mtree_add3_0_BitSelect_for_b_tessel2_1(BITSELECT,578)@20
    u0_m0_wo0_mtree_add3_0_BitSelect_for_b_tessel2_1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_add2_1_p3_of_3_q(4 downto 4));

    -- u0_m0_wo0_mtree_add2_1_BitSelect_for_b_tessel2_1(BITSELECT,564)@19
    u0_m0_wo0_mtree_add2_1_BitSelect_for_b_tessel2_1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_add1_3_p3_of_3_q(3 downto 3));

    -- u0_m0_wo0_mtree_add1_3_BitSelect_for_b_tessel2_1(BITSELECT,521)@18
    u0_m0_wo0_mtree_add1_3_BitSelect_for_b_tessel2_1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_add0_7_p3_of_3_q(2 downto 2));

    -- d_u0_m0_wo0_mtree_mult1_15_q_17(DELAY,636)@16 + 1
    d_u0_m0_wo0_mtree_mult1_15_q_17 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_mtree_mult1_15_q_16_q, xout => d_u0_m0_wo0_mtree_mult1_15_q_17_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_7_BitSelect_for_b_tessel2_1(BITSELECT,451)@17
    u0_m0_wo0_mtree_add0_7_BitSelect_for_b_tessel2_1_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_15_q_17_q(23 downto 23));

    -- u0_m0_wo0_mtree_add0_7_BitSelect_for_b_tessel2_0(BITSELECT,450)@17
    u0_m0_wo0_mtree_add0_7_BitSelect_for_b_tessel2_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_15_q_17_q(23 downto 22));

    -- u0_m0_wo0_mtree_add0_7_BitSelect_for_b_BitJoin_for_d(BITJOIN,452)@17
    u0_m0_wo0_mtree_add0_7_BitSelect_for_b_BitJoin_for_d_q <= u0_m0_wo0_mtree_add0_7_BitSelect_for_b_tessel2_1_b & u0_m0_wo0_mtree_add0_7_BitSelect_for_b_tessel2_0_b;

    -- d_u0_m0_wo0_mtree_mult1_14_q_17(DELAY,638)@16 + 1
    d_u0_m0_wo0_mtree_mult1_14_q_17 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_mtree_mult1_14_q_16_q, xout => d_u0_m0_wo0_mtree_mult1_14_q_17_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_7_BitSelect_for_a_tessel2_1(BITSELECT,444)@17
    u0_m0_wo0_mtree_add0_7_BitSelect_for_a_tessel2_1_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_14_q_17_q(23 downto 23));

    -- u0_m0_wo0_mtree_add0_7_BitSelect_for_a_tessel2_0(BITSELECT,443)@17
    u0_m0_wo0_mtree_add0_7_BitSelect_for_a_tessel2_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_14_q_17_q(23 downto 22));

    -- u0_m0_wo0_mtree_add0_7_BitSelect_for_a_BitJoin_for_d(BITJOIN,445)@17
    u0_m0_wo0_mtree_add0_7_BitSelect_for_a_BitJoin_for_d_q <= u0_m0_wo0_mtree_add0_7_BitSelect_for_a_tessel2_1_b & u0_m0_wo0_mtree_add0_7_BitSelect_for_a_tessel2_0_b;

    -- u0_m0_wo0_mtree_add0_7_p3_of_3(ADD,206)@17 + 1
    u0_m0_wo0_mtree_add0_7_p3_of_3_cin <= u0_m0_wo0_mtree_add0_7_p2_of_3_c;
    u0_m0_wo0_mtree_add0_7_p3_of_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 3 => u0_m0_wo0_mtree_add0_7_BitSelect_for_a_BitJoin_for_d_q(2)) & u0_m0_wo0_mtree_add0_7_BitSelect_for_a_BitJoin_for_d_q) & '1');
    u0_m0_wo0_mtree_add0_7_p3_of_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 3 => u0_m0_wo0_mtree_add0_7_BitSelect_for_b_BitJoin_for_d_q(2)) & u0_m0_wo0_mtree_add0_7_BitSelect_for_b_BitJoin_for_d_q) & u0_m0_wo0_mtree_add0_7_p3_of_3_cin(0));
    u0_m0_wo0_mtree_add0_7_p3_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_7_p3_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_7_p3_of_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_7_p3_of_3_a) + SIGNED(u0_m0_wo0_mtree_add0_7_p3_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_7_p3_of_3_q <= u0_m0_wo0_mtree_add0_7_p3_of_3_o(3 downto 1);

    -- u0_m0_wo0_mtree_add1_3_BitSelect_for_b_BitJoin_for_d(BITJOIN,522)@18
    u0_m0_wo0_mtree_add1_3_BitSelect_for_b_BitJoin_for_d_q <= u0_m0_wo0_mtree_add1_3_BitSelect_for_b_tessel2_1_b & u0_m0_wo0_mtree_add0_7_p3_of_3_q;

    -- u0_m0_wo0_mtree_add1_3_BitSelect_for_a_tessel2_1(BITSELECT,514)@18
    u0_m0_wo0_mtree_add1_3_BitSelect_for_a_tessel2_1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_add0_6_p3_of_3_q(2 downto 2));

    -- d_u0_m0_wo0_mtree_mult1_13_q_17(DELAY,640)@16 + 1
    d_u0_m0_wo0_mtree_mult1_13_q_17 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_mtree_mult1_13_q_16_q, xout => d_u0_m0_wo0_mtree_mult1_13_q_17_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_6_BitSelect_for_b_tessel2_1(BITSELECT,437)@17
    u0_m0_wo0_mtree_add0_6_BitSelect_for_b_tessel2_1_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_13_q_17_q(23 downto 23));

    -- u0_m0_wo0_mtree_add0_6_BitSelect_for_b_tessel2_0(BITSELECT,436)@17
    u0_m0_wo0_mtree_add0_6_BitSelect_for_b_tessel2_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_13_q_17_q(23 downto 22));

    -- u0_m0_wo0_mtree_add0_6_BitSelect_for_b_BitJoin_for_d(BITJOIN,438)@17
    u0_m0_wo0_mtree_add0_6_BitSelect_for_b_BitJoin_for_d_q <= u0_m0_wo0_mtree_add0_6_BitSelect_for_b_tessel2_1_b & u0_m0_wo0_mtree_add0_6_BitSelect_for_b_tessel2_0_b;

    -- d_u0_m0_wo0_mtree_mult1_12_q_17(DELAY,642)@16 + 1
    d_u0_m0_wo0_mtree_mult1_12_q_17 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_mtree_mult1_12_q_16_q, xout => d_u0_m0_wo0_mtree_mult1_12_q_17_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_6_BitSelect_for_a_tessel2_1(BITSELECT,430)@17
    u0_m0_wo0_mtree_add0_6_BitSelect_for_a_tessel2_1_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_12_q_17_q(23 downto 23));

    -- u0_m0_wo0_mtree_add0_6_BitSelect_for_a_tessel2_0(BITSELECT,429)@17
    u0_m0_wo0_mtree_add0_6_BitSelect_for_a_tessel2_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_12_q_17_q(23 downto 22));

    -- u0_m0_wo0_mtree_add0_6_BitSelect_for_a_BitJoin_for_d(BITJOIN,431)@17
    u0_m0_wo0_mtree_add0_6_BitSelect_for_a_BitJoin_for_d_q <= u0_m0_wo0_mtree_add0_6_BitSelect_for_a_tessel2_1_b & u0_m0_wo0_mtree_add0_6_BitSelect_for_a_tessel2_0_b;

    -- u0_m0_wo0_mtree_add0_6_p3_of_3(ADD,194)@17 + 1
    u0_m0_wo0_mtree_add0_6_p3_of_3_cin <= u0_m0_wo0_mtree_add0_6_p2_of_3_c;
    u0_m0_wo0_mtree_add0_6_p3_of_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 3 => u0_m0_wo0_mtree_add0_6_BitSelect_for_a_BitJoin_for_d_q(2)) & u0_m0_wo0_mtree_add0_6_BitSelect_for_a_BitJoin_for_d_q) & '1');
    u0_m0_wo0_mtree_add0_6_p3_of_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 3 => u0_m0_wo0_mtree_add0_6_BitSelect_for_b_BitJoin_for_d_q(2)) & u0_m0_wo0_mtree_add0_6_BitSelect_for_b_BitJoin_for_d_q) & u0_m0_wo0_mtree_add0_6_p3_of_3_cin(0));
    u0_m0_wo0_mtree_add0_6_p3_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_6_p3_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_6_p3_of_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_6_p3_of_3_a) + SIGNED(u0_m0_wo0_mtree_add0_6_p3_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_6_p3_of_3_q <= u0_m0_wo0_mtree_add0_6_p3_of_3_o(3 downto 1);

    -- u0_m0_wo0_mtree_add1_3_BitSelect_for_a_BitJoin_for_d(BITJOIN,515)@18
    u0_m0_wo0_mtree_add1_3_BitSelect_for_a_BitJoin_for_d_q <= u0_m0_wo0_mtree_add1_3_BitSelect_for_a_tessel2_1_b & u0_m0_wo0_mtree_add0_6_p3_of_3_q;

    -- u0_m0_wo0_mtree_add1_3_p3_of_3(ADD,266)@18 + 1
    u0_m0_wo0_mtree_add1_3_p3_of_3_cin <= u0_m0_wo0_mtree_add1_3_p2_of_3_c;
    u0_m0_wo0_mtree_add1_3_p3_of_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((4 downto 4 => u0_m0_wo0_mtree_add1_3_BitSelect_for_a_BitJoin_for_d_q(3)) & u0_m0_wo0_mtree_add1_3_BitSelect_for_a_BitJoin_for_d_q) & '1');
    u0_m0_wo0_mtree_add1_3_p3_of_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((4 downto 4 => u0_m0_wo0_mtree_add1_3_BitSelect_for_b_BitJoin_for_d_q(3)) & u0_m0_wo0_mtree_add1_3_BitSelect_for_b_BitJoin_for_d_q) & u0_m0_wo0_mtree_add1_3_p3_of_3_cin(0));
    u0_m0_wo0_mtree_add1_3_p3_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_3_p3_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_3_p3_of_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_3_p3_of_3_a) + SIGNED(u0_m0_wo0_mtree_add1_3_p3_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_3_p3_of_3_q <= u0_m0_wo0_mtree_add1_3_p3_of_3_o(4 downto 1);

    -- u0_m0_wo0_mtree_add2_1_BitSelect_for_b_BitJoin_for_d(BITJOIN,565)@19
    u0_m0_wo0_mtree_add2_1_BitSelect_for_b_BitJoin_for_d_q <= u0_m0_wo0_mtree_add2_1_BitSelect_for_b_tessel2_1_b & u0_m0_wo0_mtree_add1_3_p3_of_3_q;

    -- u0_m0_wo0_mtree_add2_1_BitSelect_for_a_tessel2_1(BITSELECT,557)@19
    u0_m0_wo0_mtree_add2_1_BitSelect_for_a_tessel2_1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_add1_2_p3_of_3_q(3 downto 3));

    -- u0_m0_wo0_mtree_add1_2_BitSelect_for_b_tessel2_1(BITSELECT,507)@18
    u0_m0_wo0_mtree_add1_2_BitSelect_for_b_tessel2_1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_add0_5_p3_of_3_q(2 downto 2));

    -- d_u0_m0_wo0_mtree_mult1_11_q_17(DELAY,644)@16 + 1
    d_u0_m0_wo0_mtree_mult1_11_q_17 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_mtree_mult1_11_q_16_q, xout => d_u0_m0_wo0_mtree_mult1_11_q_17_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_5_BitSelect_for_b_tessel2_1(BITSELECT,423)@17
    u0_m0_wo0_mtree_add0_5_BitSelect_for_b_tessel2_1_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_11_q_17_q(23 downto 23));

    -- u0_m0_wo0_mtree_add0_5_BitSelect_for_b_tessel2_0(BITSELECT,422)@17
    u0_m0_wo0_mtree_add0_5_BitSelect_for_b_tessel2_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_11_q_17_q(23 downto 22));

    -- u0_m0_wo0_mtree_add0_5_BitSelect_for_b_BitJoin_for_d(BITJOIN,424)@17
    u0_m0_wo0_mtree_add0_5_BitSelect_for_b_BitJoin_for_d_q <= u0_m0_wo0_mtree_add0_5_BitSelect_for_b_tessel2_1_b & u0_m0_wo0_mtree_add0_5_BitSelect_for_b_tessel2_0_b;

    -- d_u0_m0_wo0_mtree_mult1_10_q_17(DELAY,646)@16 + 1
    d_u0_m0_wo0_mtree_mult1_10_q_17 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_mtree_mult1_10_q_16_q, xout => d_u0_m0_wo0_mtree_mult1_10_q_17_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_5_BitSelect_for_a_tessel2_1(BITSELECT,416)@17
    u0_m0_wo0_mtree_add0_5_BitSelect_for_a_tessel2_1_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_10_q_17_q(23 downto 23));

    -- u0_m0_wo0_mtree_add0_5_BitSelect_for_a_tessel2_0(BITSELECT,415)@17
    u0_m0_wo0_mtree_add0_5_BitSelect_for_a_tessel2_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_10_q_17_q(23 downto 22));

    -- u0_m0_wo0_mtree_add0_5_BitSelect_for_a_BitJoin_for_d(BITJOIN,417)@17
    u0_m0_wo0_mtree_add0_5_BitSelect_for_a_BitJoin_for_d_q <= u0_m0_wo0_mtree_add0_5_BitSelect_for_a_tessel2_1_b & u0_m0_wo0_mtree_add0_5_BitSelect_for_a_tessel2_0_b;

    -- u0_m0_wo0_mtree_add0_5_p3_of_3(ADD,182)@17 + 1
    u0_m0_wo0_mtree_add0_5_p3_of_3_cin <= u0_m0_wo0_mtree_add0_5_p2_of_3_c;
    u0_m0_wo0_mtree_add0_5_p3_of_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 3 => u0_m0_wo0_mtree_add0_5_BitSelect_for_a_BitJoin_for_d_q(2)) & u0_m0_wo0_mtree_add0_5_BitSelect_for_a_BitJoin_for_d_q) & '1');
    u0_m0_wo0_mtree_add0_5_p3_of_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 3 => u0_m0_wo0_mtree_add0_5_BitSelect_for_b_BitJoin_for_d_q(2)) & u0_m0_wo0_mtree_add0_5_BitSelect_for_b_BitJoin_for_d_q) & u0_m0_wo0_mtree_add0_5_p3_of_3_cin(0));
    u0_m0_wo0_mtree_add0_5_p3_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_5_p3_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_5_p3_of_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_5_p3_of_3_a) + SIGNED(u0_m0_wo0_mtree_add0_5_p3_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_5_p3_of_3_q <= u0_m0_wo0_mtree_add0_5_p3_of_3_o(3 downto 1);

    -- u0_m0_wo0_mtree_add1_2_BitSelect_for_b_BitJoin_for_d(BITJOIN,508)@18
    u0_m0_wo0_mtree_add1_2_BitSelect_for_b_BitJoin_for_d_q <= u0_m0_wo0_mtree_add1_2_BitSelect_for_b_tessel2_1_b & u0_m0_wo0_mtree_add0_5_p3_of_3_q;

    -- u0_m0_wo0_mtree_add1_2_BitSelect_for_a_tessel2_1(BITSELECT,500)@18
    u0_m0_wo0_mtree_add1_2_BitSelect_for_a_tessel2_1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_add0_4_p3_of_3_q(2 downto 2));

    -- d_u0_m0_wo0_mtree_mult1_9_q_17(DELAY,648)@16 + 1
    d_u0_m0_wo0_mtree_mult1_9_q_17 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_mtree_mult1_9_q_16_q, xout => d_u0_m0_wo0_mtree_mult1_9_q_17_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_4_BitSelect_for_b_tessel2_1(BITSELECT,409)@17
    u0_m0_wo0_mtree_add0_4_BitSelect_for_b_tessel2_1_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_9_q_17_q(23 downto 23));

    -- u0_m0_wo0_mtree_add0_4_BitSelect_for_b_tessel2_0(BITSELECT,408)@17
    u0_m0_wo0_mtree_add0_4_BitSelect_for_b_tessel2_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_9_q_17_q(23 downto 22));

    -- u0_m0_wo0_mtree_add0_4_BitSelect_for_b_BitJoin_for_d(BITJOIN,410)@17
    u0_m0_wo0_mtree_add0_4_BitSelect_for_b_BitJoin_for_d_q <= u0_m0_wo0_mtree_add0_4_BitSelect_for_b_tessel2_1_b & u0_m0_wo0_mtree_add0_4_BitSelect_for_b_tessel2_0_b;

    -- d_u0_m0_wo0_mtree_mult1_8_q_17(DELAY,650)@16 + 1
    d_u0_m0_wo0_mtree_mult1_8_q_17 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_mtree_mult1_8_q_16_q, xout => d_u0_m0_wo0_mtree_mult1_8_q_17_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_4_BitSelect_for_a_tessel2_1(BITSELECT,402)@17
    u0_m0_wo0_mtree_add0_4_BitSelect_for_a_tessel2_1_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_8_q_17_q(23 downto 23));

    -- u0_m0_wo0_mtree_add0_4_BitSelect_for_a_tessel2_0(BITSELECT,401)@17
    u0_m0_wo0_mtree_add0_4_BitSelect_for_a_tessel2_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_8_q_17_q(23 downto 22));

    -- u0_m0_wo0_mtree_add0_4_BitSelect_for_a_BitJoin_for_d(BITJOIN,403)@17
    u0_m0_wo0_mtree_add0_4_BitSelect_for_a_BitJoin_for_d_q <= u0_m0_wo0_mtree_add0_4_BitSelect_for_a_tessel2_1_b & u0_m0_wo0_mtree_add0_4_BitSelect_for_a_tessel2_0_b;

    -- u0_m0_wo0_mtree_add0_4_p3_of_3(ADD,170)@17 + 1
    u0_m0_wo0_mtree_add0_4_p3_of_3_cin <= u0_m0_wo0_mtree_add0_4_p2_of_3_c;
    u0_m0_wo0_mtree_add0_4_p3_of_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 3 => u0_m0_wo0_mtree_add0_4_BitSelect_for_a_BitJoin_for_d_q(2)) & u0_m0_wo0_mtree_add0_4_BitSelect_for_a_BitJoin_for_d_q) & '1');
    u0_m0_wo0_mtree_add0_4_p3_of_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 3 => u0_m0_wo0_mtree_add0_4_BitSelect_for_b_BitJoin_for_d_q(2)) & u0_m0_wo0_mtree_add0_4_BitSelect_for_b_BitJoin_for_d_q) & u0_m0_wo0_mtree_add0_4_p3_of_3_cin(0));
    u0_m0_wo0_mtree_add0_4_p3_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_4_p3_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_4_p3_of_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_4_p3_of_3_a) + SIGNED(u0_m0_wo0_mtree_add0_4_p3_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_4_p3_of_3_q <= u0_m0_wo0_mtree_add0_4_p3_of_3_o(3 downto 1);

    -- u0_m0_wo0_mtree_add1_2_BitSelect_for_a_BitJoin_for_d(BITJOIN,501)@18
    u0_m0_wo0_mtree_add1_2_BitSelect_for_a_BitJoin_for_d_q <= u0_m0_wo0_mtree_add1_2_BitSelect_for_a_tessel2_1_b & u0_m0_wo0_mtree_add0_4_p3_of_3_q;

    -- u0_m0_wo0_mtree_add1_2_p3_of_3(ADD,254)@18 + 1
    u0_m0_wo0_mtree_add1_2_p3_of_3_cin <= u0_m0_wo0_mtree_add1_2_p2_of_3_c;
    u0_m0_wo0_mtree_add1_2_p3_of_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((4 downto 4 => u0_m0_wo0_mtree_add1_2_BitSelect_for_a_BitJoin_for_d_q(3)) & u0_m0_wo0_mtree_add1_2_BitSelect_for_a_BitJoin_for_d_q) & '1');
    u0_m0_wo0_mtree_add1_2_p3_of_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((4 downto 4 => u0_m0_wo0_mtree_add1_2_BitSelect_for_b_BitJoin_for_d_q(3)) & u0_m0_wo0_mtree_add1_2_BitSelect_for_b_BitJoin_for_d_q) & u0_m0_wo0_mtree_add1_2_p3_of_3_cin(0));
    u0_m0_wo0_mtree_add1_2_p3_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_2_p3_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_2_p3_of_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_2_p3_of_3_a) + SIGNED(u0_m0_wo0_mtree_add1_2_p3_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_2_p3_of_3_q <= u0_m0_wo0_mtree_add1_2_p3_of_3_o(4 downto 1);

    -- u0_m0_wo0_mtree_add2_1_BitSelect_for_a_BitJoin_for_d(BITJOIN,558)@19
    u0_m0_wo0_mtree_add2_1_BitSelect_for_a_BitJoin_for_d_q <= u0_m0_wo0_mtree_add2_1_BitSelect_for_a_tessel2_1_b & u0_m0_wo0_mtree_add1_2_p3_of_3_q;

    -- u0_m0_wo0_mtree_add2_1_p3_of_3(ADD,302)@19 + 1
    u0_m0_wo0_mtree_add2_1_p3_of_3_cin <= u0_m0_wo0_mtree_add2_1_p2_of_3_c;
    u0_m0_wo0_mtree_add2_1_p3_of_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((5 downto 5 => u0_m0_wo0_mtree_add2_1_BitSelect_for_a_BitJoin_for_d_q(4)) & u0_m0_wo0_mtree_add2_1_BitSelect_for_a_BitJoin_for_d_q) & '1');
    u0_m0_wo0_mtree_add2_1_p3_of_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((5 downto 5 => u0_m0_wo0_mtree_add2_1_BitSelect_for_b_BitJoin_for_d_q(4)) & u0_m0_wo0_mtree_add2_1_BitSelect_for_b_BitJoin_for_d_q) & u0_m0_wo0_mtree_add2_1_p3_of_3_cin(0));
    u0_m0_wo0_mtree_add2_1_p3_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_1_p3_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_1_p3_of_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_1_p3_of_3_a) + SIGNED(u0_m0_wo0_mtree_add2_1_p3_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_1_p3_of_3_q <= u0_m0_wo0_mtree_add2_1_p3_of_3_o(5 downto 1);

    -- u0_m0_wo0_mtree_add3_0_BitSelect_for_b_BitJoin_for_d(BITJOIN,579)@20
    u0_m0_wo0_mtree_add3_0_BitSelect_for_b_BitJoin_for_d_q <= u0_m0_wo0_mtree_add3_0_BitSelect_for_b_tessel2_1_b & u0_m0_wo0_mtree_add2_1_p3_of_3_q;

    -- u0_m0_wo0_mtree_add3_0_BitSelect_for_a_tessel2_1(BITSELECT,571)@20
    u0_m0_wo0_mtree_add3_0_BitSelect_for_a_tessel2_1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_add2_0_p3_of_3_q(4 downto 4));

    -- u0_m0_wo0_mtree_add2_0_BitSelect_for_b_tessel2_1(BITSELECT,550)@19
    u0_m0_wo0_mtree_add2_0_BitSelect_for_b_tessel2_1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_add1_1_p3_of_3_q(3 downto 3));

    -- u0_m0_wo0_mtree_add1_1_BitSelect_for_b_tessel2_1(BITSELECT,493)@18
    u0_m0_wo0_mtree_add1_1_BitSelect_for_b_tessel2_1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_add0_3_p3_of_3_q(2 downto 2));

    -- d_u0_m0_wo0_mtree_mult1_7_q_17(DELAY,652)@16 + 1
    d_u0_m0_wo0_mtree_mult1_7_q_17 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_mtree_mult1_7_q_16_q, xout => d_u0_m0_wo0_mtree_mult1_7_q_17_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_3_BitSelect_for_b_tessel2_1(BITSELECT,395)@17
    u0_m0_wo0_mtree_add0_3_BitSelect_for_b_tessel2_1_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_7_q_17_q(23 downto 23));

    -- u0_m0_wo0_mtree_add0_3_BitSelect_for_b_tessel2_0(BITSELECT,394)@17
    u0_m0_wo0_mtree_add0_3_BitSelect_for_b_tessel2_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_7_q_17_q(23 downto 22));

    -- u0_m0_wo0_mtree_add0_3_BitSelect_for_b_BitJoin_for_d(BITJOIN,396)@17
    u0_m0_wo0_mtree_add0_3_BitSelect_for_b_BitJoin_for_d_q <= u0_m0_wo0_mtree_add0_3_BitSelect_for_b_tessel2_1_b & u0_m0_wo0_mtree_add0_3_BitSelect_for_b_tessel2_0_b;

    -- d_u0_m0_wo0_mtree_mult1_6_q_17(DELAY,654)@16 + 1
    d_u0_m0_wo0_mtree_mult1_6_q_17 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_mtree_mult1_6_q_16_q, xout => d_u0_m0_wo0_mtree_mult1_6_q_17_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_3_BitSelect_for_a_tessel2_1(BITSELECT,388)@17
    u0_m0_wo0_mtree_add0_3_BitSelect_for_a_tessel2_1_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_6_q_17_q(23 downto 23));

    -- u0_m0_wo0_mtree_add0_3_BitSelect_for_a_tessel2_0(BITSELECT,387)@17
    u0_m0_wo0_mtree_add0_3_BitSelect_for_a_tessel2_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_6_q_17_q(23 downto 22));

    -- u0_m0_wo0_mtree_add0_3_BitSelect_for_a_BitJoin_for_d(BITJOIN,389)@17
    u0_m0_wo0_mtree_add0_3_BitSelect_for_a_BitJoin_for_d_q <= u0_m0_wo0_mtree_add0_3_BitSelect_for_a_tessel2_1_b & u0_m0_wo0_mtree_add0_3_BitSelect_for_a_tessel2_0_b;

    -- u0_m0_wo0_mtree_add0_3_p3_of_3(ADD,158)@17 + 1
    u0_m0_wo0_mtree_add0_3_p3_of_3_cin <= u0_m0_wo0_mtree_add0_3_p2_of_3_c;
    u0_m0_wo0_mtree_add0_3_p3_of_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 3 => u0_m0_wo0_mtree_add0_3_BitSelect_for_a_BitJoin_for_d_q(2)) & u0_m0_wo0_mtree_add0_3_BitSelect_for_a_BitJoin_for_d_q) & '1');
    u0_m0_wo0_mtree_add0_3_p3_of_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 3 => u0_m0_wo0_mtree_add0_3_BitSelect_for_b_BitJoin_for_d_q(2)) & u0_m0_wo0_mtree_add0_3_BitSelect_for_b_BitJoin_for_d_q) & u0_m0_wo0_mtree_add0_3_p3_of_3_cin(0));
    u0_m0_wo0_mtree_add0_3_p3_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_3_p3_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_3_p3_of_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_3_p3_of_3_a) + SIGNED(u0_m0_wo0_mtree_add0_3_p3_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_3_p3_of_3_q <= u0_m0_wo0_mtree_add0_3_p3_of_3_o(3 downto 1);

    -- u0_m0_wo0_mtree_add1_1_BitSelect_for_b_BitJoin_for_d(BITJOIN,494)@18
    u0_m0_wo0_mtree_add1_1_BitSelect_for_b_BitJoin_for_d_q <= u0_m0_wo0_mtree_add1_1_BitSelect_for_b_tessel2_1_b & u0_m0_wo0_mtree_add0_3_p3_of_3_q;

    -- u0_m0_wo0_mtree_add1_1_BitSelect_for_a_tessel2_1(BITSELECT,486)@18
    u0_m0_wo0_mtree_add1_1_BitSelect_for_a_tessel2_1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_add0_2_p3_of_3_q(2 downto 2));

    -- d_u0_m0_wo0_mtree_mult1_5_q_17(DELAY,656)@16 + 1
    d_u0_m0_wo0_mtree_mult1_5_q_17 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_mtree_mult1_5_q_16_q, xout => d_u0_m0_wo0_mtree_mult1_5_q_17_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_2_BitSelect_for_b_tessel2_1(BITSELECT,381)@17
    u0_m0_wo0_mtree_add0_2_BitSelect_for_b_tessel2_1_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_5_q_17_q(23 downto 23));

    -- u0_m0_wo0_mtree_add0_2_BitSelect_for_b_tessel2_0(BITSELECT,380)@17
    u0_m0_wo0_mtree_add0_2_BitSelect_for_b_tessel2_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_5_q_17_q(23 downto 22));

    -- u0_m0_wo0_mtree_add0_2_BitSelect_for_b_BitJoin_for_d(BITJOIN,382)@17
    u0_m0_wo0_mtree_add0_2_BitSelect_for_b_BitJoin_for_d_q <= u0_m0_wo0_mtree_add0_2_BitSelect_for_b_tessel2_1_b & u0_m0_wo0_mtree_add0_2_BitSelect_for_b_tessel2_0_b;

    -- d_u0_m0_wo0_mtree_mult1_4_q_17(DELAY,658)@16 + 1
    d_u0_m0_wo0_mtree_mult1_4_q_17 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_mtree_mult1_4_q_16_q, xout => d_u0_m0_wo0_mtree_mult1_4_q_17_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_2_BitSelect_for_a_tessel2_1(BITSELECT,374)@17
    u0_m0_wo0_mtree_add0_2_BitSelect_for_a_tessel2_1_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_4_q_17_q(23 downto 23));

    -- u0_m0_wo0_mtree_add0_2_BitSelect_for_a_tessel2_0(BITSELECT,373)@17
    u0_m0_wo0_mtree_add0_2_BitSelect_for_a_tessel2_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_4_q_17_q(23 downto 22));

    -- u0_m0_wo0_mtree_add0_2_BitSelect_for_a_BitJoin_for_d(BITJOIN,375)@17
    u0_m0_wo0_mtree_add0_2_BitSelect_for_a_BitJoin_for_d_q <= u0_m0_wo0_mtree_add0_2_BitSelect_for_a_tessel2_1_b & u0_m0_wo0_mtree_add0_2_BitSelect_for_a_tessel2_0_b;

    -- u0_m0_wo0_mtree_add0_2_p3_of_3(ADD,146)@17 + 1
    u0_m0_wo0_mtree_add0_2_p3_of_3_cin <= u0_m0_wo0_mtree_add0_2_p2_of_3_c;
    u0_m0_wo0_mtree_add0_2_p3_of_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 3 => u0_m0_wo0_mtree_add0_2_BitSelect_for_a_BitJoin_for_d_q(2)) & u0_m0_wo0_mtree_add0_2_BitSelect_for_a_BitJoin_for_d_q) & '1');
    u0_m0_wo0_mtree_add0_2_p3_of_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 3 => u0_m0_wo0_mtree_add0_2_BitSelect_for_b_BitJoin_for_d_q(2)) & u0_m0_wo0_mtree_add0_2_BitSelect_for_b_BitJoin_for_d_q) & u0_m0_wo0_mtree_add0_2_p3_of_3_cin(0));
    u0_m0_wo0_mtree_add0_2_p3_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_2_p3_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_2_p3_of_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_2_p3_of_3_a) + SIGNED(u0_m0_wo0_mtree_add0_2_p3_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_2_p3_of_3_q <= u0_m0_wo0_mtree_add0_2_p3_of_3_o(3 downto 1);

    -- u0_m0_wo0_mtree_add1_1_BitSelect_for_a_BitJoin_for_d(BITJOIN,487)@18
    u0_m0_wo0_mtree_add1_1_BitSelect_for_a_BitJoin_for_d_q <= u0_m0_wo0_mtree_add1_1_BitSelect_for_a_tessel2_1_b & u0_m0_wo0_mtree_add0_2_p3_of_3_q;

    -- u0_m0_wo0_mtree_add1_1_p3_of_3(ADD,242)@18 + 1
    u0_m0_wo0_mtree_add1_1_p3_of_3_cin <= u0_m0_wo0_mtree_add1_1_p2_of_3_c;
    u0_m0_wo0_mtree_add1_1_p3_of_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((4 downto 4 => u0_m0_wo0_mtree_add1_1_BitSelect_for_a_BitJoin_for_d_q(3)) & u0_m0_wo0_mtree_add1_1_BitSelect_for_a_BitJoin_for_d_q) & '1');
    u0_m0_wo0_mtree_add1_1_p3_of_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((4 downto 4 => u0_m0_wo0_mtree_add1_1_BitSelect_for_b_BitJoin_for_d_q(3)) & u0_m0_wo0_mtree_add1_1_BitSelect_for_b_BitJoin_for_d_q) & u0_m0_wo0_mtree_add1_1_p3_of_3_cin(0));
    u0_m0_wo0_mtree_add1_1_p3_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_1_p3_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_1_p3_of_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_1_p3_of_3_a) + SIGNED(u0_m0_wo0_mtree_add1_1_p3_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_1_p3_of_3_q <= u0_m0_wo0_mtree_add1_1_p3_of_3_o(4 downto 1);

    -- u0_m0_wo0_mtree_add2_0_BitSelect_for_b_BitJoin_for_d(BITJOIN,551)@19
    u0_m0_wo0_mtree_add2_0_BitSelect_for_b_BitJoin_for_d_q <= u0_m0_wo0_mtree_add2_0_BitSelect_for_b_tessel2_1_b & u0_m0_wo0_mtree_add1_1_p3_of_3_q;

    -- u0_m0_wo0_mtree_add2_0_BitSelect_for_a_tessel2_1(BITSELECT,543)@19
    u0_m0_wo0_mtree_add2_0_BitSelect_for_a_tessel2_1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_add1_0_p3_of_3_q(3 downto 3));

    -- u0_m0_wo0_mtree_add1_0_BitSelect_for_b_tessel2_1(BITSELECT,479)@18
    u0_m0_wo0_mtree_add1_0_BitSelect_for_b_tessel2_1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_add0_1_p3_of_3_q(2 downto 2));

    -- d_u0_m0_wo0_mtree_mult1_3_q_17(DELAY,660)@16 + 1
    d_u0_m0_wo0_mtree_mult1_3_q_17 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_mtree_mult1_3_q_16_q, xout => d_u0_m0_wo0_mtree_mult1_3_q_17_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_1_BitSelect_for_b_tessel2_1(BITSELECT,367)@17
    u0_m0_wo0_mtree_add0_1_BitSelect_for_b_tessel2_1_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_3_q_17_q(23 downto 23));

    -- u0_m0_wo0_mtree_add0_1_BitSelect_for_b_tessel2_0(BITSELECT,366)@17
    u0_m0_wo0_mtree_add0_1_BitSelect_for_b_tessel2_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_3_q_17_q(23 downto 22));

    -- u0_m0_wo0_mtree_add0_1_BitSelect_for_b_BitJoin_for_d(BITJOIN,368)@17
    u0_m0_wo0_mtree_add0_1_BitSelect_for_b_BitJoin_for_d_q <= u0_m0_wo0_mtree_add0_1_BitSelect_for_b_tessel2_1_b & u0_m0_wo0_mtree_add0_1_BitSelect_for_b_tessel2_0_b;

    -- d_u0_m0_wo0_mtree_mult1_2_q_17(DELAY,662)@16 + 1
    d_u0_m0_wo0_mtree_mult1_2_q_17 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_mtree_mult1_2_q_16_q, xout => d_u0_m0_wo0_mtree_mult1_2_q_17_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_1_BitSelect_for_a_tessel2_1(BITSELECT,360)@17
    u0_m0_wo0_mtree_add0_1_BitSelect_for_a_tessel2_1_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_2_q_17_q(23 downto 23));

    -- u0_m0_wo0_mtree_add0_1_BitSelect_for_a_tessel2_0(BITSELECT,359)@17
    u0_m0_wo0_mtree_add0_1_BitSelect_for_a_tessel2_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_2_q_17_q(23 downto 22));

    -- u0_m0_wo0_mtree_add0_1_BitSelect_for_a_BitJoin_for_d(BITJOIN,361)@17
    u0_m0_wo0_mtree_add0_1_BitSelect_for_a_BitJoin_for_d_q <= u0_m0_wo0_mtree_add0_1_BitSelect_for_a_tessel2_1_b & u0_m0_wo0_mtree_add0_1_BitSelect_for_a_tessel2_0_b;

    -- u0_m0_wo0_mtree_add0_1_p3_of_3(ADD,134)@17 + 1
    u0_m0_wo0_mtree_add0_1_p3_of_3_cin <= u0_m0_wo0_mtree_add0_1_p2_of_3_c;
    u0_m0_wo0_mtree_add0_1_p3_of_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 3 => u0_m0_wo0_mtree_add0_1_BitSelect_for_a_BitJoin_for_d_q(2)) & u0_m0_wo0_mtree_add0_1_BitSelect_for_a_BitJoin_for_d_q) & '1');
    u0_m0_wo0_mtree_add0_1_p3_of_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 3 => u0_m0_wo0_mtree_add0_1_BitSelect_for_b_BitJoin_for_d_q(2)) & u0_m0_wo0_mtree_add0_1_BitSelect_for_b_BitJoin_for_d_q) & u0_m0_wo0_mtree_add0_1_p3_of_3_cin(0));
    u0_m0_wo0_mtree_add0_1_p3_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_1_p3_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_1_p3_of_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_1_p3_of_3_a) + SIGNED(u0_m0_wo0_mtree_add0_1_p3_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_1_p3_of_3_q <= u0_m0_wo0_mtree_add0_1_p3_of_3_o(3 downto 1);

    -- u0_m0_wo0_mtree_add1_0_BitSelect_for_b_BitJoin_for_d(BITJOIN,480)@18
    u0_m0_wo0_mtree_add1_0_BitSelect_for_b_BitJoin_for_d_q <= u0_m0_wo0_mtree_add1_0_BitSelect_for_b_tessel2_1_b & u0_m0_wo0_mtree_add0_1_p3_of_3_q;

    -- u0_m0_wo0_mtree_add1_0_BitSelect_for_a_tessel2_1(BITSELECT,472)@18
    u0_m0_wo0_mtree_add1_0_BitSelect_for_a_tessel2_1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_add0_0_p3_of_3_q(2 downto 2));

    -- d_u0_m0_wo0_mtree_mult1_1_q_17(DELAY,664)@16 + 1
    d_u0_m0_wo0_mtree_mult1_1_q_17 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_mtree_mult1_1_q_16_q, xout => d_u0_m0_wo0_mtree_mult1_1_q_17_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_0_BitSelect_for_b_tessel2_1(BITSELECT,353)@17
    u0_m0_wo0_mtree_add0_0_BitSelect_for_b_tessel2_1_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_1_q_17_q(23 downto 23));

    -- u0_m0_wo0_mtree_add0_0_BitSelect_for_b_tessel2_0(BITSELECT,352)@17
    u0_m0_wo0_mtree_add0_0_BitSelect_for_b_tessel2_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_1_q_17_q(23 downto 22));

    -- u0_m0_wo0_mtree_add0_0_BitSelect_for_b_BitJoin_for_d(BITJOIN,354)@17
    u0_m0_wo0_mtree_add0_0_BitSelect_for_b_BitJoin_for_d_q <= u0_m0_wo0_mtree_add0_0_BitSelect_for_b_tessel2_1_b & u0_m0_wo0_mtree_add0_0_BitSelect_for_b_tessel2_0_b;

    -- d_u0_m0_wo0_mtree_mult1_0_q_17(DELAY,666)@16 + 1
    d_u0_m0_wo0_mtree_mult1_0_q_17 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_mtree_mult1_0_q_16_q, xout => d_u0_m0_wo0_mtree_mult1_0_q_17_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_add0_0_BitSelect_for_a_tessel2_1(BITSELECT,346)@17
    u0_m0_wo0_mtree_add0_0_BitSelect_for_a_tessel2_1_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_0_q_17_q(23 downto 23));

    -- u0_m0_wo0_mtree_add0_0_BitSelect_for_a_tessel2_0(BITSELECT,345)@17
    u0_m0_wo0_mtree_add0_0_BitSelect_for_a_tessel2_0_b <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_0_q_17_q(23 downto 22));

    -- u0_m0_wo0_mtree_add0_0_BitSelect_for_a_BitJoin_for_d(BITJOIN,347)@17
    u0_m0_wo0_mtree_add0_0_BitSelect_for_a_BitJoin_for_d_q <= u0_m0_wo0_mtree_add0_0_BitSelect_for_a_tessel2_1_b & u0_m0_wo0_mtree_add0_0_BitSelect_for_a_tessel2_0_b;

    -- u0_m0_wo0_mtree_add0_0_p3_of_3(ADD,122)@17 + 1
    u0_m0_wo0_mtree_add0_0_p3_of_3_cin <= u0_m0_wo0_mtree_add0_0_p2_of_3_c;
    u0_m0_wo0_mtree_add0_0_p3_of_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 3 => u0_m0_wo0_mtree_add0_0_BitSelect_for_a_BitJoin_for_d_q(2)) & u0_m0_wo0_mtree_add0_0_BitSelect_for_a_BitJoin_for_d_q) & '1');
    u0_m0_wo0_mtree_add0_0_p3_of_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 3 => u0_m0_wo0_mtree_add0_0_BitSelect_for_b_BitJoin_for_d_q(2)) & u0_m0_wo0_mtree_add0_0_BitSelect_for_b_BitJoin_for_d_q) & u0_m0_wo0_mtree_add0_0_p3_of_3_cin(0));
    u0_m0_wo0_mtree_add0_0_p3_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_0_p3_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_0_p3_of_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_0_p3_of_3_a) + SIGNED(u0_m0_wo0_mtree_add0_0_p3_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_0_p3_of_3_q <= u0_m0_wo0_mtree_add0_0_p3_of_3_o(3 downto 1);

    -- u0_m0_wo0_mtree_add1_0_BitSelect_for_a_BitJoin_for_d(BITJOIN,473)@18
    u0_m0_wo0_mtree_add1_0_BitSelect_for_a_BitJoin_for_d_q <= u0_m0_wo0_mtree_add1_0_BitSelect_for_a_tessel2_1_b & u0_m0_wo0_mtree_add0_0_p3_of_3_q;

    -- u0_m0_wo0_mtree_add1_0_p3_of_3(ADD,230)@18 + 1
    u0_m0_wo0_mtree_add1_0_p3_of_3_cin <= u0_m0_wo0_mtree_add1_0_p2_of_3_c;
    u0_m0_wo0_mtree_add1_0_p3_of_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((4 downto 4 => u0_m0_wo0_mtree_add1_0_BitSelect_for_a_BitJoin_for_d_q(3)) & u0_m0_wo0_mtree_add1_0_BitSelect_for_a_BitJoin_for_d_q) & '1');
    u0_m0_wo0_mtree_add1_0_p3_of_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((4 downto 4 => u0_m0_wo0_mtree_add1_0_BitSelect_for_b_BitJoin_for_d_q(3)) & u0_m0_wo0_mtree_add1_0_BitSelect_for_b_BitJoin_for_d_q) & u0_m0_wo0_mtree_add1_0_p3_of_3_cin(0));
    u0_m0_wo0_mtree_add1_0_p3_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_0_p3_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_0_p3_of_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_0_p3_of_3_a) + SIGNED(u0_m0_wo0_mtree_add1_0_p3_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_0_p3_of_3_q <= u0_m0_wo0_mtree_add1_0_p3_of_3_o(4 downto 1);

    -- u0_m0_wo0_mtree_add2_0_BitSelect_for_a_BitJoin_for_d(BITJOIN,544)@19
    u0_m0_wo0_mtree_add2_0_BitSelect_for_a_BitJoin_for_d_q <= u0_m0_wo0_mtree_add2_0_BitSelect_for_a_tessel2_1_b & u0_m0_wo0_mtree_add1_0_p3_of_3_q;

    -- u0_m0_wo0_mtree_add2_0_p3_of_3(ADD,290)@19 + 1
    u0_m0_wo0_mtree_add2_0_p3_of_3_cin <= u0_m0_wo0_mtree_add2_0_p2_of_3_c;
    u0_m0_wo0_mtree_add2_0_p3_of_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((5 downto 5 => u0_m0_wo0_mtree_add2_0_BitSelect_for_a_BitJoin_for_d_q(4)) & u0_m0_wo0_mtree_add2_0_BitSelect_for_a_BitJoin_for_d_q) & '1');
    u0_m0_wo0_mtree_add2_0_p3_of_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((5 downto 5 => u0_m0_wo0_mtree_add2_0_BitSelect_for_b_BitJoin_for_d_q(4)) & u0_m0_wo0_mtree_add2_0_BitSelect_for_b_BitJoin_for_d_q) & u0_m0_wo0_mtree_add2_0_p3_of_3_cin(0));
    u0_m0_wo0_mtree_add2_0_p3_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_0_p3_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_0_p3_of_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_0_p3_of_3_a) + SIGNED(u0_m0_wo0_mtree_add2_0_p3_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_0_p3_of_3_q <= u0_m0_wo0_mtree_add2_0_p3_of_3_o(5 downto 1);

    -- u0_m0_wo0_mtree_add3_0_BitSelect_for_a_BitJoin_for_d(BITJOIN,572)@20
    u0_m0_wo0_mtree_add3_0_BitSelect_for_a_BitJoin_for_d_q <= u0_m0_wo0_mtree_add3_0_BitSelect_for_a_tessel2_1_b & u0_m0_wo0_mtree_add2_0_p3_of_3_q;

    -- u0_m0_wo0_mtree_add3_0_p3_of_3(ADD,314)@20 + 1
    u0_m0_wo0_mtree_add3_0_p3_of_3_cin <= u0_m0_wo0_mtree_add3_0_p2_of_3_c;
    u0_m0_wo0_mtree_add3_0_p3_of_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((6 downto 6 => u0_m0_wo0_mtree_add3_0_BitSelect_for_a_BitJoin_for_d_q(5)) & u0_m0_wo0_mtree_add3_0_BitSelect_for_a_BitJoin_for_d_q) & '1');
    u0_m0_wo0_mtree_add3_0_p3_of_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((6 downto 6 => u0_m0_wo0_mtree_add3_0_BitSelect_for_b_BitJoin_for_d_q(5)) & u0_m0_wo0_mtree_add3_0_BitSelect_for_b_BitJoin_for_d_q) & u0_m0_wo0_mtree_add3_0_p3_of_3_cin(0));
    u0_m0_wo0_mtree_add3_0_p3_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add3_0_p3_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add3_0_p3_of_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add3_0_p3_of_3_a) + SIGNED(u0_m0_wo0_mtree_add3_0_p3_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add3_0_p3_of_3_q <= u0_m0_wo0_mtree_add3_0_p3_of_3_o(6 downto 1);

    -- u0_m0_wo0_mtree_add4_0_BitSelect_for_a_BitJoin_for_d(BITJOIN,586)@21
    u0_m0_wo0_mtree_add4_0_BitSelect_for_a_BitJoin_for_d_q <= u0_m0_wo0_mtree_add4_0_BitSelect_for_a_tessel2_1_b & u0_m0_wo0_mtree_add3_0_p3_of_3_q;

    -- u0_m0_wo0_mtree_add4_0_p3_of_3(ADD,326)@21 + 1
    u0_m0_wo0_mtree_add4_0_p3_of_3_cin <= u0_m0_wo0_mtree_add4_0_p2_of_3_c;
    u0_m0_wo0_mtree_add4_0_p3_of_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((7 downto 7 => u0_m0_wo0_mtree_add4_0_BitSelect_for_a_BitJoin_for_d_q(6)) & u0_m0_wo0_mtree_add4_0_BitSelect_for_a_BitJoin_for_d_q) & '1');
    u0_m0_wo0_mtree_add4_0_p3_of_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((7 downto 7 => u0_m0_wo0_mtree_add4_0_BitSelect_for_b_BitJoin_for_d_q(6)) & u0_m0_wo0_mtree_add4_0_BitSelect_for_b_BitJoin_for_d_q) & u0_m0_wo0_mtree_add4_0_p3_of_3_cin(0));
    u0_m0_wo0_mtree_add4_0_p3_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add4_0_p3_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add4_0_p3_of_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add4_0_p3_of_3_a) + SIGNED(u0_m0_wo0_mtree_add4_0_p3_of_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add4_0_p3_of_3_q <= u0_m0_wo0_mtree_add4_0_p3_of_3_o(7 downto 1);

    -- u0_m0_wo0_accum_BitSelect_for_a_BitJoin_for_d(BITJOIN,602)@22
    u0_m0_wo0_accum_BitSelect_for_a_BitJoin_for_d_q <= u0_m0_wo0_accum_BitSelect_for_a_tessel2_1_b & u0_m0_wo0_mtree_add4_0_p3_of_3_q;

    -- u0_m0_wo0_accum_p3_of_3(ADD,339)@22 + 1
    u0_m0_wo0_accum_p3_of_3_cin <= u0_m0_wo0_accum_p2_of_3_c;
    u0_m0_wo0_accum_p3_of_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((8 downto 8 => u0_m0_wo0_accum_BitSelect_for_a_BitJoin_for_d_q(7)) & u0_m0_wo0_accum_BitSelect_for_a_BitJoin_for_d_q) & '1');
    u0_m0_wo0_accum_p3_of_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((8 downto 8 => u0_m0_wo0_accum_p3_of_3_q(7)) & u0_m0_wo0_accum_p3_of_3_q) & u0_m0_wo0_accum_p3_of_3_cin(0));
    u0_m0_wo0_accum_p3_of_3_i <= u0_m0_wo0_accum_p3_of_3_a;
    u0_m0_wo0_accum_p3_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_accum_p3_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_22_q = "1") THEN
                IF (d_u0_m0_wo0_aseq_q_22_q = "1") THEN
                    u0_m0_wo0_accum_p3_of_3_o <= u0_m0_wo0_accum_p3_of_3_i;
                ELSE
                    u0_m0_wo0_accum_p3_of_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_accum_p3_of_3_a) + SIGNED(u0_m0_wo0_accum_p3_of_3_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_accum_p3_of_3_q <= u0_m0_wo0_accum_p3_of_3_o(8 downto 1);

    -- d_u0_m0_wo0_accum_p2_of_3_q_23(DELAY,670)@22 + 1
    d_u0_m0_wo0_accum_p2_of_3_q_23 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_accum_p2_of_3_q, xout => d_u0_m0_wo0_accum_p2_of_3_q_23_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_accum_p1_of_3_q_23(DELAY,669)@21 + 2
    d_u0_m0_wo0_accum_p1_of_3_q_23 : dspba_delay
    GENERIC MAP ( width => 11, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_accum_p1_of_3_q, xout => d_u0_m0_wo0_accum_p1_of_3_q_23_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_accum_BitJoin_for_q(BITJOIN,340)@23
    u0_m0_wo0_accum_BitJoin_for_q_q <= u0_m0_wo0_accum_p3_of_3_q & d_u0_m0_wo0_accum_p2_of_3_q_23_q & d_u0_m0_wo0_accum_p1_of_3_q_23_q;

    -- GND(CONSTANT,0)@0
    GND_q <= "0";

    -- u0_m0_wo0_oseq(SEQUENCE,104)@21 + 1
    u0_m0_wo0_oseq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_oseq_c : SIGNED(3 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_c := "0001";
            u0_m0_wo0_oseq_q <= "0";
            u0_m0_wo0_oseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_21_q = "1") THEN
                IF (u0_m0_wo0_oseq_c = "0000") THEN
                    u0_m0_wo0_oseq_eq <= '1';
                ELSE
                    u0_m0_wo0_oseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_oseq_eq = '1') THEN
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c + 1;
                ELSE
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c - 1;
                END IF;
                u0_m0_wo0_oseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_c(3 downto 3));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_oseq_gated(LOGICAL,105)@22
    u0_m0_wo0_oseq_gated_q <= u0_m0_wo0_oseq_q and d_u0_m0_wo0_compute_q_22_q;

    -- u0_m0_wo0_oseq_gated_reg(REG,106)@22 + 1
    u0_m0_wo0_oseq_gated_reg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_gated_q);
        END IF;
    END PROCESS;

    -- xOut(PORTOUT,111)@23 + 1
    xOut_v <= u0_m0_wo0_oseq_gated_reg_q;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= u0_m0_wo0_accum_BitJoin_for_q_q;

END normal;
