//module mips(rst, clk, mem_out, mem_read, mem_write, done, inst_data_adr, mem_data_in);

module memory (inst_data_adr, mem_data_in, mrd, mwr, clk, mem_out, min_value, min_index);
  input [31:0] inst_data_adr;
  input [31:0] mem_data_in;
  input mrd, mwr, clk;
  output [31:0] mem_out;
  output [31:0] min_value;
  output [31:0] min_index;
  
  reg [7:0] mem[0:65535];
  


  initial
  begin                                       

    $readmemb("memfile8.txt",mem,0);

//0 //PRGM: addi R1,R0,1000	        ///R1: starting address
//4 //      lw R2,0(R1)	        ///R2: min element value
//8 //      addi R3,R0,0              ///R3: index(i)
//12 //     addi R4,R0,0             ///R4: min element index
//16 //     addi R5,R0,19	        ///R5: number of iterations

//20 //LOOP: beq R3,R5,END_LOOP                          
//24 //      addi R1,R1,4
//28 //      addi R3,R3,1
//32 //      lw R6,0(R1)
//36 //      slt R7,R6,R2
//40 //      beq R7,R0,LOOP
//44 //      addi R4,R3,0
//48 //      addi R2,R6,0
//52 //      j LOOP

//56 //END_LOOP: sw R2,2000(R0)
//60 //          sw R4,2004(R0)

//    {mem[3], mem[2], mem[1], mem[0]}     = {6'b001001, 5'd0, 5'd1, 16'd1000};   
//    {mem[7], mem[6], mem[5], mem[4]}     = {6'b100011, 5'd1, 5'd2, 16'd0};               
//    {mem[11], mem[10], mem[9], mem[8]}   = {6'b001001, 5'd0, 5'd3, 16'd0};                
//    {mem[15], mem[14], mem[13], mem[12]} = {6'b001001, 5'd0, 5'd4, 16'd0};           
//    {mem[19], mem[18], mem[17], mem[16]} = {6'b001001, 5'd0, 5'd5, 16'd19}; 
//
//    {mem[23], mem[22], mem[21], mem[20]} = {6'b000100, 5'd3, 5'd5, 16'd8};            
//    {mem[27], mem[26], mem[25], mem[24]} = {6'b001001, 5'd1, 5'd1, 16'd4};               
//    {mem[31], mem[30], mem[29], mem[28]} = {6'b001001, 5'd3, 5'd3, 16'd1};  
//    {mem[35], mem[34], mem[33], mem[32]} = {6'b100011, 5'd1, 5'd6, 16'd0};         
//    {mem[39], mem[38], mem[37], mem[36]} = {6'b000000, 5'd6, 5'd2, 5'd7, 5'd0, 6'b101010}; 
//    {mem[43], mem[42], mem[41], mem[40]} = {6'b000100, 5'd7, 5'd0, -16'd6};              
//    {mem[47], mem[46], mem[45], mem[44]} = {6'b001001, 5'd3, 5'd4, 16'd0};               
//    {mem[51], mem[50], mem[49], mem[48]} = {6'b001001, 5'd6, 5'd2, 16'd0};    
//    {mem[55], mem[54], mem[53], mem[52]} = {6'b000010, 26'd5};             
         
//    {mem[59], mem[58], mem[57], mem[56]} = {6'b101011, 5'd0, 5'd2, 16'd2000}; 
//    {mem[63], mem[62], mem[61], mem[60]} = {6'b101011, 5'd0, 5'd4, 16'd2004};

//    {mem[1003], mem[1002], mem[1001], mem[1000]} = 32'd12;
//    {mem[1007], mem[1006], mem[1005], mem[1004]} = 32'd13;
//    {mem[1011], mem[1010], mem[1009], mem[1008]} = 32'd21;
//    {mem[1015], mem[1014], mem[1013], mem[1012]} = 32'd31;
//    {mem[1019], mem[1018], mem[1017], mem[1016]} = 32'd44; 
//    {mem[1023], mem[1022], mem[1021], mem[1020]} = 32'd53;
//    {mem[1027], mem[1026], mem[1025], mem[1024]} = 32'd19;
//    {mem[1031], mem[1030], mem[1029], mem[1028]} = 32'd2;
//    {mem[1035], mem[1034], mem[1033], mem[1032]} = (-32'd11);
//    {mem[1039], mem[1038], mem[1037], mem[1036]} = 32'd49; 
//    {mem[1043], mem[1042], mem[1041], mem[1040]} = 32'd52;
//    {mem[1047], mem[1046], mem[1045], mem[1044]} = 32'd13;
//    {mem[1051], mem[1050], mem[1049], mem[1048]} = 32'd27;
//    {mem[1055], mem[1054], mem[1053], mem[1052]} = 32'd36;
//    {mem[1059], mem[1058], mem[1057], mem[1056]} = 32'd45; 
//    {mem[1063], mem[1062], mem[1061], mem[1060]} = 32'd51;
//    {mem[1067], mem[1066], mem[1065], mem[1064]} = 32'd71;
//    {mem[1071], mem[1070], mem[1069], mem[1068]} = 32'd62;
//    {mem[1075], mem[1074], mem[1073], mem[1072]} = 32'd93;
//    {mem[1079], mem[1078], mem[1077], mem[1076]} = (-32'd84); 

  end

  // The following initial block is for TEST PURPOSE ONLY 
  initial
    #500 $display("The content of mem[200] = %d", {mem[203], mem[202], mem[201], mem[200]});
  
  always @(posedge clk)
    if (mwr==1'b1)
      {mem[inst_data_adr+3], mem[inst_data_adr+2], mem[inst_data_adr+1], mem[inst_data_adr]} = mem_data_in;
  
  assign mem_out = (mrd==1'b1) ? {mem[inst_data_adr+3], mem[inst_data_adr+2], mem[inst_data_adr+1], mem[inst_data_adr]} : 32'd0;
  assign min_value = {mem[2003], mem[2002], mem[2001], mem[2000]};
  assign min_index = {mem[2007], mem[2006], mem[2005], mem[2004]};
  
endmodule

