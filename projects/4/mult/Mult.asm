// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

//// Replace this comment with your code.

// R2 = R1 * R0

//PSEUDOCODE 
//n == R1
//x == R0
//sum = R2
//for(i = 0; i < n, i++) {
//    sum = sum + x;
// }

@i
M=0 //store index starting point

@R1
D=M
@n 
M=D 

@R2 
M=0 //Initialize R2 so there is no stored input value

@LOOP
(LOOP)

    @i
    D=M 
    @n 
    D=D-M
    @END
    D;JEQ //Check if i == n and jump to end if it does


    @R0 
    D=M //Store RAM[0] value into D-register
    @R2 
    M=M+D //Add RAM[0] value into R2 
    @i
    M=M+1 //Increment the count for the loop
    @LOOP //Jump back to loop ROM to re-iterate
    0;JMP

(END)
    @END
    0;JMP //End loop (best practice)



