module register_5(M1, ldM1, clk, q);
  input [4:0] M1;
  input ldM1, clk;
  output [4:0] q;
  reg [4:0] q;
  
  always @(posedge clk)
    if (ldM1)
      q <= M1;
  
endmodule

