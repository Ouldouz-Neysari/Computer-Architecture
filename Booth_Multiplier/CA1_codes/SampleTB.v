module multiplier_tb;
  reg [3:0] data_in;
  reg rst, start, clk;
  wire [3:0] data_out;
  wire done;
  
  multiplier DUT(data_in, rst, start, clk, data_out, done);
  
  initial
  begin
    start = 1'b0;
    rst = 1'b0;
    clk = 1'b0;
    #13 rst = 1'b1;
    #20 rst = 1'b0;
    #13 start = 1'b1;
    #20 start = 1'b0;
    data_in = 4'b1101;
    #20 data_in = 4'b1010;
    #500 $finish;
  end
  
  always
  begin
    #10 clk = ~clk;
  end
  
  
endmodule

