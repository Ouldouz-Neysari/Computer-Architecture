//module register_5(M1, ldM1, clk, q);
//module add_sub (a, b, s,add,sub);
//module Ashreg_11b (r, M2, clrq, ldM2, ldq, sh, clk, q);
//module mux2to1 (i0, i1, sel , y);
//module datapath (data_in, clk, ldM1, ldM2, ldq, clrq, sh, add, sub, sel, q1, q0, data_out); //ldM2=init
//module controller (start, rst, clk, q0, q1, ldM1, clrq, ldM2, ldq, sh, add, sub, sel, done);
//module BoothMultiplier (start, rst, clk, done, data_in, data_out);

module BoothMultiplier_tb();
  reg [4:0] data_in;
  reg start, rst, clk;
  wire [4:0] data_out, ps, add_sub_out;  //test
  wire done, add, sub;  //test
  wire [10:0] q;  //test
  
  BoothMultiplier DUT(start, rst, clk, done, data_in, data_out, q, ps, add_sub_out, add, sub); //test
  
  initial
  begin
    start = 1'b0;
    rst = 1'b0;
    clk = 1'b0;
    #11 rst = 1'b1;
    #31 rst = 1'b0;
    #31 start = 1'b1;
    #31 start = 1'b0;
    #31 data_in = 5'b10001;
    #61 data_in = 5'b10001;
    #1700 $finish;
  end
  
  always
  begin
    #31 clk = ~clk;
  end
  
  
endmodule
