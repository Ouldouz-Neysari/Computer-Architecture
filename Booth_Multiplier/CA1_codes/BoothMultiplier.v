//module register_5(M1, ldM1, clk, q);
//module add_sub (a, b, s,add,sub);
//module Ashreg_11b (r, M2, clrq, ldM2, ldq, sh, clk, q);
//module mux2to1 (i0, i1, sel , y);
//module datapath (data_in, clk, ldM1, ldM2, ldq, clrq, sh, add, sub, sel, q1, q0, data_out); //ldM2=init
//module controller (start, rst, clk, q0, q1, ldM1, clrq, ldM2, ldq, sh, add, sub, sel, done);

module BoothMultiplier (start, rst, clk, done, data_in, data_out, q, ps, add_sub_out, add, sub);   //test
  input [4:0] data_in;
  input start, rst, clk;
  output [4:0] data_out, ps, add_sub_out;  //test
  output done, add, sub;  //test
  output [10:0] q; //test
  
  wire ldM1, ldM2, ldq, clrq, sh, add, sub, sel, q1, q0;
  
  datapath DPInst(data_in, clk, ldM1, ldM2, ldq, clrq, sh, add, sub, sel, q1, q0, data_out, q, add_sub_out); //test
  
  controller2 CInst(start, rst, clk, q0, q1, ldM1, clrq, ldM2, ldq, sh, add, sub, sel, done, ps);   //test


endmodule