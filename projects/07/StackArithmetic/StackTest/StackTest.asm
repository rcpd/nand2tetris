
// (-3) push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-5) push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-7) eq
@SP // *esp
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_1435
D;JEQ
(EQ_FALSE_1435)
@0
D=A // d = false
@EQ_END_1435
0;JMP
(EQ_TRUE_1435)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_1435)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-12) push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-14) push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-16) eq
@SP // *esp
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_1648
D;JEQ
(EQ_FALSE_1648)
@0
D=A // d = false
@EQ_END_1648
0;JMP
(EQ_TRUE_1648)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_1648)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-21) push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-23) push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-25) eq
@SP // *esp
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_3721
D;JEQ
(EQ_FALSE_3721)
@0
D=A // d = false
@EQ_END_3721
0;JMP
(EQ_TRUE_3721)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_3721)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-30) push constant 892
@892
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-32) push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-34) lt
@SP // *esp
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_6789
D;JLT
(JLT_FALSE_6789)
@0
D=A // d = false
@JLT_END_6789
0;JMP
(JLT_TRUE_6789)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_6789)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-39) push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-41) push constant 892
@892
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-43) lt
@SP // *esp
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_6194
D;JLT
(JLT_FALSE_6194)
@0
D=A // d = false
@JLT_END_6194
0;JMP
(JLT_TRUE_6194)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_6194)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-48) push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-50) push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-52) lt
@SP // *esp
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_7027
D;JLT
(JLT_FALSE_7027)
@0
D=A // d = false
@JLT_END_7027
0;JMP
(JLT_TRUE_7027)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_7027)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-57) push constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-59) push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-61) gt
@SP // *esp
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_7704
D;JGT
(JGT_FALSE_7704)
@0
D=A // d = false
@JGT_END_7704
0;JMP
(JGT_TRUE_7704)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_7704)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-66) push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-68) push constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-70) gt
@SP // *esp
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_5318
D;JGT
(JGT_FALSE_5318)
@0
D=A // d = false
@JGT_END_5318
0;JMP
(JGT_TRUE_5318)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_5318)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-75) push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-77) push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-79) gt
@SP // *esp
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_5821
D;JGT
(JGT_FALSE_5821)
@0
D=A // d = false
@JGT_END_5821
0;JMP
(JGT_TRUE_5821)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_5821)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-84) push constant 57
@57
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-86) push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-88) push constant 53
@53
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-90) add
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

// (-92) push constant 112
@112
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-94) sub
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

// (-96) neg
@SP
M=M-1
A=M
M=-M
@SP
M=M+1

// (-98) and
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M&D
@SP
M=M+1

// (-100) push constant 82
@82
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-102) or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M|D
@SP
M=M+1

// (-104) not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
