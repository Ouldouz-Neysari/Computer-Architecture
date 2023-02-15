module add_sub (a, b, s, add, sub);
  input [4:0] a, b;
  input add, sub;
  wire co;
  output [4:0] s;

  assign s = add ? (a + b) :
	     sub ? (a - b) :
	     a;

endmodule