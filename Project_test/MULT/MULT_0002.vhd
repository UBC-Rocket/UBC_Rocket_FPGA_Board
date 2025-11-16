-- ------------------------------------------------------------------------- 
-- Intel Altera DSP Builder Advanced Flow Tools Release Version 16.1
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2017 Intel Corporation.  All rights reserved.
-- Your use of  Intel  Corporation's design tools,  logic functions and other
-- software and tools,  and its AMPP  partner logic functions, and  any output
-- files  any of the  foregoing  device programming or simulation files),  and
-- any associated  documentation or information are expressly subject  to  the
-- terms and conditions  of the Intel FPGA Software License Agreement,
-- Intel  MegaCore  Function  License  Agreement, or other applicable license
-- agreement,  including,  without limitation,  that your use  is for the sole
-- purpose of  programming  logic  devices  manufactured by Intel and sold by
-- Intel or its authorized  distributors.  Please  refer  to  the  applicable
-- agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from MULT_0002
-- VHDL created on Sun Nov 09 22:19:30 2025


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

entity MULT_0002 is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        b : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end MULT_0002;

architecture normal of MULT_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid6_fpMulTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal expX_uid6_fpMulTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expY_uid7_fpMulTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal expY_uid7_fpMulTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal signX_uid8_fpMulTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal signX_uid8_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid9_fpMulTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal signY_uid9_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid10_fpMulTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWF_uid11_fpMulTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid12_fpMulTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_x_uid14_fpMulTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal frac_x_uid14_fpMulTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_x_uid15_fpMulTest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal excZ_x_uid15_fpMulTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal excZ_x_uid15_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid15_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid16_fpMulTest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid16_fpMulTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid16_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid16_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid17_fpMulTest_a : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsZero_uid17_fpMulTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsZero_uid17_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid18_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid18_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid19_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid19_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid19_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid20_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid20_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid20_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid21_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid21_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid22_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid22_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid23_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid23_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid23_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal frac_y_uid28_fpMulTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal frac_y_uid28_fpMulTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_y_uid29_fpMulTest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal excZ_y_uid29_fpMulTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal excZ_y_uid29_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid29_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid30_fpMulTest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid30_fpMulTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid30_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid30_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid31_fpMulTest_a : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsZero_uid31_fpMulTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsZero_uid31_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid32_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid32_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid33_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid33_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid33_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid34_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid34_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid34_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid35_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid35_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid36_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid36_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid37_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid37_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid37_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ofracX_uid40_fpMulTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal ofracY_uid43_fpMulTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal biasInc_uid45_fpMulTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal signR_uid48_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid48_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid48_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid48_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stickyRange_uid54_fpMulTest_in : STD_LOGIC_VECTOR (21 downto 0);
    signal stickyRange_uid54_fpMulTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal extraStickyBitOfProd_uid55_fpMulTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal extraStickyBitOfProd_uid55_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal extraStickyBit_uid56_fpMulTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal extraStickyBit_uid56_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stickyExtendedRange_uid57_fpMulTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal stickyRangeComparator_uid59_fpMulTest_a : STD_LOGIC_VECTOR (22 downto 0);
    signal stickyRangeComparator_uid59_fpMulTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal stickyRangeComparator_uid59_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sticky_uid60_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal sticky_uid60_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal sticky_uid60_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm1dto0_uid61_fpMulTest_in : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostNorm1dto0_uid61_fpMulTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal lrs_uid62_fpMulTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal roundBitDetectionConstant_uid63_fpMulTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal roundBitDetectionPattern_uid64_fpMulTest_a : STD_LOGIC_VECTOR (2 downto 0);
    signal roundBitDetectionPattern_uid64_fpMulTest_b : STD_LOGIC_VECTOR (2 downto 0);
    signal roundBitDetectionPattern_uid64_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid65_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid65_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid65_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBitAndNormalizationOp_uid68_fpMulTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal fracRPreExc_uid70_fpMulTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExc_uid70_fpMulTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPreExcExt_uid71_fpMulTest_in : STD_LOGIC_VECTOR (35 downto 0);
    signal expRPreExcExt_uid71_fpMulTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expRPreExc_uid72_fpMulTest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expRPreExc_uid72_fpMulTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal excXZAndExcYZ_uid76_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYZ_uid76_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYZ_uid76_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYR_uid77_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYR_uid77_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYR_uid77_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXR_uid78_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXR_uid78_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXR_uid78_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZC3_uid79_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excZC3_uid79_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excZC3_uid79_fpMulTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal excZC3_uid79_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid80_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid80_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid80_fpMulTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid80_fpMulTest_d : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid80_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid80_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIAndExcYI_uid81_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIAndExcYI_uid81_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIAndExcYI_uid81_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRAndExcYI_uid82_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRAndExcYI_uid82_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRAndExcYI_uid82_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYRAndExcXI_uid83_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excYRAndExcXI_uid83_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excYRAndExcXI_uid83_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ExcROvfAndInReg_uid84_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal ExcROvfAndInReg_uid84_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal ExcROvfAndInReg_uid84_fpMulTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal ExcROvfAndInReg_uid84_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid85_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid85_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid85_fpMulTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid85_fpMulTest_d : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid85_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid85_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXI_uid86_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXI_uid86_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXI_uid86_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYI_uid87_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYI_uid87_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYI_uid87_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ZeroTimesInf_uid88_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal ZeroTimesInf_uid88_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal ZeroTimesInf_uid88_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid89_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid89_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid89_fpMulTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid89_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid89_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid90_fpMulTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid91_fpMulTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal oneFracRPostExc2_uid92_fpMulTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPostExc_uid95_fpMulTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid95_fpMulTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid100_fpMulTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid100_fpMulTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal invExcRNaN_uid101_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaN_uid101_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid102_fpMulTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid102_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid102_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal R_uid103_fpMulTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_a_0_in : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_a_0_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_a_1_in : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_a_1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_b_0_in : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_b_0_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_b_1_in : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_b_1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_a0_b0_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_a0_b0_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_a0_b0_s1 : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_a0_b0_reset : std_logic;
    signal prodXY_uid105_prod_uid47_fpMulTest_a0_b0_q : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_a1_b0_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_a1_b0_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_a1_b0_s1 : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_a1_b0_reset : std_logic;
    signal prodXY_uid105_prod_uid47_fpMulTest_a1_b0_q : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_a0_b1_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_a0_b1_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_a0_b1_s1 : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_a0_b1_reset : std_logic;
    signal prodXY_uid105_prod_uid47_fpMulTest_a0_b1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_a1_b1_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_a1_b1_b0 : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_a1_b1_s1 : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_a1_b1_reset : std_logic;
    signal prodXY_uid105_prod_uid47_fpMulTest_a1_b1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_LSB_a0_b0_in : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_LSB_a0_b0_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_MSB_a0_b0_in : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_MSB_a0_b0_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_LSB_a1_b0_in : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_LSB_a1_b0_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_MSB_a1_b0_in : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_MSB_a1_b0_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_LSB_a0_b1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_LSB_a0_b1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_MSB_a0_b1_in : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_MSB_a0_b1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_LSB_a1_b1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_LSB_a1_b1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_MSB_a1_b1_in : STD_LOGIC_VECTOR (35 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_MSB_a1_b1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_zero_36_q : STD_LOGIC_VECTOR (17 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_joined_BJ_0_q : STD_LOGIC_VECTOR (71 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_joined_BJ_1_q : STD_LOGIC_VECTOR (71 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_joined_BJ_2_q : STD_LOGIC_VECTOR (71 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_signExtendBS_0_in : STD_LOGIC_VECTOR (71 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_signExtendBS_0_b : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_signExtendBS_1_in : STD_LOGIC_VECTOR (71 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_signExtendBS_1_b : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_signExtendBS_2_in : STD_LOGIC_VECTOR (71 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_signExtendBS_2_b : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_xorOne_a : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_xorOne_b : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_xorOne_c : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_xorOne_qi : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_xorOne_q : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_andAB_a : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_andAB_b : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_andAB_q : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_andAC_a : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_andAC_b : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_andAC_q : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_andBC_a : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_andBC_b : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_andBC_q : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_orOne_a : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_orOne_b : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_orOne_c : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_orOne_q : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_comp_0_out1_lsb_BS_in : STD_LOGIC_VECTOR (46 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_comp_0_out1_lsb_BS_b : STD_LOGIC_VECTOR (46 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_comp_0_out1_BJ_q : STD_LOGIC_VECTOR (47 downto 0);
    signal expSum_uid44_fpMulTest_BitExpansion_for_a_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid44_fpMulTest_BitExpansion_for_b_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid44_fpMulTest_BitSelect_for_a_in : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid44_fpMulTest_BitSelect_for_a_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expSum_uid44_fpMulTest_BitSelect_for_a_c : STD_LOGIC_VECTOR (2 downto 0);
    signal expSum_uid44_fpMulTest_BitSelect_for_b_in : STD_LOGIC_VECTOR (8 downto 0);
    signal expSum_uid44_fpMulTest_BitSelect_for_b_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expSum_uid44_fpMulTest_BitSelect_for_b_c : STD_LOGIC_VECTOR (2 downto 0);
    signal expSum_uid44_fpMulTest_p1_of_2_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expSum_uid44_fpMulTest_p1_of_2_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expSum_uid44_fpMulTest_p1_of_2_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expSum_uid44_fpMulTest_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expSum_uid44_fpMulTest_p1_of_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expSum_uid44_fpMulTest_p2_of_2_a : STD_LOGIC_VECTOR (4 downto 0);
    signal expSum_uid44_fpMulTest_p2_of_2_b : STD_LOGIC_VECTOR (4 downto 0);
    signal expSum_uid44_fpMulTest_p2_of_2_o : STD_LOGIC_VECTOR (4 downto 0);
    signal expSum_uid44_fpMulTest_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expSum_uid44_fpMulTest_p2_of_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal expSumMBias_uid46_fpMulTest_UpperBits_for_a_q : STD_LOGIC_VECTOR (1 downto 0);
    signal expSumMBias_uid46_fpMulTest_p1_of_2_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expSumMBias_uid46_fpMulTest_p1_of_2_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expSumMBias_uid46_fpMulTest_p1_of_2_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expSumMBias_uid46_fpMulTest_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expSumMBias_uid46_fpMulTest_p1_of_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expSumMBias_uid46_fpMulTest_p2_of_2_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expSumMBias_uid46_fpMulTest_p2_of_2_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expSumMBias_uid46_fpMulTest_p2_of_2_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expSumMBias_uid46_fpMulTest_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expSumMBias_uid46_fpMulTest_p2_of_2_q : STD_LOGIC_VECTOR (4 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitExpansion_for_b_q : STD_LOGIC_VECTOR (35 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_UpperBits_for_b_q : STD_LOGIC_VECTOR (9 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_in : STD_LOGIC_VECTOR (35 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p1_of_6_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p1_of_6_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p1_of_6_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p1_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p1_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p2_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p2_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p2_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p2_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p2_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p2_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p3_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p3_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p3_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p3_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p3_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p3_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p4_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p4_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p4_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p4_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p4_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p4_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p5_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p5_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p5_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p5_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p5_of_6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p5_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p6_of_6_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p6_of_6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p6_of_6_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p6_of_6_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_p6_of_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitJoin_for_q_q : STD_LOGIC_VECTOR (35 downto 0);
    signal expUdf_uid73_fpMulTest_UpperBits_for_a_q : STD_LOGIC_VECTOR (11 downto 0);
    signal expUdf_uid73_fpMulTest_p1_of_3_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expUdf_uid73_fpMulTest_p1_of_3_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expUdf_uid73_fpMulTest_p1_of_3_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expUdf_uid73_fpMulTest_p1_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expUdf_uid73_fpMulTest_p2_of_3_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expUdf_uid73_fpMulTest_p2_of_3_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expUdf_uid73_fpMulTest_p2_of_3_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expUdf_uid73_fpMulTest_p2_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expUdf_uid73_fpMulTest_p2_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expUdf_uid73_fpMulTest_p3_of_3_a : STD_LOGIC_VECTOR (2 downto 0);
    signal expUdf_uid73_fpMulTest_p3_of_3_b : STD_LOGIC_VECTOR (2 downto 0);
    signal expUdf_uid73_fpMulTest_p3_of_3_o : STD_LOGIC_VECTOR (2 downto 0);
    signal expUdf_uid73_fpMulTest_p3_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expUdf_uid73_fpMulTest_p3_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expUdf_uid73_fpMulTest_cout_n_a : STD_LOGIC_VECTOR (0 downto 0);
    signal expUdf_uid73_fpMulTest_cout_n_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid75_fpMulTest_UpperBits_for_b_q : STD_LOGIC_VECTOR (4 downto 0);
    signal expOvf_uid75_fpMulTest_p1_of_3_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expOvf_uid75_fpMulTest_p1_of_3_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expOvf_uid75_fpMulTest_p1_of_3_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expOvf_uid75_fpMulTest_p1_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid75_fpMulTest_p2_of_3_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expOvf_uid75_fpMulTest_p2_of_3_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expOvf_uid75_fpMulTest_p2_of_3_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expOvf_uid75_fpMulTest_p2_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid75_fpMulTest_p2_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid75_fpMulTest_p3_of_3_a : STD_LOGIC_VECTOR (2 downto 0);
    signal expOvf_uid75_fpMulTest_p3_of_3_b : STD_LOGIC_VECTOR (2 downto 0);
    signal expOvf_uid75_fpMulTest_p3_of_3_o : STD_LOGIC_VECTOR (2 downto 0);
    signal expOvf_uid75_fpMulTest_p3_of_3_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid75_fpMulTest_p3_of_3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid75_fpMulTest_cout_n_a : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid75_fpMulTest_cout_n_q : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_in : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_b : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_c : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_d : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_e : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_f : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_g : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_h : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_i : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_in : STD_LOGIC_VECTOR (47 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_b : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_c : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_d : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_e : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_f : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_g : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_h : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_i : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p1_of_8_a : STD_LOGIC_VECTOR (6 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p1_of_8_b : STD_LOGIC_VECTOR (6 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p1_of_8_o : STD_LOGIC_VECTOR (6 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p1_of_8_c : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p1_of_8_q : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p2_of_8_a : STD_LOGIC_VECTOR (7 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p2_of_8_b : STD_LOGIC_VECTOR (7 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p2_of_8_o : STD_LOGIC_VECTOR (7 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p2_of_8_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p2_of_8_c : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p2_of_8_q : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p3_of_8_a : STD_LOGIC_VECTOR (7 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p3_of_8_b : STD_LOGIC_VECTOR (7 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p3_of_8_o : STD_LOGIC_VECTOR (7 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p3_of_8_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p3_of_8_c : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p3_of_8_q : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p4_of_8_a : STD_LOGIC_VECTOR (7 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p4_of_8_b : STD_LOGIC_VECTOR (7 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p4_of_8_o : STD_LOGIC_VECTOR (7 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p4_of_8_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p4_of_8_c : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p4_of_8_q : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8_a : STD_LOGIC_VECTOR (7 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8_b : STD_LOGIC_VECTOR (7 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8_o : STD_LOGIC_VECTOR (7 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8_c : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8_q : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8_a : STD_LOGIC_VECTOR (7 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8_b : STD_LOGIC_VECTOR (7 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8_o : STD_LOGIC_VECTOR (7 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8_c : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8_q : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8_a : STD_LOGIC_VECTOR (7 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8_b : STD_LOGIC_VECTOR (7 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8_o : STD_LOGIC_VECTOR (7 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8_c : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8_q : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p8_of_8_a : STD_LOGIC_VECTOR (7 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p8_of_8_b : STD_LOGIC_VECTOR (7 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p8_of_8_o : STD_LOGIC_VECTOR (7 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p8_of_8_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p8_of_8_q : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitJoin_for_q_q : STD_LOGIC_VECTOR (47 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_p0_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_p0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_p1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_p1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_p2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_p2_q : STD_LOGIC_VECTOR (4 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_p3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_p3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_p4_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_p4_q : STD_LOGIC_VECTOR (4 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_p5_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_p5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_p6_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_p6_q : STD_LOGIC_VECTOR (4 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_p7_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_p7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_p8_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_p8_q : STD_LOGIC_VECTOR (3 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitJoin_for_q_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expSumMBias_uid46_fpMulTest_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (4 downto 0);
    signal expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel0_0_in : STD_LOGIC_VECTOR (9 downto 0);
    signal expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel0_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel1_0_in : STD_LOGIC_VECTOR (9 downto 0);
    signal expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (3 downto 0);
    signal expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel1_1_in : STD_LOGIC_VECTOR (9 downto 0);
    signal expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel1_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expSumMBias_uid46_fpMulTest_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (4 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel0_2_in : STD_LOGIC_VECTOR (4 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel0_2_b : STD_LOGIC_VECTOR (3 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel1_0_in : STD_LOGIC_VECTOR (4 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel1_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel1_2_in : STD_LOGIC_VECTOR (4 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel1_2_b : STD_LOGIC_VECTOR (3 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel2_0_in : STD_LOGIC_VECTOR (4 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel2_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel2_2_in : STD_LOGIC_VECTOR (4 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel2_2_b : STD_LOGIC_VECTOR (3 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_d_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel3_0_in : STD_LOGIC_VECTOR (4 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel3_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_e_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel5_1_in : STD_LOGIC_VECTOR (4 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel5_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_g_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel1_0_in : STD_LOGIC_VECTOR (22 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel2_0_in : STD_LOGIC_VECTOR (22 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel2_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel3_0_in : STD_LOGIC_VECTOR (22 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel3_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel4_0_in : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel4_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel4_2_in : STD_LOGIC_VECTOR (9 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel4_2_b : STD_LOGIC_VECTOR (3 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_BitJoin_for_f_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel5_0_in : STD_LOGIC_VECTOR (9 downto 0);
    signal expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel5_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expUdf_uid73_fpMulTest_BitSelect_for_a_tessel0_1_in : STD_LOGIC_VECTOR (11 downto 0);
    signal expUdf_uid73_fpMulTest_BitSelect_for_a_tessel0_1_b : STD_LOGIC_VECTOR (4 downto 0);
    signal expUdf_uid73_fpMulTest_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expUdf_uid73_fpMulTest_BitSelect_for_a_tessel1_0_in : STD_LOGIC_VECTOR (11 downto 0);
    signal expUdf_uid73_fpMulTest_BitSelect_for_a_tessel1_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expUdf_uid73_fpMulTest_BitSelect_for_a_tessel2_0_in : STD_LOGIC_VECTOR (11 downto 0);
    signal expUdf_uid73_fpMulTest_BitSelect_for_a_tessel2_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expUdf_uid73_fpMulTest_BitSelect_for_b_tessel2_0_in : STD_LOGIC_VECTOR (5 downto 0);
    signal expUdf_uid73_fpMulTest_BitSelect_for_b_tessel2_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid75_fpMulTest_BitSelect_for_b_tessel0_0_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expOvf_uid75_fpMulTest_BitSelect_for_b_tessel0_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expOvf_uid75_fpMulTest_BitSelect_for_b_tessel1_0_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expOvf_uid75_fpMulTest_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (1 downto 0);
    signal expOvf_uid75_fpMulTest_BitSelect_for_b_tessel1_1_in : STD_LOGIC_VECTOR (4 downto 0);
    signal expOvf_uid75_fpMulTest_BitSelect_for_b_tessel1_1_b : STD_LOGIC_VECTOR (3 downto 0);
    signal expOvf_uid75_fpMulTest_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expOvf_uid75_fpMulTest_BitSelect_for_b_tessel2_0_in : STD_LOGIC_VECTOR (4 downto 0);
    signal expOvf_uid75_fpMulTest_BitSelect_for_b_tessel2_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel0_0_in : STD_LOGIC_VECTOR (5 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel0_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel1_0_in : STD_LOGIC_VECTOR (5 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel1_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel2_0_in : STD_LOGIC_VECTOR (5 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel2_0_b : STD_LOGIC_VECTOR (4 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel3_0_in : STD_LOGIC_VECTOR (5 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel3_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel4_0_in : STD_LOGIC_VECTOR (5 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel4_0_b : STD_LOGIC_VECTOR (4 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel5_0_in : STD_LOGIC_VECTOR (5 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel5_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel6_0_in : STD_LOGIC_VECTOR (5 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel6_0_b : STD_LOGIC_VECTOR (4 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel7_0_in : STD_LOGIC_VECTOR (5 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel7_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel8_0_in : STD_LOGIC_VECTOR (5 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel8_0_b : STD_LOGIC_VECTOR (3 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel1_0_in : STD_LOGIC_VECTOR (5 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel2_0_in : STD_LOGIC_VECTOR (5 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel2_0_b : STD_LOGIC_VECTOR (4 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel3_0_in : STD_LOGIC_VECTOR (5 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel3_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel4_0_in : STD_LOGIC_VECTOR (5 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel4_0_b : STD_LOGIC_VECTOR (4 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel5_0_in : STD_LOGIC_VECTOR (5 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel5_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel6_0_in : STD_LOGIC_VECTOR (5 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel6_0_b : STD_LOGIC_VECTOR (4 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel7_0_in : STD_LOGIC_VECTOR (5 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel7_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel8_0_in : STD_LOGIC_VECTOR (5 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel8_0_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist0_normalizeBit_uid49_fpMulTest_tessel0_0_b_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_expOvf_uid75_fpMulTest_BitSelect_for_a_tessel2_0_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel4_0_b_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_e_q_4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist5_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_d_q_3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist6_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_c_q_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist7_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_b_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist8_fracRPostNorm_uid53_fpMulTest_p8_q_2_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist9_fracRPostNorm_uid53_fpMulTest_p7_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_fracRPostNorm_uid53_fpMulTest_p6_q_2_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist11_fracRPostNorm_uid53_fpMulTest_p5_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_fracRPostNorm_uid53_fpMulTest_p4_q_2_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist13_fracRPostNorm_uid53_fpMulTest_p3_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_fracRPostNorm_uid53_fpMulTest_p2_q_2_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist15_fracRPostNorm_uid53_fpMulTest_p1_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_fracRPostNorm_uid53_fpMulTest_p0_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist18_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8_q_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist19_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8_q_3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist20_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p4_of_8_q_4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist21_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p3_of_8_q_5_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist22_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p2_of_8_q_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist23_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p1_of_8_q_7_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist24_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_c_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist25_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_d_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist26_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_e_3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist27_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_f_4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist28_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_g_5_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist29_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_h_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist30_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_i_7_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist31_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_c_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist32_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_d_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist33_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_e_3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist34_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_f_4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist35_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_g_5_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist36_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_h_6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist37_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_i_7_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist38_expFracRPostRounding_uid69_fpMulTest_p5_of_6_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist39_expFracRPostRounding_uid69_fpMulTest_p4_of_6_q_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist40_expFracRPostRounding_uid69_fpMulTest_p3_of_6_q_3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist41_expFracRPostRounding_uid69_fpMulTest_p2_of_6_q_4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist42_expFracRPostRounding_uid69_fpMulTest_p1_of_6_q_5_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist43_expSum_uid44_fpMulTest_p2_of_2_q_16_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist44_expSum_uid44_fpMulTest_p1_of_2_q_16_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist45_expSum_uid44_fpMulTest_BitSelect_for_b_c_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist46_expSum_uid44_fpMulTest_BitSelect_for_a_c_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist47_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_comp_0_out1_lsb_BS_b_1_q : STD_LOGIC_VECTOR (46 downto 0);
    signal redist48_expRPreExc_uid72_fpMulTest_b_3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist49_fracRPreExc_uid70_fpMulTest_b_3_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist50_stickyExtendedRange_uid57_fpMulTest_q_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist51_signR_uid48_fpMulTest_q_23_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_fracXIsZero_uid31_fpMulTest_q_22_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_expXIsMax_uid30_fpMulTest_q_22_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_excZ_y_uid29_fpMulTest_q_22_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist55_fracXIsZero_uid17_fpMulTest_q_22_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist56_expXIsMax_uid16_fpMulTest_q_22_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist57_excZ_x_uid15_fpMulTest_q_22_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- xIn(GPIN,3)@0

    -- frac_x_uid14_fpMulTest(BITSELECT,13)@0
    frac_x_uid14_fpMulTest_in <= a;
    frac_x_uid14_fpMulTest_b <= frac_x_uid14_fpMulTest_in(22 downto 0);

    -- cstZeroWF_uid11_fpMulTest(CONSTANT,10)
    cstZeroWF_uid11_fpMulTest_q <= "00000000000000000000000";

    -- fracXIsZero_uid17_fpMulTest(LOGICAL,16)@0 + 1
    fracXIsZero_uid17_fpMulTest_a <= cstZeroWF_uid11_fpMulTest_q;
    fracXIsZero_uid17_fpMulTest_b <= frac_x_uid14_fpMulTest_b;
    fracXIsZero_uid17_fpMulTest_qi <= "1" WHEN fracXIsZero_uid17_fpMulTest_a = fracXIsZero_uid17_fpMulTest_b ELSE "0";
    fracXIsZero_uid17_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid17_fpMulTest_qi, xout => fracXIsZero_uid17_fpMulTest_q, clk => clk, aclr => areset );

    -- redist55_fracXIsZero_uid17_fpMulTest_q_22(DELAY,384)
    redist55_fracXIsZero_uid17_fpMulTest_q_22 : dspba_delay
    GENERIC MAP ( width => 1, depth => 21, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid17_fpMulTest_q, xout => redist55_fracXIsZero_uid17_fpMulTest_q_22_q, clk => clk, aclr => areset );

    -- cstAllOWE_uid10_fpMulTest(CONSTANT,9)
    cstAllOWE_uid10_fpMulTest_q <= "11111111";

    -- expX_uid6_fpMulTest(BITSELECT,5)@0
    expX_uid6_fpMulTest_in <= a;
    expX_uid6_fpMulTest_b <= expX_uid6_fpMulTest_in(30 downto 23);

    -- expXIsMax_uid16_fpMulTest(LOGICAL,15)@0 + 1
    expXIsMax_uid16_fpMulTest_a <= expX_uid6_fpMulTest_b;
    expXIsMax_uid16_fpMulTest_b <= cstAllOWE_uid10_fpMulTest_q;
    expXIsMax_uid16_fpMulTest_qi <= "1" WHEN expXIsMax_uid16_fpMulTest_a = expXIsMax_uid16_fpMulTest_b ELSE "0";
    expXIsMax_uid16_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid16_fpMulTest_qi, xout => expXIsMax_uid16_fpMulTest_q, clk => clk, aclr => areset );

    -- redist56_expXIsMax_uid16_fpMulTest_q_22(DELAY,385)
    redist56_expXIsMax_uid16_fpMulTest_q_22 : dspba_delay
    GENERIC MAP ( width => 1, depth => 21, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid16_fpMulTest_q, xout => redist56_expXIsMax_uid16_fpMulTest_q_22_q, clk => clk, aclr => areset );

    -- excI_x_uid19_fpMulTest(LOGICAL,18)@22
    excI_x_uid19_fpMulTest_a <= redist56_expXIsMax_uid16_fpMulTest_q_22_q;
    excI_x_uid19_fpMulTest_b <= redist55_fracXIsZero_uid17_fpMulTest_q_22_q;
    excI_x_uid19_fpMulTest_q <= excI_x_uid19_fpMulTest_a and excI_x_uid19_fpMulTest_b;

    -- cstAllZWE_uid12_fpMulTest(CONSTANT,11)
    cstAllZWE_uid12_fpMulTest_q <= "00000000";

    -- expY_uid7_fpMulTest(BITSELECT,6)@0
    expY_uid7_fpMulTest_in <= b;
    expY_uid7_fpMulTest_b <= expY_uid7_fpMulTest_in(30 downto 23);

    -- excZ_y_uid29_fpMulTest(LOGICAL,28)@0 + 1
    excZ_y_uid29_fpMulTest_a <= expY_uid7_fpMulTest_b;
    excZ_y_uid29_fpMulTest_b <= cstAllZWE_uid12_fpMulTest_q;
    excZ_y_uid29_fpMulTest_qi <= "1" WHEN excZ_y_uid29_fpMulTest_a = excZ_y_uid29_fpMulTest_b ELSE "0";
    excZ_y_uid29_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid29_fpMulTest_qi, xout => excZ_y_uid29_fpMulTest_q, clk => clk, aclr => areset );

    -- redist54_excZ_y_uid29_fpMulTest_q_22(DELAY,383)
    redist54_excZ_y_uid29_fpMulTest_q_22 : dspba_delay
    GENERIC MAP ( width => 1, depth => 21, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid29_fpMulTest_q, xout => redist54_excZ_y_uid29_fpMulTest_q_22_q, clk => clk, aclr => areset );

    -- excYZAndExcXI_uid86_fpMulTest(LOGICAL,85)@22
    excYZAndExcXI_uid86_fpMulTest_a <= redist54_excZ_y_uid29_fpMulTest_q_22_q;
    excYZAndExcXI_uid86_fpMulTest_b <= excI_x_uid19_fpMulTest_q;
    excYZAndExcXI_uid86_fpMulTest_q <= excYZAndExcXI_uid86_fpMulTest_a and excYZAndExcXI_uid86_fpMulTest_b;

    -- frac_y_uid28_fpMulTest(BITSELECT,27)@0
    frac_y_uid28_fpMulTest_in <= b;
    frac_y_uid28_fpMulTest_b <= frac_y_uid28_fpMulTest_in(22 downto 0);

    -- fracXIsZero_uid31_fpMulTest(LOGICAL,30)@0 + 1
    fracXIsZero_uid31_fpMulTest_a <= cstZeroWF_uid11_fpMulTest_q;
    fracXIsZero_uid31_fpMulTest_b <= frac_y_uid28_fpMulTest_b;
    fracXIsZero_uid31_fpMulTest_qi <= "1" WHEN fracXIsZero_uid31_fpMulTest_a = fracXIsZero_uid31_fpMulTest_b ELSE "0";
    fracXIsZero_uid31_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid31_fpMulTest_qi, xout => fracXIsZero_uid31_fpMulTest_q, clk => clk, aclr => areset );

    -- redist52_fracXIsZero_uid31_fpMulTest_q_22(DELAY,381)
    redist52_fracXIsZero_uid31_fpMulTest_q_22 : dspba_delay
    GENERIC MAP ( width => 1, depth => 21, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid31_fpMulTest_q, xout => redist52_fracXIsZero_uid31_fpMulTest_q_22_q, clk => clk, aclr => areset );

    -- expXIsMax_uid30_fpMulTest(LOGICAL,29)@0 + 1
    expXIsMax_uid30_fpMulTest_a <= expY_uid7_fpMulTest_b;
    expXIsMax_uid30_fpMulTest_b <= cstAllOWE_uid10_fpMulTest_q;
    expXIsMax_uid30_fpMulTest_qi <= "1" WHEN expXIsMax_uid30_fpMulTest_a = expXIsMax_uid30_fpMulTest_b ELSE "0";
    expXIsMax_uid30_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid30_fpMulTest_qi, xout => expXIsMax_uid30_fpMulTest_q, clk => clk, aclr => areset );

    -- redist53_expXIsMax_uid30_fpMulTest_q_22(DELAY,382)
    redist53_expXIsMax_uid30_fpMulTest_q_22 : dspba_delay
    GENERIC MAP ( width => 1, depth => 21, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid30_fpMulTest_q, xout => redist53_expXIsMax_uid30_fpMulTest_q_22_q, clk => clk, aclr => areset );

    -- excI_y_uid33_fpMulTest(LOGICAL,32)@22
    excI_y_uid33_fpMulTest_a <= redist53_expXIsMax_uid30_fpMulTest_q_22_q;
    excI_y_uid33_fpMulTest_b <= redist52_fracXIsZero_uid31_fpMulTest_q_22_q;
    excI_y_uid33_fpMulTest_q <= excI_y_uid33_fpMulTest_a and excI_y_uid33_fpMulTest_b;

    -- excZ_x_uid15_fpMulTest(LOGICAL,14)@0 + 1
    excZ_x_uid15_fpMulTest_a <= expX_uid6_fpMulTest_b;
    excZ_x_uid15_fpMulTest_b <= cstAllZWE_uid12_fpMulTest_q;
    excZ_x_uid15_fpMulTest_qi <= "1" WHEN excZ_x_uid15_fpMulTest_a = excZ_x_uid15_fpMulTest_b ELSE "0";
    excZ_x_uid15_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid15_fpMulTest_qi, xout => excZ_x_uid15_fpMulTest_q, clk => clk, aclr => areset );

    -- redist57_excZ_x_uid15_fpMulTest_q_22(DELAY,386)
    redist57_excZ_x_uid15_fpMulTest_q_22 : dspba_delay
    GENERIC MAP ( width => 1, depth => 21, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid15_fpMulTest_q, xout => redist57_excZ_x_uid15_fpMulTest_q_22_q, clk => clk, aclr => areset );

    -- excXZAndExcYI_uid87_fpMulTest(LOGICAL,86)@22
    excXZAndExcYI_uid87_fpMulTest_a <= redist57_excZ_x_uid15_fpMulTest_q_22_q;
    excXZAndExcYI_uid87_fpMulTest_b <= excI_y_uid33_fpMulTest_q;
    excXZAndExcYI_uid87_fpMulTest_q <= excXZAndExcYI_uid87_fpMulTest_a and excXZAndExcYI_uid87_fpMulTest_b;

    -- ZeroTimesInf_uid88_fpMulTest(LOGICAL,87)@22
    ZeroTimesInf_uid88_fpMulTest_a <= excXZAndExcYI_uid87_fpMulTest_q;
    ZeroTimesInf_uid88_fpMulTest_b <= excYZAndExcXI_uid86_fpMulTest_q;
    ZeroTimesInf_uid88_fpMulTest_q <= ZeroTimesInf_uid88_fpMulTest_a or ZeroTimesInf_uid88_fpMulTest_b;

    -- fracXIsNotZero_uid32_fpMulTest(LOGICAL,31)@22
    fracXIsNotZero_uid32_fpMulTest_a <= redist52_fracXIsZero_uid31_fpMulTest_q_22_q;
    fracXIsNotZero_uid32_fpMulTest_q <= not (fracXIsNotZero_uid32_fpMulTest_a);

    -- excN_y_uid34_fpMulTest(LOGICAL,33)@22
    excN_y_uid34_fpMulTest_a <= redist53_expXIsMax_uid30_fpMulTest_q_22_q;
    excN_y_uid34_fpMulTest_b <= fracXIsNotZero_uid32_fpMulTest_q;
    excN_y_uid34_fpMulTest_q <= excN_y_uid34_fpMulTest_a and excN_y_uid34_fpMulTest_b;

    -- fracXIsNotZero_uid18_fpMulTest(LOGICAL,17)@22
    fracXIsNotZero_uid18_fpMulTest_a <= redist55_fracXIsZero_uid17_fpMulTest_q_22_q;
    fracXIsNotZero_uid18_fpMulTest_q <= not (fracXIsNotZero_uid18_fpMulTest_a);

    -- excN_x_uid20_fpMulTest(LOGICAL,19)@22
    excN_x_uid20_fpMulTest_a <= redist56_expXIsMax_uid16_fpMulTest_q_22_q;
    excN_x_uid20_fpMulTest_b <= fracXIsNotZero_uid18_fpMulTest_q;
    excN_x_uid20_fpMulTest_q <= excN_x_uid20_fpMulTest_a and excN_x_uid20_fpMulTest_b;

    -- excRNaN_uid89_fpMulTest(LOGICAL,88)@22 + 1
    excRNaN_uid89_fpMulTest_a <= excN_x_uid20_fpMulTest_q;
    excRNaN_uid89_fpMulTest_b <= excN_y_uid34_fpMulTest_q;
    excRNaN_uid89_fpMulTest_c <= ZeroTimesInf_uid88_fpMulTest_q;
    excRNaN_uid89_fpMulTest_qi <= excRNaN_uid89_fpMulTest_a or excRNaN_uid89_fpMulTest_b or excRNaN_uid89_fpMulTest_c;
    excRNaN_uid89_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaN_uid89_fpMulTest_qi, xout => excRNaN_uid89_fpMulTest_q, clk => clk, aclr => areset );

    -- invExcRNaN_uid101_fpMulTest(LOGICAL,100)@23
    invExcRNaN_uid101_fpMulTest_a <= excRNaN_uid89_fpMulTest_q;
    invExcRNaN_uid101_fpMulTest_q <= not (invExcRNaN_uid101_fpMulTest_a);

    -- signY_uid9_fpMulTest(BITSELECT,8)@0
    signY_uid9_fpMulTest_in <= STD_LOGIC_VECTOR(b);
    signY_uid9_fpMulTest_b <= STD_LOGIC_VECTOR(signY_uid9_fpMulTest_in(31 downto 31));

    -- signX_uid8_fpMulTest(BITSELECT,7)@0
    signX_uid8_fpMulTest_in <= STD_LOGIC_VECTOR(a);
    signX_uid8_fpMulTest_b <= STD_LOGIC_VECTOR(signX_uid8_fpMulTest_in(31 downto 31));

    -- signR_uid48_fpMulTest(LOGICAL,47)@0 + 1
    signR_uid48_fpMulTest_a <= signX_uid8_fpMulTest_b;
    signR_uid48_fpMulTest_b <= signY_uid9_fpMulTest_b;
    signR_uid48_fpMulTest_qi <= signR_uid48_fpMulTest_a xor signR_uid48_fpMulTest_b;
    signR_uid48_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid48_fpMulTest_qi, xout => signR_uid48_fpMulTest_q, clk => clk, aclr => areset );

    -- redist51_signR_uid48_fpMulTest_q_23(DELAY,380)
    redist51_signR_uid48_fpMulTest_q_23 : dspba_delay
    GENERIC MAP ( width => 1, depth => 22, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid48_fpMulTest_q, xout => redist51_signR_uid48_fpMulTest_q_23_q, clk => clk, aclr => areset );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- signRPostExc_uid102_fpMulTest(LOGICAL,101)@23
    signRPostExc_uid102_fpMulTest_a <= redist51_signR_uid48_fpMulTest_q_23_q;
    signRPostExc_uid102_fpMulTest_b <= invExcRNaN_uid101_fpMulTest_q;
    signRPostExc_uid102_fpMulTest_q <= signRPostExc_uid102_fpMulTest_a and signRPostExc_uid102_fpMulTest_b;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- expFracRPostRounding_uid69_fpMulTest_UpperBits_for_b(CONSTANT,165)
    expFracRPostRounding_uid69_fpMulTest_UpperBits_for_b_q <= "0000000000";

    -- ofracY_uid43_fpMulTest(BITJOIN,42)@0
    ofracY_uid43_fpMulTest_q <= VCC_q & frac_y_uid28_fpMulTest_b;

    -- prodXY_uid105_prod_uid47_fpMulTest_b_1(BITSELECT,110)@0
    prodXY_uid105_prod_uid47_fpMulTest_b_1_in <= STD_LOGIC_VECTOR("000000000000" & ofracY_uid43_fpMulTest_q);
    prodXY_uid105_prod_uid47_fpMulTest_b_1_b <= prodXY_uid105_prod_uid47_fpMulTest_b_1_in(35 downto 18);

    -- ofracX_uid40_fpMulTest(BITJOIN,39)@0
    ofracX_uid40_fpMulTest_q <= VCC_q & frac_x_uid14_fpMulTest_b;

    -- prodXY_uid105_prod_uid47_fpMulTest_a_1(BITSELECT,108)@0
    prodXY_uid105_prod_uid47_fpMulTest_a_1_in <= STD_LOGIC_VECTOR("000000000000" & ofracX_uid40_fpMulTest_q);
    prodXY_uid105_prod_uid47_fpMulTest_a_1_b <= prodXY_uid105_prod_uid47_fpMulTest_a_1_in(35 downto 18);

    -- prodXY_uid105_prod_uid47_fpMulTest_a1_b1(MULT,114)@0 + 2
    prodXY_uid105_prod_uid47_fpMulTest_a1_b1_a0 <= prodXY_uid105_prod_uid47_fpMulTest_a_1_b;
    prodXY_uid105_prod_uid47_fpMulTest_a1_b1_b0 <= prodXY_uid105_prod_uid47_fpMulTest_b_1_b;
    prodXY_uid105_prod_uid47_fpMulTest_a1_b1_reset <= areset;
    prodXY_uid105_prod_uid47_fpMulTest_a1_b1_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 18,
        lpm_widthp => 36,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => prodXY_uid105_prod_uid47_fpMulTest_a1_b1_a0,
        datab => prodXY_uid105_prod_uid47_fpMulTest_a1_b1_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid105_prod_uid47_fpMulTest_a1_b1_reset,
        clock => clk,
        result => prodXY_uid105_prod_uid47_fpMulTest_a1_b1_s1
    );
    prodXY_uid105_prod_uid47_fpMulTest_a1_b1_q <= prodXY_uid105_prod_uid47_fpMulTest_a1_b1_s1;

    -- prodXY_uid105_prod_uid47_fpMulTest_LSB_a1_b1(BITSELECT,121)@2
    prodXY_uid105_prod_uid47_fpMulTest_LSB_a1_b1_in <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_a1_b1_q(17 downto 0));
    prodXY_uid105_prod_uid47_fpMulTest_LSB_a1_b1_b <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_LSB_a1_b1_in(17 downto 0));

    -- prodXY_uid105_prod_uid47_fpMulTest_a_0(BITSELECT,107)@0
    prodXY_uid105_prod_uid47_fpMulTest_a_0_in <= ofracX_uid40_fpMulTest_q(17 downto 0);
    prodXY_uid105_prod_uid47_fpMulTest_a_0_b <= prodXY_uid105_prod_uid47_fpMulTest_a_0_in(17 downto 0);

    -- prodXY_uid105_prod_uid47_fpMulTest_a0_b1(MULT,113)@0 + 2
    prodXY_uid105_prod_uid47_fpMulTest_a0_b1_a0 <= prodXY_uid105_prod_uid47_fpMulTest_a_0_b;
    prodXY_uid105_prod_uid47_fpMulTest_a0_b1_b0 <= prodXY_uid105_prod_uid47_fpMulTest_b_1_b;
    prodXY_uid105_prod_uid47_fpMulTest_a0_b1_reset <= areset;
    prodXY_uid105_prod_uid47_fpMulTest_a0_b1_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 18,
        lpm_widthp => 36,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => prodXY_uid105_prod_uid47_fpMulTest_a0_b1_a0,
        datab => prodXY_uid105_prod_uid47_fpMulTest_a0_b1_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid105_prod_uid47_fpMulTest_a0_b1_reset,
        clock => clk,
        result => prodXY_uid105_prod_uid47_fpMulTest_a0_b1_s1
    );
    prodXY_uid105_prod_uid47_fpMulTest_a0_b1_q <= prodXY_uid105_prod_uid47_fpMulTest_a0_b1_s1;

    -- prodXY_uid105_prod_uid47_fpMulTest_LSB_a0_b1(BITSELECT,119)@2
    prodXY_uid105_prod_uid47_fpMulTest_LSB_a0_b1_in <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_a0_b1_q(17 downto 0));
    prodXY_uid105_prod_uid47_fpMulTest_LSB_a0_b1_b <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_LSB_a0_b1_in(17 downto 0));

    -- prodXY_uid105_prod_uid47_fpMulTest_zero_36(CONSTANT,124)
    prodXY_uid105_prod_uid47_fpMulTest_zero_36_q <= "000000000000000000";

    -- prodXY_uid105_prod_uid47_fpMulTest_joined_BJ_2(BITJOIN,128)@2
    prodXY_uid105_prod_uid47_fpMulTest_joined_BJ_2_q <= prodXY_uid105_prod_uid47_fpMulTest_zero_36_q & prodXY_uid105_prod_uid47_fpMulTest_LSB_a1_b1_b & prodXY_uid105_prod_uid47_fpMulTest_LSB_a0_b1_b & prodXY_uid105_prod_uid47_fpMulTest_zero_36_q;

    -- prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_signExtendBS_2(BITSELECT,131)@2
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_signExtendBS_2_in <= prodXY_uid105_prod_uid47_fpMulTest_joined_BJ_2_q;
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_signExtendBS_2_b <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_signExtendBS_2_in(47 downto 0);

    -- prodXY_uid105_prod_uid47_fpMulTest_MSB_a0_b1(BITSELECT,120)@2
    prodXY_uid105_prod_uid47_fpMulTest_MSB_a0_b1_in <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_a0_b1_q);
    prodXY_uid105_prod_uid47_fpMulTest_MSB_a0_b1_b <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_MSB_a0_b1_in(35 downto 18));

    -- prodXY_uid105_prod_uid47_fpMulTest_b_0(BITSELECT,109)@0
    prodXY_uid105_prod_uid47_fpMulTest_b_0_in <= ofracY_uid43_fpMulTest_q(17 downto 0);
    prodXY_uid105_prod_uid47_fpMulTest_b_0_b <= prodXY_uid105_prod_uid47_fpMulTest_b_0_in(17 downto 0);

    -- prodXY_uid105_prod_uid47_fpMulTest_a1_b0(MULT,112)@0 + 2
    prodXY_uid105_prod_uid47_fpMulTest_a1_b0_a0 <= prodXY_uid105_prod_uid47_fpMulTest_a_1_b;
    prodXY_uid105_prod_uid47_fpMulTest_a1_b0_b0 <= prodXY_uid105_prod_uid47_fpMulTest_b_0_b;
    prodXY_uid105_prod_uid47_fpMulTest_a1_b0_reset <= areset;
    prodXY_uid105_prod_uid47_fpMulTest_a1_b0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 18,
        lpm_widthp => 36,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => prodXY_uid105_prod_uid47_fpMulTest_a1_b0_a0,
        datab => prodXY_uid105_prod_uid47_fpMulTest_a1_b0_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid105_prod_uid47_fpMulTest_a1_b0_reset,
        clock => clk,
        result => prodXY_uid105_prod_uid47_fpMulTest_a1_b0_s1
    );
    prodXY_uid105_prod_uid47_fpMulTest_a1_b0_q <= prodXY_uid105_prod_uid47_fpMulTest_a1_b0_s1;

    -- prodXY_uid105_prod_uid47_fpMulTest_LSB_a1_b0(BITSELECT,117)@2
    prodXY_uid105_prod_uid47_fpMulTest_LSB_a1_b0_in <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_a1_b0_q(17 downto 0));
    prodXY_uid105_prod_uid47_fpMulTest_LSB_a1_b0_b <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_LSB_a1_b0_in(17 downto 0));

    -- prodXY_uid105_prod_uid47_fpMulTest_joined_BJ_1(BITJOIN,127)@2
    prodXY_uid105_prod_uid47_fpMulTest_joined_BJ_1_q <= prodXY_uid105_prod_uid47_fpMulTest_zero_36_q & prodXY_uid105_prod_uid47_fpMulTest_MSB_a0_b1_b & prodXY_uid105_prod_uid47_fpMulTest_LSB_a1_b0_b & prodXY_uid105_prod_uid47_fpMulTest_zero_36_q;

    -- prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_signExtendBS_1(BITSELECT,130)@2
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_signExtendBS_1_in <= prodXY_uid105_prod_uid47_fpMulTest_joined_BJ_1_q;
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_signExtendBS_1_b <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_signExtendBS_1_in(47 downto 0);

    -- prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_andBC(LOGICAL,137)@2
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_andBC_a <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_signExtendBS_1_b);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_andBC_b <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_signExtendBS_2_b);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_andBC_q <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_andBC_a and prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_andBC_b;

    -- prodXY_uid105_prod_uid47_fpMulTest_MSB_a1_b1(BITSELECT,122)@2
    prodXY_uid105_prod_uid47_fpMulTest_MSB_a1_b1_in <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_a1_b1_q);
    prodXY_uid105_prod_uid47_fpMulTest_MSB_a1_b1_b <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_MSB_a1_b1_in(35 downto 18));

    -- prodXY_uid105_prod_uid47_fpMulTest_MSB_a1_b0(BITSELECT,118)@2
    prodXY_uid105_prod_uid47_fpMulTest_MSB_a1_b0_in <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_a1_b0_q);
    prodXY_uid105_prod_uid47_fpMulTest_MSB_a1_b0_b <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_MSB_a1_b0_in(35 downto 18));

    -- prodXY_uid105_prod_uid47_fpMulTest_a0_b0(MULT,111)@0 + 2
    prodXY_uid105_prod_uid47_fpMulTest_a0_b0_a0 <= prodXY_uid105_prod_uid47_fpMulTest_a_0_b;
    prodXY_uid105_prod_uid47_fpMulTest_a0_b0_b0 <= prodXY_uid105_prod_uid47_fpMulTest_b_0_b;
    prodXY_uid105_prod_uid47_fpMulTest_a0_b0_reset <= areset;
    prodXY_uid105_prod_uid47_fpMulTest_a0_b0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 18,
        lpm_widthp => 36,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => prodXY_uid105_prod_uid47_fpMulTest_a0_b0_a0,
        datab => prodXY_uid105_prod_uid47_fpMulTest_a0_b0_b0,
        clken => VCC_q(0),
        aclr => prodXY_uid105_prod_uid47_fpMulTest_a0_b0_reset,
        clock => clk,
        result => prodXY_uid105_prod_uid47_fpMulTest_a0_b0_s1
    );
    prodXY_uid105_prod_uid47_fpMulTest_a0_b0_q <= prodXY_uid105_prod_uid47_fpMulTest_a0_b0_s1;

    -- prodXY_uid105_prod_uid47_fpMulTest_MSB_a0_b0(BITSELECT,116)@2
    prodXY_uid105_prod_uid47_fpMulTest_MSB_a0_b0_in <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_a0_b0_q);
    prodXY_uid105_prod_uid47_fpMulTest_MSB_a0_b0_b <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_MSB_a0_b0_in(35 downto 18));

    -- prodXY_uid105_prod_uid47_fpMulTest_LSB_a0_b0(BITSELECT,115)@2
    prodXY_uid105_prod_uid47_fpMulTest_LSB_a0_b0_in <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_a0_b0_q(17 downto 0));
    prodXY_uid105_prod_uid47_fpMulTest_LSB_a0_b0_b <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_LSB_a0_b0_in(17 downto 0));

    -- prodXY_uid105_prod_uid47_fpMulTest_joined_BJ_0(BITJOIN,126)@2
    prodXY_uid105_prod_uid47_fpMulTest_joined_BJ_0_q <= prodXY_uid105_prod_uid47_fpMulTest_MSB_a1_b1_b & prodXY_uid105_prod_uid47_fpMulTest_MSB_a1_b0_b & prodXY_uid105_prod_uid47_fpMulTest_MSB_a0_b0_b & prodXY_uid105_prod_uid47_fpMulTest_LSB_a0_b0_b;

    -- prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_signExtendBS_0(BITSELECT,129)@2
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_signExtendBS_0_in <= prodXY_uid105_prod_uid47_fpMulTest_joined_BJ_0_q;
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_signExtendBS_0_b <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_signExtendBS_0_in(47 downto 0);

    -- prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_andAC(LOGICAL,136)@2
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_andAC_a <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_signExtendBS_0_b);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_andAC_b <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_signExtendBS_2_b);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_andAC_q <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_andAC_a and prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_andAC_b;

    -- prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_andAB(LOGICAL,135)@2
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_andAB_a <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_signExtendBS_0_b);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_andAB_b <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_signExtendBS_1_b);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_andAB_q <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_andAB_a and prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_andAB_b;

    -- prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_orOne(LOGICAL,138)@2
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_orOne_a <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_andAB_q);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_orOne_b <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_andAC_q);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_orOne_c <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_andBC_q);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_orOne_q <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_orOne_a or prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_orOne_b or prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_orOne_c;

    -- prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_comp_0_out1_lsb_BS(BITSELECT,139)@2
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_comp_0_out1_lsb_BS_in <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_orOne_q(46 downto 0));
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_comp_0_out1_lsb_BS_b <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_comp_0_out1_lsb_BS_in(46 downto 0));

    -- redist47_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_comp_0_out1_lsb_BS_b_1(DELAY,376)
    redist47_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_comp_0_out1_lsb_BS_b_1 : dspba_delay
    GENERIC MAP ( width => 47, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_comp_0_out1_lsb_BS_b, xout => redist47_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_comp_0_out1_lsb_BS_b_1_q, clk => clk, aclr => areset );

    -- prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_comp_0_out1_BJ(BITJOIN,140)@3
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_comp_0_out1_BJ_q <= redist47_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_comp_0_out1_lsb_BS_b_1_q & GND_q;

    -- prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b(BITSELECT,200)@3
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_in <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_comp_0_out1_BJ_q;
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_b <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_in(5 downto 0);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_c <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_in(11 downto 6);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_d <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_in(17 downto 12);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_e <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_in(23 downto 18);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_f <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_in(29 downto 24);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_g <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_in(35 downto 30);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_h <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_in(41 downto 36);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_i <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_in(47 downto 42);

    -- prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_xorOne(LOGICAL,134)@2 + 1
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_xorOne_a <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_signExtendBS_0_b);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_xorOne_b <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_signExtendBS_1_b);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_xorOne_c <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_signExtendBS_2_b);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_xorOne_qi <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_xorOne_a xor prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_xorOne_b xor prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_xorOne_c;
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_xorOne_delay : dspba_delay
    GENERIC MAP ( width => 48, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_xorOne_qi, xout => prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_xorOne_q, clk => clk, aclr => areset );

    -- prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a(BITSELECT,199)@3
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_in <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_32COMP0_xorOne_q;
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_b <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_in(5 downto 0);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_c <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_in(11 downto 6);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_d <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_in(17 downto 12);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_e <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_in(23 downto 18);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_f <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_in(29 downto 24);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_g <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_in(35 downto 30);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_h <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_in(41 downto 36);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_i <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_in(47 downto 42);

    -- prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p1_of_8(ADD,201)@3 + 1
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p1_of_8_a <= STD_LOGIC_VECTOR("0" & prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_b);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p1_of_8_b <= STD_LOGIC_VECTOR("0" & prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_b);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p1_of_8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p1_of_8_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p1_of_8_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p1_of_8_a) + UNSIGNED(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p1_of_8_b));
        END IF;
    END PROCESS;
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p1_of_8_c(0) <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p1_of_8_o(6);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p1_of_8_q <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p1_of_8_o(5 downto 0);

    -- redist24_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_c_1(DELAY,353)
    redist24_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_c_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_c, xout => redist24_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_c_1_q, clk => clk, aclr => areset );

    -- redist31_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_c_1(DELAY,360)
    redist31_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_c_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_c, xout => redist31_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_c_1_q, clk => clk, aclr => areset );

    -- prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p2_of_8(ADD,202)@4 + 1
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p2_of_8_cin <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p1_of_8_c;
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p2_of_8_a <= STD_LOGIC_VECTOR("0" & redist31_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_c_1_q) & '1';
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p2_of_8_b <= STD_LOGIC_VECTOR("0" & redist24_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_c_1_q) & prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p2_of_8_cin(0);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p2_of_8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p2_of_8_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p2_of_8_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p2_of_8_a) + UNSIGNED(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p2_of_8_b));
        END IF;
    END PROCESS;
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p2_of_8_c(0) <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p2_of_8_o(7);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p2_of_8_q <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p2_of_8_o(6 downto 1);

    -- redist25_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_d_2(DELAY,354)
    redist25_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_d_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_d, xout => redist25_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_d_2_q, clk => clk, aclr => areset );

    -- redist32_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_d_2(DELAY,361)
    redist32_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_d_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_d, xout => redist32_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_d_2_q, clk => clk, aclr => areset );

    -- prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p3_of_8(ADD,203)@5 + 1
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p3_of_8_cin <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p2_of_8_c;
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p3_of_8_a <= STD_LOGIC_VECTOR("0" & redist32_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_d_2_q) & '1';
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p3_of_8_b <= STD_LOGIC_VECTOR("0" & redist25_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_d_2_q) & prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p3_of_8_cin(0);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p3_of_8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p3_of_8_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p3_of_8_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p3_of_8_a) + UNSIGNED(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p3_of_8_b));
        END IF;
    END PROCESS;
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p3_of_8_c(0) <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p3_of_8_o(7);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p3_of_8_q <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p3_of_8_o(6 downto 1);

    -- redist26_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_e_3(DELAY,355)
    redist26_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_e_3 : dspba_delay
    GENERIC MAP ( width => 6, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_e, xout => redist26_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_e_3_q, clk => clk, aclr => areset );

    -- redist33_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_e_3(DELAY,362)
    redist33_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_e_3 : dspba_delay
    GENERIC MAP ( width => 6, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_e, xout => redist33_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_e_3_q, clk => clk, aclr => areset );

    -- prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p4_of_8(ADD,204)@6 + 1
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p4_of_8_cin <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p3_of_8_c;
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p4_of_8_a <= STD_LOGIC_VECTOR("0" & redist33_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_e_3_q) & '1';
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p4_of_8_b <= STD_LOGIC_VECTOR("0" & redist26_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_e_3_q) & prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p4_of_8_cin(0);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p4_of_8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p4_of_8_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p4_of_8_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p4_of_8_a) + UNSIGNED(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p4_of_8_b));
        END IF;
    END PROCESS;
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p4_of_8_c(0) <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p4_of_8_o(7);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p4_of_8_q <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p4_of_8_o(6 downto 1);

    -- redist27_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_f_4(DELAY,356)
    redist27_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_f_4 : dspba_delay
    GENERIC MAP ( width => 6, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_f, xout => redist27_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_f_4_q, clk => clk, aclr => areset );

    -- redist34_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_f_4(DELAY,363)
    redist34_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_f_4 : dspba_delay
    GENERIC MAP ( width => 6, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_f, xout => redist34_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_f_4_q, clk => clk, aclr => areset );

    -- prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8(ADD,205)@7 + 1
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8_cin <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p4_of_8_c;
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8_a <= STD_LOGIC_VECTOR("0" & redist34_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_f_4_q) & '1';
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8_b <= STD_LOGIC_VECTOR("0" & redist27_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_f_4_q) & prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8_cin(0);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8_a) + UNSIGNED(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8_b));
        END IF;
    END PROCESS;
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8_c(0) <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8_o(7);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8_q <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8_o(6 downto 1);

    -- redist28_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_g_5(DELAY,357)
    redist28_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_g_5 : dspba_delay
    GENERIC MAP ( width => 6, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_g, xout => redist28_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_g_5_q, clk => clk, aclr => areset );

    -- redist35_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_g_5(DELAY,364)
    redist35_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_g_5 : dspba_delay
    GENERIC MAP ( width => 6, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_g, xout => redist35_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_g_5_q, clk => clk, aclr => areset );

    -- prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8(ADD,206)@8 + 1
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8_cin <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8_c;
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8_a <= STD_LOGIC_VECTOR("0" & redist35_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_g_5_q) & '1';
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8_b <= STD_LOGIC_VECTOR("0" & redist28_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_g_5_q) & prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8_cin(0);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8_a) + UNSIGNED(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8_b));
        END IF;
    END PROCESS;
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8_c(0) <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8_o(7);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8_q <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8_o(6 downto 1);

    -- redist29_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_h_6(DELAY,358)
    redist29_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_h_6 : dspba_delay
    GENERIC MAP ( width => 6, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_h, xout => redist29_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_h_6_q, clk => clk, aclr => areset );

    -- redist36_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_h_6(DELAY,365)
    redist36_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_h_6 : dspba_delay
    GENERIC MAP ( width => 6, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_h, xout => redist36_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_h_6_q, clk => clk, aclr => areset );

    -- prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8(ADD,207)@9 + 1
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8_cin <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8_c;
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8_a <= STD_LOGIC_VECTOR("0" & redist36_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_h_6_q) & '1';
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8_b <= STD_LOGIC_VECTOR("0" & redist29_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_h_6_q) & prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8_cin(0);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8_a) + UNSIGNED(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8_b));
        END IF;
    END PROCESS;
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8_c(0) <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8_o(7);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8_q <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8_o(6 downto 1);

    -- redist30_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_i_7(DELAY,359)
    redist30_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_i_7 : dspba_delay
    GENERIC MAP ( width => 6, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_i, xout => redist30_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_i_7_q, clk => clk, aclr => areset );

    -- redist37_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_i_7(DELAY,366)
    redist37_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_i_7 : dspba_delay
    GENERIC MAP ( width => 6, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_i, xout => redist37_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_i_7_q, clk => clk, aclr => areset );

    -- prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p8_of_8(ADD,208)@10 + 1
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p8_of_8_cin <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8_c;
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p8_of_8_a <= STD_LOGIC_VECTOR("0" & redist37_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_a_i_7_q) & '1';
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p8_of_8_b <= STD_LOGIC_VECTOR("0" & redist30_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitSelect_for_b_i_7_q) & prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p8_of_8_cin(0);
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p8_of_8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p8_of_8_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p8_of_8_o <= STD_LOGIC_VECTOR(UNSIGNED(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p8_of_8_a) + UNSIGNED(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p8_of_8_b));
        END IF;
    END PROCESS;
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p8_of_8_q <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p8_of_8_o(6 downto 1);

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel4_0(BITSELECT,259)@11
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel4_0_in <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p8_of_8_q);
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel4_0_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel4_0_in(5 downto 5));

    -- redist0_normalizeBit_uid49_fpMulTest_tessel0_0_b_3(DELAY,329)
    redist0_normalizeBit_uid49_fpMulTest_tessel0_0_b_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel4_0_b, xout => redist0_normalizeBit_uid49_fpMulTest_tessel0_0_b_3_q, clk => clk, aclr => areset );

    -- roundBitDetectionConstant_uid63_fpMulTest(CONSTANT,62)
    roundBitDetectionConstant_uid63_fpMulTest_q <= "010";

    -- fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel8_0(BITSELECT,327)@11
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel8_0_in <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p8_of_8_q);
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel8_0_b <= STD_LOGIC_VECTOR(fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel8_0_in(4 downto 1));

    -- fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel8_0(BITSELECT,309)@11
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel8_0_in <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p8_of_8_q);
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel8_0_b <= STD_LOGIC_VECTOR(fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel8_0_in(3 downto 0));

    -- fracRPostNorm_uid53_fpMulTest_p8(MUX,220)@11 + 1
    fracRPostNorm_uid53_fpMulTest_p8_s <= expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel4_0_b;
    fracRPostNorm_uid53_fpMulTest_p8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPostNorm_uid53_fpMulTest_p8_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRPostNorm_uid53_fpMulTest_p8_s) IS
                WHEN "0" => fracRPostNorm_uid53_fpMulTest_p8_q <= fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel8_0_b;
                WHEN "1" => fracRPostNorm_uid53_fpMulTest_p8_q <= fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel8_0_b;
                WHEN OTHERS => fracRPostNorm_uid53_fpMulTest_p8_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist8_fracRPostNorm_uid53_fpMulTest_p8_q_2(DELAY,337)
    redist8_fracRPostNorm_uid53_fpMulTest_p8_q_2 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPostNorm_uid53_fpMulTest_p8_q, xout => redist8_fracRPostNorm_uid53_fpMulTest_p8_q_2_q, clk => clk, aclr => areset );

    -- fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel7_0(BITSELECT,325)@11
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel7_0_in <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p8_of_8_q);
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel7_0_b <= STD_LOGIC_VECTOR(fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel7_0_in(0 downto 0));

    -- redist17_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8_q_1(DELAY,346)
    redist17_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8_q_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8_q, xout => redist17_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8_q_1_q, clk => clk, aclr => areset );

    -- fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel7_0(BITSELECT,307)@11
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel7_0_in <= STD_LOGIC_VECTOR(redist17_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8_q_1_q);
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel7_0_b <= STD_LOGIC_VECTOR(fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel7_0_in(5 downto 5));

    -- fracRPostNorm_uid53_fpMulTest_p7(MUX,219)@11 + 1
    fracRPostNorm_uid53_fpMulTest_p7_s <= expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel4_0_b;
    fracRPostNorm_uid53_fpMulTest_p7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPostNorm_uid53_fpMulTest_p7_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRPostNorm_uid53_fpMulTest_p7_s) IS
                WHEN "0" => fracRPostNorm_uid53_fpMulTest_p7_q <= fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel7_0_b;
                WHEN "1" => fracRPostNorm_uid53_fpMulTest_p7_q <= fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel7_0_b;
                WHEN OTHERS => fracRPostNorm_uid53_fpMulTest_p7_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist9_fracRPostNorm_uid53_fpMulTest_p7_q_2(DELAY,338)
    redist9_fracRPostNorm_uid53_fpMulTest_p7_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPostNorm_uid53_fpMulTest_p7_q, xout => redist9_fracRPostNorm_uid53_fpMulTest_p7_q_2_q, clk => clk, aclr => areset );

    -- fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel6_0(BITSELECT,323)@11
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel6_0_in <= STD_LOGIC_VECTOR(redist17_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8_q_1_q);
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel6_0_b <= STD_LOGIC_VECTOR(fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel6_0_in(5 downto 1));

    -- fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel6_0(BITSELECT,305)@11
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel6_0_in <= STD_LOGIC_VECTOR(redist17_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8_q_1_q);
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel6_0_b <= STD_LOGIC_VECTOR(fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel6_0_in(4 downto 0));

    -- fracRPostNorm_uid53_fpMulTest_p6(MUX,218)@11 + 1
    fracRPostNorm_uid53_fpMulTest_p6_s <= expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel4_0_b;
    fracRPostNorm_uid53_fpMulTest_p6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPostNorm_uid53_fpMulTest_p6_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRPostNorm_uid53_fpMulTest_p6_s) IS
                WHEN "0" => fracRPostNorm_uid53_fpMulTest_p6_q <= fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel6_0_b;
                WHEN "1" => fracRPostNorm_uid53_fpMulTest_p6_q <= fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel6_0_b;
                WHEN OTHERS => fracRPostNorm_uid53_fpMulTest_p6_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist10_fracRPostNorm_uid53_fpMulTest_p6_q_2(DELAY,339)
    redist10_fracRPostNorm_uid53_fpMulTest_p6_q_2 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPostNorm_uid53_fpMulTest_p6_q, xout => redist10_fracRPostNorm_uid53_fpMulTest_p6_q_2_q, clk => clk, aclr => areset );

    -- fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel5_0(BITSELECT,321)@11
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel5_0_in <= STD_LOGIC_VECTOR(redist17_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8_q_1_q);
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel5_0_b <= STD_LOGIC_VECTOR(fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel5_0_in(0 downto 0));

    -- redist18_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8_q_2(DELAY,347)
    redist18_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8_q_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8_q, xout => redist18_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8_q_2_q, clk => clk, aclr => areset );

    -- fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel5_0(BITSELECT,303)@11
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel5_0_in <= STD_LOGIC_VECTOR(redist18_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8_q_2_q);
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel5_0_b <= STD_LOGIC_VECTOR(fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel5_0_in(5 downto 5));

    -- fracRPostNorm_uid53_fpMulTest_p5(MUX,217)@11 + 1
    fracRPostNorm_uid53_fpMulTest_p5_s <= expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel4_0_b;
    fracRPostNorm_uid53_fpMulTest_p5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPostNorm_uid53_fpMulTest_p5_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRPostNorm_uid53_fpMulTest_p5_s) IS
                WHEN "0" => fracRPostNorm_uid53_fpMulTest_p5_q <= fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel5_0_b;
                WHEN "1" => fracRPostNorm_uid53_fpMulTest_p5_q <= fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel5_0_b;
                WHEN OTHERS => fracRPostNorm_uid53_fpMulTest_p5_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist11_fracRPostNorm_uid53_fpMulTest_p5_q_2(DELAY,340)
    redist11_fracRPostNorm_uid53_fpMulTest_p5_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPostNorm_uid53_fpMulTest_p5_q, xout => redist11_fracRPostNorm_uid53_fpMulTest_p5_q_2_q, clk => clk, aclr => areset );

    -- fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel4_0(BITSELECT,319)@11
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel4_0_in <= STD_LOGIC_VECTOR(redist18_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8_q_2_q);
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel4_0_b <= STD_LOGIC_VECTOR(fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel4_0_in(5 downto 1));

    -- fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel4_0(BITSELECT,301)@11
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel4_0_in <= STD_LOGIC_VECTOR(redist18_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8_q_2_q);
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel4_0_b <= STD_LOGIC_VECTOR(fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel4_0_in(4 downto 0));

    -- fracRPostNorm_uid53_fpMulTest_p4(MUX,216)@11 + 1
    fracRPostNorm_uid53_fpMulTest_p4_s <= expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel4_0_b;
    fracRPostNorm_uid53_fpMulTest_p4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPostNorm_uid53_fpMulTest_p4_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRPostNorm_uid53_fpMulTest_p4_s) IS
                WHEN "0" => fracRPostNorm_uid53_fpMulTest_p4_q <= fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel4_0_b;
                WHEN "1" => fracRPostNorm_uid53_fpMulTest_p4_q <= fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel4_0_b;
                WHEN OTHERS => fracRPostNorm_uid53_fpMulTest_p4_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist12_fracRPostNorm_uid53_fpMulTest_p4_q_2(DELAY,341)
    redist12_fracRPostNorm_uid53_fpMulTest_p4_q_2 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPostNorm_uid53_fpMulTest_p4_q, xout => redist12_fracRPostNorm_uid53_fpMulTest_p4_q_2_q, clk => clk, aclr => areset );

    -- fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel3_0(BITSELECT,317)@11
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel3_0_in <= STD_LOGIC_VECTOR(redist18_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8_q_2_q);
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel3_0_b <= STD_LOGIC_VECTOR(fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel3_0_in(0 downto 0));

    -- redist19_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8_q_3(DELAY,348)
    redist19_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8_q_3 : dspba_delay
    GENERIC MAP ( width => 6, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8_q, xout => redist19_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8_q_3_q, clk => clk, aclr => areset );

    -- fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel3_0(BITSELECT,299)@11
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel3_0_in <= STD_LOGIC_VECTOR(redist19_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8_q_3_q);
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel3_0_b <= STD_LOGIC_VECTOR(fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel3_0_in(5 downto 5));

    -- fracRPostNorm_uid53_fpMulTest_p3(MUX,215)@11 + 1
    fracRPostNorm_uid53_fpMulTest_p3_s <= expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel4_0_b;
    fracRPostNorm_uid53_fpMulTest_p3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPostNorm_uid53_fpMulTest_p3_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRPostNorm_uid53_fpMulTest_p3_s) IS
                WHEN "0" => fracRPostNorm_uid53_fpMulTest_p3_q <= fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel3_0_b;
                WHEN "1" => fracRPostNorm_uid53_fpMulTest_p3_q <= fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel3_0_b;
                WHEN OTHERS => fracRPostNorm_uid53_fpMulTest_p3_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist13_fracRPostNorm_uid53_fpMulTest_p3_q_2(DELAY,342)
    redist13_fracRPostNorm_uid53_fpMulTest_p3_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPostNorm_uid53_fpMulTest_p3_q, xout => redist13_fracRPostNorm_uid53_fpMulTest_p3_q_2_q, clk => clk, aclr => areset );

    -- fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel2_0(BITSELECT,315)@11
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel2_0_in <= STD_LOGIC_VECTOR(redist19_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8_q_3_q);
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel2_0_b <= STD_LOGIC_VECTOR(fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel2_0_in(5 downto 1));

    -- fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel2_0(BITSELECT,297)@11
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel2_0_in <= STD_LOGIC_VECTOR(redist19_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8_q_3_q);
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel2_0_b <= STD_LOGIC_VECTOR(fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel2_0_in(4 downto 0));

    -- fracRPostNorm_uid53_fpMulTest_p2(MUX,214)@11 + 1
    fracRPostNorm_uid53_fpMulTest_p2_s <= expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel4_0_b;
    fracRPostNorm_uid53_fpMulTest_p2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPostNorm_uid53_fpMulTest_p2_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRPostNorm_uid53_fpMulTest_p2_s) IS
                WHEN "0" => fracRPostNorm_uid53_fpMulTest_p2_q <= fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel2_0_b;
                WHEN "1" => fracRPostNorm_uid53_fpMulTest_p2_q <= fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel2_0_b;
                WHEN OTHERS => fracRPostNorm_uid53_fpMulTest_p2_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist14_fracRPostNorm_uid53_fpMulTest_p2_q_2(DELAY,343)
    redist14_fracRPostNorm_uid53_fpMulTest_p2_q_2 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPostNorm_uid53_fpMulTest_p2_q, xout => redist14_fracRPostNorm_uid53_fpMulTest_p2_q_2_q, clk => clk, aclr => areset );

    -- fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel1_0(BITSELECT,313)@11
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel1_0_in <= STD_LOGIC_VECTOR(redist19_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8_q_3_q);
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel1_0_in(0 downto 0));

    -- redist20_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p4_of_8_q_4(DELAY,349)
    redist20_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p4_of_8_q_4 : dspba_delay
    GENERIC MAP ( width => 6, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p4_of_8_q, xout => redist20_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p4_of_8_q_4_q, clk => clk, aclr => areset );

    -- fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel1_0(BITSELECT,295)@11
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel1_0_in <= STD_LOGIC_VECTOR(redist20_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p4_of_8_q_4_q);
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel1_0_b <= STD_LOGIC_VECTOR(fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel1_0_in(5 downto 5));

    -- fracRPostNorm_uid53_fpMulTest_p1(MUX,213)@11 + 1
    fracRPostNorm_uid53_fpMulTest_p1_s <= expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel4_0_b;
    fracRPostNorm_uid53_fpMulTest_p1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPostNorm_uid53_fpMulTest_p1_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRPostNorm_uid53_fpMulTest_p1_s) IS
                WHEN "0" => fracRPostNorm_uid53_fpMulTest_p1_q <= fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel1_0_b;
                WHEN "1" => fracRPostNorm_uid53_fpMulTest_p1_q <= fracRPostNorm_uid53_fpMulTest_BitSelect_for_b_tessel1_0_b;
                WHEN OTHERS => fracRPostNorm_uid53_fpMulTest_p1_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist15_fracRPostNorm_uid53_fpMulTest_p1_q_2(DELAY,344)
    redist15_fracRPostNorm_uid53_fpMulTest_p1_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPostNorm_uid53_fpMulTest_p1_q, xout => redist15_fracRPostNorm_uid53_fpMulTest_p1_q_2_q, clk => clk, aclr => areset );

    -- fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel0_0(BITSELECT,293)@11
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel0_0_in <= STD_LOGIC_VECTOR(redist20_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p4_of_8_q_4_q);
    fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel0_0_b <= STD_LOGIC_VECTOR(fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel0_0_in(4 downto 4));

    -- fracRPostNorm_uid53_fpMulTest_p0(MUX,212)@11 + 1
    fracRPostNorm_uid53_fpMulTest_p0_s <= expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel4_0_b;
    fracRPostNorm_uid53_fpMulTest_p0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPostNorm_uid53_fpMulTest_p0_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRPostNorm_uid53_fpMulTest_p0_s) IS
                WHEN "0" => fracRPostNorm_uid53_fpMulTest_p0_q <= fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel0_0_b;
                WHEN "1" => fracRPostNorm_uid53_fpMulTest_p0_q <= fracRPostNorm_uid53_fpMulTest_BitSelect_for_a_tessel1_0_b;
                WHEN OTHERS => fracRPostNorm_uid53_fpMulTest_p0_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist16_fracRPostNorm_uid53_fpMulTest_p0_q_2(DELAY,345)
    redist16_fracRPostNorm_uid53_fpMulTest_p0_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPostNorm_uid53_fpMulTest_p0_q, xout => redist16_fracRPostNorm_uid53_fpMulTest_p0_q_2_q, clk => clk, aclr => areset );

    -- fracRPostNorm_uid53_fpMulTest_BitJoin_for_q(BITJOIN,221)@13
    fracRPostNorm_uid53_fpMulTest_BitJoin_for_q_q <= redist8_fracRPostNorm_uid53_fpMulTest_p8_q_2_q & redist9_fracRPostNorm_uid53_fpMulTest_p7_q_2_q & redist10_fracRPostNorm_uid53_fpMulTest_p6_q_2_q & redist11_fracRPostNorm_uid53_fpMulTest_p5_q_2_q & redist12_fracRPostNorm_uid53_fpMulTest_p4_q_2_q & redist13_fracRPostNorm_uid53_fpMulTest_p3_q_2_q & redist14_fracRPostNorm_uid53_fpMulTest_p2_q_2_q & redist15_fracRPostNorm_uid53_fpMulTest_p1_q_2_q & redist16_fracRPostNorm_uid53_fpMulTest_p0_q_2_q;

    -- fracRPostNorm1dto0_uid61_fpMulTest(BITSELECT,60)@13
    fracRPostNorm1dto0_uid61_fpMulTest_in <= fracRPostNorm_uid53_fpMulTest_BitJoin_for_q_q(1 downto 0);
    fracRPostNorm1dto0_uid61_fpMulTest_b <= fracRPostNorm1dto0_uid61_fpMulTest_in(1 downto 0);

    -- redist21_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p3_of_8_q_5(DELAY,350)
    redist21_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p3_of_8_q_5 : dspba_delay
    GENERIC MAP ( width => 6, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p3_of_8_q, xout => redist21_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p3_of_8_q_5_q, clk => clk, aclr => areset );

    -- redist22_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p2_of_8_q_6(DELAY,351)
    redist22_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p2_of_8_q_6 : dspba_delay
    GENERIC MAP ( width => 6, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p2_of_8_q, xout => redist22_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p2_of_8_q_6_q, clk => clk, aclr => areset );

    -- redist23_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p1_of_8_q_7(DELAY,352)
    redist23_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p1_of_8_q_7 : dspba_delay
    GENERIC MAP ( width => 6, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p1_of_8_q, xout => redist23_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p1_of_8_q_7_q, clk => clk, aclr => areset );

    -- prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitJoin_for_q(BITJOIN,209)@11
    prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitJoin_for_q_q <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p8_of_8_q & redist17_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p7_of_8_q_1_q & redist18_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p6_of_8_q_2_q & redist19_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p5_of_8_q_3_q & redist20_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p4_of_8_q_4_q & redist21_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p3_of_8_q_5_q & redist22_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p2_of_8_q_6_q & redist23_prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_p1_of_8_q_7_q;

    -- extraStickyBitOfProd_uid55_fpMulTest(BITSELECT,54)@11
    extraStickyBitOfProd_uid55_fpMulTest_in <= STD_LOGIC_VECTOR(prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitJoin_for_q_q(22 downto 0));
    extraStickyBitOfProd_uid55_fpMulTest_b <= STD_LOGIC_VECTOR(extraStickyBitOfProd_uid55_fpMulTest_in(22 downto 22));

    -- extraStickyBit_uid56_fpMulTest(MUX,55)@11
    extraStickyBit_uid56_fpMulTest_s <= expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel4_0_b;
    extraStickyBit_uid56_fpMulTest_combproc: PROCESS (extraStickyBit_uid56_fpMulTest_s, GND_q, extraStickyBitOfProd_uid55_fpMulTest_b)
    BEGIN
        CASE (extraStickyBit_uid56_fpMulTest_s) IS
            WHEN "0" => extraStickyBit_uid56_fpMulTest_q <= GND_q;
            WHEN "1" => extraStickyBit_uid56_fpMulTest_q <= extraStickyBitOfProd_uid55_fpMulTest_b;
            WHEN OTHERS => extraStickyBit_uid56_fpMulTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- stickyRange_uid54_fpMulTest(BITSELECT,53)@11
    stickyRange_uid54_fpMulTest_in <= prodXY_uid105_prod_uid47_fpMulTest_comptree_0_0_ADD_BitJoin_for_q_q(21 downto 0);
    stickyRange_uid54_fpMulTest_b <= stickyRange_uid54_fpMulTest_in(21 downto 0);

    -- stickyExtendedRange_uid57_fpMulTest(BITJOIN,56)@11
    stickyExtendedRange_uid57_fpMulTest_q <= extraStickyBit_uid56_fpMulTest_q & stickyRange_uid54_fpMulTest_b;

    -- redist50_stickyExtendedRange_uid57_fpMulTest_q_1(DELAY,379)
    redist50_stickyExtendedRange_uid57_fpMulTest_q_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => stickyExtendedRange_uid57_fpMulTest_q, xout => redist50_stickyExtendedRange_uid57_fpMulTest_q_1_q, clk => clk, aclr => areset );

    -- stickyRangeComparator_uid59_fpMulTest(LOGICAL,58)@12
    stickyRangeComparator_uid59_fpMulTest_a <= redist50_stickyExtendedRange_uid57_fpMulTest_q_1_q;
    stickyRangeComparator_uid59_fpMulTest_b <= cstZeroWF_uid11_fpMulTest_q;
    stickyRangeComparator_uid59_fpMulTest_q <= "1" WHEN stickyRangeComparator_uid59_fpMulTest_a = stickyRangeComparator_uid59_fpMulTest_b ELSE "0";

    -- sticky_uid60_fpMulTest(LOGICAL,59)@12 + 1
    sticky_uid60_fpMulTest_a <= stickyRangeComparator_uid59_fpMulTest_q;
    sticky_uid60_fpMulTest_qi <= not (sticky_uid60_fpMulTest_a);
    sticky_uid60_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sticky_uid60_fpMulTest_qi, xout => sticky_uid60_fpMulTest_q, clk => clk, aclr => areset );

    -- lrs_uid62_fpMulTest(BITJOIN,61)@13
    lrs_uid62_fpMulTest_q <= fracRPostNorm1dto0_uid61_fpMulTest_b & sticky_uid60_fpMulTest_q;

    -- roundBitDetectionPattern_uid64_fpMulTest(LOGICAL,63)@13
    roundBitDetectionPattern_uid64_fpMulTest_a <= lrs_uid62_fpMulTest_q;
    roundBitDetectionPattern_uid64_fpMulTest_b <= roundBitDetectionConstant_uid63_fpMulTest_q;
    roundBitDetectionPattern_uid64_fpMulTest_q <= "1" WHEN roundBitDetectionPattern_uid64_fpMulTest_a = roundBitDetectionPattern_uid64_fpMulTest_b ELSE "0";

    -- roundBit_uid65_fpMulTest(LOGICAL,64)@13 + 1
    roundBit_uid65_fpMulTest_a <= roundBitDetectionPattern_uid64_fpMulTest_q;
    roundBit_uid65_fpMulTest_qi <= not (roundBit_uid65_fpMulTest_a);
    roundBit_uid65_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => roundBit_uid65_fpMulTest_qi, xout => roundBit_uid65_fpMulTest_q, clk => clk, aclr => areset );

    -- roundBitAndNormalizationOp_uid68_fpMulTest(BITJOIN,67)@14
    roundBitAndNormalizationOp_uid68_fpMulTest_q <= GND_q & redist0_normalizeBit_uid49_fpMulTest_tessel0_0_b_3_q & cstZeroWF_uid11_fpMulTest_q & roundBit_uid65_fpMulTest_q;

    -- expFracRPostRounding_uid69_fpMulTest_BitExpansion_for_b(BITJOIN,164)@14
    expFracRPostRounding_uid69_fpMulTest_BitExpansion_for_b_q <= expFracRPostRounding_uid69_fpMulTest_UpperBits_for_b_q & roundBitAndNormalizationOp_uid68_fpMulTest_q;

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b(BITSELECT,167)@14
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_in <= expFracRPostRounding_uid69_fpMulTest_BitExpansion_for_b_q;
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_b <= expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_in(5 downto 0);

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel0_2(BITSELECT,234)@13
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel0_2_in <= STD_LOGIC_VECTOR(redist14_fracRPostNorm_uid53_fpMulTest_p2_q_2_q);
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel0_2_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel0_2_in(3 downto 0));

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_b(BITJOIN,235)@13
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_b_q <= expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel0_2_b & redist15_fracRPostNorm_uid53_fpMulTest_p1_q_2_q & redist16_fracRPostNorm_uid53_fpMulTest_p0_q_2_q;

    -- redist7_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_b_q_1(DELAY,336)
    redist7_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_b_q_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_b_q, xout => redist7_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_b_q_1_q, clk => clk, aclr => areset );

    -- expFracRPostRounding_uid69_fpMulTest_p1_of_6(ADD,168)@14 + 1
    expFracRPostRounding_uid69_fpMulTest_p1_of_6_a <= STD_LOGIC_VECTOR("0" & redist7_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_b_q_1_q);
    expFracRPostRounding_uid69_fpMulTest_p1_of_6_b <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_b);
    expFracRPostRounding_uid69_fpMulTest_p1_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRPostRounding_uid69_fpMulTest_p1_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRPostRounding_uid69_fpMulTest_p1_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRPostRounding_uid69_fpMulTest_p1_of_6_a) + UNSIGNED(expFracRPostRounding_uid69_fpMulTest_p1_of_6_b));
        END IF;
    END PROCESS;
    expFracRPostRounding_uid69_fpMulTest_p1_of_6_c(0) <= expFracRPostRounding_uid69_fpMulTest_p1_of_6_o(6);
    expFracRPostRounding_uid69_fpMulTest_p1_of_6_q <= expFracRPostRounding_uid69_fpMulTest_p1_of_6_o(5 downto 0);

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel1_0(BITSELECT,253)
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel1_0_in <= STD_LOGIC_VECTOR(cstZeroWF_uid11_fpMulTest_q);
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel1_0_in(10 downto 5));

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel1_2(BITSELECT,238)@13
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel1_2_in <= STD_LOGIC_VECTOR(redist12_fracRPostNorm_uid53_fpMulTest_p4_q_2_q);
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel1_2_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel1_2_in(3 downto 0));

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel1_0(BITSELECT,236)@13
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel1_0_in <= STD_LOGIC_VECTOR(redist14_fracRPostNorm_uid53_fpMulTest_p2_q_2_q);
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel1_0_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel1_0_in(4 downto 4));

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_c(BITJOIN,239)@13
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_c_q <= expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel1_2_b & redist13_fracRPostNorm_uid53_fpMulTest_p3_q_2_q & expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel1_0_b;

    -- redist6_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_c_q_2(DELAY,335)
    redist6_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_c_q_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_c_q, xout => redist6_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_c_q_2_q, clk => clk, aclr => areset );

    -- expFracRPostRounding_uid69_fpMulTest_p2_of_6(ADD,169)@15 + 1
    expFracRPostRounding_uid69_fpMulTest_p2_of_6_cin <= expFracRPostRounding_uid69_fpMulTest_p1_of_6_c;
    expFracRPostRounding_uid69_fpMulTest_p2_of_6_a <= STD_LOGIC_VECTOR("0" & redist6_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_c_q_2_q) & '1';
    expFracRPostRounding_uid69_fpMulTest_p2_of_6_b <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel1_0_b) & expFracRPostRounding_uid69_fpMulTest_p2_of_6_cin(0);
    expFracRPostRounding_uid69_fpMulTest_p2_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRPostRounding_uid69_fpMulTest_p2_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRPostRounding_uid69_fpMulTest_p2_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRPostRounding_uid69_fpMulTest_p2_of_6_a) + UNSIGNED(expFracRPostRounding_uid69_fpMulTest_p2_of_6_b));
        END IF;
    END PROCESS;
    expFracRPostRounding_uid69_fpMulTest_p2_of_6_c(0) <= expFracRPostRounding_uid69_fpMulTest_p2_of_6_o(7);
    expFracRPostRounding_uid69_fpMulTest_p2_of_6_q <= expFracRPostRounding_uid69_fpMulTest_p2_of_6_o(6 downto 1);

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel2_0(BITSELECT,255)
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel2_0_in <= STD_LOGIC_VECTOR(cstZeroWF_uid11_fpMulTest_q);
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel2_0_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel2_0_in(16 downto 11));

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel2_2(BITSELECT,242)@13
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel2_2_in <= STD_LOGIC_VECTOR(redist10_fracRPostNorm_uid53_fpMulTest_p6_q_2_q);
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel2_2_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel2_2_in(3 downto 0));

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel2_0(BITSELECT,240)@13
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel2_0_in <= STD_LOGIC_VECTOR(redist12_fracRPostNorm_uid53_fpMulTest_p4_q_2_q);
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel2_0_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel2_0_in(4 downto 4));

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_d(BITJOIN,243)@13
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_d_q <= expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel2_2_b & redist11_fracRPostNorm_uid53_fpMulTest_p5_q_2_q & expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel2_0_b;

    -- redist5_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_d_q_3(DELAY,334)
    redist5_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_d_q_3 : dspba_delay
    GENERIC MAP ( width => 6, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_d_q, xout => redist5_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_d_q_3_q, clk => clk, aclr => areset );

    -- expFracRPostRounding_uid69_fpMulTest_p3_of_6(ADD,170)@16 + 1
    expFracRPostRounding_uid69_fpMulTest_p3_of_6_cin <= expFracRPostRounding_uid69_fpMulTest_p2_of_6_c;
    expFracRPostRounding_uid69_fpMulTest_p3_of_6_a <= STD_LOGIC_VECTOR("0" & redist5_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_d_q_3_q) & '1';
    expFracRPostRounding_uid69_fpMulTest_p3_of_6_b <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel2_0_b) & expFracRPostRounding_uid69_fpMulTest_p3_of_6_cin(0);
    expFracRPostRounding_uid69_fpMulTest_p3_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRPostRounding_uid69_fpMulTest_p3_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRPostRounding_uid69_fpMulTest_p3_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRPostRounding_uid69_fpMulTest_p3_of_6_a) + UNSIGNED(expFracRPostRounding_uid69_fpMulTest_p3_of_6_b));
        END IF;
    END PROCESS;
    expFracRPostRounding_uid69_fpMulTest_p3_of_6_c(0) <= expFracRPostRounding_uid69_fpMulTest_p3_of_6_o(7);
    expFracRPostRounding_uid69_fpMulTest_p3_of_6_q <= expFracRPostRounding_uid69_fpMulTest_p3_of_6_o(6 downto 1);

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel3_0(BITSELECT,257)
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel3_0_in <= STD_LOGIC_VECTOR(cstZeroWF_uid11_fpMulTest_q);
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel3_0_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel3_0_in(22 downto 17));

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel3_0(BITSELECT,244)@13
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel3_0_in <= STD_LOGIC_VECTOR(redist10_fracRPostNorm_uid53_fpMulTest_p6_q_2_q);
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel3_0_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel3_0_in(4 downto 4));

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_e(BITJOIN,247)@13
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_e_q <= redist8_fracRPostNorm_uid53_fpMulTest_p8_q_2_q & redist9_fracRPostNorm_uid53_fpMulTest_p7_q_2_q & expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel3_0_b;

    -- redist4_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_e_q_4(DELAY,333)
    redist4_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_e_q_4 : dspba_delay
    GENERIC MAP ( width => 6, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_e_q, xout => redist4_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_e_q_4_q, clk => clk, aclr => areset );

    -- expFracRPostRounding_uid69_fpMulTest_p4_of_6(ADD,171)@17 + 1
    expFracRPostRounding_uid69_fpMulTest_p4_of_6_cin <= expFracRPostRounding_uid69_fpMulTest_p3_of_6_c;
    expFracRPostRounding_uid69_fpMulTest_p4_of_6_a <= STD_LOGIC_VECTOR("0" & redist4_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_e_q_4_q) & '1';
    expFracRPostRounding_uid69_fpMulTest_p4_of_6_b <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel3_0_b) & expFracRPostRounding_uid69_fpMulTest_p4_of_6_cin(0);
    expFracRPostRounding_uid69_fpMulTest_p4_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRPostRounding_uid69_fpMulTest_p4_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRPostRounding_uid69_fpMulTest_p4_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRPostRounding_uid69_fpMulTest_p4_of_6_a) + UNSIGNED(expFracRPostRounding_uid69_fpMulTest_p4_of_6_b));
        END IF;
    END PROCESS;
    expFracRPostRounding_uid69_fpMulTest_p4_of_6_c(0) <= expFracRPostRounding_uid69_fpMulTest_p4_of_6_o(7);
    expFracRPostRounding_uid69_fpMulTest_p4_of_6_q <= expFracRPostRounding_uid69_fpMulTest_p4_of_6_o(6 downto 1);

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel4_2(BITSELECT,261)
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel4_2_in <= STD_LOGIC_VECTOR(expFracRPostRounding_uid69_fpMulTest_UpperBits_for_b_q);
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel4_2_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel4_2_in(3 downto 0));

    -- redist3_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel4_0_b_7(DELAY,332)
    redist3_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel4_0_b_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel4_0_b, xout => redist3_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel4_0_b_7_q, clk => clk, aclr => areset );

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_BitJoin_for_f(BITJOIN,262)@18
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_BitJoin_for_f_q <= expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel4_2_b & GND_q & redist3_expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel4_0_b_7_q;

    -- biasInc_uid45_fpMulTest(CONSTANT,44)
    biasInc_uid45_fpMulTest_q <= "0001111111";

    -- expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel0_0(BITSELECT,227)
    expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel0_0_in <= STD_LOGIC_VECTOR(biasInc_uid45_fpMulTest_q);
    expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel0_0_b <= STD_LOGIC_VECTOR(expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel0_0_in(5 downto 0));

    -- expSum_uid44_fpMulTest_BitExpansion_for_b(BITJOIN,144)@0
    expSum_uid44_fpMulTest_BitExpansion_for_b_q <= GND_q & expY_uid7_fpMulTest_b;

    -- expSum_uid44_fpMulTest_BitSelect_for_b(BITSELECT,147)@0
    expSum_uid44_fpMulTest_BitSelect_for_b_in <= expSum_uid44_fpMulTest_BitExpansion_for_b_q;
    expSum_uid44_fpMulTest_BitSelect_for_b_b <= expSum_uid44_fpMulTest_BitSelect_for_b_in(5 downto 0);
    expSum_uid44_fpMulTest_BitSelect_for_b_c <= expSum_uid44_fpMulTest_BitSelect_for_b_in(8 downto 6);

    -- expSum_uid44_fpMulTest_BitExpansion_for_a(BITJOIN,142)@0
    expSum_uid44_fpMulTest_BitExpansion_for_a_q <= GND_q & expX_uid6_fpMulTest_b;

    -- expSum_uid44_fpMulTest_BitSelect_for_a(BITSELECT,146)@0
    expSum_uid44_fpMulTest_BitSelect_for_a_in <= expSum_uid44_fpMulTest_BitExpansion_for_a_q;
    expSum_uid44_fpMulTest_BitSelect_for_a_b <= expSum_uid44_fpMulTest_BitSelect_for_a_in(5 downto 0);
    expSum_uid44_fpMulTest_BitSelect_for_a_c <= expSum_uid44_fpMulTest_BitSelect_for_a_in(8 downto 6);

    -- expSum_uid44_fpMulTest_p1_of_2(ADD,148)@0 + 1
    expSum_uid44_fpMulTest_p1_of_2_a <= STD_LOGIC_VECTOR("0" & expSum_uid44_fpMulTest_BitSelect_for_a_b);
    expSum_uid44_fpMulTest_p1_of_2_b <= STD_LOGIC_VECTOR("0" & expSum_uid44_fpMulTest_BitSelect_for_b_b);
    expSum_uid44_fpMulTest_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSum_uid44_fpMulTest_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expSum_uid44_fpMulTest_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(expSum_uid44_fpMulTest_p1_of_2_a) + UNSIGNED(expSum_uid44_fpMulTest_p1_of_2_b));
        END IF;
    END PROCESS;
    expSum_uid44_fpMulTest_p1_of_2_c(0) <= expSum_uid44_fpMulTest_p1_of_2_o(6);
    expSum_uid44_fpMulTest_p1_of_2_q <= expSum_uid44_fpMulTest_p1_of_2_o(5 downto 0);

    -- redist44_expSum_uid44_fpMulTest_p1_of_2_q_16(DELAY,373)
    redist44_expSum_uid44_fpMulTest_p1_of_2_q_16 : dspba_delay
    GENERIC MAP ( width => 6, depth => 16, reset_kind => "ASYNC" )
    PORT MAP ( xin => expSum_uid44_fpMulTest_p1_of_2_q, xout => redist44_expSum_uid44_fpMulTest_p1_of_2_q_16_q, clk => clk, aclr => areset );

    -- expSumMBias_uid46_fpMulTest_p1_of_2(SUB,158)@17 + 1
    expSumMBias_uid46_fpMulTest_p1_of_2_a <= STD_LOGIC_VECTOR("0" & redist44_expSum_uid44_fpMulTest_p1_of_2_q_16_q);
    expSumMBias_uid46_fpMulTest_p1_of_2_b <= STD_LOGIC_VECTOR("0" & expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel0_0_b);
    expSumMBias_uid46_fpMulTest_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSumMBias_uid46_fpMulTest_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expSumMBias_uid46_fpMulTest_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(expSumMBias_uid46_fpMulTest_p1_of_2_a) - UNSIGNED(expSumMBias_uid46_fpMulTest_p1_of_2_b));
        END IF;
    END PROCESS;
    expSumMBias_uid46_fpMulTest_p1_of_2_c(0) <= expSumMBias_uid46_fpMulTest_p1_of_2_o(6);
    expSumMBias_uid46_fpMulTest_p1_of_2_q <= expSumMBias_uid46_fpMulTest_p1_of_2_o(5 downto 0);

    -- expFracRPostRounding_uid69_fpMulTest_p5_of_6(ADD,172)@18 + 1
    expFracRPostRounding_uid69_fpMulTest_p5_of_6_cin <= expFracRPostRounding_uid69_fpMulTest_p4_of_6_c;
    expFracRPostRounding_uid69_fpMulTest_p5_of_6_a <= STD_LOGIC_VECTOR("0" & expSumMBias_uid46_fpMulTest_p1_of_2_q) & '1';
    expFracRPostRounding_uid69_fpMulTest_p5_of_6_b <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_BitJoin_for_f_q) & expFracRPostRounding_uid69_fpMulTest_p5_of_6_cin(0);
    expFracRPostRounding_uid69_fpMulTest_p5_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRPostRounding_uid69_fpMulTest_p5_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRPostRounding_uid69_fpMulTest_p5_of_6_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRPostRounding_uid69_fpMulTest_p5_of_6_a) + UNSIGNED(expFracRPostRounding_uid69_fpMulTest_p5_of_6_b));
        END IF;
    END PROCESS;
    expFracRPostRounding_uid69_fpMulTest_p5_of_6_c(0) <= expFracRPostRounding_uid69_fpMulTest_p5_of_6_o(7);
    expFracRPostRounding_uid69_fpMulTest_p5_of_6_q <= expFracRPostRounding_uid69_fpMulTest_p5_of_6_o(6 downto 1);

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel5_0(BITSELECT,263)
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel5_0_in <= STD_LOGIC_VECTOR(expFracRPostRounding_uid69_fpMulTest_UpperBits_for_b_q);
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel5_0_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel5_0_in(9 downto 4));

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel5_1(BITSELECT,251)@19
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel5_1_in <= STD_LOGIC_VECTOR(expSumMBias_uid46_fpMulTest_p2_of_2_q);
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel5_1_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel5_1_in(4 downto 4));

    -- expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel1_1(BITSELECT,230)
    expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel1_1_in <= STD_LOGIC_VECTOR(biasInc_uid45_fpMulTest_q);
    expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel1_1_b <= STD_LOGIC_VECTOR(expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel1_1_in(9 downto 9));

    -- expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel1_0(BITSELECT,229)
    expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel1_0_in <= STD_LOGIC_VECTOR(biasInc_uid45_fpMulTest_q);
    expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel1_0_in(9 downto 6));

    -- expSumMBias_uid46_fpMulTest_BitSelect_for_b_BitJoin_for_c(BITJOIN,231)@18
    expSumMBias_uid46_fpMulTest_BitSelect_for_b_BitJoin_for_c_q <= expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel1_1_b & expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel1_0_b;

    -- expSumMBias_uid46_fpMulTest_UpperBits_for_a(CONSTANT,152)
    expSumMBias_uid46_fpMulTest_UpperBits_for_a_q <= "00";

    -- redist45_expSum_uid44_fpMulTest_BitSelect_for_b_c_1(DELAY,374)
    redist45_expSum_uid44_fpMulTest_BitSelect_for_b_c_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expSum_uid44_fpMulTest_BitSelect_for_b_c, xout => redist45_expSum_uid44_fpMulTest_BitSelect_for_b_c_1_q, clk => clk, aclr => areset );

    -- redist46_expSum_uid44_fpMulTest_BitSelect_for_a_c_1(DELAY,375)
    redist46_expSum_uid44_fpMulTest_BitSelect_for_a_c_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expSum_uid44_fpMulTest_BitSelect_for_a_c, xout => redist46_expSum_uid44_fpMulTest_BitSelect_for_a_c_1_q, clk => clk, aclr => areset );

    -- expSum_uid44_fpMulTest_p2_of_2(ADD,149)@1 + 1
    expSum_uid44_fpMulTest_p2_of_2_cin <= expSum_uid44_fpMulTest_p1_of_2_c;
    expSum_uid44_fpMulTest_p2_of_2_a <= STD_LOGIC_VECTOR("0" & redist46_expSum_uid44_fpMulTest_BitSelect_for_a_c_1_q) & '1';
    expSum_uid44_fpMulTest_p2_of_2_b <= STD_LOGIC_VECTOR("0" & redist45_expSum_uid44_fpMulTest_BitSelect_for_b_c_1_q) & expSum_uid44_fpMulTest_p2_of_2_cin(0);
    expSum_uid44_fpMulTest_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSum_uid44_fpMulTest_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expSum_uid44_fpMulTest_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(expSum_uid44_fpMulTest_p2_of_2_a) + UNSIGNED(expSum_uid44_fpMulTest_p2_of_2_b));
        END IF;
    END PROCESS;
    expSum_uid44_fpMulTest_p2_of_2_q <= expSum_uid44_fpMulTest_p2_of_2_o(3 downto 1);

    -- redist43_expSum_uid44_fpMulTest_p2_of_2_q_16(DELAY,372)
    redist43_expSum_uid44_fpMulTest_p2_of_2_q_16 : dspba_delay
    GENERIC MAP ( width => 3, depth => 16, reset_kind => "ASYNC" )
    PORT MAP ( xin => expSum_uid44_fpMulTest_p2_of_2_q, xout => redist43_expSum_uid44_fpMulTest_p2_of_2_q_16_q, clk => clk, aclr => areset );

    -- expSumMBias_uid46_fpMulTest_BitSelect_for_a_BitJoin_for_c(BITJOIN,226)@18
    expSumMBias_uid46_fpMulTest_BitSelect_for_a_BitJoin_for_c_q <= expSumMBias_uid46_fpMulTest_UpperBits_for_a_q & redist43_expSum_uid44_fpMulTest_p2_of_2_q_16_q;

    -- expSumMBias_uid46_fpMulTest_p2_of_2(SUB,159)@18 + 1
    expSumMBias_uid46_fpMulTest_p2_of_2_cin <= expSumMBias_uid46_fpMulTest_p1_of_2_c;
    expSumMBias_uid46_fpMulTest_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & expSumMBias_uid46_fpMulTest_BitSelect_for_a_BitJoin_for_c_q) & '0');
    expSumMBias_uid46_fpMulTest_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((5 downto 5 => expSumMBias_uid46_fpMulTest_BitSelect_for_b_BitJoin_for_c_q(4)) & expSumMBias_uid46_fpMulTest_BitSelect_for_b_BitJoin_for_c_q) & expSumMBias_uid46_fpMulTest_p2_of_2_cin(0));
    expSumMBias_uid46_fpMulTest_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSumMBias_uid46_fpMulTest_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expSumMBias_uid46_fpMulTest_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(expSumMBias_uid46_fpMulTest_p2_of_2_a) - SIGNED(expSumMBias_uid46_fpMulTest_p2_of_2_b));
        END IF;
    END PROCESS;
    expSumMBias_uid46_fpMulTest_p2_of_2_q <= expSumMBias_uid46_fpMulTest_p2_of_2_o(5 downto 1);

    -- expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_g(BITJOIN,252)@19
    expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_g_q <= expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_tessel5_1_b & expSumMBias_uid46_fpMulTest_p2_of_2_q;

    -- expFracRPostRounding_uid69_fpMulTest_p6_of_6(ADD,173)@19 + 1
    expFracRPostRounding_uid69_fpMulTest_p6_of_6_cin <= expFracRPostRounding_uid69_fpMulTest_p5_of_6_c;
    expFracRPostRounding_uid69_fpMulTest_p6_of_6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((6 downto 6 => expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_g_q(5)) & expFracRPostRounding_uid69_fpMulTest_BitSelect_for_a_BitJoin_for_g_q) & '1');
    expFracRPostRounding_uid69_fpMulTest_p6_of_6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid69_fpMulTest_BitSelect_for_b_tessel5_0_b) & expFracRPostRounding_uid69_fpMulTest_p6_of_6_cin(0));
    expFracRPostRounding_uid69_fpMulTest_p6_of_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRPostRounding_uid69_fpMulTest_p6_of_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracRPostRounding_uid69_fpMulTest_p6_of_6_o <= STD_LOGIC_VECTOR(SIGNED(expFracRPostRounding_uid69_fpMulTest_p6_of_6_a) + SIGNED(expFracRPostRounding_uid69_fpMulTest_p6_of_6_b));
        END IF;
    END PROCESS;
    expFracRPostRounding_uid69_fpMulTest_p6_of_6_q <= expFracRPostRounding_uid69_fpMulTest_p6_of_6_o(6 downto 1);

    -- redist38_expFracRPostRounding_uid69_fpMulTest_p5_of_6_q_1(DELAY,367)
    redist38_expFracRPostRounding_uid69_fpMulTest_p5_of_6_q_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid69_fpMulTest_p5_of_6_q, xout => redist38_expFracRPostRounding_uid69_fpMulTest_p5_of_6_q_1_q, clk => clk, aclr => areset );

    -- redist39_expFracRPostRounding_uid69_fpMulTest_p4_of_6_q_2(DELAY,368)
    redist39_expFracRPostRounding_uid69_fpMulTest_p4_of_6_q_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid69_fpMulTest_p4_of_6_q, xout => redist39_expFracRPostRounding_uid69_fpMulTest_p4_of_6_q_2_q, clk => clk, aclr => areset );

    -- redist40_expFracRPostRounding_uid69_fpMulTest_p3_of_6_q_3(DELAY,369)
    redist40_expFracRPostRounding_uid69_fpMulTest_p3_of_6_q_3 : dspba_delay
    GENERIC MAP ( width => 6, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid69_fpMulTest_p3_of_6_q, xout => redist40_expFracRPostRounding_uid69_fpMulTest_p3_of_6_q_3_q, clk => clk, aclr => areset );

    -- redist41_expFracRPostRounding_uid69_fpMulTest_p2_of_6_q_4(DELAY,370)
    redist41_expFracRPostRounding_uid69_fpMulTest_p2_of_6_q_4 : dspba_delay
    GENERIC MAP ( width => 6, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid69_fpMulTest_p2_of_6_q, xout => redist41_expFracRPostRounding_uid69_fpMulTest_p2_of_6_q_4_q, clk => clk, aclr => areset );

    -- redist42_expFracRPostRounding_uid69_fpMulTest_p1_of_6_q_5(DELAY,371)
    redist42_expFracRPostRounding_uid69_fpMulTest_p1_of_6_q_5 : dspba_delay
    GENERIC MAP ( width => 6, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid69_fpMulTest_p1_of_6_q, xout => redist42_expFracRPostRounding_uid69_fpMulTest_p1_of_6_q_5_q, clk => clk, aclr => areset );

    -- expFracRPostRounding_uid69_fpMulTest_BitJoin_for_q(BITJOIN,174)@20
    expFracRPostRounding_uid69_fpMulTest_BitJoin_for_q_q <= expFracRPostRounding_uid69_fpMulTest_p6_of_6_q & redist38_expFracRPostRounding_uid69_fpMulTest_p5_of_6_q_1_q & redist39_expFracRPostRounding_uid69_fpMulTest_p4_of_6_q_2_q & redist40_expFracRPostRounding_uid69_fpMulTest_p3_of_6_q_3_q & redist41_expFracRPostRounding_uid69_fpMulTest_p2_of_6_q_4_q & redist42_expFracRPostRounding_uid69_fpMulTest_p1_of_6_q_5_q;

    -- expRPreExcExt_uid71_fpMulTest(BITSELECT,70)@20
    expRPreExcExt_uid71_fpMulTest_in <= STD_LOGIC_VECTOR(expFracRPostRounding_uid69_fpMulTest_BitJoin_for_q_q);
    expRPreExcExt_uid71_fpMulTest_b <= STD_LOGIC_VECTOR(expRPreExcExt_uid71_fpMulTest_in(35 downto 24));

    -- expRPreExc_uid72_fpMulTest(BITSELECT,71)@20
    expRPreExc_uid72_fpMulTest_in <= expRPreExcExt_uid71_fpMulTest_b(7 downto 0);
    expRPreExc_uid72_fpMulTest_b <= expRPreExc_uid72_fpMulTest_in(7 downto 0);

    -- redist48_expRPreExc_uid72_fpMulTest_b_3(DELAY,377)
    redist48_expRPreExc_uid72_fpMulTest_b_3 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPreExc_uid72_fpMulTest_b, xout => redist48_expRPreExc_uid72_fpMulTest_b_3_q, clk => clk, aclr => areset );

    -- expOvf_uid75_fpMulTest_BitSelect_for_b_tessel0_0(BITSELECT,284)
    expOvf_uid75_fpMulTest_BitSelect_for_b_tessel0_0_in <= STD_LOGIC_VECTOR(cstAllOWE_uid10_fpMulTest_q);
    expOvf_uid75_fpMulTest_BitSelect_for_b_tessel0_0_b <= STD_LOGIC_VECTOR(expOvf_uid75_fpMulTest_BitSelect_for_b_tessel0_0_in(5 downto 0));

    -- expOvf_uid75_fpMulTest_p1_of_3(SUB,194)@19 + 1
    expOvf_uid75_fpMulTest_p1_of_3_a <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid69_fpMulTest_p5_of_6_q);
    expOvf_uid75_fpMulTest_p1_of_3_b <= STD_LOGIC_VECTOR("0" & expOvf_uid75_fpMulTest_BitSelect_for_b_tessel0_0_b);
    expOvf_uid75_fpMulTest_p1_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expOvf_uid75_fpMulTest_p1_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expOvf_uid75_fpMulTest_p1_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(expOvf_uid75_fpMulTest_p1_of_3_a) - UNSIGNED(expOvf_uid75_fpMulTest_p1_of_3_b));
        END IF;
    END PROCESS;
    expOvf_uid75_fpMulTest_p1_of_3_c(0) <= expOvf_uid75_fpMulTest_p1_of_3_o(6);

    -- expOvf_uid75_fpMulTest_UpperBits_for_b(CONSTANT,191)
    expOvf_uid75_fpMulTest_UpperBits_for_b_q <= "00000";

    -- expOvf_uid75_fpMulTest_BitSelect_for_b_tessel1_1(BITSELECT,287)
    expOvf_uid75_fpMulTest_BitSelect_for_b_tessel1_1_in <= STD_LOGIC_VECTOR(expOvf_uid75_fpMulTest_UpperBits_for_b_q);
    expOvf_uid75_fpMulTest_BitSelect_for_b_tessel1_1_b <= STD_LOGIC_VECTOR(expOvf_uid75_fpMulTest_BitSelect_for_b_tessel1_1_in(3 downto 0));

    -- expOvf_uid75_fpMulTest_BitSelect_for_b_tessel1_0(BITSELECT,286)
    expOvf_uid75_fpMulTest_BitSelect_for_b_tessel1_0_in <= STD_LOGIC_VECTOR(cstAllOWE_uid10_fpMulTest_q);
    expOvf_uid75_fpMulTest_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(expOvf_uid75_fpMulTest_BitSelect_for_b_tessel1_0_in(7 downto 6));

    -- expOvf_uid75_fpMulTest_BitSelect_for_b_BitJoin_for_c(BITJOIN,288)@20
    expOvf_uid75_fpMulTest_BitSelect_for_b_BitJoin_for_c_q <= expOvf_uid75_fpMulTest_BitSelect_for_b_tessel1_1_b & expOvf_uid75_fpMulTest_BitSelect_for_b_tessel1_0_b;

    -- expOvf_uid75_fpMulTest_p2_of_3(SUB,195)@20 + 1
    expOvf_uid75_fpMulTest_p2_of_3_cin <= expOvf_uid75_fpMulTest_p1_of_3_c;
    expOvf_uid75_fpMulTest_p2_of_3_a <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid69_fpMulTest_p6_of_6_q) & '0';
    expOvf_uid75_fpMulTest_p2_of_3_b <= STD_LOGIC_VECTOR("0" & expOvf_uid75_fpMulTest_BitSelect_for_b_BitJoin_for_c_q) & expOvf_uid75_fpMulTest_p2_of_3_cin(0);
    expOvf_uid75_fpMulTest_p2_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expOvf_uid75_fpMulTest_p2_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expOvf_uid75_fpMulTest_p2_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(expOvf_uid75_fpMulTest_p2_of_3_a) - UNSIGNED(expOvf_uid75_fpMulTest_p2_of_3_b));
        END IF;
    END PROCESS;
    expOvf_uid75_fpMulTest_p2_of_3_c(0) <= expOvf_uid75_fpMulTest_p2_of_3_o(7);

    -- expOvf_uid75_fpMulTest_BitSelect_for_b_tessel2_0(BITSELECT,289)
    expOvf_uid75_fpMulTest_BitSelect_for_b_tessel2_0_in <= STD_LOGIC_VECTOR(expOvf_uid75_fpMulTest_UpperBits_for_b_q);
    expOvf_uid75_fpMulTest_BitSelect_for_b_tessel2_0_b <= STD_LOGIC_VECTOR(expOvf_uid75_fpMulTest_BitSelect_for_b_tessel2_0_in(4 downto 4));

    -- expUdf_uid73_fpMulTest_BitSelect_for_b_tessel2_0(BITSELECT,276)@20
    expUdf_uid73_fpMulTest_BitSelect_for_b_tessel2_0_in <= STD_LOGIC_VECTOR(expFracRPostRounding_uid69_fpMulTest_p6_of_6_q);
    expUdf_uid73_fpMulTest_BitSelect_for_b_tessel2_0_b <= STD_LOGIC_VECTOR(expUdf_uid73_fpMulTest_BitSelect_for_b_tessel2_0_in(5 downto 5));

    -- redist1_expOvf_uid75_fpMulTest_BitSelect_for_a_tessel2_0_b_1(DELAY,330)
    redist1_expOvf_uid75_fpMulTest_BitSelect_for_a_tessel2_0_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expUdf_uid73_fpMulTest_BitSelect_for_b_tessel2_0_b, xout => redist1_expOvf_uid75_fpMulTest_BitSelect_for_a_tessel2_0_b_1_q, clk => clk, aclr => areset );

    -- expOvf_uid75_fpMulTest_p3_of_3(SUB,196)@21 + 1
    expOvf_uid75_fpMulTest_p3_of_3_cin <= expOvf_uid75_fpMulTest_p2_of_3_c;
    expOvf_uid75_fpMulTest_p3_of_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((1 downto 1 => redist1_expOvf_uid75_fpMulTest_BitSelect_for_a_tessel2_0_b_1_q(0)) & redist1_expOvf_uid75_fpMulTest_BitSelect_for_a_tessel2_0_b_1_q) & '0');
    expOvf_uid75_fpMulTest_p3_of_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & expOvf_uid75_fpMulTest_BitSelect_for_b_tessel2_0_b) & expOvf_uid75_fpMulTest_p3_of_3_cin(0));
    expOvf_uid75_fpMulTest_p3_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expOvf_uid75_fpMulTest_p3_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expOvf_uid75_fpMulTest_p3_of_3_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid75_fpMulTest_p3_of_3_a) - SIGNED(expOvf_uid75_fpMulTest_p3_of_3_b));
        END IF;
    END PROCESS;
    expOvf_uid75_fpMulTest_p3_of_3_c(0) <= expOvf_uid75_fpMulTest_p3_of_3_o(2);

    -- expOvf_uid75_fpMulTest_cout_n(LOGICAL,198)@22
    expOvf_uid75_fpMulTest_cout_n_a <= STD_LOGIC_VECTOR(expOvf_uid75_fpMulTest_p3_of_3_c);
    expOvf_uid75_fpMulTest_cout_n_q <= not (expOvf_uid75_fpMulTest_cout_n_a);

    -- invExpXIsMax_uid35_fpMulTest(LOGICAL,34)@22
    invExpXIsMax_uid35_fpMulTest_a <= redist53_expXIsMax_uid30_fpMulTest_q_22_q;
    invExpXIsMax_uid35_fpMulTest_q <= not (invExpXIsMax_uid35_fpMulTest_a);

    -- InvExpXIsZero_uid36_fpMulTest(LOGICAL,35)@22
    InvExpXIsZero_uid36_fpMulTest_a <= redist54_excZ_y_uid29_fpMulTest_q_22_q;
    InvExpXIsZero_uid36_fpMulTest_q <= not (InvExpXIsZero_uid36_fpMulTest_a);

    -- excR_y_uid37_fpMulTest(LOGICAL,36)@22
    excR_y_uid37_fpMulTest_a <= InvExpXIsZero_uid36_fpMulTest_q;
    excR_y_uid37_fpMulTest_b <= invExpXIsMax_uid35_fpMulTest_q;
    excR_y_uid37_fpMulTest_q <= excR_y_uid37_fpMulTest_a and excR_y_uid37_fpMulTest_b;

    -- invExpXIsMax_uid21_fpMulTest(LOGICAL,20)@22
    invExpXIsMax_uid21_fpMulTest_a <= redist56_expXIsMax_uid16_fpMulTest_q_22_q;
    invExpXIsMax_uid21_fpMulTest_q <= not (invExpXIsMax_uid21_fpMulTest_a);

    -- InvExpXIsZero_uid22_fpMulTest(LOGICAL,21)@22
    InvExpXIsZero_uid22_fpMulTest_a <= redist57_excZ_x_uid15_fpMulTest_q_22_q;
    InvExpXIsZero_uid22_fpMulTest_q <= not (InvExpXIsZero_uid22_fpMulTest_a);

    -- excR_x_uid23_fpMulTest(LOGICAL,22)@22
    excR_x_uid23_fpMulTest_a <= InvExpXIsZero_uid22_fpMulTest_q;
    excR_x_uid23_fpMulTest_b <= invExpXIsMax_uid21_fpMulTest_q;
    excR_x_uid23_fpMulTest_q <= excR_x_uid23_fpMulTest_a and excR_x_uid23_fpMulTest_b;

    -- ExcROvfAndInReg_uid84_fpMulTest(LOGICAL,83)@22
    ExcROvfAndInReg_uid84_fpMulTest_a <= excR_x_uid23_fpMulTest_q;
    ExcROvfAndInReg_uid84_fpMulTest_b <= excR_y_uid37_fpMulTest_q;
    ExcROvfAndInReg_uid84_fpMulTest_c <= expOvf_uid75_fpMulTest_cout_n_q;
    ExcROvfAndInReg_uid84_fpMulTest_q <= ExcROvfAndInReg_uid84_fpMulTest_a and ExcROvfAndInReg_uid84_fpMulTest_b and ExcROvfAndInReg_uid84_fpMulTest_c;

    -- excYRAndExcXI_uid83_fpMulTest(LOGICAL,82)@22
    excYRAndExcXI_uid83_fpMulTest_a <= excR_y_uid37_fpMulTest_q;
    excYRAndExcXI_uid83_fpMulTest_b <= excI_x_uid19_fpMulTest_q;
    excYRAndExcXI_uid83_fpMulTest_q <= excYRAndExcXI_uid83_fpMulTest_a and excYRAndExcXI_uid83_fpMulTest_b;

    -- excXRAndExcYI_uid82_fpMulTest(LOGICAL,81)@22
    excXRAndExcYI_uid82_fpMulTest_a <= excR_x_uid23_fpMulTest_q;
    excXRAndExcYI_uid82_fpMulTest_b <= excI_y_uid33_fpMulTest_q;
    excXRAndExcYI_uid82_fpMulTest_q <= excXRAndExcYI_uid82_fpMulTest_a and excXRAndExcYI_uid82_fpMulTest_b;

    -- excXIAndExcYI_uid81_fpMulTest(LOGICAL,80)@22
    excXIAndExcYI_uid81_fpMulTest_a <= excI_x_uid19_fpMulTest_q;
    excXIAndExcYI_uid81_fpMulTest_b <= excI_y_uid33_fpMulTest_q;
    excXIAndExcYI_uid81_fpMulTest_q <= excXIAndExcYI_uid81_fpMulTest_a and excXIAndExcYI_uid81_fpMulTest_b;

    -- excRInf_uid85_fpMulTest(LOGICAL,84)@22 + 1
    excRInf_uid85_fpMulTest_a <= excXIAndExcYI_uid81_fpMulTest_q;
    excRInf_uid85_fpMulTest_b <= excXRAndExcYI_uid82_fpMulTest_q;
    excRInf_uid85_fpMulTest_c <= excYRAndExcXI_uid83_fpMulTest_q;
    excRInf_uid85_fpMulTest_d <= ExcROvfAndInReg_uid84_fpMulTest_q;
    excRInf_uid85_fpMulTest_qi <= excRInf_uid85_fpMulTest_a or excRInf_uid85_fpMulTest_b or excRInf_uid85_fpMulTest_c or excRInf_uid85_fpMulTest_d;
    excRInf_uid85_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRInf_uid85_fpMulTest_qi, xout => excRInf_uid85_fpMulTest_q, clk => clk, aclr => areset );

    -- expUdf_uid73_fpMulTest_UpperBits_for_a(CONSTANT,176)
    expUdf_uid73_fpMulTest_UpperBits_for_a_q <= "000000000000";

    -- expUdf_uid73_fpMulTest_BitSelect_for_a_tessel0_1(BITSELECT,266)
    expUdf_uid73_fpMulTest_BitSelect_for_a_tessel0_1_in <= STD_LOGIC_VECTOR(expUdf_uid73_fpMulTest_UpperBits_for_a_q);
    expUdf_uid73_fpMulTest_BitSelect_for_a_tessel0_1_b <= STD_LOGIC_VECTOR(expUdf_uid73_fpMulTest_BitSelect_for_a_tessel0_1_in(4 downto 0));

    -- expUdf_uid73_fpMulTest_BitSelect_for_a_BitJoin_for_b(BITJOIN,267)@19
    expUdf_uid73_fpMulTest_BitSelect_for_a_BitJoin_for_b_q <= expUdf_uid73_fpMulTest_BitSelect_for_a_tessel0_1_b & GND_q;

    -- expUdf_uid73_fpMulTest_p1_of_3(SUB,182)@19 + 1
    expUdf_uid73_fpMulTest_p1_of_3_a <= STD_LOGIC_VECTOR("0" & expUdf_uid73_fpMulTest_BitSelect_for_a_BitJoin_for_b_q);
    expUdf_uid73_fpMulTest_p1_of_3_b <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid69_fpMulTest_p5_of_6_q);
    expUdf_uid73_fpMulTest_p1_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expUdf_uid73_fpMulTest_p1_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expUdf_uid73_fpMulTest_p1_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(expUdf_uid73_fpMulTest_p1_of_3_a) - UNSIGNED(expUdf_uid73_fpMulTest_p1_of_3_b));
        END IF;
    END PROCESS;
    expUdf_uid73_fpMulTest_p1_of_3_c(0) <= expUdf_uid73_fpMulTest_p1_of_3_o(6);

    -- expUdf_uid73_fpMulTest_BitSelect_for_a_tessel1_0(BITSELECT,268)
    expUdf_uid73_fpMulTest_BitSelect_for_a_tessel1_0_in <= STD_LOGIC_VECTOR(expUdf_uid73_fpMulTest_UpperBits_for_a_q);
    expUdf_uid73_fpMulTest_BitSelect_for_a_tessel1_0_b <= STD_LOGIC_VECTOR(expUdf_uid73_fpMulTest_BitSelect_for_a_tessel1_0_in(10 downto 5));

    -- expUdf_uid73_fpMulTest_p2_of_3(SUB,183)@20 + 1
    expUdf_uid73_fpMulTest_p2_of_3_cin <= expUdf_uid73_fpMulTest_p1_of_3_c;
    expUdf_uid73_fpMulTest_p2_of_3_a <= STD_LOGIC_VECTOR("0" & expUdf_uid73_fpMulTest_BitSelect_for_a_tessel1_0_b) & '0';
    expUdf_uid73_fpMulTest_p2_of_3_b <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid69_fpMulTest_p6_of_6_q) & expUdf_uid73_fpMulTest_p2_of_3_cin(0);
    expUdf_uid73_fpMulTest_p2_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expUdf_uid73_fpMulTest_p2_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expUdf_uid73_fpMulTest_p2_of_3_o <= STD_LOGIC_VECTOR(UNSIGNED(expUdf_uid73_fpMulTest_p2_of_3_a) - UNSIGNED(expUdf_uid73_fpMulTest_p2_of_3_b));
        END IF;
    END PROCESS;
    expUdf_uid73_fpMulTest_p2_of_3_c(0) <= expUdf_uid73_fpMulTest_p2_of_3_o(7);

    -- expUdf_uid73_fpMulTest_BitSelect_for_a_tessel2_0(BITSELECT,270)
    expUdf_uid73_fpMulTest_BitSelect_for_a_tessel2_0_in <= STD_LOGIC_VECTOR(expUdf_uid73_fpMulTest_UpperBits_for_a_q);
    expUdf_uid73_fpMulTest_BitSelect_for_a_tessel2_0_b <= STD_LOGIC_VECTOR(expUdf_uid73_fpMulTest_BitSelect_for_a_tessel2_0_in(11 downto 11));

    -- expUdf_uid73_fpMulTest_p3_of_3(SUB,184)@21 + 1
    expUdf_uid73_fpMulTest_p3_of_3_cin <= expUdf_uid73_fpMulTest_p2_of_3_c;
    expUdf_uid73_fpMulTest_p3_of_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & expUdf_uid73_fpMulTest_BitSelect_for_a_tessel2_0_b) & '0');
    expUdf_uid73_fpMulTest_p3_of_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((1 downto 1 => redist1_expOvf_uid75_fpMulTest_BitSelect_for_a_tessel2_0_b_1_q(0)) & redist1_expOvf_uid75_fpMulTest_BitSelect_for_a_tessel2_0_b_1_q) & expUdf_uid73_fpMulTest_p3_of_3_cin(0));
    expUdf_uid73_fpMulTest_p3_of_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expUdf_uid73_fpMulTest_p3_of_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expUdf_uid73_fpMulTest_p3_of_3_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid73_fpMulTest_p3_of_3_a) - SIGNED(expUdf_uid73_fpMulTest_p3_of_3_b));
        END IF;
    END PROCESS;
    expUdf_uid73_fpMulTest_p3_of_3_c(0) <= expUdf_uid73_fpMulTest_p3_of_3_o(2);

    -- expUdf_uid73_fpMulTest_cout_n(LOGICAL,186)@22
    expUdf_uid73_fpMulTest_cout_n_a <= STD_LOGIC_VECTOR(expUdf_uid73_fpMulTest_p3_of_3_c);
    expUdf_uid73_fpMulTest_cout_n_q <= not (expUdf_uid73_fpMulTest_cout_n_a);

    -- excZC3_uid79_fpMulTest(LOGICAL,78)@22
    excZC3_uid79_fpMulTest_a <= excR_x_uid23_fpMulTest_q;
    excZC3_uid79_fpMulTest_b <= excR_y_uid37_fpMulTest_q;
    excZC3_uid79_fpMulTest_c <= expUdf_uid73_fpMulTest_cout_n_q;
    excZC3_uid79_fpMulTest_q <= excZC3_uid79_fpMulTest_a and excZC3_uid79_fpMulTest_b and excZC3_uid79_fpMulTest_c;

    -- excYZAndExcXR_uid78_fpMulTest(LOGICAL,77)@22
    excYZAndExcXR_uid78_fpMulTest_a <= redist54_excZ_y_uid29_fpMulTest_q_22_q;
    excYZAndExcXR_uid78_fpMulTest_b <= excR_x_uid23_fpMulTest_q;
    excYZAndExcXR_uid78_fpMulTest_q <= excYZAndExcXR_uid78_fpMulTest_a and excYZAndExcXR_uid78_fpMulTest_b;

    -- excXZAndExcYR_uid77_fpMulTest(LOGICAL,76)@22
    excXZAndExcYR_uid77_fpMulTest_a <= redist57_excZ_x_uid15_fpMulTest_q_22_q;
    excXZAndExcYR_uid77_fpMulTest_b <= excR_y_uid37_fpMulTest_q;
    excXZAndExcYR_uid77_fpMulTest_q <= excXZAndExcYR_uid77_fpMulTest_a and excXZAndExcYR_uid77_fpMulTest_b;

    -- excXZAndExcYZ_uid76_fpMulTest(LOGICAL,75)@22
    excXZAndExcYZ_uid76_fpMulTest_a <= redist57_excZ_x_uid15_fpMulTest_q_22_q;
    excXZAndExcYZ_uid76_fpMulTest_b <= redist54_excZ_y_uid29_fpMulTest_q_22_q;
    excXZAndExcYZ_uid76_fpMulTest_q <= excXZAndExcYZ_uid76_fpMulTest_a and excXZAndExcYZ_uid76_fpMulTest_b;

    -- excRZero_uid80_fpMulTest(LOGICAL,79)@22 + 1
    excRZero_uid80_fpMulTest_a <= excXZAndExcYZ_uid76_fpMulTest_q;
    excRZero_uid80_fpMulTest_b <= excXZAndExcYR_uid77_fpMulTest_q;
    excRZero_uid80_fpMulTest_c <= excYZAndExcXR_uid78_fpMulTest_q;
    excRZero_uid80_fpMulTest_d <= excZC3_uid79_fpMulTest_q;
    excRZero_uid80_fpMulTest_qi <= excRZero_uid80_fpMulTest_a or excRZero_uid80_fpMulTest_b or excRZero_uid80_fpMulTest_c or excRZero_uid80_fpMulTest_d;
    excRZero_uid80_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRZero_uid80_fpMulTest_qi, xout => excRZero_uid80_fpMulTest_q, clk => clk, aclr => areset );

    -- concExc_uid90_fpMulTest(BITJOIN,89)@23
    concExc_uid90_fpMulTest_q <= excRNaN_uid89_fpMulTest_q & excRInf_uid85_fpMulTest_q & excRZero_uid80_fpMulTest_q;

    -- excREnc_uid91_fpMulTest(LOOKUP,90)@23
    excREnc_uid91_fpMulTest_combproc: PROCESS (concExc_uid90_fpMulTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid90_fpMulTest_q) IS
            WHEN "000" => excREnc_uid91_fpMulTest_q <= "01";
            WHEN "001" => excREnc_uid91_fpMulTest_q <= "00";
            WHEN "010" => excREnc_uid91_fpMulTest_q <= "10";
            WHEN "011" => excREnc_uid91_fpMulTest_q <= "00";
            WHEN "100" => excREnc_uid91_fpMulTest_q <= "11";
            WHEN "101" => excREnc_uid91_fpMulTest_q <= "00";
            WHEN "110" => excREnc_uid91_fpMulTest_q <= "00";
            WHEN "111" => excREnc_uid91_fpMulTest_q <= "00";
            WHEN OTHERS => -- unreachable
                           excREnc_uid91_fpMulTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid100_fpMulTest(MUX,99)@23
    expRPostExc_uid100_fpMulTest_s <= excREnc_uid91_fpMulTest_q;
    expRPostExc_uid100_fpMulTest_combproc: PROCESS (expRPostExc_uid100_fpMulTest_s, cstAllZWE_uid12_fpMulTest_q, redist48_expRPreExc_uid72_fpMulTest_b_3_q, cstAllOWE_uid10_fpMulTest_q)
    BEGIN
        CASE (expRPostExc_uid100_fpMulTest_s) IS
            WHEN "00" => expRPostExc_uid100_fpMulTest_q <= cstAllZWE_uid12_fpMulTest_q;
            WHEN "01" => expRPostExc_uid100_fpMulTest_q <= redist48_expRPreExc_uid72_fpMulTest_b_3_q;
            WHEN "10" => expRPostExc_uid100_fpMulTest_q <= cstAllOWE_uid10_fpMulTest_q;
            WHEN "11" => expRPostExc_uid100_fpMulTest_q <= cstAllOWE_uid10_fpMulTest_q;
            WHEN OTHERS => expRPostExc_uid100_fpMulTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid92_fpMulTest(CONSTANT,91)
    oneFracRPostExc2_uid92_fpMulTest_q <= "00000000000000000000001";

    -- fracRPreExc_uid70_fpMulTest(BITSELECT,69)@20
    fracRPreExc_uid70_fpMulTest_in <= expFracRPostRounding_uid69_fpMulTest_BitJoin_for_q_q(23 downto 0);
    fracRPreExc_uid70_fpMulTest_b <= fracRPreExc_uid70_fpMulTest_in(23 downto 1);

    -- redist49_fracRPreExc_uid70_fpMulTest_b_3(DELAY,378)
    redist49_fracRPreExc_uid70_fpMulTest_b_3 : dspba_delay
    GENERIC MAP ( width => 23, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreExc_uid70_fpMulTest_b, xout => redist49_fracRPreExc_uid70_fpMulTest_b_3_q, clk => clk, aclr => areset );

    -- fracRPostExc_uid95_fpMulTest(MUX,94)@23
    fracRPostExc_uid95_fpMulTest_s <= excREnc_uid91_fpMulTest_q;
    fracRPostExc_uid95_fpMulTest_combproc: PROCESS (fracRPostExc_uid95_fpMulTest_s, cstZeroWF_uid11_fpMulTest_q, redist49_fracRPreExc_uid70_fpMulTest_b_3_q, oneFracRPostExc2_uid92_fpMulTest_q)
    BEGIN
        CASE (fracRPostExc_uid95_fpMulTest_s) IS
            WHEN "00" => fracRPostExc_uid95_fpMulTest_q <= cstZeroWF_uid11_fpMulTest_q;
            WHEN "01" => fracRPostExc_uid95_fpMulTest_q <= redist49_fracRPreExc_uid70_fpMulTest_b_3_q;
            WHEN "10" => fracRPostExc_uid95_fpMulTest_q <= cstZeroWF_uid11_fpMulTest_q;
            WHEN "11" => fracRPostExc_uid95_fpMulTest_q <= oneFracRPostExc2_uid92_fpMulTest_q;
            WHEN OTHERS => fracRPostExc_uid95_fpMulTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid103_fpMulTest(BITJOIN,102)@23
    R_uid103_fpMulTest_q <= signRPostExc_uid102_fpMulTest_q & expRPostExc_uid100_fpMulTest_q & fracRPostExc_uid95_fpMulTest_q;

    -- xOut(GPOUT,4)@23
    q <= R_uid103_fpMulTest_q;

END normal;
