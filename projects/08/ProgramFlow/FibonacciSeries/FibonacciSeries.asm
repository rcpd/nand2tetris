
// (-3) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-5) pop pointer 1 // that = argument[1]
@3 // pop pointer 1 // that = argument[1]
D=A
@1
D=D+A
@SP
A=M
M=D
@SP
M=M-1
A=M
D=M
@SP
M=M+1
A=M
A=M
M=D
@SP
M=M-1

// (-7) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-9) pop that 0 // first element in the series = 0
@THAT // pop that 0 // first element in the series = 0
D=M
@0
D=D+A
@SP
A=M
M=D
@SP
M=M-1
A=M
D=M
@SP
M=M+1
A=M
A=M
M=D
@SP
M=M-1

// (-11) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-13) pop that 1 // second element in the series = 1
@THAT // pop that 1 // second element in the series = 1
D=M
@1
D=D+A
@SP
A=M
M=D
@SP
M=M-1
A=M
D=M
@SP
M=M+1
A=M
A=M
M=D
@SP
M=M-1

// (-15) push argument 0
@ARG // push argument 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-17) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-19) sub
@SP // sub
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M-D
@SP
M=M+1

// (-21) pop argument 0 // num_of_elements -= 2 (first 2 elements are set)
@ARG // pop argument 0 // num_of_elements -= 2 (first 2 elements are set)
D=M
@0
D=D+A
@SP
A=M
M=D
@SP
M=M-1
A=M
D=M
@SP
M=M+1
A=M
A=M
M=D
@SP
M=M-1

// (-23) label MAIN_LOOP_START
(FibonacciSeries.MAIN_LOOP_START) // label MAIN_LOOP_START

// (-26) push argument 0
@ARG // push argument 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-28) if-goto COMPUTE_ELEMENT // if num_of_elements > 0, goto COMPUTE_ELEMENT
@0 // if-goto COMPUTE_ELEMENT // if num_of_elements > 0, goto COMPUTE_ELEMENT
D=A // push a zero onto the stack
@SP
A=M
M=D
@SP
M=M+1
@SP // *esp // compare val1 (if-goto conditional) with val2 (zero)
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2] // leave esp here (pop equivalent)
@FibonacciSeries.COMPUTE_ELEMENT
D;JNE // jump if not zero

// (-30) goto END_PROGRAM // otherwise, goto END_PROGRAM
@FibonacciSeries.END_PROGRAM // goto END_PROGRAM // otherwise, goto END_PROGRAM
0;JMP // unconditional jump

// (-32) label COMPUTE_ELEMENT
(FibonacciSeries.COMPUTE_ELEMENT) // label COMPUTE_ELEMENT

// (-35) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-37) push that 1
@THAT // push that 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-39) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-41) pop that 2 // that[2] = that[0] + that[1]
@THAT // pop that 2 // that[2] = that[0] + that[1]
D=M
@2
D=D+A
@SP
A=M
M=D
@SP
M=M-1
A=M
D=M
@SP
M=M+1
A=M
A=M
M=D
@SP
M=M-1

// (-43) push pointer 1
@3 // push pointer 1
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-45) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-47) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-49) pop pointer 1 // that += 1
@3 // pop pointer 1 // that += 1
D=A
@1
D=D+A
@SP
A=M
M=D
@SP
M=M-1
A=M
D=M
@SP
M=M+1
A=M
A=M
M=D
@SP
M=M-1

// (-51) push argument 0
@ARG // push argument 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-53) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-55) sub
@SP // sub
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M-D
@SP
M=M+1

// (-57) pop argument 0 // num_of_elements--
@ARG // pop argument 0 // num_of_elements--
D=M
@0
D=D+A
@SP
A=M
M=D
@SP
M=M-1
A=M
D=M
@SP
M=M+1
A=M
A=M
M=D
@SP
M=M-1

// (-59) goto MAIN_LOOP_START
@FibonacciSeries.MAIN_LOOP_START // goto MAIN_LOOP_START
0;JMP // unconditional jump

// (-61) label END_PROGRAM
(FibonacciSeries.END_PROGRAM) // label END_PROGRAM
