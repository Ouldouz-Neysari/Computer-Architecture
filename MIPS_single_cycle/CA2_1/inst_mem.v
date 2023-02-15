module inst_mem (adr, d_out);
  input [31:0] adr;
  output [31:0] d_out;
  
  reg [7:0] mem[0:65535];
  
  initial
  begin                                       

    $readmemb("instmem.txt",mem,0);

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
    
  end
  
  assign d_out = {mem[adr[15:0]+3], mem[adr[15:0]+2], mem[adr[15:0]+1], mem[adr[15:0]]};
  
endmodule
