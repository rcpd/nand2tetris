
// (-3) push constant 111
@111 // push constant 111
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-5) push constant 333
@333 // push constant 333
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-7) push constant 888
@888 // push constant 888
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-9) pop static 8
@16 // pop static 8 // static + src segment offset (..\07\MemoryAccess\StaticTest\StaticTest.vm)
D=A
@8
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

// (-11) pop static 3
@16 // pop static 3 // static + src segment offset (..\07\MemoryAccess\StaticTest\StaticTest.vm)
D=A
@3
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

// (-13) pop static 1
@16 // pop static 1 // static + src segment offset (..\07\MemoryAccess\StaticTest\StaticTest.vm)
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

// (-15) push static 3
@16 // push static 3 // static + src segment offset (..\07\MemoryAccess\StaticTest\StaticTest.vm)
D=A
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-17) push static 1
@16 // push static 1 // static + src segment offset (..\07\MemoryAccess\StaticTest\StaticTest.vm)
D=A
@1
A=D+A
D=M
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

// (-21) push static 8
@16 // push static 8 // static + src segment offset (..\07\MemoryAccess\StaticTest\StaticTest.vm)
D=A
@8
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-23) add
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
