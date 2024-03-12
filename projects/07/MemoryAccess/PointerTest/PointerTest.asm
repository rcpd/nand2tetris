
// (-3) push constant 3030
@3030 // push constant 3030
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5) pop pointer 0
@3 // pop pointer 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
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

// (-7) push constant 3040
@3040 // push constant 3040
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-9) pop pointer 1
@3 // pop pointer 1
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

// (-11) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-13) pop this 2
@THIS // pop this 2
D=M
@2 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
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

// (-15) push constant 46
@46 // push constant 46
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-17) pop that 6
@THAT // pop that 6
D=M
@6 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
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

// (-19) push pointer 0
@3 // push pointer 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-21) push pointer 1
@3 // push pointer 1
D=A
@1
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

// (-25) push this 2
@THIS // push this 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-27) sub
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

// (-29) push that 6
@THAT // push that 6
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-31) add
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
