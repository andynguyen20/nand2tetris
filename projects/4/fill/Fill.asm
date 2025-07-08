// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.


@LOOP
(LOOP)
    @KBD 
    D=M //Store keyboard input value into D-Register (noInput = 0, input !=0)

    @DRAW 
    D; JNE //Jump to drawing ROM address if key is pressed

    @CLEAR
    D; JEQ //Jump to clearing ROM address if no key is pressed

    (DRAW)
        @SCREEN 
        D=A 
        @i 
        M=D //initialize the incrementor i to the first address of screen everytime

    (DRAW_LOOP)
        @i 
        D=M 
        @24576 //last address of screen + 1
        D=D-A 
        @END_DRAW 
        D;JEQ //if exits the last address of the screen then go to END_DRAW

        @i 
        A=M
        M=-1 //draw black (-1 = 1111111111111111) onto current address 


        @i 
        M=M+1 //increment the count 
        @DRAW_LOOP
        0; JMP //loop back

    (END_DRAW) 
        @LOOP 
        0; JMP //go back to start of loop and reevaluate key input 
    
    (CLEAR)
        @SCREEN 
        D=A 
        @i //initialize incrementor to first address
        M=D

    (CLEAR_LOOP)
        @i 
        D=M 
        @24576
        D=D-A
        @END_CLEAR
        D;JEQ //if exits last address of screen then go to END_CLEAR 

        @i 
        A=M
        M=0 //clears the screen to white (0 = 0000000000000000) on current address

        @i 
        M=M+1 //increment the address count
        @CLEAR_LOOP
        0; JMP //loop back

    (END_CLEAR)
        @LOOP 
        0; JMP //go back to start of loop and reevalute key input




