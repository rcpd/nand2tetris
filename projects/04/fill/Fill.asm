// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(MAIN)
	@SCREEN
	D=A // fetch SCREEN
	@pos // 16
	M=D // pos = SCREEN
	
	@SCREEN // min: base address of SCREEN
	D=A
	@min // 17
	M=D // min = SCREEN
	
	@8192 // max: 512x256 screen with 16bit cells
	D=A
	@SCREEN
	D=D+A
	@max // 18
	M=D-1 // max = SCREEN+8192

(CHECK)
	@KBD
	D=M // fetch KBD
	@ERASE
	D;JEQ // if no keypress goto ERASE
	@DRAW
	0;JMP // else goto DRAW

(ERASE)
	@pos
	D=M // fetch pos into D
	@min
	D=M-D // decrement min by pos (positive if below min)
	@SET_MIN
	D;JGT // if pos < min goto SET_MIN
	
	@pos
	A=M // dereference pos
	M=0 // set pos to max black pixels (1111111111111111)
	
	@pos
	M=M-1 // reverse screen pos by 1 cell
	
	@CHECK
	0;JMP // return to CHECK
	
(DRAW)	
	@pos
	D=M // fetch pos into D
	@max
	D=D-M // decrement pos by max (positive if above max)
	@SET_MAX
	D;JGT // if pos > max goto SET_MAX
	
	@pos
	A=M // dereference pos
	M=-1 // set pos to max black pixels (1111111111111111)
	
	@pos
	M=M+1 // advance screen pos by 1 cell
	
	@CHECK
	0;JMP // return to CHECK

(SET_MIN)
	@min
	D=M // fetch min
	@pos
	M=D // set pos to min (last dec exceeded boundary)
	@CHECK
	0;JMP // return to CHECK
	
(SET_MAX)
	@max
	D=M // fetch max
	@pos
	M=D // set pos to max (last inc exceeded boundary)
	@CHECK
	0;JMP // return to CHECK
	
(END)
	@END
	0;JMP // Infinite loop (unconditional jump to self)