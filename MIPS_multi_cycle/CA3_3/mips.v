//module datapath (clk, rst, 
//		 pc_ld,IorD,IRwrite,reg_dst,mem_to_reg,alu_src_A,alu_src_B,alu_ctrl,reg_write,pc_src,
//		 zero, 
//               R31_sel,jal_sel,
//		 mem_out,
//               inst_out,
// 		 inst_data_adr,mem_data_in);

//module controller ( opcode, func, zero, 
//                    IorD, IRwrite, R31_sel,jal_sel,
//                    reg_dst, mem_to_reg, alu_src_A, alu_src_B, operation, reg_write, 
//                    pc_src, pc_ld, mem_read, mem_write,clk,rst);

////module mem (inst_data_adr, mem_data_in, mrd, mwr, clk, mem_out, min_value, min_index);

///general inputs 
///inputs from memory
///outputs to memory 

module mips(rst, clk, mem_out, mem_read, mem_write, inst_data_adr, mem_data_in); 

  input rst, clk;

  input  [31:0] mem_out;

  output mem_read, mem_write;

  output [31:0] inst_data_adr;
  output [31:0] mem_data_in;


  wire pc_ld, IorD, IRwrite,reg_dst, mem_to_reg,reg_write,R31_sel,jal_sel,alu_src_A,zero;
  wire [1:0] alu_src_B, pc_src;
  wire [2:0] alu_ctrl;
  wire [31:0] inst_out;



  datapath DP(clk, rst,
              pc_ld,IorD,IRwrite,reg_dst, mem_to_reg,alu_src_A,alu_src_B,alu_ctrl,reg_write,pc_src,
	      zero,
	      R31_sel,jal_sel,
	      mem_out,
              inst_out,
              inst_data_adr ,mem_data_in
            );
           
  controller CU( inst_out[31:26], inst_out[5:0], zero,
                 IorD,IRwrite,R31_sel,jal_sel,
                 reg_dst, mem_to_reg,alu_src_A,alu_src_B, alu_ctrl, reg_write, 
                 pc_src,pc_ld, mem_read, mem_write, clk, rst
                );
  
endmodule


