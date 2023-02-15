module mux4to1_32b (i0, i1,i2,i3, sel, y);
  input [31:0] i0, i1,i2,i3;
  input [1:0] sel;
  output [31:0] y;
  
  assign y = sel[1] ? (sel[0] ? i3 : i2) : (sel[0] ? i1 : i0);
  
endmodule
