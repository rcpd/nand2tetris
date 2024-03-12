
// (-3) push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-5) pop local 0
@LCL
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

// (-7) push constant 21
@21
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-9) push constant 22
@22
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-11) pop argument 2
@ARG
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

// (-13) pop argument 1
@ARG
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

// (-15) push constant 36
@36
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-17) pop this 6
@THIS
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

// (-19) push constant 42
@42
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-21) push constant 45
@45
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-23) pop that 5
@THAT
D=M
@5
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

// (-25) pop that 2
@THAT
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

// (-27) push constant 510
@510
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-29) pop temp 6
@5
D=A
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

// (-31) push local 0
@LCL
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-33) push that 5
@THAT
D=M
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-35) add
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

// (-37) push argument 1
@ARG
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-39) sub
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

// (-41) push this 6
@THIS
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-43) push this 6
@THIS
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-45) add
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

// (-47) sub
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

// (-49) push temp 6
@5
D=A
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-51) add
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
