
// (-3) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5) pop local 0 // initializes sum = 0
@LCL // pop local 0 // initializes sum = 0
D=M
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

// (-7) label LOOP_START
(BasicLoop.LOOP_START) // label LOOP_START

// (-10) push argument 0
@ARG // push argument 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-12) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-14) add
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

// (-16) pop local 0 // sum = sum + counter
@LCL // pop local 0 // sum = sum + counter
D=M
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

// (-18) push argument 0
@ARG // push argument 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-20) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-22) sub
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

// (-24) pop argument 0 // counter--
@ARG // pop argument 0 // counter--
D=M
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
M=M+1 // stacksize++

// (-28) if-goto LOOP_START // If counter > 0, goto LOOP_START
@0 // if-goto LOOP_START // If counter > 0, goto LOOP_START
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
@BasicLoop.LOOP_START
D;JNE // jump if not zero

// (-30) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
