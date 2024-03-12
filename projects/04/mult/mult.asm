// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Usage: put numbers in RAM[0] & RAM[1]
// Solution: Add num1[R0] to sum[R2] for num2[R1] times

(MAIN)
	// assign/initialize arguments
	@R0
	D=M // fetch R0
	@num1
	M=D // num1 = R0
	
	@R1
	D=M // fetch R1
	@num2
	M=D // num2 = R1

	@i
	M=0 // i = 0
	@sum
	M=0 // sum = 0

	// test for zeros
	@num1
	D=M // fetch num1
	@STOP
	D;JEQ // if num1 == 0 goto STOP
	
	@num2
	D=M // fetch num2
	@STOP
	D;JEQ // if num2 == 0 goto STOP
	
(LOOP)	
	// if (i>num2) goto STOP
	@i
	D=M // fetch i into D
	@num2
	D=D-M // decrement i by num2
	@STOP
	D;JGE // if i > num2 goto STOP
	
	// else add num1 to sum and increment i
	@num1
	D=M // fetch num1 into D
	@sum
	M=D+M // add num1 to sum
	@i
	D=M // fetch i
	M=D+1 // inc i by 1
	
	// return to top of loop
	@LOOP
	0;JMP // unconditional jump

(STOP)
	// assign sum to R2 (result)
	@sum
	D=M
	@R2
	M=D

(END)
	// Infinite loop (unconditional jump to self)
	@END
	0;JMP