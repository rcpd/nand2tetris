
// (-3) push constant 7
@7 // push constant 7
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5) push constant 8
@8 // push constant 8
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7) add
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
