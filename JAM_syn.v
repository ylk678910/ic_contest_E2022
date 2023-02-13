/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : R-2020.09
// Date      : Wed Mar 30 14:48:11 2022
/////////////////////////////////////////////////////////////


module JAM_DW01_add_0 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3;
  wire   [9:1] carry;

  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  AND2X2 U2 ( .A(A[8]), .B(n3), .Y(n2) );
  XOR2XL U3 ( .A(A[8]), .B(n3), .Y(SUM[8]) );
  XOR2XL U4 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  XOR2X1 U5 ( .A(A[9]), .B(n2), .Y(SUM[9]) );
  AND2X2 U6 ( .A(A[7]), .B(carry[7]), .Y(n3) );
  XOR2X1 U7 ( .A(A[7]), .B(carry[7]), .Y(SUM[7]) );
endmodule


module JAM ( CLK, RST, W, J, Cost, MatchCount, MinCost, Valid );
  output [2:0] W;
  output [2:0] J;
  input [6:0] Cost;
  output [3:0] MatchCount;
  output [9:0] MinCost;
  input CLK, RST;
  output Valid;
  wire   N160, N161, N165, N166, N167, N168, N169, N170, N171, N172, N173,
         N174, N175, N176, N180, N181, N182, N183, N184, N185, n779, n780,
         n781, n782, n783, n784, n785, n786, n787, n788, n789, n790, n791,
         n792, \dictionary[7][2] , \dictionary[7][1] , \dictionary[7][0] ,
         \dictionary[6][2] , \dictionary[6][1] , \dictionary[6][0] ,
         \dictionary[5][2] , \dictionary[5][1] , \dictionary[5][0] ,
         \dictionary[4][2] , \dictionary[4][1] , \dictionary[4][0] ,
         \dictionary[3][2] , \dictionary[3][1] , \dictionary[3][0] ,
         \dictionary[2][2] , \dictionary[2][1] , \dictionary[2][0] ,
         \dictionary[1][2] , \dictionary[1][1] , \dictionary[1][0] ,
         \dictionary[0][2] , \dictionary[0][1] , \dictionary[0][0] ,
         \dic_cmpl[0] , \replace[2] , \cur_state_tmp1[1] , fsm0_2_flg,
         find_flg1, fsm0_finish_flg, fsm1_finish_flg, N209, N210, N224, N225,
         find_flg0, N251, N252, N253, N342, N343, N344, N353, N354, N355,
         \dictionary_tmp[7][2] , \dictionary_tmp[7][1] ,
         \dictionary_tmp[7][0] , \dictionary_tmp[6][2] ,
         \dictionary_tmp[6][1] , \dictionary_tmp[6][0] ,
         \dictionary_tmp[5][2] , \dictionary_tmp[5][1] ,
         \dictionary_tmp[5][0] , \dictionary_tmp[4][2] ,
         \dictionary_tmp[4][1] , \dictionary_tmp[4][0] ,
         \dictionary_tmp[3][2] , \dictionary_tmp[3][1] ,
         \dictionary_tmp[3][0] , \dictionary_tmp[2][2] ,
         \dictionary_tmp[2][1] , \dictionary_tmp[2][0] ,
         \dictionary_tmp[1][2] , \dictionary_tmp[1][1] ,
         \dictionary_tmp[1][0] , \dictionary_tmp[0][2] ,
         \dictionary_tmp[0][1] , \dictionary_tmp[0][0] , N595, N596, N597,
         N621, N622, N623, N674, N675, N676, N678, N679, N680, N681, N682,
         N683, N684, N685, N686, N687, N705, N706, N707, N725, N726, n55, n56,
         n61, n64, n66, n67, n68, n70, n72, n73, n77, n78, n80, n84, n103,
         n121, n124, n125, n129, n130, n132, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249,
         n250, n251, n252, n253, n254, n255, n256, n257, n258, n259, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n271,
         n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, n282,
         n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326,
         n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348,
         n349, n350, n351, n352, n353, n354, n355, n356, n357, n358, n359,
         n360, n361, n362, n363, n364, n365, n366, n367, n368, n369, n370,
         n371, n372, n373, n374, n375, n376, n377, n378, n379, n380, n381,
         n382, n383, n384, n385, n386, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n442, n443, n444, n445, n446, n447,
         n448, n449, n450, n451, n452, n453, n454, n455, n456, n457, n458,
         n459, n460, n461, n462, n463, n464, n465, n466, n467, n468, n469,
         n470, n471, n472, n473, n474, n475, n476, n477, n478, n479, n480,
         n481, n482, n483, n484, n506, n507, n508, n509, n510, n511, n512,
         n513, n514, n515, n516, n517, n518, n519, n520, n521, n522, n523,
         n524, n525, n526, n527, n528, n529, n530, n531, n532, n533, n534,
         n535, n536, n537, n538, n539, n540, n541, n542, n543, n544, n545,
         n546, n547, n548, n549, n550, n551, n552, n553, n554, n555, n556,
         n557, n558, n559, n560, n561, n562, n563, n564, n565, n566, n567,
         n568, n569, n570, n571, n572, n573, n574, n575, n576, n577, n578,
         n579, n580, n581, n582, n583, n584, n585, n586, n587, n588, n589,
         n590, n591, n592, n593, n594, n595, n596, n597, n598, n599, n600,
         n601, n602, n603, n604, n605, n606, n607, n608, n609, n610, n611,
         n612, n613, n614, n615, n616, n617, n618, n619, n620, n621, n622,
         n623, n624, n625, n626, n627, n628, n629, n630, n631, n632, n633,
         n634, n635, n636, n637, n638, n639, n640, n641, n642, n643, n644,
         n645, n646, n647, n648, n649, n650, n651, n652, n653, n654, n655,
         n656, n657, n658, n659, n660, n661, n662, n663, n664, n665, n666,
         n667, n668, n669, n670, n671, n672, n673, n674, n675, n676, n677,
         n678, n679, n680, n681, n682, n683, n684, n685, n686, n687, n688,
         n689, n690, n691, n692, n693, n694, n695, n696, n697, n698, n699,
         n700, n701, n702, n703, n704, n705, n706, n707, n708, n709, n710,
         n711, n712, n713, n714, n715, n716, n717, n718, n719, n720, n721,
         n722, n723, n724, n725, n726, n727, n728, n729, n730, n731, n732,
         n733, n734, n735, n736, n737, n738, n739, n740, n741, n742, n743,
         n744, n745, n746, n747, n748, n749, n750, n751, n752, n753, n754,
         n755, n756, n757, n758, n759, n760, n761, n762, n763, n764, n765,
         n766, n767, n768, n769, n770, n771, n772, n773, n774, n775, n776,
         n777, n778;
  wire   [2:0] dic_cmpr;
  wire   [1:0] cur_state1;
  wire   [1:0] cur_state0;
  wire   [9:0] TotalCost;

  AOI211X2 U124 ( .A0(n740), .A1(n223), .B0(n235), .C0(n236), .Y(n221) );
  AOI211X2 U144 ( .A0(n740), .A1(n242), .B0(n251), .C0(n252), .Y(n239) );
  AOI211X2 U160 ( .A0(n738), .A1(n755), .B0(n731), .C0(n268), .Y(n253) );
  AOI211X2 U175 ( .A0(n738), .A1(n276), .B0(n731), .C0(n284), .Y(n274) );
  OAI211X2 U316 ( .A0(n245), .A1(n56), .B0(n213), .C0(n337), .Y(n327) );
  JAM_DW01_add_0 add_458 ( .A(TotalCost), .B({1'b0, 1'b0, 1'b0, Cost}), .CI(
        1'b0), .SUM({N687, N686, N685, N684, N683, N682, N681, N680, N679, 
        N678}) );
  EDFFX1 find_flg1_reg ( .D(n513), .E(n343), .CK(CLK), .Q(find_flg1), .QN(n103) );
  DFFQX1 fsm1_finish_flg_reg ( .D(n471), .CK(CLK), .Q(fsm1_finish_flg) );
  DFFQX1 \cur_state_tmp1_reg[1]  ( .D(cur_state1[1]), .CK(CLK), .Q(
        \cur_state_tmp1[1] ) );
  DFFQX1 \dictionary_tmp_reg[6][2]  ( .D(n413), .CK(CLK), .Q(
        \dictionary_tmp[6][2] ) );
  DFFQX1 \dictionary_tmp_reg[6][0]  ( .D(n415), .CK(CLK), .Q(
        \dictionary_tmp[6][0] ) );
  DFFQX1 \dictionary_tmp_reg[6][1]  ( .D(n414), .CK(CLK), .Q(
        \dictionary_tmp[6][1] ) );
  DFFQX1 \dictionary_tmp_reg[7][2]  ( .D(n410), .CK(CLK), .Q(
        \dictionary_tmp[7][2] ) );
  DFFX1 \cur_state_tmp1_reg[0]  ( .D(cur_state1[0]), .CK(CLK), .QN(n55) );
  DFFQX1 \dictionary_tmp_reg[2][2]  ( .D(n425), .CK(CLK), .Q(
        \dictionary_tmp[2][2] ) );
  DFFQX1 \dictionary_tmp_reg[2][0]  ( .D(n427), .CK(CLK), .Q(
        \dictionary_tmp[2][0] ) );
  DFFQX1 \dictionary_tmp_reg[7][0]  ( .D(n412), .CK(CLK), .Q(
        \dictionary_tmp[7][0] ) );
  DFFQX1 \dictionary_tmp_reg[7][1]  ( .D(n411), .CK(CLK), .Q(
        \dictionary_tmp[7][1] ) );
  DFFQX1 \dictionary_tmp_reg[2][1]  ( .D(n426), .CK(CLK), .Q(
        \dictionary_tmp[2][1] ) );
  DFFQX1 \dictionary_tmp_reg[3][2]  ( .D(n422), .CK(CLK), .Q(
        \dictionary_tmp[3][2] ) );
  DFFQX1 \dictionary_tmp_reg[3][1]  ( .D(n423), .CK(CLK), .Q(
        \dictionary_tmp[3][1] ) );
  DFFQX1 \dictionary_tmp_reg[3][0]  ( .D(n424), .CK(CLK), .Q(
        \dictionary_tmp[3][0] ) );
  DFFQX1 \dictionary_tmp_reg[5][2]  ( .D(n416), .CK(CLK), .Q(
        \dictionary_tmp[5][2] ) );
  DFFQX1 \dictionary_tmp_reg[1][2]  ( .D(n428), .CK(CLK), .Q(
        \dictionary_tmp[1][2] ) );
  DFFQX1 \dictionary_tmp_reg[1][1]  ( .D(n429), .CK(CLK), .Q(
        \dictionary_tmp[1][1] ) );
  DFFQX1 \dictionary_tmp_reg[5][1]  ( .D(n417), .CK(CLK), .Q(
        \dictionary_tmp[5][1] ) );
  DFFQX1 \dictionary_tmp_reg[1][0]  ( .D(n430), .CK(CLK), .Q(
        \dictionary_tmp[1][0] ) );
  DFFQX1 \dictionary_tmp_reg[5][0]  ( .D(n418), .CK(CLK), .Q(
        \dictionary_tmp[5][0] ) );
  DFFQX1 \dictionary_tmp_reg[4][2]  ( .D(n419), .CK(CLK), .Q(
        \dictionary_tmp[4][2] ) );
  DFFQX1 \dictionary_tmp_reg[0][2]  ( .D(n431), .CK(CLK), .Q(
        \dictionary_tmp[0][2] ) );
  DFFQX1 \dictionary_tmp_reg[0][1]  ( .D(n432), .CK(CLK), .Q(
        \dictionary_tmp[0][1] ) );
  DFFQX1 \dictionary_tmp_reg[0][0]  ( .D(n433), .CK(CLK), .Q(
        \dictionary_tmp[0][0] ) );
  DFFQX1 \dictionary_tmp_reg[4][1]  ( .D(n420), .CK(CLK), .Q(
        \dictionary_tmp[4][1] ) );
  DFFQX1 \dictionary_tmp_reg[4][0]  ( .D(n421), .CK(CLK), .Q(
        \dictionary_tmp[4][0] ) );
  DFFQX1 fsm0_finish_flg_reg ( .D(n472), .CK(CLK), .Q(fsm0_finish_flg) );
  DFFQX1 \cur_state1_reg[1]  ( .D(N225), .CK(CLK), .Q(cur_state1[1]) );
  EDFFX1 find_flg0_reg ( .D(n512), .E(n357), .CK(CLK), .Q(find_flg0) );
  DFFTRX1 finish_flg_reg ( .D(n336), .RN(n512), .CK(CLK), .Q(fsm0_2_flg), .QN(
        n56) );
  DFFQX1 \tran_ptr_max_reg[1]  ( .D(n459), .CK(CLK), .Q(N175) );
  DFFQX1 \tran_ptr_min_reg[1]  ( .D(n461), .CK(CLK), .Q(N172) );
  DFFQX1 \cur_state1_reg[0]  ( .D(N224), .CK(CLK), .Q(cur_state1[0]) );
  DFFQX1 \ptr1_reg[1]  ( .D(n723), .CK(CLK), .Q(N184) );
  DFFQX1 \MinCost_reg[7]  ( .D(n396), .CK(CLK), .Q(n785) );
  DFFQX1 \MinCost_reg[2]  ( .D(n391), .CK(CLK), .Q(n790) );
  DFFQX1 \MinCost_reg[9]  ( .D(n398), .CK(CLK), .Q(n783) );
  DFFQX1 \MatchCount_reg[0]  ( .D(n389), .CK(CLK), .Q(n782) );
  DFFQX1 \MinCost_reg[0]  ( .D(n399), .CK(CLK), .Q(n792) );
  DFFQX1 \MatchCount_reg[2]  ( .D(n387), .CK(CLK), .Q(n780) );
  DFFQX1 \MinCost_reg[8]  ( .D(n397), .CK(CLK), .Q(n784) );
  DFFQX1 \MinCost_reg[5]  ( .D(n394), .CK(CLK), .Q(n787) );
  DFFQX1 \MinCost_reg[4]  ( .D(n393), .CK(CLK), .Q(n788) );
  DFFQX1 \MinCost_reg[1]  ( .D(n390), .CK(CLK), .Q(n791) );
  DFFQX1 \MinCost_reg[6]  ( .D(n395), .CK(CLK), .Q(n786) );
  DFFQX1 \MinCost_reg[3]  ( .D(n392), .CK(CLK), .Q(n789) );
  DFFX1 \cur_state0_reg[0]  ( .D(N209), .CK(CLK), .Q(cur_state0[0]), .QN(n742)
         );
  DFFX1 \ptr1_reg[2]  ( .D(n469), .CK(CLK), .Q(N185), .QN(n687) );
  DFFX1 \tran_ptr_max_reg[2]  ( .D(n458), .CK(CLK), .Q(N176), .QN(n635) );
  DFFX1 \ptr0_reg[1]  ( .D(n474), .CK(CLK), .Q(N160), .QN(n543) );
  DFFX1 \tran_ptr_min_reg[0]  ( .D(n462), .CK(CLK), .Q(N171), .QN(n761) );
  DFFX1 \replace_ptr_reg[2]  ( .D(n466), .CK(CLK), .Q(N167), .QN(n582) );
  DFFX1 \replace_ptr_reg[1]  ( .D(n467), .CK(CLK), .Q(N166), .QN(n581) );
  DFFXL \TotalCost_reg[3]  ( .D(n406), .CK(CLK), .Q(TotalCost[3]), .QN(n720)
         );
  DFFXL \TotalCost_reg[1]  ( .D(n408), .CK(CLK), .Q(TotalCost[1]), .QN(n722)
         );
  DFFXL \TotalCost_reg[4]  ( .D(n405), .CK(CLK), .Q(TotalCost[4]), .QN(n125)
         );
  DFFXL \MatchCount_reg[1]  ( .D(n388), .CK(CLK), .Q(n781), .QN(n132) );
  DFFXL \TotalCost_reg[5]  ( .D(n404), .CK(CLK), .Q(TotalCost[5]), .QN(n124)
         );
  DFFXL \MatchCount_reg[3]  ( .D(n386), .CK(CLK), .Q(n779), .QN(n130) );
  DFFXL \TotalCost_reg[6]  ( .D(n403), .CK(CLK), .Q(TotalCost[6]), .QN(n719)
         );
  DFFTRX1 \W_reg[2]  ( .D(N185), .RN(n513), .CK(CLK), .QN(n482) );
  DFFTRX1 \W_reg[1]  ( .D(N184), .RN(n160), .CK(CLK), .QN(n481) );
  DFFTRXL \W_reg[0]  ( .D(N183), .RN(n160), .CK(CLK), .QN(n483) );
  DFFTRX1 \J_reg[2]  ( .D(N674), .RN(n160), .CK(CLK), .QN(n480) );
  DFFTRX1 \J_reg[1]  ( .D(N675), .RN(n160), .CK(CLK), .QN(n479) );
  DFFTRX1 \J_reg[0]  ( .D(N676), .RN(n160), .CK(CLK), .QN(n478) );
  DFFTRX1 Valid_reg ( .D(n312), .RN(n724), .CK(CLK), .QN(n477) );
  DFFX2 \ptr0_reg[2]  ( .D(n473), .CK(CLK), .Q(N161), .QN(n542) );
  DFFX2 \min_num_ptr_reg[2]  ( .D(n463), .CK(CLK), .Q(N170), .QN(n750) );
  DFFX2 \dictionary_reg[3][2]  ( .D(n445), .CK(CLK), .Q(\dictionary[3][2] ), 
        .QN(n764) );
  DFFX2 \dictionary_reg[6][0]  ( .D(n438), .CK(CLK), .Q(\dictionary[6][0] ), 
        .QN(n767) );
  DFFX2 \dictionary_reg[2][2]  ( .D(n448), .CK(CLK), .Q(\dictionary[2][2] ), 
        .QN(n765) );
  DFFX2 \dictionary_reg[2][0]  ( .D(n450), .CK(CLK), .Q(\dictionary[2][0] ), 
        .QN(n766) );
  DFFX2 \tran_ptr_min_reg[2]  ( .D(n460), .CK(CLK), .Q(N173), .QN(n616) );
  DFFX2 \tran_ptr_max_reg[0]  ( .D(n476), .CK(CLK), .Q(N174), .QN(n636) );
  DFFX2 \dictionary_reg[5][1]  ( .D(n440), .CK(CLK), .Q(\dictionary[5][1] ), 
        .QN(n768) );
  DFFX2 \dictionary_reg[1][2]  ( .D(n451), .CK(CLK), .Q(\dictionary[1][2] ), 
        .QN(n771) );
  DFFX2 \dictionary_reg[1][1]  ( .D(n452), .CK(CLK), .Q(\dictionary[1][1] ), 
        .QN(n772) );
  DFFX2 \dictionary_reg[0][2]  ( .D(n454), .CK(CLK), .Q(\dictionary[0][2] ), 
        .QN(n773) );
  DFFX2 \dictionary_reg[0][0]  ( .D(n456), .CK(CLK), .Q(\dictionary[0][0] ), 
        .QN(n775) );
  DFFX2 \dictionary_reg[0][1]  ( .D(n455), .CK(CLK), .Q(\dictionary[0][1] ), 
        .QN(n774) );
  DFFX2 \dictionary_reg[4][0]  ( .D(n444), .CK(CLK), .Q(\dictionary[4][0] ), 
        .QN(n770) );
  DFFX2 \dictionary_reg[4][1]  ( .D(n443), .CK(CLK), .Q(\dictionary[4][1] ), 
        .QN(n769) );
  DFFX2 \cur_state0_reg[1]  ( .D(N210), .CK(CLK), .Q(cur_state0[1]) );
  DFFX2 \dictionary_reg[7][2]  ( .D(n434), .CK(CLK), .Q(\dictionary[7][2] ), 
        .QN(n61) );
  DFFX2 \dictionary_reg[7][0]  ( .D(n435), .CK(CLK), .Q(\dictionary[7][0] ), 
        .QN(n66) );
  DFFX2 \dictionary_reg[7][1]  ( .D(n457), .CK(CLK), .Q(\dictionary[7][1] ), 
        .QN(n64) );
  DFFX2 \dictionary_reg[3][1]  ( .D(n446), .CK(CLK), .Q(\dictionary[3][1] ), 
        .QN(n77) );
  DFFX2 \dictionary_reg[3][0]  ( .D(n447), .CK(CLK), .Q(\dictionary[3][0] ), 
        .QN(n78) );
  DFFX2 \min_num_ptr_reg[1]  ( .D(n464), .CK(CLK), .Q(N169), .QN(n751) );
  DFFX2 \min_num_ptr_reg[0]  ( .D(n465), .CK(CLK), .Q(N168), .QN(n752) );
  DFFX2 \dictionary_reg[2][1]  ( .D(n449), .CK(CLK), .Q(\dictionary[2][1] ), 
        .QN(n80) );
  DFFX2 \dictionary_reg[6][1]  ( .D(n437), .CK(CLK), .Q(\dictionary[6][1] ), 
        .QN(n68) );
  DFFX2 \dictionary_reg[6][2]  ( .D(n436), .CK(CLK), .Q(\dictionary[6][2] ), 
        .QN(n67) );
  DFFX2 \dictionary_reg[5][2]  ( .D(n439), .CK(CLK), .Q(\dictionary[5][2] ), 
        .QN(n70) );
  DFFX2 \dictionary_reg[1][0]  ( .D(n453), .CK(CLK), .Q(\dictionary[1][0] ), 
        .QN(n84) );
  DFFX2 \dictionary_reg[5][0]  ( .D(n441), .CK(CLK), .Q(\dictionary[5][0] ), 
        .QN(n72) );
  DFFX2 \dictionary_reg[4][2]  ( .D(n442), .CK(CLK), .Q(\dictionary[4][2] ), 
        .QN(n73) );
  DFFX1 \TotalCost_reg[8]  ( .D(n401), .CK(CLK), .Q(TotalCost[8]), .QN(n121)
         );
  DFFX2 \ptr0_reg[0]  ( .D(n475), .CK(CLK), .Q(n563), .QN(N180) );
  DFFX1 \TotalCost_reg[2]  ( .D(n407), .CK(CLK), .Q(TotalCost[2]), .QN(n721)
         );
  DFFX1 \TotalCost_reg[7]  ( .D(n402), .CK(CLK), .Q(TotalCost[7]), .QN(n718)
         );
  DFFX1 \TotalCost_reg[9]  ( .D(n400), .CK(CLK), .Q(TotalCost[9]), .QN(n715)
         );
  DFFX1 \TotalCost_reg[0]  ( .D(n409), .CK(CLK), .Q(TotalCost[0]), .QN(n129)
         );
  DFFX2 \replace_ptr_reg[0]  ( .D(n468), .CK(CLK), .Q(N165), .QN(n754) );
  DFFX1 \ptr1_reg[0]  ( .D(n470), .CK(CLK), .Q(N183), .QN(n689) );
  CLKINVX1 U428 ( .A(n788), .Y(n714) );
  CLKINVX1 U429 ( .A(n787), .Y(n713) );
  CLKINVX1 U430 ( .A(n784), .Y(n712) );
  AOI211X1 U431 ( .A0(n738), .A1(n303), .B0(n731), .C0(n737), .Y(n301) );
  NOR3BX2 U432 ( .AN(n514), .B(n312), .C(RST), .Y(n206) );
  OAI31X1 U433 ( .A0(n335), .A1(cur_state0[0]), .A2(n336), .B0(n337), .Y(n333)
         );
  CLKINVX1 U434 ( .A(n780), .Y(n778) );
  CLKINVX1 U435 ( .A(n782), .Y(n777) );
  OA21XL U436 ( .A0(n735), .A1(n782), .B0(n138), .Y(n142) );
  OA22X1 U437 ( .A0(n582), .A1(n571), .B0(N167), .B1(n570), .Y(n484) );
  NOR2X2 U438 ( .A(n581), .B(N165), .Y(n577) );
  NOR2X2 U439 ( .A(n688), .B(N183), .Y(n684) );
  NOR2X2 U440 ( .A(n562), .B(N180), .Y(n558) );
  NOR2X2 U441 ( .A(n654), .B(N180), .Y(n650) );
  AOI2BB1XL U442 ( .A0N(N166), .A1N(n754), .B0(n216), .Y(n332) );
  OAI33XL U443 ( .A0(N165), .A1(N166), .A2(n238), .B0(N174), .B1(n519), .B2(
        n218), .Y(n251) );
  OAI33XL U444 ( .A0(n754), .A1(N166), .A2(n238), .B0(n218), .B1(n519), .B2(
        n636), .Y(n235) );
  NOR3XL U445 ( .A(N166), .B(N167), .C(n270), .Y(n298) );
  NOR2X2 U446 ( .A(n751), .B(N168), .Y(n596) );
  NOR3X2 U447 ( .A(N169), .B(N170), .C(N168), .Y(n304) );
  AO22XL U448 ( .A0(\dictionary[5][0] ), .A1(n536), .B0(\dictionary[4][0] ), 
        .B1(n535), .Y(n526) );
  AO22XL U449 ( .A0(\dictionary[5][0] ), .A1(n555), .B0(\dictionary[4][0] ), 
        .B1(n554), .Y(n545) );
  AO22XL U450 ( .A0(\dictionary[5][0] ), .A1(n574), .B0(\dictionary[4][0] ), 
        .B1(n573), .Y(n564) );
  AO22XL U451 ( .A0(\dictionary[5][0] ), .A1(n647), .B0(\dictionary[4][0] ), 
        .B1(n646), .Y(n637) );
  AO22XL U452 ( .A0(\dictionary[5][0] ), .A1(n593), .B0(\dictionary[4][0] ), 
        .B1(n592), .Y(n583) );
  AO22XL U453 ( .A0(\dictionary[5][0] ), .A1(n610), .B0(\dictionary[4][0] ), 
        .B1(n609), .Y(n600) );
  AO22XL U454 ( .A0(\dictionary[1][0] ), .A1(n555), .B0(\dictionary[0][0] ), 
        .B1(n554), .Y(n546) );
  AO22XL U455 ( .A0(\dictionary[1][0] ), .A1(n536), .B0(\dictionary[0][0] ), 
        .B1(n535), .Y(n527) );
  AO22XL U456 ( .A0(\dictionary[1][0] ), .A1(n574), .B0(\dictionary[0][0] ), 
        .B1(n573), .Y(n565) );
  AO22XL U457 ( .A0(\dictionary[1][0] ), .A1(n647), .B0(\dictionary[0][0] ), 
        .B1(n646), .Y(n638) );
  AO22XL U458 ( .A0(\dictionary[1][0] ), .A1(n593), .B0(\dictionary[0][0] ), 
        .B1(n592), .Y(n584) );
  AO22XL U459 ( .A0(\dictionary[1][0] ), .A1(n610), .B0(\dictionary[0][0] ), 
        .B1(n609), .Y(n601) );
  NOR2X2 U460 ( .A(n763), .B(N174), .Y(n632) );
  INVX12 U461 ( .A(n477), .Y(Valid) );
  INVX12 U462 ( .A(n478), .Y(J[0]) );
  INVX12 U463 ( .A(n479), .Y(J[1]) );
  INVX12 U464 ( .A(n480), .Y(J[2]) );
  INVX12 U465 ( .A(n483), .Y(W[0]) );
  INVX12 U466 ( .A(n481), .Y(W[1]) );
  INVX12 U467 ( .A(n482), .Y(W[2]) );
  BUFX12 U468 ( .A(n789), .Y(MinCost[3]) );
  BUFX12 U469 ( .A(n779), .Y(MatchCount[3]) );
  BUFX12 U470 ( .A(n781), .Y(MatchCount[1]) );
  BUFX12 U471 ( .A(n786), .Y(MinCost[6]) );
  BUFX16 U472 ( .A(n791), .Y(MinCost[1]) );
  INVX12 U473 ( .A(n714), .Y(MinCost[4]) );
  INVX12 U474 ( .A(n713), .Y(MinCost[5]) );
  INVX12 U475 ( .A(n712), .Y(MinCost[8]) );
  INVX12 U476 ( .A(n778), .Y(MatchCount[2]) );
  BUFX16 U477 ( .A(n792), .Y(MinCost[0]) );
  INVX12 U478 ( .A(n777), .Y(MatchCount[0]) );
  BUFX16 U479 ( .A(n783), .Y(MinCost[9]) );
  OA22XL U480 ( .A0(n716), .A1(n698), .B0(MinCost[9]), .B1(n715), .Y(N726) );
  BUFX12 U481 ( .A(n790), .Y(MinCost[2]) );
  BUFX12 U482 ( .A(n785), .Y(MinCost[7]) );
  NOR2BXL U483 ( .AN(TotalCost[0]), .B(MinCost[0]), .Y(n691) );
  OAI2BB1XL U484 ( .A0N(n691), .A1N(TotalCost[1]), .B0(MinCost[1]), .Y(n690)
         );
  NAND2XL U485 ( .A(n790), .B(n721), .Y(n706) );
  NOR2BXL U486 ( .AN(n789), .B(TotalCost[3]), .Y(n709) );
  NOR2BXL U487 ( .AN(n786), .B(TotalCost[6]), .Y(n708) );
  NAND2XL U488 ( .A(n785), .B(n718), .Y(n702) );
  NAND2XL U489 ( .A(MinCost[9]), .B(n715), .Y(n705) );
  NOR2BXL U490 ( .AN(MinCost[0]), .B(TotalCost[0]), .Y(n699) );
  CLKINVX1 U491 ( .A(n245), .Y(n741) );
  NOR2X1 U492 ( .A(n746), .B(n356), .Y(n312) );
  NOR2X1 U493 ( .A(n219), .B(n616), .Y(n196) );
  AOI2BB1X1 U494 ( .A0N(n175), .A1N(n743), .B0(RST), .Y(n161) );
  OAI21X1 U495 ( .A0(cur_state0[1]), .A1(n744), .B0(n337), .Y(n341) );
  CLKINVX1 U496 ( .A(n212), .Y(n734) );
  CLKINVX1 U497 ( .A(n296), .Y(n733) );
  NAND2X1 U498 ( .A(cur_state0[1]), .B(n742), .Y(n245) );
  NAND2X2 U499 ( .A(cur_state0[1]), .B(cur_state0[0]), .Y(n213) );
  NAND2X1 U500 ( .A(N176), .B(n738), .Y(n218) );
  NOR2X1 U501 ( .A(cur_state0[0]), .B(cur_state0[1]), .Y(n367) );
  NOR3X2 U502 ( .A(N171), .B(n520), .C(n616), .Y(n244) );
  NOR3X2 U503 ( .A(N168), .B(N170), .C(n751), .Y(n277) );
  NOR3X2 U504 ( .A(n751), .B(N168), .C(n750), .Y(n194) );
  NOR3X2 U505 ( .A(n752), .B(N170), .C(n751), .Y(n257) );
  NOR3X2 U506 ( .A(N169), .B(N170), .C(n752), .Y(n288) );
  NOR3X2 U507 ( .A(n752), .B(N169), .C(n750), .Y(n223) );
  NOR3X2 U508 ( .A(N168), .B(N169), .C(n750), .Y(n242) );
  NOR3X2 U509 ( .A(n520), .B(N173), .C(N171), .Y(n303) );
  NOR2X1 U510 ( .A(n514), .B(n253), .Y(n262) );
  NOR2X1 U511 ( .A(n726), .B(n753), .Y(n258) );
  CLKBUFX3 U512 ( .A(n181), .Y(n515) );
  NAND2BX1 U513 ( .AN(n312), .B(n522), .Y(n181) );
  CLKINVX1 U514 ( .A(n363), .Y(n727) );
  AOI2BB1X1 U515 ( .A0N(n544), .A1N(n728), .B0(n363), .Y(n365) );
  NOR2X1 U516 ( .A(n514), .B(n732), .Y(n176) );
  NAND2X1 U517 ( .A(n312), .B(n522), .Y(n371) );
  CLKBUFX3 U518 ( .A(n203), .Y(n514) );
  NOR2X1 U519 ( .A(n741), .B(n738), .Y(n203) );
  CLKINVX1 U520 ( .A(n265), .Y(n755) );
  CLKINVX1 U521 ( .A(n196), .Y(n760) );
  CLKINVX1 U522 ( .A(n295), .Y(n757) );
  CLKINVX1 U523 ( .A(N725), .Y(n776) );
  CLKINVX1 U524 ( .A(n141), .Y(n735) );
  OA21XL U525 ( .A0(n139), .A1(n735), .B0(n138), .Y(n137) );
  NAND2X2 U526 ( .A(n522), .B(n145), .Y(n138) );
  OAI21XL U527 ( .A0(N725), .A1(N726), .B0(n146), .Y(n145) );
  OAI21XL U528 ( .A0(n137), .A1(n778), .B0(n140), .Y(n387) );
  NAND4X1 U529 ( .A(n141), .B(n139), .C(n138), .D(n778), .Y(n140) );
  CLKBUFX3 U530 ( .A(n147), .Y(n518) );
  NAND3X1 U531 ( .A(n146), .B(n776), .C(N726), .Y(n147) );
  OAI21XL U532 ( .A0(n777), .A1(n138), .B0(n144), .Y(n389) );
  OAI211X1 U533 ( .A0(n776), .A1(n777), .B0(n138), .C0(n523), .Y(n144) );
  OAI32X1 U534 ( .A0(n763), .A1(n636), .A2(n269), .B0(n270), .B1(n271), .Y(
        n268) );
  NOR2BX1 U535 ( .AN(n272), .B(n257), .Y(n271) );
  CLKINVX1 U536 ( .A(n214), .Y(n731) );
  NOR2X1 U537 ( .A(n274), .B(n206), .Y(n273) );
  NOR2X1 U538 ( .A(n239), .B(n206), .Y(n246) );
  NOR2X1 U539 ( .A(n514), .B(n221), .Y(n220) );
  NAND2X1 U540 ( .A(n512), .B(n327), .Y(n324) );
  NOR2X1 U541 ( .A(n301), .B(n206), .Y(n300) );
  OAI211X1 U542 ( .A0(n322), .A1(n635), .B0(n323), .C0(n324), .Y(n458) );
  NAND3BX1 U543 ( .AN(n325), .B(n763), .C(n635), .Y(n323) );
  OA21XL U544 ( .A0(n763), .A1(n725), .B0(n326), .Y(n322) );
  OA21XL U545 ( .A0(n636), .A1(n725), .B0(n327), .Y(n326) );
  OAI211X1 U546 ( .A0(n636), .A1(n327), .B0(n325), .C0(n324), .Y(n476) );
  CLKBUFX3 U547 ( .A(n724), .Y(n522) );
  CLKINVX1 U548 ( .A(n512), .Y(n726) );
  NOR2X1 U549 ( .A(n726), .B(n484), .Y(n229) );
  NOR2X1 U550 ( .A(n726), .B(n506), .Y(n208) );
  OAI22XL U551 ( .A0(n616), .A1(n327), .B0(n730), .B1(n328), .Y(n460) );
  AOI22X1 U552 ( .A0(n512), .A1(n329), .B0(n511), .B1(n330), .Y(n328) );
  CLKINVX1 U553 ( .A(n327), .Y(n730) );
  OAI21XL U554 ( .A0(n319), .A1(n582), .B0(n272), .Y(n329) );
  CLKINVX1 U555 ( .A(n511), .Y(n725) );
  NAND2X1 U556 ( .A(n511), .B(N343), .Y(n231) );
  OAI22XL U557 ( .A0(n758), .A1(n231), .B0(n223), .B1(n232), .Y(n230) );
  NAND2X1 U558 ( .A(n511), .B(N342), .Y(n260) );
  OAI22XL U559 ( .A0(n755), .A1(n260), .B0(n257), .B1(n261), .Y(n259) );
  NAND2X1 U560 ( .A(n511), .B(N344), .Y(n210) );
  NAND2X1 U561 ( .A(n512), .B(N252), .Y(n232) );
  NAND2X1 U562 ( .A(n512), .B(N251), .Y(n261) );
  NOR2X1 U563 ( .A(n728), .B(n744), .Y(n363) );
  OAI21XL U564 ( .A0(N180), .A1(n727), .B0(n369), .Y(n475) );
  OAI211X1 U565 ( .A0(n370), .A1(n512), .B0(n727), .C0(n544), .Y(n369) );
  CLKINVX1 U566 ( .A(n370), .Y(n728) );
  NAND2X1 U567 ( .A(n512), .B(N253), .Y(n211) );
  OAI22XL U568 ( .A0(n750), .A1(n333), .B0(n653), .B1(n334), .Y(n463) );
  OAI22XL U569 ( .A0(n752), .A1(n333), .B0(n521), .B1(n334), .Y(n465) );
  OAI22XL U570 ( .A0(n751), .A1(n333), .B0(n654), .B1(n334), .Y(n464) );
  CLKBUFX3 U571 ( .A(n161), .Y(n524) );
  CLKINVX1 U572 ( .A(n513), .Y(n729) );
  NOR2X1 U573 ( .A(n688), .B(n729), .Y(N706) );
  CLKINVX1 U574 ( .A(n349), .Y(n723) );
  AOI211X1 U575 ( .A0(n688), .A1(N705), .B0(n348), .C0(n350), .Y(n349) );
  NOR2X1 U576 ( .A(n689), .B(n729), .Y(N705) );
  OAI2BB2XL U577 ( .B0(n345), .B1(n688), .A0N(n689), .A1N(N706), .Y(n350) );
  OAI22XL U578 ( .A0(n196), .A1(n210), .B0(n194), .B1(n211), .Y(n209) );
  NOR2X1 U579 ( .A(n733), .B(n206), .Y(n286) );
  AND2X2 U580 ( .A(n517), .B(n513), .Y(n159) );
  AND2X2 U581 ( .A(N354), .B(n511), .Y(n228) );
  AND2X2 U582 ( .A(N355), .B(n511), .Y(n207) );
  AND2X2 U583 ( .A(N353), .B(n511), .Y(n256) );
  CLKINVX1 U584 ( .A(n317), .Y(n732) );
  OAI211X1 U585 ( .A0(n213), .A1(n184), .B0(n214), .C0(n318), .Y(n317) );
  AOI221XL U586 ( .A0(n179), .A1(n740), .B0(n739), .B1(n319), .C0(n320), .Y(
        n318) );
  NOR3X1 U587 ( .A(n763), .B(n218), .C(n636), .Y(n320) );
  NOR2X1 U588 ( .A(n514), .B(n734), .Y(n192) );
  CLKBUFX3 U589 ( .A(n724), .Y(n523) );
  OAI22XL U590 ( .A0(n754), .A1(n341), .B0(n544), .B1(n342), .Y(n468) );
  OAI22XL U591 ( .A0(n581), .A1(n341), .B0(n747), .B1(n342), .Y(n467) );
  CLKBUFX3 U592 ( .A(n161), .Y(n525) );
  NAND2X1 U593 ( .A(n511), .B(n636), .Y(n325) );
  AOI32X1 U594 ( .A0(n745), .A1(n508), .A2(dic_cmpr[1]), .B0(dic_cmpr[2]), 
        .B1(n507), .Y(n378) );
  CLKINVX1 U595 ( .A(n377), .Y(n745) );
  NOR2X1 U596 ( .A(n507), .B(dic_cmpr[2]), .Y(n377) );
  CLKINVX1 U597 ( .A(n509), .Y(n562) );
  CLKINVX1 U598 ( .A(n509), .Y(n654) );
  OAI2BB1X1 U599 ( .A0N(n484), .A1N(N596), .B0(n340), .Y(n339) );
  OAI211X1 U600 ( .A0(N596), .A1(n484), .B0(n506), .C0(N597), .Y(n340) );
  CLKINVX1 U601 ( .A(\replace[2] ), .Y(n753) );
  CLKINVX1 U602 ( .A(n521), .Y(n544) );
  NAND2X1 U603 ( .A(N253), .B(n741), .Y(n190) );
  NAND2X1 U604 ( .A(N252), .B(n741), .Y(n201) );
  NAND2X1 U605 ( .A(N251), .B(n741), .Y(n183) );
  NOR2X1 U606 ( .A(n753), .B(n245), .Y(n178) );
  NAND2X1 U607 ( .A(N344), .B(n738), .Y(n189) );
  NAND2X1 U608 ( .A(N343), .B(n738), .Y(n200) );
  NAND2X1 U609 ( .A(N342), .B(n738), .Y(n182) );
  CLKINVX1 U610 ( .A(n520), .Y(n617) );
  NAND2X1 U611 ( .A(N354), .B(n738), .Y(n202) );
  NAND2X1 U612 ( .A(N355), .B(n738), .Y(n191) );
  NAND2X1 U613 ( .A(N353), .B(n738), .Y(n185) );
  CLKINVX1 U614 ( .A(n510), .Y(n561) );
  CLKINVX1 U615 ( .A(n510), .Y(n653) );
  NOR2X1 U616 ( .A(n484), .B(n245), .Y(n198) );
  NOR2X1 U617 ( .A(n506), .B(n245), .Y(n187) );
  INVX3 U618 ( .A(n270), .Y(n740) );
  CLKINVX1 U619 ( .A(n238), .Y(n739) );
  INVX3 U620 ( .A(n213), .Y(n738) );
  NAND2X1 U621 ( .A(n738), .B(n635), .Y(n269) );
  NAND2X1 U622 ( .A(n321), .B(n616), .Y(n265) );
  NOR2X1 U623 ( .A(n617), .B(n761), .Y(n321) );
  NAND2X1 U624 ( .A(n520), .B(n761), .Y(n219) );
  NOR2X1 U625 ( .A(n581), .B(n754), .Y(n319) );
  NAND2X1 U626 ( .A(n319), .B(n582), .Y(n272) );
  NOR2X1 U627 ( .A(n761), .B(n520), .Y(n237) );
  CLKINVX1 U628 ( .A(n244), .Y(n762) );
  NOR3X2 U629 ( .A(n751), .B(n752), .C(n750), .Y(n179) );
  INVX3 U630 ( .A(n519), .Y(n763) );
  CLKINVX1 U631 ( .A(n225), .Y(n758) );
  CLKINVX1 U632 ( .A(n336), .Y(n746) );
  NAND2X1 U633 ( .A(n237), .B(n616), .Y(n295) );
  CLKINVX1 U634 ( .A(n184), .Y(n756) );
  NAND2X1 U635 ( .A(n379), .B(n380), .Y(n355) );
  XOR2X1 U636 ( .A(n384), .B(n383), .Y(n379) );
  XOR2X1 U637 ( .A(n381), .B(n382), .Y(n380) );
  XNOR2X1 U638 ( .A(n520), .B(n519), .Y(n384) );
  NAND2X1 U639 ( .A(n383), .B(n763), .Y(n381) );
  CLKINVX1 U640 ( .A(n276), .Y(n759) );
  OAI21XL U641 ( .A0(n321), .A1(n616), .B0(n265), .Y(n330) );
  CLKINVX1 U642 ( .A(n146), .Y(n748) );
  CLKINVX1 U643 ( .A(n705), .Y(n716) );
  CLKINVX1 U644 ( .A(n700), .Y(n717) );
  OAI32X1 U645 ( .A0(n135), .A1(n735), .A2(n778), .B0(n136), .B1(n130), .Y(
        n386) );
  NAND3X1 U646 ( .A(n138), .B(n130), .C(n139), .Y(n135) );
  OA21XL U647 ( .A0(n780), .A1(n735), .B0(n137), .Y(n136) );
  NOR2X1 U648 ( .A(n776), .B(RST), .Y(n141) );
  OAI21XL U649 ( .A0(n142), .A1(n132), .B0(n143), .Y(n388) );
  NAND4XL U650 ( .A(n141), .B(n782), .C(n138), .D(n132), .Y(n143) );
  OAI211X1 U651 ( .A0(n518), .A1(n715), .B0(n156), .C0(n523), .Y(n398) );
  NAND2XL U652 ( .A(MinCost[9]), .B(n518), .Y(n156) );
  OAI211X1 U653 ( .A0(n518), .A1(n718), .B0(n154), .C0(n522), .Y(n396) );
  NAND2XL U654 ( .A(MinCost[7]), .B(n518), .Y(n154) );
  OAI211X1 U655 ( .A0(n518), .A1(n721), .B0(n149), .C0(n522), .Y(n391) );
  NAND2XL U656 ( .A(MinCost[2]), .B(n518), .Y(n149) );
  OAI211X1 U657 ( .A0(n518), .A1(n722), .B0(n148), .C0(n522), .Y(n390) );
  NAND2XL U658 ( .A(MinCost[1]), .B(n518), .Y(n148) );
  OAI211X1 U659 ( .A0(n518), .A1(n129), .B0(n157), .C0(n523), .Y(n399) );
  NAND2XL U660 ( .A(MinCost[0]), .B(n518), .Y(n157) );
  OAI211X1 U661 ( .A0(n518), .A1(n720), .B0(n150), .C0(n522), .Y(n392) );
  NAND2XL U662 ( .A(MinCost[3]), .B(n518), .Y(n150) );
  OAI211X1 U663 ( .A0(n518), .A1(n719), .B0(n153), .C0(n522), .Y(n395) );
  NAND2XL U664 ( .A(MinCost[6]), .B(n518), .Y(n153) );
  OAI211X1 U665 ( .A0(n518), .A1(n121), .B0(n155), .C0(n523), .Y(n397) );
  NAND2XL U666 ( .A(n784), .B(n518), .Y(n155) );
  OAI211X1 U667 ( .A0(n518), .A1(n124), .B0(n152), .C0(n522), .Y(n394) );
  NAND2XL U668 ( .A(n787), .B(n518), .Y(n152) );
  OAI211X1 U669 ( .A0(n518), .A1(n125), .B0(n151), .C0(n522), .Y(n393) );
  NAND2XL U670 ( .A(n788), .B(n518), .Y(n151) );
  OAI2BB2XL U671 ( .B0(n715), .B1(n517), .A0N(N687), .A1N(n159), .Y(n400) );
  OAI2BB2XL U672 ( .B0(n121), .B1(n517), .A0N(N686), .A1N(n159), .Y(n401) );
  OAI2BB2XL U673 ( .B0(n718), .B1(n517), .A0N(N685), .A1N(n159), .Y(n402) );
  NOR2X2 U674 ( .A(RST), .B(n514), .Y(n214) );
  OAI22XL U675 ( .A0(n253), .A1(n254), .B0(n255), .B1(n764), .Y(n445) );
  AOI221XL U676 ( .A0(n256), .A1(n755), .B0(n257), .B1(n258), .C0(n259), .Y(
        n254) );
  NOR2X1 U677 ( .A(n206), .B(n253), .Y(n255) );
  OAI32X1 U678 ( .A0(n763), .A1(N174), .A2(n269), .B0(n270), .B1(n285), .Y(
        n284) );
  AOI21X1 U679 ( .A0(n582), .A1(n216), .B0(n277), .Y(n285) );
  OAI22XL U680 ( .A0(n273), .A1(n766), .B0(n274), .B1(n282), .Y(n450) );
  AOI221XL U681 ( .A0(n276), .A1(n207), .B0(n277), .B1(n208), .C0(n283), .Y(
        n282) );
  OAI22XL U682 ( .A0(n276), .A1(n210), .B0(n277), .B1(n211), .Y(n283) );
  OAI22XL U683 ( .A0(n273), .A1(n765), .B0(n274), .B1(n275), .Y(n448) );
  AOI221XL U684 ( .A0(n276), .A1(n256), .B0(n277), .B1(n258), .C0(n278), .Y(
        n275) );
  OAI22XL U685 ( .A0(n276), .A1(n260), .B0(n277), .B1(n261), .Y(n278) );
  OAI22XL U686 ( .A0(n262), .A1(n78), .B0(n253), .B1(n266), .Y(n447) );
  AOI211X1 U687 ( .A0(n257), .A1(n187), .B0(n267), .C0(n515), .Y(n266) );
  OAI222XL U688 ( .A0(n755), .A1(n189), .B0(n257), .B1(n190), .C0(n191), .C1(
        n265), .Y(n267) );
  OAI22XL U689 ( .A0(n262), .A1(n77), .B0(n253), .B1(n263), .Y(n446) );
  AOI211X1 U690 ( .A0(n257), .A1(n198), .B0(n264), .C0(n515), .Y(n263) );
  OAI222XL U691 ( .A0(n755), .A1(n200), .B0(n257), .B1(n201), .C0(n202), .C1(
        n265), .Y(n264) );
  OAI21XL U692 ( .A0(n225), .A1(n213), .B0(n214), .Y(n236) );
  OAI22XL U693 ( .A0(n221), .A1(n226), .B0(n227), .B1(n768), .Y(n440) );
  AOI221XL U694 ( .A0(n228), .A1(n758), .B0(n229), .B1(n223), .C0(n230), .Y(
        n226) );
  NOR2X1 U695 ( .A(n206), .B(n221), .Y(n227) );
  OAI21XL U696 ( .A0(n762), .A1(n213), .B0(n214), .Y(n252) );
  OAI22XL U697 ( .A0(n246), .A1(n770), .B0(n239), .B1(n249), .Y(n444) );
  AOI221XL U698 ( .A0(n244), .A1(n207), .B0(n242), .B1(n208), .C0(n250), .Y(
        n249) );
  OAI22XL U699 ( .A0(n244), .A1(n210), .B0(n242), .B1(n211), .Y(n250) );
  OAI22XL U700 ( .A0(n246), .A1(n769), .B0(n239), .B1(n247), .Y(n443) );
  AOI221XL U701 ( .A0(n244), .A1(n228), .B0(n242), .B1(n229), .C0(n248), .Y(
        n247) );
  OAI22XL U702 ( .A0(n244), .A1(n231), .B0(n242), .B1(n232), .Y(n248) );
  OAI22XL U703 ( .A0(n220), .A1(n72), .B0(n221), .B1(n233), .Y(n441) );
  AOI211X1 U704 ( .A0(n223), .A1(n187), .B0(n234), .C0(n515), .Y(n233) );
  OAI222XL U705 ( .A0(n758), .A1(n189), .B0(n223), .B1(n190), .C0(n191), .C1(
        n225), .Y(n234) );
  OAI22XL U706 ( .A0(n220), .A1(n70), .B0(n221), .B1(n222), .Y(n439) );
  AOI211X1 U707 ( .A0(n223), .A1(n178), .B0(n224), .C0(n515), .Y(n222) );
  OAI222XL U708 ( .A0(n758), .A1(n182), .B0(n223), .B1(n183), .C0(n185), .C1(
        n225), .Y(n224) );
  OAI2BB2XL U709 ( .B0(n719), .B1(n517), .A0N(N684), .A1N(n159), .Y(n403) );
  OAI22XL U710 ( .A0(n274), .A1(n279), .B0(n280), .B1(n80), .Y(n449) );
  AOI211X1 U711 ( .A0(n277), .A1(n198), .B0(n281), .C0(n515), .Y(n279) );
  NOR2X1 U712 ( .A(n274), .B(n514), .Y(n280) );
  OAI222XL U713 ( .A0(n276), .A1(n200), .B0(n277), .B1(n201), .C0(n202), .C1(
        n759), .Y(n281) );
  NOR2X1 U714 ( .A(RST), .B(n367), .Y(n337) );
  OAI221XL U715 ( .A0(n219), .A1(n725), .B0(n617), .B1(n327), .C0(n331), .Y(
        n461) );
  AOI2BB2X1 U716 ( .B0(n237), .B1(n511), .A0N(n324), .A1N(n332), .Y(n331) );
  OAI22XL U717 ( .A0(n239), .A1(n240), .B0(n241), .B1(n73), .Y(n442) );
  AOI211X1 U718 ( .A0(n242), .A1(n178), .B0(n243), .C0(n515), .Y(n240) );
  NOR2X1 U719 ( .A(n239), .B(n514), .Y(n241) );
  OAI222XL U720 ( .A0(n244), .A1(n182), .B0(n242), .B1(n183), .C0(n185), .C1(
        n762), .Y(n243) );
  CLKINVX1 U721 ( .A(n313), .Y(n737) );
  AOI221XL U722 ( .A0(n304), .A1(n740), .B0(n298), .B1(n754), .C0(n314), .Y(
        n313) );
  NOR3X1 U723 ( .A(n269), .B(n519), .C(N174), .Y(n314) );
  OAI22XL U724 ( .A0(n300), .A1(n775), .B0(n301), .B1(n310), .Y(n456) );
  AOI221XL U725 ( .A0(n303), .A1(n207), .B0(n304), .B1(n208), .C0(n311), .Y(
        n310) );
  OAI22XL U726 ( .A0(n303), .A1(n210), .B0(n304), .B1(n211), .Y(n311) );
  OAI22XL U727 ( .A0(n300), .A1(n774), .B0(n301), .B1(n308), .Y(n455) );
  AOI221XL U728 ( .A0(n303), .A1(n228), .B0(n304), .B1(n229), .C0(n309), .Y(
        n308) );
  OAI22XL U729 ( .A0(n303), .A1(n231), .B0(n304), .B1(n232), .Y(n309) );
  OAI22XL U730 ( .A0(n300), .A1(n773), .B0(n301), .B1(n302), .Y(n454) );
  AOI221XL U731 ( .A0(n303), .A1(n256), .B0(n304), .B1(n258), .C0(n305), .Y(
        n302) );
  OAI22XL U732 ( .A0(n303), .A1(n260), .B0(n304), .B1(n261), .Y(n305) );
  OAI222XL U733 ( .A0(N165), .A1(n324), .B0(N171), .B1(n725), .C0(n761), .C1(
        n327), .Y(n462) );
  OAI2BB2XL U734 ( .B0(n124), .B1(n517), .A0N(N683), .A1N(n159), .Y(n404) );
  OAI221XL U735 ( .A0(n519), .A1(n325), .B0(n326), .B1(n763), .C0(n324), .Y(
        n459) );
  CLKINVX1 U736 ( .A(RST), .Y(n724) );
  OAI2BB2XL U737 ( .B0(n125), .B1(n517), .A0N(N682), .A1N(n159), .Y(n405) );
  CLKBUFX3 U738 ( .A(n306), .Y(n512) );
  NOR2X1 U739 ( .A(n245), .B(RST), .Y(n306) );
  OAI22XL U740 ( .A0(n286), .A1(n771), .B0(n733), .B1(n287), .Y(n451) );
  AOI221XL U741 ( .A0(n757), .A1(n256), .B0(n288), .B1(n258), .C0(n289), .Y(
        n287) );
  OAI22XL U742 ( .A0(n757), .A1(n260), .B0(n288), .B1(n261), .Y(n289) );
  OAI22XL U743 ( .A0(n286), .A1(n772), .B0(n733), .B1(n290), .Y(n452) );
  AOI221XL U744 ( .A0(n757), .A1(n228), .B0(n288), .B1(n229), .C0(n291), .Y(
        n290) );
  OAI22XL U745 ( .A0(n757), .A1(n231), .B0(n288), .B1(n232), .Y(n291) );
  CLKBUFX3 U746 ( .A(n307), .Y(n511) );
  NOR2X1 U747 ( .A(n213), .B(RST), .Y(n307) );
  OAI22XL U748 ( .A0(n192), .A1(n68), .B0(n734), .B1(n197), .Y(n437) );
  AOI211X1 U749 ( .A0(n198), .A1(n194), .B0(n199), .C0(n515), .Y(n197) );
  OAI222XL U750 ( .A0(n196), .A1(n200), .B0(n194), .B1(n201), .C0(n760), .C1(
        n202), .Y(n199) );
  OAI22XL U751 ( .A0(n192), .A1(n67), .B0(n734), .B1(n193), .Y(n436) );
  AOI211X1 U752 ( .A0(n194), .A1(n178), .B0(n195), .C0(n515), .Y(n193) );
  OAI222XL U753 ( .A0(n196), .A1(n182), .B0(n194), .B1(n183), .C0(n185), .C1(
        n760), .Y(n195) );
  OAI22XL U754 ( .A0(n176), .A1(n64), .B0(n732), .B1(n315), .Y(n457) );
  AOI211X1 U755 ( .A0(n198), .A1(n179), .B0(n316), .C0(n515), .Y(n315) );
  OAI222XL U756 ( .A0(n756), .A1(n200), .B0(n179), .B1(n201), .C0(n184), .C1(
        n202), .Y(n316) );
  OAI22XL U757 ( .A0(n176), .A1(n66), .B0(n732), .B1(n186), .Y(n435) );
  AOI211X1 U758 ( .A0(n187), .A1(n179), .B0(n188), .C0(n515), .Y(n186) );
  OAI222XL U759 ( .A0(n756), .A1(n189), .B0(n179), .B1(n190), .C0(n184), .C1(
        n191), .Y(n188) );
  OAI22XL U760 ( .A0(n176), .A1(n61), .B0(n732), .B1(n177), .Y(n434) );
  AOI211X1 U761 ( .A0(n178), .A1(n179), .B0(n180), .C0(n515), .Y(n177) );
  OAI222XL U762 ( .A0(n756), .A1(n182), .B0(n179), .B1(n183), .C0(n184), .C1(
        n185), .Y(n180) );
  OAI22XL U763 ( .A0(n733), .A1(n292), .B0(n293), .B1(n84), .Y(n453) );
  NOR2X1 U764 ( .A(n733), .B(n514), .Y(n293) );
  AOI211X1 U765 ( .A0(n288), .A1(n187), .B0(n294), .C0(n515), .Y(n292) );
  OAI222XL U766 ( .A0(n757), .A1(n189), .B0(n288), .B1(n190), .C0(n191), .C1(
        n295), .Y(n294) );
  NOR2X1 U767 ( .A(n356), .B(RST), .Y(n370) );
  AOI22XL U768 ( .A0(n338), .A1(n753), .B0(n339), .B1(N595), .Y(n335) );
  OR2X1 U769 ( .A(n339), .B(N595), .Y(n338) );
  NAND3X1 U770 ( .A(n333), .B(n522), .C(cur_state0[1]), .Y(n334) );
  OAI22XL U771 ( .A0(n734), .A1(n204), .B0(n205), .B1(n767), .Y(n438) );
  NOR2X1 U772 ( .A(n206), .B(n734), .Y(n205) );
  AOI221XL U773 ( .A0(n207), .A1(n196), .B0(n208), .B1(n194), .C0(n209), .Y(
        n204) );
  CLKBUFX3 U774 ( .A(n167), .Y(n516) );
  NOR2X1 U775 ( .A(n524), .B(RST), .Y(n167) );
  AO22X1 U776 ( .A0(\dictionary_tmp[3][2] ), .A1(n525), .B0(\dictionary[3][2] ), .B1(n516), .Y(n422) );
  AO22X1 U777 ( .A0(\dictionary_tmp[6][0] ), .A1(n525), .B0(\dictionary[6][0] ), .B1(n516), .Y(n415) );
  AO22X1 U778 ( .A0(\dictionary_tmp[2][0] ), .A1(n525), .B0(\dictionary[2][0] ), .B1(n516), .Y(n427) );
  AO22X1 U779 ( .A0(\dictionary_tmp[2][2] ), .A1(n525), .B0(\dictionary[2][2] ), .B1(n516), .Y(n425) );
  AO22X1 U780 ( .A0(\dictionary_tmp[0][0] ), .A1(n525), .B0(\dictionary[0][0] ), .B1(n516), .Y(n433) );
  AO22X1 U781 ( .A0(\dictionary_tmp[0][1] ), .A1(n525), .B0(\dictionary[0][1] ), .B1(n516), .Y(n432) );
  AO22X1 U782 ( .A0(\dictionary_tmp[0][2] ), .A1(n525), .B0(\dictionary[0][2] ), .B1(n516), .Y(n431) );
  AO22X1 U783 ( .A0(\dictionary_tmp[1][1] ), .A1(n525), .B0(\dictionary[1][1] ), .B1(n516), .Y(n429) );
  AO22X1 U784 ( .A0(\dictionary_tmp[1][2] ), .A1(n525), .B0(\dictionary[1][2] ), .B1(n516), .Y(n428) );
  AO22X1 U785 ( .A0(\dictionary_tmp[4][0] ), .A1(n525), .B0(\dictionary[4][0] ), .B1(n516), .Y(n421) );
  AO22X1 U786 ( .A0(\dictionary_tmp[4][1] ), .A1(n525), .B0(\dictionary[4][1] ), .B1(n516), .Y(n420) );
  AO22X1 U787 ( .A0(\dictionary_tmp[5][1] ), .A1(n525), .B0(\dictionary[5][1] ), .B1(n516), .Y(n417) );
  CLKBUFX3 U788 ( .A(n160), .Y(n513) );
  NOR2X1 U789 ( .A(n351), .B(RST), .Y(n160) );
  OAI2BB2XL U790 ( .B0(n720), .B1(n517), .A0N(N681), .A1N(n159), .Y(n406) );
  OAI2BB2XL U791 ( .B0(n721), .B1(n517), .A0N(N680), .A1N(n159), .Y(n407) );
  OAI2BB2XL U792 ( .B0(n722), .B1(n517), .A0N(N679), .A1N(n159), .Y(n408) );
  OAI2BB2XL U793 ( .B0(n129), .B1(n517), .A0N(N678), .A1N(n159), .Y(n409) );
  CLKBUFX3 U794 ( .A(n158), .Y(n517) );
  OAI21XL U795 ( .A0(\cur_state_tmp1[1] ), .A1(n55), .B0(n513), .Y(n158) );
  OAI32X1 U796 ( .A0(n362), .A1(RST), .A2(n363), .B0(n364), .B1(n542), .Y(n473) );
  AOI221XL U797 ( .A0(n510), .A1(n742), .B0(n366), .B1(n542), .C0(n367), .Y(
        n362) );
  OA21XL U798 ( .A0(n747), .A1(n728), .B0(n365), .Y(n364) );
  OAI211X1 U799 ( .A0(n213), .A1(n760), .B0(n214), .C0(n215), .Y(n212) );
  AOI221XL U800 ( .A0(n194), .A1(n740), .B0(n216), .B1(n739), .C0(n217), .Y(
        n215) );
  NOR3X1 U801 ( .A(n763), .B(N174), .C(n218), .Y(n217) );
  OAI211X1 U802 ( .A0(n687), .A1(n345), .B0(n346), .C0(n347), .Y(n469) );
  OAI21XL U803 ( .A0(n689), .A1(n688), .B0(N707), .Y(n346) );
  AOI31X1 U804 ( .A0(N183), .A1(n687), .A2(N706), .B0(n348), .Y(n347) );
  NOR2X1 U805 ( .A(n687), .B(n729), .Y(N707) );
  OAI211X1 U806 ( .A0(n213), .A1(n295), .B0(n214), .C0(n297), .Y(n296) );
  AOI221XL U807 ( .A0(n288), .A1(n740), .B0(n298), .B1(N165), .C0(n299), .Y(
        n297) );
  NOR3X1 U808 ( .A(n269), .B(n519), .C(n636), .Y(n299) );
  NAND3X1 U809 ( .A(n351), .B(n522), .C(cur_state1[0]), .Y(n345) );
  OAI32X1 U810 ( .A0(n368), .A1(RST), .A2(n363), .B0(n365), .B1(n747), .Y(n474) );
  AOI211X1 U811 ( .A0(n509), .A1(n742), .B0(n367), .C0(n366), .Y(n368) );
  OAI221XL U812 ( .A0(n736), .A1(n725), .B0(n56), .B1(n726), .C0(n374), .Y(
        N209) );
  CLKINVX1 U813 ( .A(n355), .Y(n736) );
  AOI33X1 U814 ( .A0(n370), .A1(n746), .A2(n744), .B0(fsm1_finish_flg), .B1(
        n522), .B2(n367), .Y(n374) );
  OAI21XL U815 ( .A0(n743), .A1(n353), .B0(n354), .Y(n472) );
  OAI21XL U816 ( .A0(RST), .A1(cur_state0[1]), .B0(n353), .Y(n354) );
  OAI211X1 U817 ( .A0(n742), .A1(n355), .B0(n356), .C0(n523), .Y(n353) );
  NAND3X1 U818 ( .A(n344), .B(n522), .C(cur_state1[0]), .Y(n343) );
  NAND4X1 U819 ( .A(N185), .B(N184), .C(N183), .D(n749), .Y(n344) );
  NAND3X1 U820 ( .A(n727), .B(n726), .C(n373), .Y(N210) );
  NAND3X1 U821 ( .A(n355), .B(n522), .C(cur_state0[1]), .Y(n373) );
  OAI211X1 U822 ( .A0(n525), .A1(n84), .B0(n174), .C0(n523), .Y(n430) );
  NAND2X1 U823 ( .A(\dictionary_tmp[1][0] ), .B(n524), .Y(n174) );
  OAI211X1 U824 ( .A0(n525), .A1(n73), .B0(n170), .C0(n523), .Y(n419) );
  NAND2X1 U825 ( .A(\dictionary_tmp[4][2] ), .B(n524), .Y(n170) );
  OAI211X1 U826 ( .A0(n525), .A1(n72), .B0(n169), .C0(n523), .Y(n418) );
  NAND2X1 U827 ( .A(\dictionary_tmp[5][0] ), .B(n524), .Y(n169) );
  OAI211X1 U828 ( .A0(n525), .A1(n70), .B0(n168), .C0(n523), .Y(n416) );
  NAND2X1 U829 ( .A(\dictionary_tmp[5][2] ), .B(n524), .Y(n168) );
  OAI211X1 U830 ( .A0(n524), .A1(n64), .B0(n163), .C0(n523), .Y(n411) );
  NAND2X1 U831 ( .A(\dictionary_tmp[7][1] ), .B(n524), .Y(n163) );
  OAI211X1 U832 ( .A0(n524), .A1(n66), .B0(n164), .C0(n523), .Y(n412) );
  NAND2X1 U833 ( .A(\dictionary_tmp[7][0] ), .B(n524), .Y(n164) );
  OAI211X1 U834 ( .A0(n525), .A1(n61), .B0(n162), .C0(n523), .Y(n410) );
  NAND2X1 U835 ( .A(\dictionary_tmp[7][2] ), .B(n524), .Y(n162) );
  OAI211X1 U836 ( .A0(n525), .A1(n68), .B0(n166), .C0(n523), .Y(n414) );
  NAND2X1 U837 ( .A(\dictionary_tmp[6][1] ), .B(n524), .Y(n166) );
  OAI211X1 U838 ( .A0(n524), .A1(n67), .B0(n165), .C0(n523), .Y(n413) );
  NAND2X1 U839 ( .A(\dictionary_tmp[6][2] ), .B(n524), .Y(n165) );
  OAI211X1 U840 ( .A0(n525), .A1(n80), .B0(n173), .C0(n523), .Y(n426) );
  NAND2X1 U841 ( .A(\dictionary_tmp[2][1] ), .B(n524), .Y(n173) );
  OAI211X1 U842 ( .A0(n525), .A1(n78), .B0(n172), .C0(n523), .Y(n424) );
  NAND2X1 U843 ( .A(\dictionary_tmp[3][0] ), .B(n524), .Y(n172) );
  OAI211X1 U844 ( .A0(n525), .A1(n77), .B0(n171), .C0(n523), .Y(n423) );
  NAND2X1 U845 ( .A(\dictionary_tmp[3][1] ), .B(n524), .Y(n171) );
  OAI22XL U846 ( .A0(find_flg1), .A1(n729), .B0(n175), .B1(n372), .Y(N224) );
  OA21XL U847 ( .A0(RST), .A1(n743), .B0(n371), .Y(n372) );
  NAND3X1 U848 ( .A(n341), .B(n522), .C(cur_state0[0]), .Y(n342) );
  OAI22XL U849 ( .A0(n582), .A1(n341), .B0(n542), .B1(n342), .Y(n466) );
  OAI32X1 U850 ( .A0(n371), .A1(fsm0_finish_flg), .A2(n175), .B0(n729), .B1(
        n103), .Y(N225) );
  OAI22XL U851 ( .A0(n689), .A1(n345), .B0(N183), .B1(n729), .Y(n470) );
  OAI211X1 U852 ( .A0(cur_state0[0]), .A1(n358), .B0(n213), .C0(n337), .Y(n357) );
  AOI22X1 U853 ( .A0(n359), .A1(n360), .B0(N621), .B1(n753), .Y(n358) );
  OAI2BB1X1 U854 ( .A0N(n484), .A1N(N622), .B0(n361), .Y(n360) );
  NAND2BXL U855 ( .AN(N621), .B(\replace[2] ), .Y(n359) );
  NOR2X1 U856 ( .A(n748), .B(RST), .Y(n348) );
  CLKINVX1 U857 ( .A(n375), .Y(n744) );
  OAI31XL U858 ( .A0(n376), .A1(\dic_cmpl[0] ), .A2(n377), .B0(n378), .Y(n375)
         );
  OAI21XL U859 ( .A0(dic_cmpr[1]), .A1(n508), .B0(dic_cmpr[0]), .Y(n376) );
  CLKBUFX3 U860 ( .A(N181), .Y(n509) );
  XNOR2X1 U861 ( .A(N160), .B(N180), .Y(N181) );
  CLKBUFX3 U862 ( .A(n563), .Y(n521) );
  AOI21X1 U863 ( .A0(n352), .A1(n748), .B0(RST), .Y(n471) );
  NAND2X1 U864 ( .A(fsm1_finish_flg), .B(n351), .Y(n352) );
  CLKINVX1 U865 ( .A(N165), .Y(n580) );
  OAI211X1 U866 ( .A0(N622), .A1(n484), .B0(n506), .C0(N623), .Y(n361) );
  OA22X1 U867 ( .A0(n582), .A1(n567), .B0(N167), .B1(n566), .Y(n506) );
  OA22X1 U868 ( .A0(n541), .A1(n542), .B0(N161), .B1(n540), .Y(n507) );
  CLKINVX1 U869 ( .A(N168), .Y(n599) );
  CLKINVX1 U870 ( .A(N171), .Y(n618) );
  OA22X1 U871 ( .A0(n542), .A1(n533), .B0(N161), .B1(n532), .Y(n508) );
  CLKBUFX3 U872 ( .A(N172), .Y(n520) );
  CLKBUFX3 U873 ( .A(N175), .Y(n519) );
  CLKBUFX3 U874 ( .A(N182), .Y(n510) );
  XOR2X1 U875 ( .A(n385), .B(n542), .Y(N182) );
  NAND2X1 U876 ( .A(N160), .B(n521), .Y(n385) );
  NOR2X1 U877 ( .A(n132), .B(n777), .Y(n139) );
  NAND3X1 U878 ( .A(find_flg0), .B(n741), .C(fsm0_2_flg), .Y(n270) );
  NAND2X1 U879 ( .A(N167), .B(n740), .Y(n238) );
  CLKINVX1 U880 ( .A(N184), .Y(n688) );
  NOR2X2 U881 ( .A(n219), .B(N173), .Y(n276) );
  NAND2X1 U882 ( .A(n237), .B(N173), .Y(n225) );
  NOR2X1 U883 ( .A(n581), .B(N165), .Y(n216) );
  NAND2X1 U884 ( .A(N173), .B(n321), .Y(n184) );
  NOR3X1 U885 ( .A(n747), .B(n544), .C(n542), .Y(n336) );
  OR2X1 U886 ( .A(cur_state0[1]), .B(n742), .Y(n356) );
  CLKINVX1 U887 ( .A(N160), .Y(n747) );
  NOR2X1 U888 ( .A(n761), .B(N174), .Y(n383) );
  XNOR2X1 U889 ( .A(n616), .B(N176), .Y(n382) );
  NAND2BX1 U890 ( .AN(cur_state1[0]), .B(n749), .Y(n175) );
  NOR2X1 U891 ( .A(n749), .B(cur_state1[0]), .Y(n146) );
  CLKINVX1 U892 ( .A(cur_state1[1]), .Y(n749) );
  NAND2X1 U893 ( .A(cur_state1[0]), .B(n749), .Y(n351) );
  NOR3X1 U894 ( .A(n521), .B(N160), .C(n356), .Y(n366) );
  CLKINVX1 U895 ( .A(fsm0_finish_flg), .Y(n743) );
  NOR2X1 U896 ( .A(n543), .B(n521), .Y(n539) );
  NOR2X1 U897 ( .A(n543), .B(n544), .Y(n538) );
  NOR2X1 U898 ( .A(n544), .B(N160), .Y(n536) );
  NOR2X1 U899 ( .A(n521), .B(N160), .Y(n535) );
  AOI221XL U900 ( .A0(\dictionary[6][0] ), .A1(n539), .B0(\dictionary[7][0] ), 
        .B1(n538), .C0(n526), .Y(n529) );
  AOI221XL U901 ( .A0(\dictionary[2][0] ), .A1(n539), .B0(\dictionary[3][0] ), 
        .B1(n538), .C0(n527), .Y(n528) );
  OAI22XL U902 ( .A0(n542), .A1(n529), .B0(N161), .B1(n528), .Y(\dic_cmpl[0] )
         );
  AO22X1 U903 ( .A0(\dictionary[5][1] ), .A1(n536), .B0(\dictionary[4][1] ), 
        .B1(n535), .Y(n530) );
  AOI221XL U904 ( .A0(\dictionary[6][1] ), .A1(n539), .B0(\dictionary[7][1] ), 
        .B1(n538), .C0(n530), .Y(n533) );
  AO22X1 U905 ( .A0(\dictionary[1][1] ), .A1(n536), .B0(\dictionary[0][1] ), 
        .B1(n535), .Y(n531) );
  AOI221XL U906 ( .A0(\dictionary[2][1] ), .A1(n539), .B0(\dictionary[3][1] ), 
        .B1(n538), .C0(n531), .Y(n532) );
  AO22X1 U907 ( .A0(\dictionary[5][2] ), .A1(n536), .B0(\dictionary[4][2] ), 
        .B1(n535), .Y(n534) );
  AOI221XL U908 ( .A0(\dictionary[6][2] ), .A1(n539), .B0(\dictionary[7][2] ), 
        .B1(n538), .C0(n534), .Y(n541) );
  AO22X1 U909 ( .A0(\dictionary[1][2] ), .A1(n536), .B0(\dictionary[0][2] ), 
        .B1(n535), .Y(n537) );
  AOI221XL U910 ( .A0(\dictionary[2][2] ), .A1(n539), .B0(\dictionary[3][2] ), 
        .B1(n538), .C0(n537), .Y(n540) );
  NOR2X1 U911 ( .A(n562), .B(n563), .Y(n557) );
  NOR2X1 U912 ( .A(n563), .B(n509), .Y(n555) );
  NOR2X1 U913 ( .A(N180), .B(n509), .Y(n554) );
  AOI221XL U914 ( .A0(\dictionary[6][0] ), .A1(n558), .B0(\dictionary[7][0] ), 
        .B1(n557), .C0(n545), .Y(n548) );
  AOI221XL U915 ( .A0(\dictionary[2][0] ), .A1(n558), .B0(\dictionary[3][0] ), 
        .B1(n557), .C0(n546), .Y(n547) );
  OAI22XL U916 ( .A0(n561), .A1(n548), .B0(n510), .B1(n547), .Y(dic_cmpr[0])
         );
  AO22X1 U917 ( .A0(\dictionary[5][1] ), .A1(n555), .B0(\dictionary[4][1] ), 
        .B1(n554), .Y(n549) );
  AOI221XL U918 ( .A0(\dictionary[6][1] ), .A1(n558), .B0(\dictionary[7][1] ), 
        .B1(n557), .C0(n549), .Y(n552) );
  AO22X1 U919 ( .A0(\dictionary[1][1] ), .A1(n555), .B0(\dictionary[0][1] ), 
        .B1(n554), .Y(n550) );
  AOI221XL U920 ( .A0(\dictionary[2][1] ), .A1(n558), .B0(\dictionary[3][1] ), 
        .B1(n557), .C0(n550), .Y(n551) );
  OAI22XL U921 ( .A0(n561), .A1(n552), .B0(n510), .B1(n551), .Y(dic_cmpr[1])
         );
  AO22X1 U922 ( .A0(\dictionary[5][2] ), .A1(n555), .B0(\dictionary[4][2] ), 
        .B1(n554), .Y(n553) );
  AOI221XL U923 ( .A0(\dictionary[6][2] ), .A1(n558), .B0(\dictionary[7][2] ), 
        .B1(n557), .C0(n553), .Y(n560) );
  AO22X1 U924 ( .A0(\dictionary[1][2] ), .A1(n555), .B0(\dictionary[0][2] ), 
        .B1(n554), .Y(n556) );
  AOI221XL U925 ( .A0(\dictionary[2][2] ), .A1(n558), .B0(\dictionary[3][2] ), 
        .B1(n557), .C0(n556), .Y(n559) );
  OAI22XL U926 ( .A0(n560), .A1(n561), .B0(n510), .B1(n559), .Y(dic_cmpr[2])
         );
  NOR2X1 U927 ( .A(n581), .B(n580), .Y(n576) );
  NOR2X1 U928 ( .A(n580), .B(N166), .Y(n574) );
  NOR2X1 U929 ( .A(N165), .B(N166), .Y(n573) );
  AOI221XL U930 ( .A0(\dictionary[6][0] ), .A1(n577), .B0(\dictionary[7][0] ), 
        .B1(n576), .C0(n564), .Y(n567) );
  AOI221XL U931 ( .A0(\dictionary[2][0] ), .A1(n577), .B0(\dictionary[3][0] ), 
        .B1(n576), .C0(n565), .Y(n566) );
  AO22X1 U932 ( .A0(\dictionary[5][1] ), .A1(n574), .B0(\dictionary[4][1] ), 
        .B1(n573), .Y(n568) );
  AOI221XL U933 ( .A0(\dictionary[6][1] ), .A1(n577), .B0(\dictionary[7][1] ), 
        .B1(n576), .C0(n568), .Y(n571) );
  AO22X1 U934 ( .A0(\dictionary[1][1] ), .A1(n574), .B0(\dictionary[0][1] ), 
        .B1(n573), .Y(n569) );
  AOI221XL U935 ( .A0(\dictionary[2][1] ), .A1(n577), .B0(\dictionary[3][1] ), 
        .B1(n576), .C0(n569), .Y(n570) );
  AO22X1 U936 ( .A0(\dictionary[5][2] ), .A1(n574), .B0(\dictionary[4][2] ), 
        .B1(n573), .Y(n572) );
  AOI221XL U937 ( .A0(\dictionary[6][2] ), .A1(n577), .B0(\dictionary[7][2] ), 
        .B1(n576), .C0(n572), .Y(n579) );
  AO22X1 U938 ( .A0(\dictionary[1][2] ), .A1(n574), .B0(\dictionary[0][2] ), 
        .B1(n573), .Y(n575) );
  AOI221XL U939 ( .A0(\dictionary[2][2] ), .A1(n577), .B0(\dictionary[3][2] ), 
        .B1(n576), .C0(n575), .Y(n578) );
  OAI22XL U940 ( .A0(n579), .A1(n582), .B0(N167), .B1(n578), .Y(\replace[2] )
         );
  NOR2X1 U941 ( .A(n751), .B(n599), .Y(n595) );
  NOR2X1 U942 ( .A(n599), .B(N169), .Y(n593) );
  NOR2X1 U943 ( .A(N168), .B(N169), .Y(n592) );
  AOI221XL U944 ( .A0(\dictionary[6][0] ), .A1(n596), .B0(\dictionary[7][0] ), 
        .B1(n595), .C0(n583), .Y(n586) );
  AOI221XL U945 ( .A0(\dictionary[2][0] ), .A1(n596), .B0(\dictionary[3][0] ), 
        .B1(n595), .C0(n584), .Y(n585) );
  OAI22XL U946 ( .A0(n750), .A1(n586), .B0(N170), .B1(n585), .Y(N253) );
  AO22X1 U947 ( .A0(\dictionary[5][1] ), .A1(n593), .B0(\dictionary[4][1] ), 
        .B1(n592), .Y(n587) );
  AOI221XL U948 ( .A0(\dictionary[6][1] ), .A1(n596), .B0(\dictionary[7][1] ), 
        .B1(n595), .C0(n587), .Y(n590) );
  AO22X1 U949 ( .A0(\dictionary[1][1] ), .A1(n593), .B0(\dictionary[0][1] ), 
        .B1(n592), .Y(n588) );
  AOI221XL U950 ( .A0(\dictionary[2][1] ), .A1(n596), .B0(\dictionary[3][1] ), 
        .B1(n595), .C0(n588), .Y(n589) );
  OAI22XL U951 ( .A0(n750), .A1(n590), .B0(N170), .B1(n589), .Y(N252) );
  AO22X1 U952 ( .A0(\dictionary[5][2] ), .A1(n593), .B0(\dictionary[4][2] ), 
        .B1(n592), .Y(n591) );
  AOI221XL U953 ( .A0(\dictionary[6][2] ), .A1(n596), .B0(\dictionary[7][2] ), 
        .B1(n595), .C0(n591), .Y(n598) );
  AO22X1 U954 ( .A0(\dictionary[1][2] ), .A1(n593), .B0(\dictionary[0][2] ), 
        .B1(n592), .Y(n594) );
  AOI221XL U955 ( .A0(\dictionary[2][2] ), .A1(n596), .B0(\dictionary[3][2] ), 
        .B1(n595), .C0(n594), .Y(n597) );
  OAI22XL U956 ( .A0(n598), .A1(n750), .B0(N170), .B1(n597), .Y(N251) );
  NOR2X1 U957 ( .A(n617), .B(N171), .Y(n613) );
  NOR2X1 U958 ( .A(n617), .B(n618), .Y(n612) );
  NOR2X1 U959 ( .A(n618), .B(n520), .Y(n610) );
  NOR2X1 U960 ( .A(N171), .B(n520), .Y(n609) );
  AOI221XL U961 ( .A0(\dictionary[6][0] ), .A1(n613), .B0(\dictionary[7][0] ), 
        .B1(n612), .C0(n600), .Y(n603) );
  AOI221XL U962 ( .A0(\dictionary[2][0] ), .A1(n613), .B0(\dictionary[3][0] ), 
        .B1(n612), .C0(n601), .Y(n602) );
  OAI22XL U963 ( .A0(n616), .A1(n603), .B0(N173), .B1(n602), .Y(N344) );
  AO22X1 U964 ( .A0(\dictionary[5][1] ), .A1(n610), .B0(\dictionary[4][1] ), 
        .B1(n609), .Y(n604) );
  AOI221XL U965 ( .A0(\dictionary[6][1] ), .A1(n613), .B0(\dictionary[7][1] ), 
        .B1(n612), .C0(n604), .Y(n607) );
  AO22X1 U966 ( .A0(\dictionary[1][1] ), .A1(n610), .B0(\dictionary[0][1] ), 
        .B1(n609), .Y(n605) );
  AOI221XL U967 ( .A0(\dictionary[2][1] ), .A1(n613), .B0(\dictionary[3][1] ), 
        .B1(n612), .C0(n605), .Y(n606) );
  OAI22XL U968 ( .A0(n616), .A1(n607), .B0(N173), .B1(n606), .Y(N343) );
  AO22X1 U969 ( .A0(\dictionary[5][2] ), .A1(n610), .B0(\dictionary[4][2] ), 
        .B1(n609), .Y(n608) );
  AOI221XL U970 ( .A0(\dictionary[6][2] ), .A1(n613), .B0(\dictionary[7][2] ), 
        .B1(n612), .C0(n608), .Y(n615) );
  AO22X1 U971 ( .A0(\dictionary[1][2] ), .A1(n610), .B0(\dictionary[0][2] ), 
        .B1(n609), .Y(n611) );
  AOI221XL U972 ( .A0(\dictionary[2][2] ), .A1(n613), .B0(\dictionary[3][2] ), 
        .B1(n612), .C0(n611), .Y(n614) );
  OAI22XL U973 ( .A0(n615), .A1(n616), .B0(N173), .B1(n614), .Y(N342) );
  NOR2X1 U974 ( .A(n763), .B(n636), .Y(n631) );
  NOR2X1 U975 ( .A(n636), .B(n519), .Y(n629) );
  NOR2X1 U976 ( .A(N174), .B(n519), .Y(n628) );
  AO22X1 U977 ( .A0(\dictionary[5][0] ), .A1(n629), .B0(\dictionary[4][0] ), 
        .B1(n628), .Y(n619) );
  AOI221XL U978 ( .A0(\dictionary[6][0] ), .A1(n632), .B0(\dictionary[7][0] ), 
        .B1(n631), .C0(n619), .Y(n622) );
  AO22X1 U979 ( .A0(\dictionary[1][0] ), .A1(n629), .B0(\dictionary[0][0] ), 
        .B1(n628), .Y(n620) );
  AOI221XL U980 ( .A0(\dictionary[2][0] ), .A1(n632), .B0(\dictionary[3][0] ), 
        .B1(n631), .C0(n620), .Y(n621) );
  OAI22XL U981 ( .A0(n635), .A1(n622), .B0(N176), .B1(n621), .Y(N355) );
  AO22X1 U982 ( .A0(\dictionary[5][1] ), .A1(n629), .B0(\dictionary[4][1] ), 
        .B1(n628), .Y(n623) );
  AOI221XL U983 ( .A0(\dictionary[6][1] ), .A1(n632), .B0(\dictionary[7][1] ), 
        .B1(n631), .C0(n623), .Y(n626) );
  AO22X1 U984 ( .A0(\dictionary[1][1] ), .A1(n629), .B0(\dictionary[0][1] ), 
        .B1(n628), .Y(n624) );
  AOI221XL U985 ( .A0(\dictionary[2][1] ), .A1(n632), .B0(\dictionary[3][1] ), 
        .B1(n631), .C0(n624), .Y(n625) );
  OAI22XL U986 ( .A0(n635), .A1(n626), .B0(N176), .B1(n625), .Y(N354) );
  AO22X1 U987 ( .A0(\dictionary[5][2] ), .A1(n629), .B0(\dictionary[4][2] ), 
        .B1(n628), .Y(n627) );
  AOI221XL U988 ( .A0(\dictionary[6][2] ), .A1(n632), .B0(\dictionary[7][2] ), 
        .B1(n631), .C0(n627), .Y(n634) );
  AO22X1 U989 ( .A0(\dictionary[1][2] ), .A1(n629), .B0(\dictionary[0][2] ), 
        .B1(n628), .Y(n630) );
  AOI221XL U990 ( .A0(\dictionary[2][2] ), .A1(n632), .B0(\dictionary[3][2] ), 
        .B1(n631), .C0(n630), .Y(n633) );
  OAI22XL U991 ( .A0(n634), .A1(n635), .B0(N176), .B1(n633), .Y(N353) );
  NOR2X1 U992 ( .A(n654), .B(n563), .Y(n649) );
  NOR2X1 U993 ( .A(n563), .B(n509), .Y(n647) );
  NOR2X1 U994 ( .A(N180), .B(n509), .Y(n646) );
  AOI221XL U995 ( .A0(\dictionary[6][0] ), .A1(n650), .B0(\dictionary[7][0] ), 
        .B1(n649), .C0(n637), .Y(n640) );
  AOI221XL U996 ( .A0(\dictionary[2][0] ), .A1(n650), .B0(\dictionary[3][0] ), 
        .B1(n649), .C0(n638), .Y(n639) );
  OAI22XL U997 ( .A0(n653), .A1(n640), .B0(n510), .B1(n639), .Y(N597) );
  AO22X1 U998 ( .A0(\dictionary[5][1] ), .A1(n647), .B0(\dictionary[4][1] ), 
        .B1(n646), .Y(n641) );
  AOI221XL U999 ( .A0(\dictionary[6][1] ), .A1(n650), .B0(\dictionary[7][1] ), 
        .B1(n649), .C0(n641), .Y(n644) );
  AO22X1 U1000 ( .A0(\dictionary[1][1] ), .A1(n647), .B0(\dictionary[0][1] ), 
        .B1(n646), .Y(n642) );
  AOI221XL U1001 ( .A0(\dictionary[2][1] ), .A1(n650), .B0(\dictionary[3][1] ), 
        .B1(n649), .C0(n642), .Y(n643) );
  OAI22XL U1002 ( .A0(n653), .A1(n644), .B0(n510), .B1(n643), .Y(N596) );
  AO22X1 U1003 ( .A0(\dictionary[5][2] ), .A1(n647), .B0(\dictionary[4][2] ), 
        .B1(n646), .Y(n645) );
  AOI221XL U1004 ( .A0(\dictionary[6][2] ), .A1(n650), .B0(\dictionary[7][2] ), 
        .B1(n649), .C0(n645), .Y(n652) );
  AO22X1 U1005 ( .A0(\dictionary[1][2] ), .A1(n647), .B0(\dictionary[0][2] ), 
        .B1(n646), .Y(n648) );
  AOI221XL U1006 ( .A0(\dictionary[2][2] ), .A1(n650), .B0(\dictionary[3][2] ), 
        .B1(n649), .C0(n648), .Y(n651) );
  OAI22XL U1007 ( .A0(n652), .A1(n653), .B0(n510), .B1(n651), .Y(N595) );
  NOR2X1 U1008 ( .A(n654), .B(N180), .Y(n668) );
  NOR2X1 U1009 ( .A(n654), .B(n563), .Y(n667) );
  NOR2X1 U1010 ( .A(n521), .B(n509), .Y(n665) );
  NOR2X1 U1011 ( .A(N180), .B(n509), .Y(n664) );
  AO22X1 U1012 ( .A0(\dictionary[5][0] ), .A1(n665), .B0(\dictionary[4][0] ), 
        .B1(n664), .Y(n655) );
  AOI221XL U1013 ( .A0(\dictionary[6][0] ), .A1(n668), .B0(\dictionary[7][0] ), 
        .B1(n667), .C0(n655), .Y(n658) );
  AO22X1 U1014 ( .A0(\dictionary[1][0] ), .A1(n665), .B0(\dictionary[0][0] ), 
        .B1(n664), .Y(n656) );
  AOI221XL U1015 ( .A0(\dictionary[2][0] ), .A1(n668), .B0(\dictionary[3][0] ), 
        .B1(n667), .C0(n656), .Y(n657) );
  OAI22XL U1016 ( .A0(n653), .A1(n658), .B0(n510), .B1(n657), .Y(N623) );
  AO22X1 U1017 ( .A0(\dictionary[5][1] ), .A1(n665), .B0(\dictionary[4][1] ), 
        .B1(n664), .Y(n659) );
  AOI221XL U1018 ( .A0(\dictionary[6][1] ), .A1(n668), .B0(\dictionary[7][1] ), 
        .B1(n667), .C0(n659), .Y(n662) );
  AO22X1 U1019 ( .A0(\dictionary[1][1] ), .A1(n665), .B0(\dictionary[0][1] ), 
        .B1(n664), .Y(n660) );
  AOI221XL U1020 ( .A0(\dictionary[2][1] ), .A1(n668), .B0(\dictionary[3][1] ), 
        .B1(n667), .C0(n660), .Y(n661) );
  OAI22XL U1021 ( .A0(n653), .A1(n662), .B0(n510), .B1(n661), .Y(N622) );
  AO22X1 U1022 ( .A0(\dictionary[5][2] ), .A1(n665), .B0(\dictionary[4][2] ), 
        .B1(n664), .Y(n663) );
  AOI221XL U1023 ( .A0(\dictionary[6][2] ), .A1(n668), .B0(\dictionary[7][2] ), 
        .B1(n667), .C0(n663), .Y(n670) );
  AO22X1 U1024 ( .A0(\dictionary[1][2] ), .A1(n665), .B0(\dictionary[0][2] ), 
        .B1(n664), .Y(n666) );
  AOI221XL U1025 ( .A0(\dictionary[2][2] ), .A1(n668), .B0(\dictionary[3][2] ), 
        .B1(n667), .C0(n666), .Y(n669) );
  OAI22XL U1026 ( .A0(n670), .A1(n653), .B0(n510), .B1(n669), .Y(N621) );
  NOR2X1 U1027 ( .A(n688), .B(n689), .Y(n683) );
  NOR2X1 U1028 ( .A(n689), .B(N184), .Y(n681) );
  NOR2X1 U1029 ( .A(N183), .B(N184), .Y(n680) );
  AO22X1 U1030 ( .A0(\dictionary_tmp[5][0] ), .A1(n681), .B0(
        \dictionary_tmp[4][0] ), .B1(n680), .Y(n671) );
  AOI221XL U1031 ( .A0(\dictionary_tmp[6][0] ), .A1(n684), .B0(
        \dictionary_tmp[7][0] ), .B1(n683), .C0(n671), .Y(n674) );
  AO22X1 U1032 ( .A0(\dictionary_tmp[1][0] ), .A1(n681), .B0(
        \dictionary_tmp[0][0] ), .B1(n680), .Y(n672) );
  AOI221XL U1033 ( .A0(\dictionary_tmp[2][0] ), .A1(n684), .B0(
        \dictionary_tmp[3][0] ), .B1(n683), .C0(n672), .Y(n673) );
  OAI22XL U1034 ( .A0(n687), .A1(n674), .B0(N185), .B1(n673), .Y(N676) );
  AO22X1 U1035 ( .A0(\dictionary_tmp[5][1] ), .A1(n681), .B0(
        \dictionary_tmp[4][1] ), .B1(n680), .Y(n675) );
  AOI221XL U1036 ( .A0(\dictionary_tmp[6][1] ), .A1(n684), .B0(
        \dictionary_tmp[7][1] ), .B1(n683), .C0(n675), .Y(n678) );
  AO22X1 U1037 ( .A0(\dictionary_tmp[1][1] ), .A1(n681), .B0(
        \dictionary_tmp[0][1] ), .B1(n680), .Y(n676) );
  AOI221XL U1038 ( .A0(\dictionary_tmp[2][1] ), .A1(n684), .B0(
        \dictionary_tmp[3][1] ), .B1(n683), .C0(n676), .Y(n677) );
  OAI22XL U1039 ( .A0(n687), .A1(n678), .B0(N185), .B1(n677), .Y(N675) );
  AO22X1 U1040 ( .A0(\dictionary_tmp[5][2] ), .A1(n681), .B0(
        \dictionary_tmp[4][2] ), .B1(n680), .Y(n679) );
  AOI221XL U1041 ( .A0(\dictionary_tmp[6][2] ), .A1(n684), .B0(
        \dictionary_tmp[7][2] ), .B1(n683), .C0(n679), .Y(n686) );
  AO22X1 U1042 ( .A0(\dictionary_tmp[1][2] ), .A1(n681), .B0(
        \dictionary_tmp[0][2] ), .B1(n680), .Y(n682) );
  AOI221XL U1043 ( .A0(\dictionary_tmp[2][2] ), .A1(n684), .B0(
        \dictionary_tmp[3][2] ), .B1(n683), .C0(n682), .Y(n685) );
  OAI22XL U1044 ( .A0(n686), .A1(n687), .B0(N185), .B1(n685), .Y(N674) );
  NOR2X1 U1045 ( .A(n712), .B(TotalCost[8]), .Y(n700) );
  NOR2X1 U1046 ( .A(n714), .B(TotalCost[4]), .Y(n707) );
  NOR2X1 U1047 ( .A(n707), .B(n709), .Y(n694) );
  OAI211X1 U1048 ( .A0(TotalCost[1]), .A1(n691), .B0(n690), .C0(n706), .Y(n692) );
  OAI221XL U1049 ( .A0(n790), .A1(n721), .B0(n789), .B1(n720), .C0(n692), .Y(
        n693) );
  AOI222XL U1050 ( .A0(TotalCost[5]), .A1(n713), .B0(TotalCost[4]), .B1(n714), 
        .C0(n694), .C1(n693), .Y(n696) );
  NOR2X1 U1051 ( .A(n713), .B(TotalCost[5]), .Y(n701) );
  OR2X1 U1052 ( .A(n701), .B(n708), .Y(n695) );
  OAI222XL U1053 ( .A0(n696), .A1(n695), .B0(n786), .B1(n719), .C0(n785), .C1(
        n718), .Y(n697) );
  AOI32X1 U1054 ( .A0(n702), .A1(n717), .A2(n697), .B0(TotalCost[8]), .B1(n712), .Y(n698) );
  OAI22XL U1055 ( .A0(n699), .A1(n722), .B0(MinCost[1]), .B1(n699), .Y(n704)
         );
  NOR3BXL U1056 ( .AN(n702), .B(n701), .C(n700), .Y(n703) );
  NAND3X1 U1057 ( .A(N726), .B(n704), .C(n703), .Y(n711) );
  NAND3BX1 U1058 ( .AN(n707), .B(n706), .C(n705), .Y(n710) );
  NOR4X1 U1059 ( .A(n711), .B(n710), .C(n709), .D(n708), .Y(N725) );
endmodule

