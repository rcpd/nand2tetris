@261 // bootstrap: initialize SP as 261
D=A
@0
M=D

// (-3) function Sys.init 0
(Sys.init)

// (-6) push constant 4000 // test THIS and THAT context save
@4000
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-8) pop pointer 0
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

// (-10) push constant 5000
@5000
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-12) pop pointer 1
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

// (-15) call Sys.main 0
(sys.Sys.main.6837)

// (-17) push constant 9999 // if no args, create a space on the stack for the return
@9999
D=A
@SP
A=M
M=D
@SP
M=M+1
@sys.Sys.main.6837 // create the RIP pointer and push it to the stack
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-19) push constant 0 // local(0) init
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-21) push constant 0 // local(1) init
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-23) push constant 0 // local(2) init
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-25) push constant 0 // local(3) init
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-27) push constant 0 // local(4) init
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@10 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@106 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@10 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@10 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@1 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@5 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Sys.main // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-29) pop temp 1
@5
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

// (-31) label LOOP
(sys.LOOP)

// (-34) goto LOOP
@sys.LOOP
0;JMP // unconditional jump

// (-36) function Sys.main 5
(Sys.main)

// (-39) push constant 4001
@4001
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-41) pop pointer 0
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

// (-43) push constant 5001
@5001
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-45) pop pointer 1
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

// (-47) push constant 200
@200
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-49) pop local 1
@LCL
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

// (-51) push constant 40
@40
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-53) pop local 2
@LCL
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

// (-55) push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-57) pop local 3
@LCL
D=M
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

// (-59) push constant 123
@123
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-62) call Sys.add12 1
(sys.Sys.add12.2027)
@sys.Sys.add12.2027 // create the RIP pointer and push it to the stack
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@5 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@64 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@5 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@5 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@1 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@0 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Sys.add12 // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-64) pop temp 0
@5
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

// (-66) push local 0
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

// (-68) push local 1
@LCL
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-70) push local 2
@LCL
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-72) push local 3
@LCL
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-74) push local 4
@LCL
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-76) add
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

// (-78) add
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

// (-80) add
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

// (-82) add
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

// (-84) return

// (-86) pop argument 0 // function return: move result to ARG[0] (soon to be last stack item)
@ARG
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
@ARG // *ARG[0] // function return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // function return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // function return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // function return: restore caller stack (ARG)
D=A // d=3
@LCL // *LCL 
A=M-D // *LCL-3 (**ARG)
D=M // d = [LCL-3] (*ARG)
@ARG
M=D // [ARG] = [LCL-3] (*ARG)
@LCL // *LCL // before restoring LCL, save it at R13
D=M // d = [LCL]
@R13 // *R13
M=D // [R13] = [LCL]
@4 // function return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-88) function Sys.add12 0
(Sys.add12)

// (-91) push constant 4002
@4002
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-93) pop pointer 0
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

// (-95) push constant 5002
@5002
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-97) pop pointer 1
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

// (-99) push argument 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-101) push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1

// (-103) add
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

// (-105) return

// (-107) pop argument 0 // function return: move result to ARG[0] (soon to be last stack item)
@ARG
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
@ARG // *ARG[0] // function return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // function return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // function return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // function return: restore caller stack (ARG)
D=A // d=3
@LCL // *LCL 
A=M-D // *LCL-3 (**ARG)
D=M // d = [LCL-3] (*ARG)
@ARG
M=D // [ARG] = [LCL-3] (*ARG)
@LCL // *LCL // before restoring LCL, save it at R13
D=M // d = [LCL]
@R13 // *R13
M=D // [R13] = [LCL]
@4 // function return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)
