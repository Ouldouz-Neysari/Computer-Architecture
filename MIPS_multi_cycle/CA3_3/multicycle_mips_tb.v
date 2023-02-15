////module mips(rst, clk, mem_out, mem_read, mem_write, inst_data_adr, mem_data_in);

////module memory (inst_data_adr, mem_data_in, mrd, mwr, clk, mem_out, min_value, min_index);

module multicycle_mips_tb;
  
  wire [31:0] inst_data_adr, mem_out, mem_data_in, min_value, min_index; 
  wire mem_read, mem_write;
  reg clk, rst;

mips CPU (rst, clk, mem_out, mem_read, mem_write, inst_data_adr, mem_data_in); 

memory MEM (inst_data_adr, mem_data_in, mem_read, mem_write, clk, mem_out, min_value, min_index);
  
  initial
  begin
    rst = 1'b1;
    clk = 1'b0;
    #9 rst = 1'b0;
    #7201 $stop;
  end
  
  always
  begin
    #7 clk = ~clk;
  end
  
endmodule
