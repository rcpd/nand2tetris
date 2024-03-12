
// (-3) push constant 3030
@3030
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-5) pop pointer 0
@3
D=A
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

// (-7) push constant 3040
@3040
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-9) pop pointer 1
@3
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

// (-11) push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-13) pop this 2
@THIS
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

// (-15) push constant 46
@46
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-17) pop that 6
@THAT
D=M
@6
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

// (-19) push pointer 0
@3
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-21) push pointer 1
@3
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-23) add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-25) push this 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-27) sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M-D
@SP
M=M+1

// (-29) push that 6
@THAT
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-31) add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
