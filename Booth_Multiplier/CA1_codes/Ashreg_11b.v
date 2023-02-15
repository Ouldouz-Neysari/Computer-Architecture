module Ashreg_11b (r, M2, clrq, ldM2, ldq, sh, clk, q);
  input [4:0] r, M2;
  input clrq, ldM2, ldq, sh, clk;
  output [10:0] q;
  reg [10:0] q;
  
  always @(posedge clk)
    if (clrq)
      q <= 11'b000_0000_0000;
    else if (ldM2)
      q <= {5'b0000, M2, 1'b0};
    else if (ldq)
      q <= {r, q[5:0]};
    else if (sh)
      q <= {q[10], q[10:1]};
        
endmodule

