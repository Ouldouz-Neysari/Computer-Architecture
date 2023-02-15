/////multi cycle

///general inputs 
/// control (input) signals of unchanged multicycle mips
/// control (output) signals
/// control signals we have added 
///inputs from memory
///outputs to controler
///outputs to memry

module datapath (clk, rst, 
		 pc_ld,IorD,IRwrite,reg_dst,mem_to_reg,alu_src_A,alu_src_B,alu_ctrl,reg_write,pc_src,
		 zero, 
                 R31_sel,jal_sel,
		 mem_out,
                 inst_out,
 		 inst_data_adr,mem_data_in	                    
                 );
  input  clk, rst;
  output zero;

  input  pc_ld,IorD,IRwrite,reg_dst, mem_to_reg,alu_src_A,reg_write;
  input  [1:0] alu_src_B,pc_src;
  input  [2:0] alu_ctrl;

  input R31_sel,jal_sel;

  input  [31:0] mem_out;

  output  [31:0] inst_out;

  output [31:0] inst_data_adr,mem_data_in;


  wire [31:0] pc_out;
  wire [31:0] mux1_out;
  wire [31:0] IR_out;
  wire [31:0] MDR_out;
  wire [4:0] mux2_out;
  wire [4:0] mux3_out;
  wire [31:0] mux4_out;
  wire [31:0] mux5_out;
  wire [31:0] read_Data1;
  wire [31:0] read_Data2;
  wire [31:0] sgn_ext_out;
  wire [31:0] shl2_out;
  wire [31:0] A_out;
  wire [31:0] B_out;
  wire [31:0] mux6_out;
  wire [31:0] mux7_out;
  wire [31:0] alu_out;
  wire [31:0] alu_out_out;
  wire [31:0] mux8_out; 


  reg_32b PC(mux8_out, rst, pc_ld, clk, pc_out);
  
  mux2to1_32b MUX1(pc_out, alu_out_out, IorD, mux1_out);
  assign inst_data_adr = mux1_out;
  
  reg_32b IR(mem_out, rst, IRwrite, clk, IR_out);
  assign inst_out = IR_out;
  
  reg_32b MDR(mem_out, rst, 1'b1, clk, MDR_out);
  
  mux2to1_5b MUX2(IR_out[20:16], IR_out[15:11], reg_dst, mux2_out);
  
  mux2to1_5b MUX3(mux2_out, 5'b11111, R31_sel, mux3_out);
  
  mux2to1_32b MUX4(alu_out_out, MDR_out, mem_to_reg, mux4_out);
  
  mux2to1_32b MUX5(mux4_out, pc_out, jal_sel, mux5_out);
  
  reg_file  RF(mux5_out, IR_out[25:21], IR_out[20:16], mux3_out, reg_write, rst, clk, read_Data1, read_Data2); 
  
  reg_32b A(read_Data1, rst, 1'b1, clk, A_out);
  
  reg_32b B(read_Data2, rst, 1'b1, clk, B_out);
  assign mem_data_in = B_out;
  
  mux2to1_32b MUX6(pc_out, A_out, alu_src_A, mux6_out);
  
  sign_ext SGN_EXT(IR_out[15:0], sgn_ext_out);
  
  shl2 SHIFT_LEFT_2b(sgn_ext_out, shl2_out);
  
  mux4to1_32b MUX7(B_out, 32'd4, sgn_ext_out, shl2_out, alu_src_B, mux7_out);
  
  alu ALU(mux6_out, mux7_out, alu_ctrl, alu_out, zero);
  
  reg_32b ALU_OUT(alu_out, rst, 1'b1, clk, alu_out_out);
  
  mux4to1_32b MUX8(alu_out, {pc_out[31:28],IR_out[25:0],2'b00}, alu_out_out, A_out, pc_src, mux8_out);
  

endmodule

