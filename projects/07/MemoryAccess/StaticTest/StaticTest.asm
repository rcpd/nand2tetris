
// (-3) push constant 111
@111 // push constant 111
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5) push constant 333
@333 // push constant 333
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7) push constant 888
@888 // push constant 888
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-9) pop static 8
@16 // pop static 8 // static + src segment offset (..\07\MemoryAccess\StaticTest\StaticTest.vm)
D=A
@8 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-11) pop static 3
@16 // pop static 3 // static + src segment offset (..\07\MemoryAccess\StaticTest\StaticTest.vm)
D=A
@3 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-13) pop static 1
@16 // pop static 1 // static + src segment offset (..\07\MemoryAccess\StaticTest\StaticTest.vm)
D=A
@1 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

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
M=M+1 // stacksize++

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
M=M+1 // stacksize++

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
M=M+1 // stacksize++

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
