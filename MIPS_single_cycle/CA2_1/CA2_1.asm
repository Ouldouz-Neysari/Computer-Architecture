addi R1,R0,1000 //start address
lw R2,0(R1)     //first element
addi R3,R1,0    //index
addi R4,R1,0    ///index of min eleemt
addi R5,R0,19  /// number of iterations

LOOP:
    beq R3,R5,END_LOOP
    addi R1,R1,4
    addi R3,R3,1
    lw R6,0(R1)
    slt R7,R6,R2
    beq R7,R0,LOOP
    addi R4,R4,1
    add R2,R6,R0
    j LOOP
END_LOOP:
    sw R2,200(R0)
    sw R5,2004(R0)


    
    