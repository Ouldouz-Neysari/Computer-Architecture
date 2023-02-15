//module register_5(M1, ldM1, clk, q);
//module add_sub (a, b, s,add,sub);
//module Ashreg_11b (r, M2, clrq, ldM2, ldq, sh, clk, q);
//module mux2to1 (i0, i1, sel , y);

module datapath (data_in, clk, ldM1, ldM2, ldq, clrq, sh, add, sub, sel, q1, q0, data_out, q, add_sub_out); //ldM2=init   //test
  input [4:0] data_in;
  input clk, ldM1, ldM2, ldq, clrq, sh, add, sub, sel;
  output q1, q0; 
  output [4:0] data_out, add_sub_out;   //test
  output [10:0] q;   //test
  
  wire [10:0] q;
  wire [4:0] reg5_out, add_sub_out;
  
  register_5 Reg5Inst (data_in, ldM1, clk, reg5_out);
  
  add_sub AddSubInst (q[10:6], reg5_out, add_sub_out, add, sub);

  Ashreg_11b AshReg11Inst (add_sub_out, data_in, clrq, ldM2, ldq, sh, clk, q);
    
  mux2to1 MuxInst (q[10:6], q[5:1], sel, data_out);

  assign {q1,q0} = q[1:0];
  
endmodule  

