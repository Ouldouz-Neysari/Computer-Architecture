`define   S0      5'b00000
`define   S1      5'b00001
`define   S2      5'b00010
`define   S3      5'b00011
`define   S4      5'b00100
`define   S5      5'b00101
`define   S6      5'b00110
`define   S7      5'b00111
`define   S8      5'b01000
`define   S9      5'b01001
`define   S10     5'b01010
`define   S11     5'b01011
`define   S12     5'b01100
`define   S13     5'b01101
`define   S14     5'b01110
`define   S15     5'b01111
`define   S16     5'b10000
`define   S17     5'b10001
`define   S18     5'b10010
`define   S19     5'b10011
`define   S20     5'b10100
`define   S21     5'b10101
`define   S22     5'b10110
`define   S23     5'b10111
`define   S24     5'b11000

//module register_5(M1, ldM1, clk, q);
//module add_sub (a, b, s,add,sub);
//module Ashreg_11b (r, M2, clrq, ldM2, ldq, sh, clk, q);
//module mux2to1 (i0, i1, sel , y);
//module datapath (data_in, clk, ldM1, ldM2, ldq, clrq, sh, add, sub, sel, q1, q0, data_out); //ldM2=init

module controller2 (start, rst, clk, q0, q1, ldM1, clrq, ldM2, ldq, sh, add, sub, sel, done, ps); //test
  input start, rst, clk, q0, q1;
  output ldM1, clrq, ldM2, ldq, sh, add, sub, sel, done;
  output [4:0] ps;  //test
  reg ldM1, clrq, ldM2, ldq, sh, add, sub, sel, done;
  reg [4:0] ps, ns;
  
  // Sequential part 
  always @(posedge clk)
    if (rst)
      ps <= 5'b00000;
    else
      ps <= ns;
  
  always @(ps or start or q0 or q1)
  begin
    case (ps)
      `S0:  ns = start ? `S1 : `S0;
      `S1:  ns = `S2;
      `S2:  ns = `S24;
      `S24:  ns = q0 ? (q1 ? `S5 : `S3) : (q1 ? `S4 : `S5);
      `S3:  ns = `S5;
      `S4:  ns = `S5;
      `S5:  ns = `S6;
      `S6:  ns = q0 ? (q1 ? `S9 : `S7) : (q1 ? `S8 : `S9);
      `S7:  ns = `S9;
      `S8:  ns = `S9;
      `S9:  ns = `S10;
      `S10:  ns = q0 ? (q1 ? `S13 : `S11) : (q1 ? `S12 : `S13);
      `S11:  ns = `S13;
      `S12:  ns = `S13;
      `S13:  ns = `S14;
      `S14:  ns = q0 ? (q1 ? `S17 : `S15) : (q1 ? `S16 : `S17);
      `S15:  ns = `S17;
      `S16:  ns = `S17;
      `S17:  ns = `S18;
      `S18:  ns = q0 ? (q1 ? `S21 : `S19) : (q1 ? `S20 : `S21);
      `S19:  ns = `S21;
      `S20:  ns = `S21;
      `S21:  ns = `S22;
      `S22:  ns = `S23;
      `S23:  ns = `S0;
    endcase
  end

  always @(ps)
  begin
    {ldM1, clrq, ldM2, ldq, sh, add, sub, sel, done} = 9'b0_0000_0000;
    case (ps)
      `S0: ;
      `S1: {ldM1, clrq} = 2'b11;
      `S2: ldM2 = 1'b1;
      `S3: {ldq, add} = 2'b11;
      `S4: {ldq, sub} = 2'b11;
      `S5: sh = 1'b1;   //{sh, clrq} = 2'b11; 
      `S6: ;
      `S7: {ldq, add} = 2'b11;
      `S8: {ldq, sub} = 2'b11;
      `S9: sh = 1'b1;
      `S10: ;
      `S11: {ldq, add} = 2'b11;
      `S12: {ldq, sub} = 2'b11;
      `S13: sh = 1'b1;
      `S14: ;
      `S15: {ldq, add} = 2'b11;
      `S16: {ldq, sub} = 2'b11;
      `S17: sh = 1'b1;
      `S18: ;
      `S19: {ldq, add} = 2'b11;
      `S20: {ldq, sub} = 2'b11;
      `S21: sh = 1'b1;
      `S22: done = 1'b1;
      `S23: {sel, done} = 2'b11;
    endcase
  end
  
endmodule 


