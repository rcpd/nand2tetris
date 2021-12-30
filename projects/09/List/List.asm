
// (-3) function Sys.init 0
(Sys.init) // function Sys.init 0

// (-7) call Memory.init 0
(sys.Memory.init.1) // call Memory.init 0 // function Sys.init 0

// (-9) push constant 9999 // call Memory.init // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Memory.init // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@sys.Memory.init.1 // push RIP
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
@71 // prologue_size
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
@Memory.init // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)
// (-11) pop temp 0
@5 // pop temp 0
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

// (-14) call Math.init 0
(sys.Math.init.2) // call Math.init 0

// (-16) push constant 9999 // call Math.init // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Math.init // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@sys.Math.init.2 // push RIP
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

// (-18) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@78 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@1 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Math.init // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-20) pop temp 0
@5 // pop temp 0
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

// (-23) call Screen.init 0
(sys.Screen.init.3) // call Screen.init 0

// (-25) push constant 9999 // call Screen.init // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Screen.init // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@sys.Screen.init.3 // push RIP
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

// (-27) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@78 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@1 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Screen.init // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-29) pop temp 0
@5 // pop temp 0
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

// (-32) call Output.init 0
(sys.Output.init.4) // call Output.init 0

// (-34) push constant 9999 // call Output.init // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Output.init // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@sys.Output.init.4 // push RIP
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
@71 // prologue_size
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
@Output.init // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-36) pop temp 0
@5 // pop temp 0
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

// (-39) call Keyboard.init 0
(sys.Keyboard.init.5) // call Keyboard.init 0

// (-41) push constant 9999 // call Keyboard.init // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Keyboard.init // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@sys.Keyboard.init.5 // push RIP
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
@71 // prologue_size
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
@Keyboard.init // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-43) pop temp 0
@5 // pop temp 0
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

// (-46) call Main.main 0
(sys.Main.main.6) // call Main.main 0

// (-48) push constant 9999 // call Main.main // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Main.main // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@sys.Main.main.6 // push RIP
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

// (-50) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@78 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@1 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Main.main // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-52) pop temp 0
@5 // pop temp 0
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

// (-55) call Sys.halt 0
(sys.Sys.halt.7) // call Sys.halt 0

// (-57) push constant 9999 // call Sys.halt // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Sys.halt // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@sys.Sys.halt.7 // push RIP
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
@71 // prologue_size
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
@Sys.halt // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-59) pop temp 0
@5 // pop temp 0
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

// (-61) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-63) return

// (-65) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-67) function Sys.halt 0
(Sys.halt) // function Sys.halt 0

// (-70) label WHILE_EXP0
(sys.WHILE_EXP0) // label WHILE_EXP0

// (-73) push constant 0
@0 // push constant 0 // function Sys.halt 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-75) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-77) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-79) if-goto WHILE_END0
@0 // if-goto WHILE_END0
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
@sys.WHILE_END0
D;JNE // jump if not zero

// (-81) goto WHILE_EXP0
@sys.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-83) label WHILE_END0
(sys.WHILE_END0) // label WHILE_END0

// (-86) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-88) return

// (-90) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-92) function Sys.wait 1
(Sys.wait) // function Sys.wait 1

// (-95) push argument 0
@ARG // push argument 0 // function Sys.wait 1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-97) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-99) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_8
D;JLT
(JLT_FALSE_8)
@0
D=A // d = false
@JLT_END_8
0;JMP
(JLT_TRUE_8)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_8)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-104) if-goto IF_TRUE0
@0 // if-goto IF_TRUE0
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
@sys.IF_TRUE0
D;JNE // jump if not zero

// (-106) goto IF_FALSE0
@sys.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-108) label IF_TRUE0
(sys.IF_TRUE0) // label IF_TRUE0

// (-111) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-114) call Sys.error 1
(sys.Sys.error.9) // call Sys.error 1
@sys.Sys.error.9 // call Sys.error // push RIP
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
@Sys.error // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-116) pop temp 0
@5 // pop temp 0
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

// (-118) label IF_FALSE0
(sys.IF_FALSE0) // label IF_FALSE0

// (-121) label WHILE_EXP0
(sys.WHILE_EXP0) // label WHILE_EXP0

// (-124) push argument 0
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

// (-126) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-128) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_10
D;JGT
(JGT_FALSE_10)
@0
D=A // d = false
@JGT_END_10
0;JMP
(JGT_TRUE_10)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_10)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-133) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-135) if-goto WHILE_END0
@0 // if-goto WHILE_END0
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
@sys.WHILE_END0
D;JNE // jump if not zero

// (-137) push constant 50
@50 // push constant 50
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-139) pop local 0
@LCL // pop local 0
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

// (-141) label WHILE_EXP1
(sys.WHILE_EXP1) // label WHILE_EXP1

// (-144) push local 0
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

// (-146) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-148) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_11
D;JGT
(JGT_FALSE_11)
@0
D=A // d = false
@JGT_END_11
0;JMP
(JGT_TRUE_11)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_11)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-153) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-155) if-goto WHILE_END1
@0 // if-goto WHILE_END1
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
@sys.WHILE_END1
D;JNE // jump if not zero

// (-157) push local 0
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

// (-159) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-161) sub
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

// (-163) pop local 0
@LCL // pop local 0
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

// (-165) goto WHILE_EXP1
@sys.WHILE_EXP1 // goto WHILE_EXP1
0;JMP // unconditional jump

// (-167) label WHILE_END1
(sys.WHILE_END1) // label WHILE_END1

// (-170) push argument 0
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

// (-172) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-174) sub
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

// (-176) pop argument 0
@ARG // pop argument 0
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

// (-178) goto WHILE_EXP0
@sys.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-180) label WHILE_END0
(sys.WHILE_END0) // label WHILE_END0

// (-183) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-185) return

// (-187) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-189) function Sys.error 0
(Sys.error) // function Sys.error 0

// (-192) push constant 3
@3 // push constant 3 // function Sys.error 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-195) call String.new 1
(sys.String.new.12) // call String.new 1
@sys.String.new.12 // call String.new // push RIP
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
@String.new // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-197) push constant 69
@69 // push constant 69
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-200) call String.appendChar 2
(sys.String.appendChar.13) // call String.appendChar 2
@sys.String.appendChar.13 // call String.appendChar // push RIP
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@0 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@String.appendChar // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-202) push constant 82
@82 // push constant 82
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-205) call String.appendChar 2
(sys.String.appendChar.14) // call String.appendChar 2
@sys.String.appendChar.14 // call String.appendChar // push RIP
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@0 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@String.appendChar // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-207) push constant 82
@82 // push constant 82
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-210) call String.appendChar 2
(sys.String.appendChar.15) // call String.appendChar 2
@sys.String.appendChar.15 // call String.appendChar // push RIP
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@0 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@String.appendChar // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-213) call Output.printString 1
(sys.Output.printString.16) // call Output.printString 1
@sys.Output.printString.16 // call Output.printString // push RIP
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

// (-215) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-217) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@7 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@78 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@7 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@7 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@1 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@2 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.printString // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-219) pop temp 0
@5 // pop temp 0
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

// (-221) push argument 0
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

// (-224) call Output.printInt 1
(sys.Output.printInt.17) // call Output.printInt 1
@sys.Output.printInt.17 // call Output.printInt // push RIP
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
@Output.printInt // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-226) pop temp 0
@5 // pop temp 0
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

// (-229) call Sys.halt 0
(sys.Sys.halt.18) // call Sys.halt 0

// (-231) push constant 9999 // call Sys.halt // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Sys.halt // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@sys.Sys.halt.18 // push RIP
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
@71 // prologue_size
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
@Sys.halt // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-233) pop temp 0
@5 // pop temp 0
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

// (-235) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-237) return

// (-239) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-241) function Main.main 1
(Main.main) // function Main.main 1

// (-244) push constant 5
@5 // push constant 5 // function Main.main 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-246) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-249) call List.new 2
(main.List.new.19) // call List.new 2
@main.List.new.19 // call List.new // push RIP
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@0 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@List.new // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-251) pop local 0
@LCL // pop local 0
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

// (-253) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-255) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-257) push local 0
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

// (-260) call List.new 2
(main.List.new.20) // call List.new 2
@main.List.new.20 // call List.new // push RIP
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@0 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@List.new // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-263) call List.new 2
(main.List.new.21) // call List.new 2
@main.List.new.21 // call List.new // push RIP
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@0 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@List.new // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-265) pop local 0
@LCL // pop local 0
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

// (-267) push local 0
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

// (-270) call List.print 1
(main.List.print.22) // call List.print 1
@main.List.print.22 // call List.print // push RIP
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

// (-272) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@1 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@List.print // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-274) pop temp 0
@5 // pop temp 0
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

// (-276) push local 0
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

// (-279) call List.dispose 1
(main.List.dispose.23) // call List.dispose 1
@main.List.dispose.23 // call List.dispose // push RIP
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
@List.dispose // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-281) pop temp 0
@5 // pop temp 0
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

// (-283) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-285) return

// (-287) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-289) function List.new 0
(List.new) // function List.new 0

// (-292) push constant 2
@2 // push constant 2 // function List.new 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-295) call Memory.alloc 1
(List.Memory.alloc.24) // call Memory.alloc 1
@List.Memory.alloc.24 // call Memory.alloc // push RIP
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

// (-297) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@1 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Memory.alloc // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-299) pop pointer 0
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

// (-301) push argument 0
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

// (-303) pop this 0
@THIS // pop this 0
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

// (-305) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-307) pop this 1
@THIS // pop this 1
D=M
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

// (-309) push pointer 0
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

// (-311) return

// (-313) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-315) function List.getData 0
(List.getData) // function List.getData 0

// (-318) push argument 0
@ARG // push argument 0 // function List.getData 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-320) pop pointer 0
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

// (-322) push this 0
@THIS // push this 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-324) return

// (-326) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-328) function List.getNext 0
(List.getNext) // function List.getNext 0

// (-331) push argument 0
@ARG // push argument 0 // function List.getNext 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-333) pop pointer 0
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

// (-335) push this 1
@THIS // push this 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-337) return

// (-339) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-341) function List.print 1
(List.print) // function List.print 1

// (-344) push argument 0
@ARG // push argument 0 // function List.print 1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-346) pop pointer 0
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

// (-348) push pointer 0
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

// (-350) pop local 0
@LCL // pop local 0
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

// (-352) label WHILE_EXP0
(List.WHILE_EXP0) // label WHILE_EXP0

// (-355) push local 0
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

// (-357) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-359) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_25
D;JEQ
(EQ_FALSE_25)
@0
D=A // d = false
@EQ_END_25
0;JMP
(EQ_TRUE_25)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_25)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-364) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-366) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-368) if-goto WHILE_END0
@0 // if-goto WHILE_END0
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
@List.WHILE_END0
D;JNE // jump if not zero

// (-370) push local 0
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

// (-373) call List.getData 1
(List.List.getData.26) // call List.getData 1
@List.List.getData.26 // call List.getData // push RIP
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
@List.getData // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-376) call Output.printInt 1
(List.Output.printInt.27) // call Output.printInt 1
@List.Output.printInt.27 // call Output.printInt // push RIP
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
@Output.printInt // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-378) pop temp 0
@5 // pop temp 0
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

// (-380) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-383) call Output.printChar 1
(List.Output.printChar.28) // call Output.printChar 1
@List.Output.printChar.28 // call Output.printChar // push RIP
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
@Output.printChar // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-385) pop temp 0
@5 // pop temp 0
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

// (-387) push local 0
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

// (-390) call List.getNext 1
(List.List.getNext.29) // call List.getNext 1
@List.List.getNext.29 // call List.getNext // push RIP
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
@List.getNext // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-392) pop local 0
@LCL // pop local 0
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

// (-394) goto WHILE_EXP0
@List.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-396) label WHILE_END0
(List.WHILE_END0) // label WHILE_END0

// (-399) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-401) return

// (-403) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-405) function List.dispose 0
(List.dispose) // function List.dispose 0

// (-408) push argument 0
@ARG // push argument 0 // function List.dispose 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-410) pop pointer 0
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

// (-412) push this 1
@THIS // push this 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-414) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-416) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_30
D;JEQ
(EQ_FALSE_30)
@0
D=A // d = false
@EQ_END_30
0;JMP
(EQ_TRUE_30)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_30)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-421) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-423) if-goto IF_TRUE0
@0 // if-goto IF_TRUE0
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
@List.IF_TRUE0
D;JNE // jump if not zero

// (-425) goto IF_FALSE0
@List.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-427) label IF_TRUE0
(List.IF_TRUE0) // label IF_TRUE0

// (-430) push this 1
@THIS // push this 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-433) call List.dispose 1
(List.List.dispose.31) // call List.dispose 1
@List.List.dispose.31 // call List.dispose // push RIP
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
@List.dispose // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-435) pop temp 0
@5 // pop temp 0
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

// (-437) label IF_FALSE0
(List.IF_FALSE0) // label IF_FALSE0

// (-440) push pointer 0
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

// (-443) call Memory.deAlloc 1
(List.Memory.deAlloc.32) // call Memory.deAlloc 1
@List.Memory.deAlloc.32 // call Memory.deAlloc // push RIP
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

// (-445) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-447) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@7 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@78 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@7 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@7 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@1 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@2 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Memory.deAlloc // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-449) pop temp 0
@5 // pop temp 0
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

// (-451) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-453) return

// (-455) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-457) function Array.new 0
(Array.new) // function Array.new 0

// (-460) push argument 0
@ARG // push argument 0 // function Array.new 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-462) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-464) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_33
D;JGT
(JGT_FALSE_33)
@0
D=A // d = false
@JGT_END_33
0;JMP
(JGT_TRUE_33)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_33)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-469) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-471) if-goto IF_TRUE0
@0 // if-goto IF_TRUE0
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
@Array.IF_TRUE0
D;JNE // jump if not zero

// (-473) goto IF_FALSE0
@Array.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-475) label IF_TRUE0
(Array.IF_TRUE0) // label IF_TRUE0

// (-478) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-481) call Sys.error 1
(Array.Sys.error.34) // call Sys.error 1
@Array.Sys.error.34 // call Sys.error // push RIP
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
@Sys.error // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-483) pop temp 0
@5 // pop temp 0
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

// (-485) label IF_FALSE0
(Array.IF_FALSE0) // label IF_FALSE0

// (-488) push argument 0
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

// (-491) call Memory.alloc 1
(Array.Memory.alloc.35) // call Memory.alloc 1
@Array.Memory.alloc.35 // call Memory.alloc // push RIP
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

// (-493) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@1 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Memory.alloc // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-495) return

// (-497) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-499) function Array.dispose 0
(Array.dispose) // function Array.dispose 0

// (-502) push argument 0
@ARG // push argument 0 // function Array.dispose 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-504) pop pointer 0
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

// (-506) push pointer 0
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

// (-509) call Memory.deAlloc 1
(Array.Memory.deAlloc.36) // call Memory.deAlloc 1
@Array.Memory.deAlloc.36 // call Memory.deAlloc // push RIP
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

// (-511) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-513) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@7 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@78 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@7 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@7 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@1 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@2 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Memory.deAlloc // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-515) pop temp 0
@5 // pop temp 0
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

// (-517) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-519) return

// (-521) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-523) function Keyboard.init 0
(Keyboard.init) // function Keyboard.init 0

// (-526) push constant 0
@0 // push constant 0 // function Keyboard.init 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-528) return

// (-530) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-532) function Keyboard.keyPressed 0
(Keyboard.keyPressed) // function Keyboard.keyPressed 0

// (-535) push constant 24576
@24576 // push constant 24576 // function Keyboard.keyPressed 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-538) call Memory.peek 1
(Keyboard.Memory.peek.37) // call Memory.peek 1
@Keyboard.Memory.peek.37 // call Memory.peek // push RIP
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
@Memory.peek // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-540) return

// (-542) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-544) function Keyboard.readChar 2
(Keyboard.readChar) // function Keyboard.readChar 2

// (-547) push constant 0
@0 // push constant 0 // function Keyboard.readChar 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-550) call Output.printChar 1
(Keyboard.Output.printChar.38) // call Output.printChar 1
@Keyboard.Output.printChar.38 // call Output.printChar // push RIP
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
@Output.printChar // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-552) pop temp 0
@5 // pop temp 0
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

// (-554) label WHILE_EXP0
(Keyboard.WHILE_EXP0) // label WHILE_EXP0

// (-557) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-559) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-561) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_39
D;JEQ
(EQ_FALSE_39)
@0
D=A // d = false
@EQ_END_39
0;JMP
(EQ_TRUE_39)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_39)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-566) push local 0
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

// (-568) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-570) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_40
D;JGT
(JGT_FALSE_40)
@0
D=A // d = false
@JGT_END_40
0;JMP
(JGT_TRUE_40)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_40)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-575) or
@SP // or
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M|D
@SP
M=M+1

// (-577) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-579) if-goto WHILE_END0
@0 // if-goto WHILE_END0
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
@Keyboard.WHILE_END0
D;JNE // jump if not zero

// (-582) call Keyboard.keyPressed 0
(Keyboard.Keyboard.keyPressed.41) // call Keyboard.keyPressed 0

// (-584) push constant 9999 // call Keyboard.keyPressed // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Keyboard.keyPressed // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Keyboard.Keyboard.keyPressed.41 // push RIP
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
@71 // prologue_size
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
@Keyboard.keyPressed // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-586) pop local 0
@LCL // pop local 0
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

// (-588) push local 0
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

// (-590) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-592) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_42
D;JGT
(JGT_FALSE_42)
@0
D=A // d = false
@JGT_END_42
0;JMP
(JGT_TRUE_42)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_42)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-597) if-goto IF_TRUE0
@0 // if-goto IF_TRUE0
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
@Keyboard.IF_TRUE0
D;JNE // jump if not zero

// (-599) goto IF_FALSE0
@Keyboard.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-601) label IF_TRUE0
(Keyboard.IF_TRUE0) // label IF_TRUE0

// (-604) push local 0
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

// (-606) pop local 1
@LCL // pop local 1
D=M
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

// (-608) label IF_FALSE0
(Keyboard.IF_FALSE0) // label IF_FALSE0

// (-611) goto WHILE_EXP0
@Keyboard.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-613) label WHILE_END0
(Keyboard.WHILE_END0) // label WHILE_END0

// (-617) call String.backSpace 0
(Keyboard.String.backSpace.43) // call String.backSpace 0

// (-619) push constant 9999 // call String.backSpace // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call String.backSpace // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Keyboard.String.backSpace.43 // push RIP
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
@71 // prologue_size
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
@String.backSpace // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-622) call Output.printChar 1
(Keyboard.Output.printChar.44) // call Output.printChar 1
@Keyboard.Output.printChar.44 // call Output.printChar // push RIP
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
@Output.printChar // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-624) pop temp 0
@5 // pop temp 0
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

// (-626) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-629) call Output.printChar 1
(Keyboard.Output.printChar.45) // call Output.printChar 1
@Keyboard.Output.printChar.45 // call Output.printChar // push RIP
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
@Output.printChar // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-631) pop temp 0
@5 // pop temp 0
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

// (-633) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-635) return

// (-637) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-639) function Keyboard.readLine 5
(Keyboard.readLine) // function Keyboard.readLine 5

// (-642) push constant 80
@80 // push constant 80 // function Keyboard.readLine 5
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-645) call String.new 1
(Keyboard.String.new.46) // call String.new 1
@Keyboard.String.new.46 // call String.new // push RIP
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
@String.new // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-647) pop local 3
@LCL // pop local 3
D=M
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

// (-649) push argument 0
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

// (-652) call Output.printString 1
(Keyboard.Output.printString.47) // call Output.printString 1
@Keyboard.Output.printString.47 // call Output.printString // push RIP
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

// (-654) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-656) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@7 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@78 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@7 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@7 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@1 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@2 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.printString // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-658) pop temp 0
@5 // pop temp 0
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

// (-661) call String.newLine 0
(Keyboard.String.newLine.48) // call String.newLine 0

// (-663) push constant 9999 // call String.newLine // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call String.newLine // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Keyboard.String.newLine.48 // push RIP
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
@71 // prologue_size
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
@String.newLine // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-665) pop local 1
@LCL // pop local 1
D=M
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

// (-668) call String.backSpace 0
(Keyboard.String.backSpace.49) // call String.backSpace 0

// (-670) push constant 9999 // call String.backSpace // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call String.backSpace // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Keyboard.String.backSpace.49 // push RIP
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
@71 // prologue_size
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
@String.backSpace // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-672) pop local 2
@LCL // pop local 2
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

// (-674) label WHILE_EXP0
(Keyboard.WHILE_EXP0) // label WHILE_EXP0

// (-677) push local 4
@LCL // push local 4
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-679) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-681) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-683) if-goto WHILE_END0
@0 // if-goto WHILE_END0
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
@Keyboard.WHILE_END0
D;JNE // jump if not zero

// (-686) call Keyboard.readChar 0
(Keyboard.Keyboard.readChar.50) // call Keyboard.readChar 0

// (-688) push constant 9999 // call Keyboard.readChar // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Keyboard.readChar // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Keyboard.Keyboard.readChar.50 // push RIP
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

// (-690) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-692) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@7 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@85 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@7 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@7 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@1 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@2 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Keyboard.readChar // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-694) pop local 0
@LCL // pop local 0
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

// (-696) push local 0
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

// (-698) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-700) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_51
D;JEQ
(EQ_FALSE_51)
@0
D=A // d = false
@EQ_END_51
0;JMP
(EQ_TRUE_51)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_51)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-705) pop local 4
@LCL // pop local 4
D=M
@4 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
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

// (-707) push local 4
@LCL // push local 4
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-709) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-711) if-goto IF_TRUE0
@0 // if-goto IF_TRUE0
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
@Keyboard.IF_TRUE0
D;JNE // jump if not zero

// (-713) goto IF_FALSE0
@Keyboard.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-715) label IF_TRUE0
(Keyboard.IF_TRUE0) // label IF_TRUE0

// (-718) push local 0
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

// (-720) push local 2
@LCL // push local 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-722) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_52
D;JEQ
(EQ_FALSE_52)
@0
D=A // d = false
@EQ_END_52
0;JMP
(EQ_TRUE_52)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_52)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-727) if-goto IF_TRUE1
@0 // if-goto IF_TRUE1
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
@Keyboard.IF_TRUE1
D;JNE // jump if not zero

// (-729) goto IF_FALSE1
@Keyboard.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-731) label IF_TRUE1
(Keyboard.IF_TRUE1) // label IF_TRUE1

// (-734) push local 3
@LCL // push local 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-737) call String.eraseLastChar 1
(Keyboard.String.eraseLastChar.53) // call String.eraseLastChar 1
@Keyboard.String.eraseLastChar.53 // call String.eraseLastChar // push RIP
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
@String.eraseLastChar // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-739) pop temp 0
@5 // pop temp 0
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

// (-741) goto IF_END1
@Keyboard.IF_END1 // goto IF_END1
0;JMP // unconditional jump

// (-743) label IF_FALSE1
(Keyboard.IF_FALSE1) // label IF_FALSE1

// (-746) push local 3
@LCL // push local 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-748) push local 0
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

// (-751) call String.appendChar 2
(Keyboard.String.appendChar.54) // call String.appendChar 2
@Keyboard.String.appendChar.54 // call String.appendChar // push RIP
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@0 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@String.appendChar // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-753) pop local 3
@LCL // pop local 3
D=M
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

// (-755) label IF_END1
(Keyboard.IF_END1) // label IF_END1

// (-758) label IF_FALSE0
(Keyboard.IF_FALSE0) // label IF_FALSE0

// (-761) goto WHILE_EXP0
@Keyboard.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-763) label WHILE_END0
(Keyboard.WHILE_END0) // label WHILE_END0

// (-766) push local 3
@LCL // push local 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-768) return

// (-770) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-772) function Keyboard.readInt 2
(Keyboard.readInt) // function Keyboard.readInt 2

// (-775) push argument 0
@ARG // push argument 0 // function Keyboard.readInt 2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-778) call Keyboard.readLine 1
(Keyboard.Keyboard.readLine.55) // call Keyboard.readLine 1
@Keyboard.Keyboard.readLine.55 // call Keyboard.readLine // push RIP
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

// (-780) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-782) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-784) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-786) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-788) push constant 0 // local(4) init
@0 // push constant 0 // local(4) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@10 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@99 // prologue_size
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
@Keyboard.readLine // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-790) pop local 0
@LCL // pop local 0
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

// (-792) push local 0
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

// (-795) call String.intValue 1
(Keyboard.String.intValue.56) // call String.intValue 1
@Keyboard.String.intValue.56 // call String.intValue // push RIP
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

// (-797) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-799) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-801) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-803) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-805) push constant 0 // local(4) init
@0 // push constant 0 // local(4) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@10 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@99 // prologue_size
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
@String.intValue // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-807) pop local 1
@LCL // pop local 1
D=M
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

// (-809) push local 0
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

// (-812) call String.dispose 1
(Keyboard.String.dispose.57) // call String.dispose 1
@Keyboard.String.dispose.57 // call String.dispose // push RIP
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
@String.dispose // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-814) pop temp 0
@5 // pop temp 0
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

// (-816) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-818) return

// (-820) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-822) function Math.init 1
(Math.init) // function Math.init 1

// (-825) push constant 16
@16 // push constant 16 // function Math.init 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-828) call Array.new 1
(Math.Array.new.58) // call Array.new 1
@Math.Array.new.58 // call Array.new // push RIP
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
@Array.new // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-830) pop static 1
@16 // pop static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Math.vm)
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

// (-832) push constant 16
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-835) call Array.new 1
(Math.Array.new.59) // call Array.new 1
@Math.Array.new.59 // call Array.new // push RIP
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
@Array.new // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-837) pop static 0
@16 // pop static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Math.vm)
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

// (-839) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-841) push static 0
@16 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Math.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-843) add
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

// (-845) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-847) pop temp 0
@5 // pop temp 0
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

// (-849) pop pointer 1
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

// (-851) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-853) pop that 0
@THAT // pop that 0
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

// (-855) label WHILE_EXP0
(Math.WHILE_EXP0) // label WHILE_EXP0

// (-858) push local 0
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

// (-860) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-862) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_60
D;JLT
(JLT_FALSE_60)
@0
D=A // d = false
@JLT_END_60
0;JMP
(JLT_TRUE_60)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_60)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-867) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-869) if-goto WHILE_END0
@0 // if-goto WHILE_END0
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
@Math.WHILE_END0
D;JNE // jump if not zero

// (-871) push local 0
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

// (-873) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-875) add
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

// (-877) pop local 0
@LCL // pop local 0
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

// (-879) push local 0
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

// (-881) push static 0
@16 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Math.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-883) add
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

// (-885) push local 0
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

// (-887) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-889) sub
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

// (-891) push static 0
@16 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Math.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-893) add
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

// (-895) pop pointer 1
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

// (-897) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-899) push local 0
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

// (-901) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-903) sub
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

// (-905) push static 0
@16 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Math.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-907) add
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

// (-909) pop pointer 1
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

// (-911) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-913) add
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

// (-915) pop temp 0
@5 // pop temp 0
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

// (-917) pop pointer 1
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

// (-919) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-921) pop that 0
@THAT // pop that 0
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

// (-923) goto WHILE_EXP0
@Math.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-925) label WHILE_END0
(Math.WHILE_END0) // label WHILE_END0

// (-928) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-930) return

// (-932) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-934) function Math.abs 0
(Math.abs) // function Math.abs 0

// (-937) push argument 0
@ARG // push argument 0 // function Math.abs 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-939) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-941) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_61
D;JLT
(JLT_FALSE_61)
@0
D=A // d = false
@JLT_END_61
0;JMP
(JLT_TRUE_61)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_61)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-946) if-goto IF_TRUE0
@0 // if-goto IF_TRUE0
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
@Math.IF_TRUE0
D;JNE // jump if not zero

// (-948) goto IF_FALSE0
@Math.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-950) label IF_TRUE0
(Math.IF_TRUE0) // label IF_TRUE0

// (-953) push argument 0
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

// (-955) neg
@SP // neg
M=M-1
A=M
M=-M
@SP
M=M+1

// (-957) pop argument 0
@ARG // pop argument 0
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

// (-959) label IF_FALSE0
(Math.IF_FALSE0) // label IF_FALSE0

// (-962) push argument 0
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

// (-964) return

// (-966) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-968) function Math.multiply 5
(Math.multiply) // function Math.multiply 5

// (-971) push argument 0
@ARG // push argument 0 // function Math.multiply 5
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-973) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-975) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_62
D;JLT
(JLT_FALSE_62)
@0
D=A // d = false
@JLT_END_62
0;JMP
(JLT_TRUE_62)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_62)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-980) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-982) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-984) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_63
D;JGT
(JGT_FALSE_63)
@0
D=A // d = false
@JGT_END_63
0;JMP
(JGT_TRUE_63)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_63)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-989) and
@SP // and
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1

// (-991) push argument 0
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

// (-993) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-995) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_64
D;JGT
(JGT_FALSE_64)
@0
D=A // d = false
@JGT_END_64
0;JMP
(JGT_TRUE_64)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_64)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1000) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1002) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1004) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_65
D;JLT
(JLT_FALSE_65)
@0
D=A // d = false
@JLT_END_65
0;JMP
(JLT_TRUE_65)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_65)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1009) and
@SP // and
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1

// (-1011) or
@SP // or
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M|D
@SP
M=M+1

// (-1013) pop local 4
@LCL // pop local 4
D=M
@4 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
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

// (-1015) push argument 0
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

// (-1018) call Math.abs 1
(Math.Math.abs.66) // call Math.abs 1
@Math.Math.abs.66 // call Math.abs // push RIP
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
@Math.abs // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-1020) pop argument 0
@ARG // pop argument 0
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

// (-1022) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1025) call Math.abs 1
(Math.Math.abs.67) // call Math.abs 1
@Math.Math.abs.67 // call Math.abs // push RIP
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
@Math.abs // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-1027) pop argument 1
@ARG // pop argument 1
D=M
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

// (-1029) push argument 0
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

// (-1031) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1033) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_68
D;JLT
(JLT_FALSE_68)
@0
D=A // d = false
@JLT_END_68
0;JMP
(JLT_TRUE_68)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_68)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1038) if-goto IF_TRUE0
@0 // if-goto IF_TRUE0
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
@Math.IF_TRUE0
D;JNE // jump if not zero

// (-1040) goto IF_FALSE0
@Math.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-1042) label IF_TRUE0
(Math.IF_TRUE0) // label IF_TRUE0

// (-1045) push argument 0
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

// (-1047) pop local 1
@LCL // pop local 1
D=M
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

// (-1049) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1051) pop argument 0
@ARG // pop argument 0
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

// (-1053) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1055) pop argument 1
@ARG // pop argument 1
D=M
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

// (-1057) label IF_FALSE0
(Math.IF_FALSE0) // label IF_FALSE0

// (-1060) label WHILE_EXP0
(Math.WHILE_EXP0) // label WHILE_EXP0

// (-1063) push local 2
@LCL // push local 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1065) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1067) sub
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

// (-1069) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1071) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1073) sub
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

// (-1075) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_69
D;JLT
(JLT_FALSE_69)
@0
D=A // d = false
@JLT_END_69
0;JMP
(JLT_TRUE_69)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_69)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1080) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1082) if-goto WHILE_END0
@0 // if-goto WHILE_END0
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
@Math.WHILE_END0
D;JNE // jump if not zero

// (-1084) push local 3
@LCL // push local 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1086) push static 0
@16 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Math.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1088) add
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

// (-1090) pop pointer 1
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

// (-1092) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1094) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1096) and
@SP // and
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1

// (-1098) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1100) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_70
D;JEQ
(EQ_FALSE_70)
@0
D=A // d = false
@EQ_END_70
0;JMP
(EQ_TRUE_70)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_70)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1105) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1107) if-goto IF_TRUE1
@0 // if-goto IF_TRUE1
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
@Math.IF_TRUE1
D;JNE // jump if not zero

// (-1109) goto IF_FALSE1
@Math.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-1111) label IF_TRUE1
(Math.IF_TRUE1) // label IF_TRUE1

// (-1114) push local 0
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

// (-1116) push argument 0
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

// (-1118) add
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

// (-1120) pop local 0
@LCL // pop local 0
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

// (-1122) push local 2
@LCL // push local 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1124) push local 3
@LCL // push local 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1126) push static 0
@16 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Math.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1128) add
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

// (-1130) pop pointer 1
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

// (-1132) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1134) add
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

// (-1136) pop local 2
@LCL // pop local 2
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

// (-1138) label IF_FALSE1
(Math.IF_FALSE1) // label IF_FALSE1

// (-1141) push argument 0
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

// (-1143) push argument 0
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

// (-1145) add
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

// (-1147) pop argument 0
@ARG // pop argument 0
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

// (-1149) push local 3
@LCL // push local 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1151) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1153) add
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

// (-1155) pop local 3
@LCL // pop local 3
D=M
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

// (-1157) goto WHILE_EXP0
@Math.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-1159) label WHILE_END0
(Math.WHILE_END0) // label WHILE_END0

// (-1162) push local 4
@LCL // push local 4
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1164) if-goto IF_TRUE2
@0 // if-goto IF_TRUE2
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
@Math.IF_TRUE2
D;JNE // jump if not zero

// (-1166) goto IF_FALSE2
@Math.IF_FALSE2 // goto IF_FALSE2
0;JMP // unconditional jump

// (-1168) label IF_TRUE2
(Math.IF_TRUE2) // label IF_TRUE2

// (-1171) push local 0
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

// (-1173) neg
@SP // neg
M=M-1
A=M
M=-M
@SP
M=M+1

// (-1175) pop local 0
@LCL // pop local 0
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

// (-1177) label IF_FALSE2
(Math.IF_FALSE2) // label IF_FALSE2

// (-1180) push local 0
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

// (-1182) return

// (-1184) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-1186) function Math.divide 4
(Math.divide) // function Math.divide 4

// (-1189) push argument 1
@ARG // push argument 1 // function Math.divide 4
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-1191) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1193) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_71
D;JEQ
(EQ_FALSE_71)
@0
D=A // d = false
@EQ_END_71
0;JMP
(EQ_TRUE_71)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_71)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1198) if-goto IF_TRUE0
@0 // if-goto IF_TRUE0
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
@Math.IF_TRUE0
D;JNE // jump if not zero

// (-1200) goto IF_FALSE0
@Math.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-1202) label IF_TRUE0
(Math.IF_TRUE0) // label IF_TRUE0

// (-1205) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1208) call Sys.error 1
(Math.Sys.error.72) // call Sys.error 1
@Math.Sys.error.72 // call Sys.error // push RIP
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
@Sys.error // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-1210) pop temp 0
@5 // pop temp 0
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

// (-1212) label IF_FALSE0
(Math.IF_FALSE0) // label IF_FALSE0

// (-1215) push argument 0
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

// (-1217) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1219) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_73
D;JLT
(JLT_FALSE_73)
@0
D=A // d = false
@JLT_END_73
0;JMP
(JLT_TRUE_73)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_73)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1224) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1226) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1228) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_74
D;JGT
(JGT_FALSE_74)
@0
D=A // d = false
@JGT_END_74
0;JMP
(JGT_TRUE_74)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_74)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1233) and
@SP // and
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1

// (-1235) push argument 0
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

// (-1237) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1239) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_75
D;JGT
(JGT_FALSE_75)
@0
D=A // d = false
@JGT_END_75
0;JMP
(JGT_TRUE_75)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_75)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1244) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1246) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1248) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_76
D;JLT
(JLT_FALSE_76)
@0
D=A // d = false
@JLT_END_76
0;JMP
(JLT_TRUE_76)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_76)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1253) and
@SP // and
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1

// (-1255) or
@SP // or
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M|D
@SP
M=M+1

// (-1257) pop local 2
@LCL // pop local 2
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

// (-1259) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1261) push static 1
@16 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1263) add
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

// (-1265) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1268) call Math.abs 1
(Math.Math.abs.77) // call Math.abs 1
@Math.Math.abs.77 // call Math.abs // push RIP
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
@Math.abs // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-1270) pop temp 0
@5 // pop temp 0
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

// (-1272) pop pointer 1
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

// (-1274) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1276) pop that 0
@THAT // pop that 0
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

// (-1278) push argument 0
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

// (-1281) call Math.abs 1
(Math.Math.abs.78) // call Math.abs 1
@Math.Math.abs.78 // call Math.abs // push RIP
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
@Math.abs // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-1283) pop argument 0
@ARG // pop argument 0
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

// (-1285) label WHILE_EXP0
(Math.WHILE_EXP0) // label WHILE_EXP0

// (-1288) push local 0
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

// (-1290) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1292) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_79
D;JLT
(JLT_FALSE_79)
@0
D=A // d = false
@JLT_END_79
0;JMP
(JLT_TRUE_79)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_79)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1297) push local 3
@LCL // push local 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1299) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1301) and
@SP // and
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1

// (-1303) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1305) if-goto WHILE_END0
@0 // if-goto WHILE_END0
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
@Math.WHILE_END0
D;JNE // jump if not zero

// (-1307) push constant 32767
@32767 // push constant 32767
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1309) push local 0
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

// (-1311) push static 1
@16 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1313) add
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

// (-1315) pop pointer 1
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

// (-1317) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1319) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1321) sub
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

// (-1323) sub
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

// (-1325) push local 0
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

// (-1327) push static 1
@16 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1329) add
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

// (-1331) pop pointer 1
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

// (-1333) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1335) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1337) sub
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

// (-1339) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_80
D;JLT
(JLT_FALSE_80)
@0
D=A // d = false
@JLT_END_80
0;JMP
(JLT_TRUE_80)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_80)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1344) pop local 3
@LCL // pop local 3
D=M
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

// (-1346) push local 3
@LCL // push local 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1348) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1350) if-goto IF_TRUE1
@0 // if-goto IF_TRUE1
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
@Math.IF_TRUE1
D;JNE // jump if not zero

// (-1352) goto IF_FALSE1
@Math.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-1354) label IF_TRUE1
(Math.IF_TRUE1) // label IF_TRUE1

// (-1357) push local 0
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

// (-1359) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1361) add
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

// (-1363) push static 1
@16 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1365) add
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

// (-1367) push local 0
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

// (-1369) push static 1
@16 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1371) add
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

// (-1373) pop pointer 1
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

// (-1375) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1377) push local 0
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

// (-1379) push static 1
@16 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1381) add
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

// (-1383) pop pointer 1
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

// (-1385) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1387) add
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

// (-1389) pop temp 0
@5 // pop temp 0
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

// (-1391) pop pointer 1
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

// (-1393) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1395) pop that 0
@THAT // pop that 0
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

// (-1397) push local 0
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

// (-1399) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1401) add
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

// (-1403) push static 1
@16 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1405) add
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

// (-1407) pop pointer 1
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

// (-1409) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1411) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1413) sub
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

// (-1415) push argument 0
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

// (-1417) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1419) sub
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

// (-1421) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_81
D;JGT
(JGT_FALSE_81)
@0
D=A // d = false
@JGT_END_81
0;JMP
(JGT_TRUE_81)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_81)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1426) pop local 3
@LCL // pop local 3
D=M
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

// (-1428) push local 3
@LCL // push local 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1430) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1432) if-goto IF_TRUE2
@0 // if-goto IF_TRUE2
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
@Math.IF_TRUE2
D;JNE // jump if not zero

// (-1434) goto IF_FALSE2
@Math.IF_FALSE2 // goto IF_FALSE2
0;JMP // unconditional jump

// (-1436) label IF_TRUE2
(Math.IF_TRUE2) // label IF_TRUE2

// (-1439) push local 0
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

// (-1441) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1443) add
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

// (-1445) pop local 0
@LCL // pop local 0
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

// (-1447) label IF_FALSE2
(Math.IF_FALSE2) // label IF_FALSE2

// (-1450) label IF_FALSE1
(Math.IF_FALSE1) // label IF_FALSE1

// (-1453) goto WHILE_EXP0
@Math.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-1455) label WHILE_END0
(Math.WHILE_END0) // label WHILE_END0

// (-1458) label WHILE_EXP1
(Math.WHILE_EXP1) // label WHILE_EXP1

// (-1461) push local 0
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

// (-1463) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1465) neg
@SP // neg
M=M-1
A=M
M=-M
@SP
M=M+1

// (-1467) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_82
D;JGT
(JGT_FALSE_82)
@0
D=A // d = false
@JGT_END_82
0;JMP
(JGT_TRUE_82)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_82)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1472) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1474) if-goto WHILE_END1
@0 // if-goto WHILE_END1
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
@Math.WHILE_END1
D;JNE // jump if not zero

// (-1476) push local 0
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

// (-1478) push static 1
@16 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1480) add
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

// (-1482) pop pointer 1
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

// (-1484) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1486) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1488) sub
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

// (-1490) push argument 0
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

// (-1492) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1494) sub
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

// (-1496) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_83
D;JGT
(JGT_FALSE_83)
@0
D=A // d = false
@JGT_END_83
0;JMP
(JGT_TRUE_83)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_83)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1501) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1503) if-goto IF_TRUE3
@0 // if-goto IF_TRUE3
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
@Math.IF_TRUE3
D;JNE // jump if not zero

// (-1505) goto IF_FALSE3
@Math.IF_FALSE3 // goto IF_FALSE3
0;JMP // unconditional jump

// (-1507) label IF_TRUE3
(Math.IF_TRUE3) // label IF_TRUE3

// (-1510) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1512) push local 0
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

// (-1514) push static 0
@16 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Math.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1516) add
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

// (-1518) pop pointer 1
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

// (-1520) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1522) add
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

// (-1524) pop local 1
@LCL // pop local 1
D=M
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

// (-1526) push argument 0
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

// (-1528) push local 0
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

// (-1530) push static 1
@16 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1532) add
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

// (-1534) pop pointer 1
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

// (-1536) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1538) sub
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

// (-1540) pop argument 0
@ARG // pop argument 0
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

// (-1542) label IF_FALSE3
(Math.IF_FALSE3) // label IF_FALSE3

// (-1545) push local 0
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

// (-1547) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1549) sub
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

// (-1551) pop local 0
@LCL // pop local 0
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

// (-1553) goto WHILE_EXP1
@Math.WHILE_EXP1 // goto WHILE_EXP1
0;JMP // unconditional jump

// (-1555) label WHILE_END1
(Math.WHILE_END1) // label WHILE_END1

// (-1558) push local 2
@LCL // push local 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1560) if-goto IF_TRUE4
@0 // if-goto IF_TRUE4
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
@Math.IF_TRUE4
D;JNE // jump if not zero

// (-1562) goto IF_FALSE4
@Math.IF_FALSE4 // goto IF_FALSE4
0;JMP // unconditional jump

// (-1564) label IF_TRUE4
(Math.IF_TRUE4) // label IF_TRUE4

// (-1567) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1569) neg
@SP // neg
M=M-1
A=M
M=-M
@SP
M=M+1

// (-1571) pop local 1
@LCL // pop local 1
D=M
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

// (-1573) label IF_FALSE4
(Math.IF_FALSE4) // label IF_FALSE4

// (-1576) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1578) return

// (-1580) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-1582) function Math.sqrt 4
(Math.sqrt) // function Math.sqrt 4

// (-1585) push argument 0
@ARG // push argument 0 // function Math.sqrt 4
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-1587) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1589) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_84
D;JLT
(JLT_FALSE_84)
@0
D=A // d = false
@JLT_END_84
0;JMP
(JLT_TRUE_84)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_84)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1594) if-goto IF_TRUE0
@0 // if-goto IF_TRUE0
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
@Math.IF_TRUE0
D;JNE // jump if not zero

// (-1596) goto IF_FALSE0
@Math.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-1598) label IF_TRUE0
(Math.IF_TRUE0) // label IF_TRUE0

// (-1601) push constant 4
@4 // push constant 4
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1604) call Sys.error 1
(Math.Sys.error.85) // call Sys.error 1
@Math.Sys.error.85 // call Sys.error // push RIP
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
@Sys.error // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-1606) pop temp 0
@5 // pop temp 0
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

// (-1608) label IF_FALSE0
(Math.IF_FALSE0) // label IF_FALSE0

// (-1611) push constant 7
@7 // push constant 7
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1613) pop local 0
@LCL // pop local 0
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

// (-1615) label WHILE_EXP0
(Math.WHILE_EXP0) // label WHILE_EXP0

// (-1618) push local 0
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

// (-1620) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1622) neg
@SP // neg
M=M-1
A=M
M=-M
@SP
M=M+1

// (-1624) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_86
D;JGT
(JGT_FALSE_86)
@0
D=A // d = false
@JGT_END_86
0;JMP
(JGT_TRUE_86)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_86)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1629) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1631) if-goto WHILE_END0
@0 // if-goto WHILE_END0
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
@Math.WHILE_END0
D;JNE // jump if not zero

// (-1633) push local 3
@LCL // push local 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1635) push local 0
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

// (-1637) push static 0
@16 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Math.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1639) add
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

// (-1641) pop pointer 1
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

// (-1643) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1645) add
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

// (-1647) pop local 1
@LCL // pop local 1
D=M
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

// (-1649) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1651) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1654) call Math.multiply 2
(Math.Math.multiply.87) // call Math.multiply 2
@Math.Math.multiply.87 // call Math.multiply // push RIP
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

// (-1656) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1658) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1660) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1662) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1664) push constant 0 // local(4) init
@0 // push constant 0 // local(4) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@10 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@99 // prologue_size
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@5 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Math.multiply // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-1666) pop local 2
@LCL // pop local 2
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

// (-1668) push local 2
@LCL // push local 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1670) push argument 0
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

// (-1672) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_88
D;JGT
(JGT_FALSE_88)
@0
D=A // d = false
@JGT_END_88
0;JMP
(JGT_TRUE_88)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_88)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1677) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1679) push local 2
@LCL // push local 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1681) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1683) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_89
D;JLT
(JLT_FALSE_89)
@0
D=A // d = false
@JLT_END_89
0;JMP
(JLT_TRUE_89)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_89)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1688) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1690) and
@SP // and
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1

// (-1692) if-goto IF_TRUE1
@0 // if-goto IF_TRUE1
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
@Math.IF_TRUE1
D;JNE // jump if not zero

// (-1694) goto IF_FALSE1
@Math.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-1696) label IF_TRUE1
(Math.IF_TRUE1) // label IF_TRUE1

// (-1699) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1701) pop local 3
@LCL // pop local 3
D=M
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

// (-1703) label IF_FALSE1
(Math.IF_FALSE1) // label IF_FALSE1

// (-1706) push local 0
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

// (-1708) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1710) sub
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

// (-1712) pop local 0
@LCL // pop local 0
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

// (-1714) goto WHILE_EXP0
@Math.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-1716) label WHILE_END0
(Math.WHILE_END0) // label WHILE_END0

// (-1719) push local 3
@LCL // push local 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1721) return

// (-1723) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-1725) function Math.max 0
(Math.max) // function Math.max 0

// (-1728) push argument 0
@ARG // push argument 0 // function Math.max 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-1730) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1732) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_90
D;JGT
(JGT_FALSE_90)
@0
D=A // d = false
@JGT_END_90
0;JMP
(JGT_TRUE_90)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_90)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1737) if-goto IF_TRUE0
@0 // if-goto IF_TRUE0
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
@Math.IF_TRUE0
D;JNE // jump if not zero

// (-1739) goto IF_FALSE0
@Math.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-1741) label IF_TRUE0
(Math.IF_TRUE0) // label IF_TRUE0

// (-1744) push argument 0
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

// (-1746) pop argument 1
@ARG // pop argument 1
D=M
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

// (-1748) label IF_FALSE0
(Math.IF_FALSE0) // label IF_FALSE0

// (-1751) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1753) return

// (-1755) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-1757) function Math.min 0
(Math.min) // function Math.min 0

// (-1760) push argument 0
@ARG // push argument 0 // function Math.min 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-1762) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1764) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_91
D;JLT
(JLT_FALSE_91)
@0
D=A // d = false
@JLT_END_91
0;JMP
(JLT_TRUE_91)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_91)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1769) if-goto IF_TRUE0
@0 // if-goto IF_TRUE0
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
@Math.IF_TRUE0
D;JNE // jump if not zero

// (-1771) goto IF_FALSE0
@Math.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-1773) label IF_TRUE0
(Math.IF_TRUE0) // label IF_TRUE0

// (-1776) push argument 0
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

// (-1778) pop argument 1
@ARG // pop argument 1
D=M
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

// (-1780) label IF_FALSE0
(Math.IF_FALSE0) // label IF_FALSE0

// (-1783) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1785) return

// (-1787) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-1789) function Memory.init 0
(Memory.init) // function Memory.init 0

// (-1792) push constant 0
@0 // push constant 0 // function Memory.init 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-1794) pop static 0
@18 // pop static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Memory.vm)
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

// (-1796) push constant 2048
@2048 // push constant 2048
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1798) push static 0
@18 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Memory.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1800) add
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

// (-1802) push constant 14334
@14334 // push constant 14334
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1804) pop temp 0
@5 // pop temp 0
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

// (-1806) pop pointer 1
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

// (-1808) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1810) pop that 0
@THAT // pop that 0
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

// (-1812) push constant 2049
@2049 // push constant 2049
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1814) push static 0
@18 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Memory.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1816) add
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

// (-1818) push constant 2050
@2050 // push constant 2050
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1820) pop temp 0
@5 // pop temp 0
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

// (-1822) pop pointer 1
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

// (-1824) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1826) pop that 0
@THAT // pop that 0
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

// (-1828) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1830) return

// (-1832) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-1834) function Memory.peek 0
(Memory.peek) // function Memory.peek 0

// (-1837) push argument 0
@ARG // push argument 0 // function Memory.peek 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-1839) push static 0
@18 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Memory.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1841) add
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

// (-1843) pop pointer 1
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

// (-1845) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1847) return

// (-1849) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-1851) function Memory.poke 0
(Memory.poke) // function Memory.poke 0

// (-1854) push argument 0
@ARG // push argument 0 // function Memory.poke 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-1856) push static 0
@18 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Memory.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1858) add
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

// (-1860) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1862) pop temp 0
@5 // pop temp 0
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

// (-1864) pop pointer 1
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

// (-1866) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1868) pop that 0
@THAT // pop that 0
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

// (-1870) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1872) return

// (-1874) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-1876) function Memory.alloc 1
(Memory.alloc) // function Memory.alloc 1

// (-1879) push argument 0
@ARG // push argument 0 // function Memory.alloc 1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-1881) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1883) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_92
D;JLT
(JLT_FALSE_92)
@0
D=A // d = false
@JLT_END_92
0;JMP
(JLT_TRUE_92)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_92)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1888) if-goto IF_TRUE0
@0 // if-goto IF_TRUE0
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
@Memory.IF_TRUE0
D;JNE // jump if not zero

// (-1890) goto IF_FALSE0
@Memory.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-1892) label IF_TRUE0
(Memory.IF_TRUE0) // label IF_TRUE0

// (-1895) push constant 5
@5 // push constant 5
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1898) call Sys.error 1
(Memory.Sys.error.93) // call Sys.error 1
@Memory.Sys.error.93 // call Sys.error // push RIP
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
@Sys.error // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-1900) pop temp 0
@5 // pop temp 0
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

// (-1902) label IF_FALSE0
(Memory.IF_FALSE0) // label IF_FALSE0

// (-1905) push constant 2048
@2048 // push constant 2048
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1907) pop local 0
@LCL // pop local 0
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

// (-1909) label WHILE_EXP0
(Memory.WHILE_EXP0) // label WHILE_EXP0

// (-1912) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1914) push local 0
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

// (-1916) add
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

// (-1918) pop pointer 1
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

// (-1920) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1922) push argument 0
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

// (-1924) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_94
D;JLT
(JLT_FALSE_94)
@0
D=A // d = false
@JLT_END_94
0;JMP
(JLT_TRUE_94)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_94)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1929) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1931) if-goto WHILE_END0
@0 // if-goto WHILE_END0
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
@Memory.WHILE_END0
D;JNE // jump if not zero

// (-1933) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1935) push local 0
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

// (-1937) add
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

// (-1939) pop pointer 1
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

// (-1941) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1943) pop local 0
@LCL // pop local 0
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

// (-1945) goto WHILE_EXP0
@Memory.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-1947) label WHILE_END0
(Memory.WHILE_END0) // label WHILE_END0

// (-1950) push local 0
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

// (-1952) push argument 0
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

// (-1954) add
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

// (-1956) push constant 16379
@16379 // push constant 16379
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1958) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_95
D;JGT
(JGT_FALSE_95)
@0
D=A // d = false
@JGT_END_95
0;JMP
(JGT_TRUE_95)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_95)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1963) if-goto IF_TRUE1
@0 // if-goto IF_TRUE1
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
@Memory.IF_TRUE1
D;JNE // jump if not zero

// (-1965) goto IF_FALSE1
@Memory.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-1967) label IF_TRUE1
(Memory.IF_TRUE1) // label IF_TRUE1

// (-1970) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1973) call Sys.error 1
(Memory.Sys.error.96) // call Sys.error 1
@Memory.Sys.error.96 // call Sys.error // push RIP
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
@Sys.error // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-1975) pop temp 0
@5 // pop temp 0
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

// (-1977) label IF_FALSE1
(Memory.IF_FALSE1) // label IF_FALSE1

// (-1980) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1982) push local 0
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

// (-1984) add
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

// (-1986) pop pointer 1
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

// (-1988) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1990) push argument 0
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

// (-1992) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1994) add
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

// (-1996) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_97
D;JGT
(JGT_FALSE_97)
@0
D=A // d = false
@JGT_END_97
0;JMP
(JGT_TRUE_97)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_97)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2001) if-goto IF_TRUE2
@0 // if-goto IF_TRUE2
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
@Memory.IF_TRUE2
D;JNE // jump if not zero

// (-2003) goto IF_FALSE2
@Memory.IF_FALSE2 // goto IF_FALSE2
0;JMP // unconditional jump

// (-2005) label IF_TRUE2
(Memory.IF_TRUE2) // label IF_TRUE2

// (-2008) push argument 0
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

// (-2010) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2012) add
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

// (-2014) push local 0
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

// (-2016) add
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

// (-2018) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2020) push local 0
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

// (-2022) add
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

// (-2024) pop pointer 1
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

// (-2026) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2028) push argument 0
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

// (-2030) sub
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

// (-2032) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2034) sub
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

// (-2036) pop temp 0
@5 // pop temp 0
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

// (-2038) pop pointer 1
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

// (-2040) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2042) pop that 0
@THAT // pop that 0
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

// (-2044) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2046) push local 0
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

// (-2048) add
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

// (-2050) pop pointer 1
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

// (-2052) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2054) push local 0
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

// (-2056) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2058) add
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

// (-2060) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_98
D;JEQ
(EQ_FALSE_98)
@0
D=A // d = false
@EQ_END_98
0;JMP
(EQ_TRUE_98)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_98)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2065) if-goto IF_TRUE3
@0 // if-goto IF_TRUE3
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
@Memory.IF_TRUE3
D;JNE // jump if not zero

// (-2067) goto IF_FALSE3
@Memory.IF_FALSE3 // goto IF_FALSE3
0;JMP // unconditional jump

// (-2069) label IF_TRUE3
(Memory.IF_TRUE3) // label IF_TRUE3

// (-2072) push argument 0
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

// (-2074) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2076) add
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

// (-2078) push local 0
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

// (-2080) add
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

// (-2082) push local 0
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

// (-2084) push argument 0
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

// (-2086) add
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

// (-2088) push constant 4
@4 // push constant 4
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2090) add
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

// (-2092) pop temp 0
@5 // pop temp 0
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

// (-2094) pop pointer 1
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

// (-2096) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2098) pop that 0
@THAT // pop that 0
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

// (-2100) goto IF_END3
@Memory.IF_END3 // goto IF_END3
0;JMP // unconditional jump

// (-2102) label IF_FALSE3
(Memory.IF_FALSE3) // label IF_FALSE3

// (-2105) push argument 0
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

// (-2107) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2109) add
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

// (-2111) push local 0
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

// (-2113) add
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

// (-2115) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2117) push local 0
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

// (-2119) add
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

// (-2121) pop pointer 1
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

// (-2123) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2125) pop temp 0
@5 // pop temp 0
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

// (-2127) pop pointer 1
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

// (-2129) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2131) pop that 0
@THAT // pop that 0
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

// (-2133) label IF_END3
(Memory.IF_END3) // label IF_END3

// (-2136) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2138) push local 0
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

// (-2140) add
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

// (-2142) push local 0
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

// (-2144) push argument 0
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

// (-2146) add
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

// (-2148) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2150) add
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

// (-2152) pop temp 0
@5 // pop temp 0
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

// (-2154) pop pointer 1
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

// (-2156) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2158) pop that 0
@THAT // pop that 0
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

// (-2160) label IF_FALSE2
(Memory.IF_FALSE2) // label IF_FALSE2

// (-2163) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2165) push local 0
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

// (-2167) add
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

// (-2169) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2171) pop temp 0
@5 // pop temp 0
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

// (-2173) pop pointer 1
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

// (-2175) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2177) pop that 0
@THAT // pop that 0
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

// (-2179) push local 0
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

// (-2181) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2183) add
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

// (-2185) return

// (-2187) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-2189) function Memory.deAlloc 2
(Memory.deAlloc) // function Memory.deAlloc 2

// (-2192) push argument 0
@ARG // push argument 0 // function Memory.deAlloc 2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-2194) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2196) sub
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

// (-2198) pop local 0
@LCL // pop local 0
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

// (-2200) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2202) push local 0
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

// (-2204) add
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

// (-2206) pop pointer 1
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

// (-2208) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2210) pop local 1
@LCL // pop local 1
D=M
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

// (-2212) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2214) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2216) add
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

// (-2218) pop pointer 1
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

// (-2220) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2222) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2224) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_99
D;JEQ
(EQ_FALSE_99)
@0
D=A // d = false
@EQ_END_99
0;JMP
(EQ_TRUE_99)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_99)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2229) if-goto IF_TRUE0
@0 // if-goto IF_TRUE0
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
@Memory.IF_TRUE0
D;JNE // jump if not zero

// (-2231) goto IF_FALSE0
@Memory.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-2233) label IF_TRUE0
(Memory.IF_TRUE0) // label IF_TRUE0

// (-2236) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2238) push local 0
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

// (-2240) add
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

// (-2242) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2244) push local 0
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

// (-2246) add
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

// (-2248) pop pointer 1
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

// (-2250) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2252) push local 0
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

// (-2254) sub
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

// (-2256) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2258) sub
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

// (-2260) pop temp 0
@5 // pop temp 0
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

// (-2262) pop pointer 1
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

// (-2264) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2266) pop that 0
@THAT // pop that 0
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

// (-2268) goto IF_END0
@Memory.IF_END0 // goto IF_END0
0;JMP // unconditional jump

// (-2270) label IF_FALSE0
(Memory.IF_FALSE0) // label IF_FALSE0

// (-2273) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2275) push local 0
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

// (-2277) add
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

// (-2279) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2281) push local 0
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

// (-2283) add
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

// (-2285) pop pointer 1
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

// (-2287) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2289) push local 0
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

// (-2291) sub
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

// (-2293) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2295) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2297) add
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

// (-2299) pop pointer 1
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

// (-2301) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2303) add
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

// (-2305) pop temp 0
@5 // pop temp 0
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

// (-2307) pop pointer 1
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

// (-2309) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2311) pop that 0
@THAT // pop that 0
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

// (-2313) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2315) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2317) add
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

// (-2319) pop pointer 1
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

// (-2321) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2323) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2325) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2327) add
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

// (-2329) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_100
D;JEQ
(EQ_FALSE_100)
@0
D=A // d = false
@EQ_END_100
0;JMP
(EQ_TRUE_100)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_100)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2334) if-goto IF_TRUE1
@0 // if-goto IF_TRUE1
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
@Memory.IF_TRUE1
D;JNE // jump if not zero

// (-2336) goto IF_FALSE1
@Memory.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-2338) label IF_TRUE1
(Memory.IF_TRUE1) // label IF_TRUE1

// (-2341) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2343) push local 0
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

// (-2345) add
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

// (-2347) push local 0
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

// (-2349) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2351) add
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

// (-2353) pop temp 0
@5 // pop temp 0
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

// (-2355) pop pointer 1
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

// (-2357) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2359) pop that 0
@THAT // pop that 0
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

// (-2361) goto IF_END1
@Memory.IF_END1 // goto IF_END1
0;JMP // unconditional jump

// (-2363) label IF_FALSE1
(Memory.IF_FALSE1) // label IF_FALSE1

// (-2366) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2368) push local 0
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

// (-2370) add
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

// (-2372) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2374) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2376) add
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

// (-2378) pop pointer 1
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

// (-2380) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2382) pop temp 0
@5 // pop temp 0
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

// (-2384) pop pointer 1
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

// (-2386) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2388) pop that 0
@THAT // pop that 0
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

// (-2390) label IF_END1
(Memory.IF_END1) // label IF_END1

// (-2393) label IF_END0
(Memory.IF_END0) // label IF_END0

// (-2396) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2398) return

// (-2400) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-2402) function Output.init 0
(Output.init) // function Output.init 0

// (-2405) push constant 16384
@16384 // push constant 16384 // function Output.init 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-2407) pop static 4
@19 // pop static 4 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@4 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
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

// (-2409) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2411) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-2413) pop static 2
@19 // pop static 2 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
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

// (-2415) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2417) pop static 1
@19 // pop static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
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

// (-2419) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2421) pop static 0
@19 // pop static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
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

// (-2423) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2426) call String.new 1
(Output.String.new.101) // call String.new 1
@Output.String.new.101 // call String.new // push RIP
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
@String.new // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-2428) pop static 3
@19 // pop static 3 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
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

// (-2431) call Output.initMap 0
(Output.Output.initMap.102) // call Output.initMap 0

// (-2433) push constant 9999 // call Output.initMap // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Output.initMap // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Output.Output.initMap.102 // push RIP
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
@71 // prologue_size
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
@Output.initMap // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-2435) pop temp 0
@5 // pop temp 0
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

// (-2438) call Output.createShiftedMap 0
(Output.Output.createShiftedMap.103) // call Output.createShiftedMap 0

// (-2440) push constant 9999 // call Output.createShiftedMap // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Output.createShiftedMap // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Output.Output.createShiftedMap.103 // push RIP
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

// (-2442) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2444) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2446) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2448) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@9 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@99 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@9 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@9 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@1 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@4 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.createShiftedMap // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-2450) pop temp 0
@5 // pop temp 0
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

// (-2452) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2454) return

// (-2456) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-2458) function Output.initMap 0
(Output.initMap) // function Output.initMap 0

// (-2461) push constant 127
@127 // push constant 127 // function Output.initMap 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-2464) call Array.new 1
(Output.Array.new.104) // call Array.new 1
@Output.Array.new.104 // call Array.new // push RIP
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
@Array.new // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-2466) pop static 5
@19 // pop static 5 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@5 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
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

// (-2468) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2470) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2472) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2474) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2476) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2478) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2480) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2482) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2484) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2486) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2488) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2490) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2493) call Output.create 12
(Output.Output.create.105) // call Output.create 12
@Output.Output.create.105 // call Output.create // push RIP
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

// (-2495) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-2497) pop temp 0
@5 // pop temp 0
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

// (-2499) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2501) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2503) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2505) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2507) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2509) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2511) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2513) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2515) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2517) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2519) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2521) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2524) call Output.create 12
(Output.Output.create.106) // call Output.create 12
@Output.Output.create.106 // call Output.create // push RIP
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

// (-2526) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-2528) pop temp 0
@5 // pop temp 0
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

// (-2530) push constant 33
@33 // push constant 33
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2532) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2534) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2536) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2538) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2540) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2542) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2544) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2546) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2548) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2550) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2552) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2555) call Output.create 12
(Output.Output.create.107) // call Output.create 12
@Output.Output.create.107 // call Output.create // push RIP
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

// (-2557) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-2559) pop temp 0
@5 // pop temp 0
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

// (-2561) push constant 34
@34 // push constant 34
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2563) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2565) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2567) push constant 20
@20 // push constant 20
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2569) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2571) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2573) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2575) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2577) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2579) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2581) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2583) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2586) call Output.create 12
(Output.Output.create.108) // call Output.create 12
@Output.Output.create.108 // call Output.create // push RIP
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

// (-2588) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-2590) pop temp 0
@5 // pop temp 0
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

// (-2592) push constant 35
@35 // push constant 35
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2594) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2596) push constant 18
@18 // push constant 18
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2598) push constant 18
@18 // push constant 18
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2600) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2602) push constant 18
@18 // push constant 18
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2604) push constant 18
@18 // push constant 18
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2606) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2608) push constant 18
@18 // push constant 18
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2610) push constant 18
@18 // push constant 18
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2612) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2614) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2617) call Output.create 12
(Output.Output.create.109) // call Output.create 12
@Output.Output.create.109 // call Output.create // push RIP
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

// (-2619) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-2621) pop temp 0
@5 // pop temp 0
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

// (-2623) push constant 36
@36 // push constant 36
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2625) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2627) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2629) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2631) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2633) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2635) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2637) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2639) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2641) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2643) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2645) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2648) call Output.create 12
(Output.Output.create.110) // call Output.create 12
@Output.Output.create.110 // call Output.create // push RIP
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

// (-2650) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-2652) pop temp 0
@5 // pop temp 0
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

// (-2654) push constant 37
@37 // push constant 37
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2656) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2658) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2660) push constant 35
@35 // push constant 35
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2662) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2664) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2666) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2668) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2670) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2672) push constant 49
@49 // push constant 49
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2674) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2676) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2679) call Output.create 12
(Output.Output.create.111) // call Output.create 12
@Output.Output.create.111 // call Output.create // push RIP
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

// (-2681) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-2683) pop temp 0
@5 // pop temp 0
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

// (-2685) push constant 38
@38 // push constant 38
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2687) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2689) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2691) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2693) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2695) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2697) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2699) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2701) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2703) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2705) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2707) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2710) call Output.create 12
(Output.Output.create.112) // call Output.create 12
@Output.Output.create.112 // call Output.create // push RIP
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

// (-2712) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-2714) pop temp 0
@5 // pop temp 0
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

// (-2716) push constant 39
@39 // push constant 39
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2718) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2720) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2722) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2724) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2726) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2728) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2730) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2732) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2734) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2736) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2738) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2741) call Output.create 12
(Output.Output.create.113) // call Output.create 12
@Output.Output.create.113 // call Output.create // push RIP
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

// (-2743) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-2745) pop temp 0
@5 // pop temp 0
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

// (-2747) push constant 40
@40 // push constant 40
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2749) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2751) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2753) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2755) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2757) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2759) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2761) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2763) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2765) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2767) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2769) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2772) call Output.create 12
(Output.Output.create.114) // call Output.create 12
@Output.Output.create.114 // call Output.create // push RIP
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

// (-2774) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-2776) pop temp 0
@5 // pop temp 0
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

// (-2778) push constant 41
@41 // push constant 41
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2780) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2782) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2784) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2786) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2788) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2790) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2792) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2794) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2796) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2798) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2800) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2803) call Output.create 12
(Output.Output.create.115) // call Output.create 12
@Output.Output.create.115 // call Output.create // push RIP
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

// (-2805) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-2807) pop temp 0
@5 // pop temp 0
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

// (-2809) push constant 42
@42 // push constant 42
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2811) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2813) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2815) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2817) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2819) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2821) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2823) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2825) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2827) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2829) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2831) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2834) call Output.create 12
(Output.Output.create.116) // call Output.create 12
@Output.Output.create.116 // call Output.create // push RIP
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

// (-2836) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-2838) pop temp 0
@5 // pop temp 0
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

// (-2840) push constant 43
@43 // push constant 43
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2842) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2844) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2846) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2848) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2850) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2852) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2854) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2856) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2858) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2860) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2862) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2865) call Output.create 12
(Output.Output.create.117) // call Output.create 12
@Output.Output.create.117 // call Output.create // push RIP
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

// (-2867) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-2869) pop temp 0
@5 // pop temp 0
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

// (-2871) push constant 44
@44 // push constant 44
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2873) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2875) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2877) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2879) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2881) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2883) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2885) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2887) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2889) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2891) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2893) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2896) call Output.create 12
(Output.Output.create.118) // call Output.create 12
@Output.Output.create.118 // call Output.create // push RIP
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

// (-2898) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-2900) pop temp 0
@5 // pop temp 0
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

// (-2902) push constant 45
@45 // push constant 45
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2904) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2906) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2908) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2910) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2912) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2914) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2916) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2918) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2920) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2922) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2924) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2927) call Output.create 12
(Output.Output.create.119) // call Output.create 12
@Output.Output.create.119 // call Output.create // push RIP
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

// (-2929) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-2931) pop temp 0
@5 // pop temp 0
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

// (-2933) push constant 46
@46 // push constant 46
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2935) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2937) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2939) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2941) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2943) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2945) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2947) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2949) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2951) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2953) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2955) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2958) call Output.create 12
(Output.Output.create.120) // call Output.create 12
@Output.Output.create.120 // call Output.create // push RIP
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

// (-2960) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-2962) pop temp 0
@5 // pop temp 0
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

// (-2964) push constant 47
@47 // push constant 47
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2966) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2968) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2970) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2972) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2974) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2976) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2978) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2980) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2982) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2984) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2986) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2989) call Output.create 12
(Output.Output.create.121) // call Output.create 12
@Output.Output.create.121 // call Output.create // push RIP
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

// (-2991) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-2993) pop temp 0
@5 // pop temp 0
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

// (-2995) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2997) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2999) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3001) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3003) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3005) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3007) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3009) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3011) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3013) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3015) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3017) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3020) call Output.create 12
(Output.Output.create.122) // call Output.create 12
@Output.Output.create.122 // call Output.create // push RIP
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

// (-3022) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3024) pop temp 0
@5 // pop temp 0
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

// (-3026) push constant 49
@49 // push constant 49
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3028) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3030) push constant 14
@14 // push constant 14
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3032) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3034) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3036) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3038) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3040) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3042) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3044) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3046) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3048) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3051) call Output.create 12
(Output.Output.create.123) // call Output.create 12
@Output.Output.create.123 // call Output.create // push RIP
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

// (-3053) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3055) pop temp 0
@5 // pop temp 0
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

// (-3057) push constant 50
@50 // push constant 50
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3059) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3061) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3063) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3065) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3067) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3069) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3071) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3073) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3075) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3077) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3079) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3082) call Output.create 12
(Output.Output.create.124) // call Output.create 12
@Output.Output.create.124 // call Output.create // push RIP
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

// (-3084) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3086) pop temp 0
@5 // pop temp 0
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

// (-3088) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3090) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3092) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3094) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3096) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3098) push constant 28
@28 // push constant 28
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3100) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3102) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3104) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3106) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3108) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3110) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3113) call Output.create 12
(Output.Output.create.125) // call Output.create 12
@Output.Output.create.125 // call Output.create // push RIP
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

// (-3115) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3117) pop temp 0
@5 // pop temp 0
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

// (-3119) push constant 52
@52 // push constant 52
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3121) push constant 16
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3123) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3125) push constant 28
@28 // push constant 28
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3127) push constant 26
@26 // push constant 26
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3129) push constant 25
@25 // push constant 25
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3131) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3133) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3135) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3137) push constant 60
@60 // push constant 60
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3139) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3141) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3144) call Output.create 12
(Output.Output.create.126) // call Output.create 12
@Output.Output.create.126 // call Output.create // push RIP
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

// (-3146) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3148) pop temp 0
@5 // pop temp 0
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

// (-3150) push constant 53
@53 // push constant 53
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3152) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3154) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3156) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3158) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3160) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3162) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3164) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3166) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3168) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3170) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3172) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3175) call Output.create 12
(Output.Output.create.127) // call Output.create 12
@Output.Output.create.127 // call Output.create // push RIP
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

// (-3177) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3179) pop temp 0
@5 // pop temp 0
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

// (-3181) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3183) push constant 28
@28 // push constant 28
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3185) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3187) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3189) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3191) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3193) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3195) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3197) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3199) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3201) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3203) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3206) call Output.create 12
(Output.Output.create.128) // call Output.create 12
@Output.Output.create.128 // call Output.create // push RIP
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

// (-3208) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3210) pop temp 0
@5 // pop temp 0
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

// (-3212) push constant 55
@55 // push constant 55
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3214) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3216) push constant 49
@49 // push constant 49
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3218) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3220) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3222) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3224) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3226) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3228) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3230) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3232) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3234) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3237) call Output.create 12
(Output.Output.create.129) // call Output.create 12
@Output.Output.create.129 // call Output.create // push RIP
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

// (-3239) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3241) pop temp 0
@5 // pop temp 0
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

// (-3243) push constant 56
@56 // push constant 56
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3245) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3247) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3249) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3251) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3253) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3255) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3257) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3259) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3261) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3263) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3265) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3268) call Output.create 12
(Output.Output.create.130) // call Output.create 12
@Output.Output.create.130 // call Output.create // push RIP
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

// (-3270) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3272) pop temp 0
@5 // pop temp 0
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

// (-3274) push constant 57
@57 // push constant 57
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3276) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3278) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3280) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3282) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3284) push constant 62
@62 // push constant 62
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3286) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3288) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3290) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3292) push constant 14
@14 // push constant 14
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3294) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3296) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3299) call Output.create 12
(Output.Output.create.131) // call Output.create 12
@Output.Output.create.131 // call Output.create // push RIP
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

// (-3301) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3303) pop temp 0
@5 // pop temp 0
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

// (-3305) push constant 58
@58 // push constant 58
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3307) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3309) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3311) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3313) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3315) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3317) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3319) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3321) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3323) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3325) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3327) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3330) call Output.create 12
(Output.Output.create.132) // call Output.create 12
@Output.Output.create.132 // call Output.create // push RIP
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

// (-3332) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3334) pop temp 0
@5 // pop temp 0
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

// (-3336) push constant 59
@59 // push constant 59
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3338) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3340) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3342) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3344) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3346) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3348) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3350) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3352) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3354) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3356) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3358) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3361) call Output.create 12
(Output.Output.create.133) // call Output.create 12
@Output.Output.create.133 // call Output.create // push RIP
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

// (-3363) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3365) pop temp 0
@5 // pop temp 0
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

// (-3367) push constant 60
@60 // push constant 60
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3369) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3371) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3373) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3375) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3377) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3379) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3381) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3383) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3385) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3387) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3389) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3392) call Output.create 12
(Output.Output.create.134) // call Output.create 12
@Output.Output.create.134 // call Output.create // push RIP
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

// (-3394) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3396) pop temp 0
@5 // pop temp 0
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

// (-3398) push constant 61
@61 // push constant 61
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3400) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3402) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3404) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3406) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3408) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3410) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3412) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3414) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3416) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3418) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3420) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3423) call Output.create 12
(Output.Output.create.135) // call Output.create 12
@Output.Output.create.135 // call Output.create // push RIP
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

// (-3425) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3427) pop temp 0
@5 // pop temp 0
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

// (-3429) push constant 62
@62 // push constant 62
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3431) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3433) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3435) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3437) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3439) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3441) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3443) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3445) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3447) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3449) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3451) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3454) call Output.create 12
(Output.Output.create.136) // call Output.create 12
@Output.Output.create.136 // call Output.create // push RIP
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

// (-3456) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3458) pop temp 0
@5 // pop temp 0
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

// (-3460) push constant 64
@64 // push constant 64
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3462) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3464) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3466) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3468) push constant 59
@59 // push constant 59
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3470) push constant 59
@59 // push constant 59
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3472) push constant 59
@59 // push constant 59
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3474) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3476) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3478) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3480) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3482) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3485) call Output.create 12
(Output.Output.create.137) // call Output.create 12
@Output.Output.create.137 // call Output.create // push RIP
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

// (-3487) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3489) pop temp 0
@5 // pop temp 0
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

// (-3491) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3493) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3495) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3497) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3499) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3501) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3503) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3505) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3507) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3509) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3511) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3513) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3516) call Output.create 12
(Output.Output.create.138) // call Output.create 12
@Output.Output.create.138 // call Output.create // push RIP
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

// (-3518) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3520) pop temp 0
@5 // pop temp 0
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

// (-3522) push constant 65
@65 // push constant 65
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3524) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3526) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3528) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3530) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3532) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3534) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3536) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3538) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3540) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3542) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3544) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3547) call Output.create 12
(Output.Output.create.139) // call Output.create 12
@Output.Output.create.139 // call Output.create // push RIP
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

// (-3549) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3551) pop temp 0
@5 // pop temp 0
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

// (-3553) push constant 66
@66 // push constant 66
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3555) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3557) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3559) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3561) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3563) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3565) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3567) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3569) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3571) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3573) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3575) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3578) call Output.create 12
(Output.Output.create.140) // call Output.create 12
@Output.Output.create.140 // call Output.create // push RIP
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

// (-3580) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3582) pop temp 0
@5 // pop temp 0
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

// (-3584) push constant 67
@67 // push constant 67
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3586) push constant 28
@28 // push constant 28
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3588) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3590) push constant 35
@35 // push constant 35
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3592) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3594) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3596) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3598) push constant 35
@35 // push constant 35
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3600) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3602) push constant 28
@28 // push constant 28
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3604) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3606) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3609) call Output.create 12
(Output.Output.create.141) // call Output.create 12
@Output.Output.create.141 // call Output.create // push RIP
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

// (-3611) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3613) pop temp 0
@5 // pop temp 0
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

// (-3615) push constant 68
@68 // push constant 68
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3617) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3619) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3621) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3623) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3625) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3627) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3629) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3631) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3633) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3635) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3637) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3640) call Output.create 12
(Output.Output.create.142) // call Output.create 12
@Output.Output.create.142 // call Output.create // push RIP
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

// (-3642) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3644) pop temp 0
@5 // pop temp 0
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

// (-3646) push constant 69
@69 // push constant 69
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3648) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3650) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3652) push constant 35
@35 // push constant 35
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3654) push constant 11
@11 // push constant 11
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3656) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3658) push constant 11
@11 // push constant 11
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3660) push constant 35
@35 // push constant 35
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3662) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3664) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3666) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3668) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3671) call Output.create 12
(Output.Output.create.143) // call Output.create 12
@Output.Output.create.143 // call Output.create // push RIP
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

// (-3673) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3675) pop temp 0
@5 // pop temp 0
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

// (-3677) push constant 70
@70 // push constant 70
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3679) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3681) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3683) push constant 35
@35 // push constant 35
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3685) push constant 11
@11 // push constant 11
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3687) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3689) push constant 11
@11 // push constant 11
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3691) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3693) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3695) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3697) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3699) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3702) call Output.create 12
(Output.Output.create.144) // call Output.create 12
@Output.Output.create.144 // call Output.create // push RIP
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

// (-3704) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3706) pop temp 0
@5 // pop temp 0
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

// (-3708) push constant 71
@71 // push constant 71
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3710) push constant 28
@28 // push constant 28
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3712) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3714) push constant 35
@35 // push constant 35
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3716) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3718) push constant 59
@59 // push constant 59
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3720) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3722) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3724) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3726) push constant 44
@44 // push constant 44
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3728) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3730) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3733) call Output.create 12
(Output.Output.create.145) // call Output.create 12
@Output.Output.create.145 // call Output.create // push RIP
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

// (-3735) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3737) pop temp 0
@5 // pop temp 0
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

// (-3739) push constant 72
@72 // push constant 72
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3741) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3743) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3745) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3747) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3749) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3751) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3753) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3755) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3757) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3759) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3761) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3764) call Output.create 12
(Output.Output.create.146) // call Output.create 12
@Output.Output.create.146 // call Output.create // push RIP
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

// (-3766) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3768) pop temp 0
@5 // pop temp 0
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

// (-3770) push constant 73
@73 // push constant 73
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3772) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3774) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3776) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3778) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3780) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3782) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3784) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3786) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3788) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3790) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3792) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3795) call Output.create 12
(Output.Output.create.147) // call Output.create 12
@Output.Output.create.147 // call Output.create // push RIP
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

// (-3797) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3799) pop temp 0
@5 // pop temp 0
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

// (-3801) push constant 74
@74 // push constant 74
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3803) push constant 60
@60 // push constant 60
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3805) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3807) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3809) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3811) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3813) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3815) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3817) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3819) push constant 14
@14 // push constant 14
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3821) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3823) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3826) call Output.create 12
(Output.Output.create.148) // call Output.create 12
@Output.Output.create.148 // call Output.create // push RIP
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

// (-3828) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3830) pop temp 0
@5 // pop temp 0
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

// (-3832) push constant 75
@75 // push constant 75
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3834) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3836) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3838) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3840) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3842) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3844) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3846) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3848) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3850) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3852) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3854) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3857) call Output.create 12
(Output.Output.create.149) // call Output.create 12
@Output.Output.create.149 // call Output.create // push RIP
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

// (-3859) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3861) pop temp 0
@5 // pop temp 0
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

// (-3863) push constant 76
@76 // push constant 76
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3865) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3867) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3869) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3871) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3873) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3875) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3877) push constant 35
@35 // push constant 35
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3879) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3881) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3883) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3885) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3888) call Output.create 12
(Output.Output.create.150) // call Output.create 12
@Output.Output.create.150 // call Output.create // push RIP
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

// (-3890) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3892) pop temp 0
@5 // pop temp 0
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

// (-3894) push constant 77
@77 // push constant 77
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3896) push constant 33
@33 // push constant 33
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3898) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3900) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3902) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3904) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3906) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3908) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3910) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3912) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3914) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3916) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3919) call Output.create 12
(Output.Output.create.151) // call Output.create 12
@Output.Output.create.151 // call Output.create // push RIP
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

// (-3921) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3923) pop temp 0
@5 // pop temp 0
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

// (-3925) push constant 78
@78 // push constant 78
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3927) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3929) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3931) push constant 55
@55 // push constant 55
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3933) push constant 55
@55 // push constant 55
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3935) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3937) push constant 59
@59 // push constant 59
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3939) push constant 59
@59 // push constant 59
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3941) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3943) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3945) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3947) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3950) call Output.create 12
(Output.Output.create.152) // call Output.create 12
@Output.Output.create.152 // call Output.create // push RIP
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

// (-3952) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3954) pop temp 0
@5 // pop temp 0
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

// (-3956) push constant 79
@79 // push constant 79
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3958) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3960) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3962) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3964) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3966) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3968) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3970) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3972) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3974) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3976) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3978) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3981) call Output.create 12
(Output.Output.create.153) // call Output.create 12
@Output.Output.create.153 // call Output.create // push RIP
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

// (-3983) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-3985) pop temp 0
@5 // pop temp 0
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

// (-3987) push constant 80
@80 // push constant 80
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3989) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3991) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3993) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3995) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3997) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3999) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4001) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4003) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4005) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4007) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4009) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4012) call Output.create 12
(Output.Output.create.154) // call Output.create 12
@Output.Output.create.154 // call Output.create // push RIP
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

// (-4014) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4016) pop temp 0
@5 // pop temp 0
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

// (-4018) push constant 81
@81 // push constant 81
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4020) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4022) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4024) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4026) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4028) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4030) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4032) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4034) push constant 59
@59 // push constant 59
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4036) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4038) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4040) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4043) call Output.create 12
(Output.Output.create.155) // call Output.create 12
@Output.Output.create.155 // call Output.create // push RIP
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

// (-4045) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4047) pop temp 0
@5 // pop temp 0
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

// (-4049) push constant 82
@82 // push constant 82
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4051) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4053) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4055) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4057) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4059) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4061) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4063) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4065) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4067) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4069) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4071) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4074) call Output.create 12
(Output.Output.create.156) // call Output.create 12
@Output.Output.create.156 // call Output.create // push RIP
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

// (-4076) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4078) pop temp 0
@5 // pop temp 0
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

// (-4080) push constant 83
@83 // push constant 83
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4082) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4084) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4086) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4088) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4090) push constant 28
@28 // push constant 28
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4092) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4094) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4096) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4098) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4100) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4102) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4105) call Output.create 12
(Output.Output.create.157) // call Output.create 12
@Output.Output.create.157 // call Output.create // push RIP
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

// (-4107) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4109) pop temp 0
@5 // pop temp 0
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

// (-4111) push constant 84
@84 // push constant 84
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4113) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4115) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4117) push constant 45
@45 // push constant 45
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4119) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4121) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4123) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4125) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4127) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4129) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4131) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4133) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4136) call Output.create 12
(Output.Output.create.158) // call Output.create 12
@Output.Output.create.158 // call Output.create // push RIP
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

// (-4138) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4140) pop temp 0
@5 // pop temp 0
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

// (-4142) push constant 85
@85 // push constant 85
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4144) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4146) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4148) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4150) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4152) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4154) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4156) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4158) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4160) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4162) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4164) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4167) call Output.create 12
(Output.Output.create.159) // call Output.create 12
@Output.Output.create.159 // call Output.create // push RIP
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

// (-4169) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4171) pop temp 0
@5 // pop temp 0
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

// (-4173) push constant 86
@86 // push constant 86
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4175) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4177) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4179) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4181) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4183) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4185) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4187) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4189) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4191) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4193) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4195) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4198) call Output.create 12
(Output.Output.create.160) // call Output.create 12
@Output.Output.create.160 // call Output.create // push RIP
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

// (-4200) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4202) pop temp 0
@5 // pop temp 0
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

// (-4204) push constant 87
@87 // push constant 87
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4206) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4208) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4210) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4212) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4214) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4216) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4218) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4220) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4222) push constant 18
@18 // push constant 18
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4224) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4226) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4229) call Output.create 12
(Output.Output.create.161) // call Output.create 12
@Output.Output.create.161 // call Output.create // push RIP
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

// (-4231) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4233) pop temp 0
@5 // pop temp 0
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

// (-4235) push constant 88
@88 // push constant 88
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4237) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4239) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4241) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4243) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4245) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4247) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4249) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4251) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4253) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4255) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4257) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4260) call Output.create 12
(Output.Output.create.162) // call Output.create 12
@Output.Output.create.162 // call Output.create // push RIP
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

// (-4262) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4264) pop temp 0
@5 // pop temp 0
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

// (-4266) push constant 89
@89 // push constant 89
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4268) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4270) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4272) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4274) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4276) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4278) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4280) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4282) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4284) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4286) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4288) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4291) call Output.create 12
(Output.Output.create.163) // call Output.create 12
@Output.Output.create.163 // call Output.create // push RIP
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

// (-4293) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4295) pop temp 0
@5 // pop temp 0
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

// (-4297) push constant 90
@90 // push constant 90
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4299) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4301) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4303) push constant 49
@49 // push constant 49
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4305) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4307) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4309) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4311) push constant 35
@35 // push constant 35
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4313) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4315) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4317) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4319) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4322) call Output.create 12
(Output.Output.create.164) // call Output.create 12
@Output.Output.create.164 // call Output.create // push RIP
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

// (-4324) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4326) pop temp 0
@5 // pop temp 0
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

// (-4328) push constant 91
@91 // push constant 91
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4330) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4332) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4334) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4336) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4338) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4340) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4342) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4344) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4346) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4348) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4350) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4353) call Output.create 12
(Output.Output.create.165) // call Output.create 12
@Output.Output.create.165 // call Output.create // push RIP
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

// (-4355) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4357) pop temp 0
@5 // pop temp 0
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

// (-4359) push constant 92
@92 // push constant 92
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4361) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4363) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4365) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4367) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4369) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4371) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4373) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4375) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4377) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4379) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4381) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4384) call Output.create 12
(Output.Output.create.166) // call Output.create 12
@Output.Output.create.166 // call Output.create // push RIP
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

// (-4386) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4388) pop temp 0
@5 // pop temp 0
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

// (-4390) push constant 93
@93 // push constant 93
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4392) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4394) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4396) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4398) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4400) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4402) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4404) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4406) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4408) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4410) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4412) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4415) call Output.create 12
(Output.Output.create.167) // call Output.create 12
@Output.Output.create.167 // call Output.create // push RIP
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

// (-4417) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4419) pop temp 0
@5 // pop temp 0
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

// (-4421) push constant 94
@94 // push constant 94
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4423) push constant 8
@8 // push constant 8
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4425) push constant 28
@28 // push constant 28
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4427) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4429) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4431) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4433) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4435) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4437) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4439) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4441) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4443) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4446) call Output.create 12
(Output.Output.create.168) // call Output.create 12
@Output.Output.create.168 // call Output.create // push RIP
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

// (-4448) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4450) pop temp 0
@5 // pop temp 0
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

// (-4452) push constant 95
@95 // push constant 95
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4454) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4456) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4458) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4460) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4462) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4464) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4466) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4468) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4470) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4472) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4474) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4477) call Output.create 12
(Output.Output.create.169) // call Output.create 12
@Output.Output.create.169 // call Output.create // push RIP
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

// (-4479) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4481) pop temp 0
@5 // pop temp 0
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

// (-4483) push constant 96
@96 // push constant 96
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4485) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4487) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4489) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4491) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4493) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4495) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4497) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4499) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4501) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4503) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4505) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4508) call Output.create 12
(Output.Output.create.170) // call Output.create 12
@Output.Output.create.170 // call Output.create // push RIP
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

// (-4510) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4512) pop temp 0
@5 // pop temp 0
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

// (-4514) push constant 97
@97 // push constant 97
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4516) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4518) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4520) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4522) push constant 14
@14 // push constant 14
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4524) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4526) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4528) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4530) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4532) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4534) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4536) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4539) call Output.create 12
(Output.Output.create.171) // call Output.create 12
@Output.Output.create.171 // call Output.create // push RIP
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

// (-4541) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4543) pop temp 0
@5 // pop temp 0
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

// (-4545) push constant 98
@98 // push constant 98
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4547) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4549) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4551) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4553) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4555) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4557) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4559) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4561) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4563) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4565) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4567) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4570) call Output.create 12
(Output.Output.create.172) // call Output.create 12
@Output.Output.create.172 // call Output.create // push RIP
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

// (-4572) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4574) pop temp 0
@5 // pop temp 0
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

// (-4576) push constant 99
@99 // push constant 99
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4578) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4580) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4582) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4584) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4586) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4588) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4590) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4592) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4594) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4596) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4598) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4601) call Output.create 12
(Output.Output.create.173) // call Output.create 12
@Output.Output.create.173 // call Output.create // push RIP
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

// (-4603) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4605) pop temp 0
@5 // pop temp 0
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

// (-4607) push constant 100
@100 // push constant 100
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4609) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4611) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4613) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4615) push constant 60
@60 // push constant 60
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4617) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4619) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4621) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4623) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4625) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4627) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4629) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4632) call Output.create 12
(Output.Output.create.174) // call Output.create 12
@Output.Output.create.174 // call Output.create // push RIP
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

// (-4634) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4636) pop temp 0
@5 // pop temp 0
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

// (-4638) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4640) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4642) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4644) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4646) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4648) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4650) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4652) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4654) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4656) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4658) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4660) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4663) call Output.create 12
(Output.Output.create.175) // call Output.create 12
@Output.Output.create.175 // call Output.create // push RIP
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

// (-4665) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4667) pop temp 0
@5 // pop temp 0
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

// (-4669) push constant 102
@102 // push constant 102
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4671) push constant 28
@28 // push constant 28
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4673) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4675) push constant 38
@38 // push constant 38
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4677) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4679) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4681) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4683) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4685) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4687) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4689) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4691) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4694) call Output.create 12
(Output.Output.create.176) // call Output.create 12
@Output.Output.create.176 // call Output.create // push RIP
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

// (-4696) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4698) pop temp 0
@5 // pop temp 0
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

// (-4700) push constant 103
@103 // push constant 103
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4702) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4704) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4706) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4708) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4710) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4712) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4714) push constant 62
@62 // push constant 62
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4716) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4718) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4720) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4722) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4725) call Output.create 12
(Output.Output.create.177) // call Output.create 12
@Output.Output.create.177 // call Output.create // push RIP
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

// (-4727) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4729) pop temp 0
@5 // pop temp 0
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

// (-4731) push constant 104
@104 // push constant 104
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4733) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4735) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4737) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4739) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4741) push constant 55
@55 // push constant 55
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4743) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4745) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4747) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4749) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4751) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4753) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4756) call Output.create 12
(Output.Output.create.178) // call Output.create 12
@Output.Output.create.178 // call Output.create // push RIP
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

// (-4758) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4760) pop temp 0
@5 // pop temp 0
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

// (-4762) push constant 105
@105 // push constant 105
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4764) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4766) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4768) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4770) push constant 14
@14 // push constant 14
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4772) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4774) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4776) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4778) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4780) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4782) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4784) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4787) call Output.create 12
(Output.Output.create.179) // call Output.create 12
@Output.Output.create.179 // call Output.create // push RIP
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

// (-4789) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4791) pop temp 0
@5 // pop temp 0
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

// (-4793) push constant 106
@106 // push constant 106
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4795) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4797) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4799) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4801) push constant 56
@56 // push constant 56
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4803) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4805) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4807) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4809) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4811) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4813) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4815) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4818) call Output.create 12
(Output.Output.create.180) // call Output.create 12
@Output.Output.create.180 // call Output.create // push RIP
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

// (-4820) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4822) pop temp 0
@5 // pop temp 0
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

// (-4824) push constant 107
@107 // push constant 107
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4826) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4828) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4830) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4832) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4834) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4836) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4838) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4840) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4842) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4844) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4846) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4849) call Output.create 12
(Output.Output.create.181) // call Output.create 12
@Output.Output.create.181 // call Output.create // push RIP
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

// (-4851) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4853) pop temp 0
@5 // pop temp 0
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

// (-4855) push constant 108
@108 // push constant 108
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4857) push constant 14
@14 // push constant 14
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4859) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4861) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4863) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4865) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4867) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4869) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4871) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4873) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4875) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4877) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4880) call Output.create 12
(Output.Output.create.182) // call Output.create 12
@Output.Output.create.182 // call Output.create // push RIP
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

// (-4882) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4884) pop temp 0
@5 // pop temp 0
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

// (-4886) push constant 109
@109 // push constant 109
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4888) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4890) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4892) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4894) push constant 29
@29 // push constant 29
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4896) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4898) push constant 43
@43 // push constant 43
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4900) push constant 43
@43 // push constant 43
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4902) push constant 43
@43 // push constant 43
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4904) push constant 43
@43 // push constant 43
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4906) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4908) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4911) call Output.create 12
(Output.Output.create.183) // call Output.create 12
@Output.Output.create.183 // call Output.create // push RIP
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

// (-4913) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4915) pop temp 0
@5 // pop temp 0
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

// (-4917) push constant 110
@110 // push constant 110
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4919) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4921) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4923) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4925) push constant 29
@29 // push constant 29
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4927) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4929) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4931) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4933) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4935) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4937) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4939) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4942) call Output.create 12
(Output.Output.create.184) // call Output.create 12
@Output.Output.create.184 // call Output.create // push RIP
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

// (-4944) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4946) pop temp 0
@5 // pop temp 0
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

// (-4948) push constant 111
@111 // push constant 111
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4950) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4952) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4954) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4956) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4958) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4960) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4962) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4964) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4966) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4968) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4970) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4973) call Output.create 12
(Output.Output.create.185) // call Output.create 12
@Output.Output.create.185 // call Output.create // push RIP
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

// (-4975) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-4977) pop temp 0
@5 // pop temp 0
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

// (-4979) push constant 112
@112 // push constant 112
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4981) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4983) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4985) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4987) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4989) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4991) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4993) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4995) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4997) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4999) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5001) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5004) call Output.create 12
(Output.Output.create.186) // call Output.create 12
@Output.Output.create.186 // call Output.create // push RIP
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

// (-5006) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-5008) pop temp 0
@5 // pop temp 0
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

// (-5010) push constant 113
@113 // push constant 113
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5012) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5014) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5016) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5018) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5020) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5022) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5024) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5026) push constant 62
@62 // push constant 62
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5028) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5030) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5032) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5035) call Output.create 12
(Output.Output.create.187) // call Output.create 12
@Output.Output.create.187 // call Output.create // push RIP
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

// (-5037) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-5039) pop temp 0
@5 // pop temp 0
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

// (-5041) push constant 114
@114 // push constant 114
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5043) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5045) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5047) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5049) push constant 29
@29 // push constant 29
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5051) push constant 55
@55 // push constant 55
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5053) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5055) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5057) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5059) push constant 7
@7 // push constant 7
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5061) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5063) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5066) call Output.create 12
(Output.Output.create.188) // call Output.create 12
@Output.Output.create.188 // call Output.create // push RIP
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

// (-5068) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-5070) pop temp 0
@5 // pop temp 0
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

// (-5072) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5074) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5076) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5078) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5080) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5082) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5084) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5086) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5088) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5090) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5092) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5094) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5097) call Output.create 12
(Output.Output.create.189) // call Output.create 12
@Output.Output.create.189 // call Output.create // push RIP
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

// (-5099) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-5101) pop temp 0
@5 // pop temp 0
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

// (-5103) push constant 116
@116 // push constant 116
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5105) push constant 4
@4 // push constant 4
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5107) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5109) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5111) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5113) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5115) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5117) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5119) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5121) push constant 28
@28 // push constant 28
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5123) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5125) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5128) call Output.create 12
(Output.Output.create.190) // call Output.create 12
@Output.Output.create.190 // call Output.create // push RIP
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

// (-5130) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-5132) pop temp 0
@5 // pop temp 0
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

// (-5134) push constant 117
@117 // push constant 117
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5136) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5138) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5140) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5142) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5144) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5146) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5148) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5150) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5152) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5154) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5156) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5159) call Output.create 12
(Output.Output.create.191) // call Output.create 12
@Output.Output.create.191 // call Output.create // push RIP
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

// (-5161) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-5163) pop temp 0
@5 // pop temp 0
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

// (-5165) push constant 118
@118 // push constant 118
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5167) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5169) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5171) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5173) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5175) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5177) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5179) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5181) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5183) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5185) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5187) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5190) call Output.create 12
(Output.Output.create.192) // call Output.create 12
@Output.Output.create.192 // call Output.create // push RIP
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

// (-5192) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-5194) pop temp 0
@5 // pop temp 0
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

// (-5196) push constant 119
@119 // push constant 119
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5198) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5200) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5202) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5204) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5206) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5208) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5210) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5212) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5214) push constant 18
@18 // push constant 18
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5216) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5218) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5221) call Output.create 12
(Output.Output.create.193) // call Output.create 12
@Output.Output.create.193 // call Output.create // push RIP
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

// (-5223) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-5225) pop temp 0
@5 // pop temp 0
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

// (-5227) push constant 120
@120 // push constant 120
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5229) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5231) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5233) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5235) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5237) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5239) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5241) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5243) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5245) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5247) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5249) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5252) call Output.create 12
(Output.Output.create.194) // call Output.create 12
@Output.Output.create.194 // call Output.create // push RIP
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

// (-5254) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-5256) pop temp 0
@5 // pop temp 0
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

// (-5258) push constant 121
@121 // push constant 121
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5260) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5262) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5264) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5266) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5268) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5270) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5272) push constant 62
@62 // push constant 62
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5274) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5276) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5278) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5280) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5283) call Output.create 12
(Output.Output.create.195) // call Output.create 12
@Output.Output.create.195 // call Output.create // push RIP
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

// (-5285) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-5287) pop temp 0
@5 // pop temp 0
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

// (-5289) push constant 122
@122 // push constant 122
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5291) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5293) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5295) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5297) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5299) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5301) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5303) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5305) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5307) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5309) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5311) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5314) call Output.create 12
(Output.Output.create.196) // call Output.create 12
@Output.Output.create.196 // call Output.create // push RIP
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

// (-5316) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-5318) pop temp 0
@5 // pop temp 0
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

// (-5320) push constant 123
@123 // push constant 123
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5322) push constant 56
@56 // push constant 56
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5324) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5326) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5328) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5330) push constant 7
@7 // push constant 7
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5332) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5334) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5336) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5338) push constant 56
@56 // push constant 56
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5340) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5342) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5345) call Output.create 12
(Output.Output.create.197) // call Output.create 12
@Output.Output.create.197 // call Output.create // push RIP
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

// (-5347) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-5349) pop temp 0
@5 // pop temp 0
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

// (-5351) push constant 124
@124 // push constant 124
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5353) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5355) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5357) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5359) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5361) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5363) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5365) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5367) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5369) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5371) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5373) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5376) call Output.create 12
(Output.Output.create.198) // call Output.create 12
@Output.Output.create.198 // call Output.create // push RIP
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

// (-5378) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-5380) pop temp 0
@5 // pop temp 0
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

// (-5382) push constant 125
@125 // push constant 125
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5384) push constant 7
@7 // push constant 7
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5386) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5388) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5390) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5392) push constant 56
@56 // push constant 56
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5394) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5396) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5398) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5400) push constant 7
@7 // push constant 7
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5402) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5404) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5407) call Output.create 12
(Output.Output.create.199) // call Output.create 12
@Output.Output.create.199 // call Output.create // push RIP
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

// (-5409) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-5411) pop temp 0
@5 // pop temp 0
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

// (-5413) push constant 126
@126 // push constant 126
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5415) push constant 38
@38 // push constant 38
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5417) push constant 45
@45 // push constant 45
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5419) push constant 25
@25 // push constant 25
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5421) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5423) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5425) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5427) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5429) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5431) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5433) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5435) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5438) call Output.create 12
(Output.Output.create.200) // call Output.create 12
@Output.Output.create.200 // call Output.create // push RIP
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

// (-5440) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@12 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.create // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-5442) pop temp 0
@5 // pop temp 0
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

// (-5444) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5446) return

// (-5448) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-5450) function Output.create 1
(Output.create) // function Output.create 1

// (-5453) push constant 11
@11 // push constant 11 // function Output.create 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-5456) call Array.new 1
(Output.Array.new.201) // call Array.new 1
@Output.Array.new.201 // call Array.new // push RIP
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
@Array.new // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-5458) pop local 0
@LCL // pop local 0
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

// (-5460) push argument 0
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

// (-5462) push static 5
@19 // push static 5 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5464) add
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

// (-5466) push local 0
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

// (-5468) pop temp 0
@5 // pop temp 0
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

// (-5470) pop pointer 1
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

// (-5472) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5474) pop that 0
@THAT // pop that 0
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

// (-5476) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5478) push local 0
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

// (-5480) add
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

// (-5482) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5484) pop temp 0
@5 // pop temp 0
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

// (-5486) pop pointer 1
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

// (-5488) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5490) pop that 0
@THAT // pop that 0
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

// (-5492) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5494) push local 0
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

// (-5496) add
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

// (-5498) push argument 2
@ARG // push argument 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5500) pop temp 0
@5 // pop temp 0
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

// (-5502) pop pointer 1
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

// (-5504) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5506) pop that 0
@THAT // pop that 0
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

// (-5508) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5510) push local 0
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

// (-5512) add
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

// (-5514) push argument 3
@ARG // push argument 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5516) pop temp 0
@5 // pop temp 0
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

// (-5518) pop pointer 1
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

// (-5520) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5522) pop that 0
@THAT // pop that 0
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

// (-5524) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5526) push local 0
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

// (-5528) add
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

// (-5530) push argument 4
@ARG // push argument 4
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5532) pop temp 0
@5 // pop temp 0
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

// (-5534) pop pointer 1
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

// (-5536) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5538) pop that 0
@THAT // pop that 0
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

// (-5540) push constant 4
@4 // push constant 4
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5542) push local 0
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

// (-5544) add
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

// (-5546) push argument 5
@ARG // push argument 5
D=M
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5548) pop temp 0
@5 // pop temp 0
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

// (-5550) pop pointer 1
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

// (-5552) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5554) pop that 0
@THAT // pop that 0
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

// (-5556) push constant 5
@5 // push constant 5
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5558) push local 0
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

// (-5560) add
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

// (-5562) push argument 6
@ARG // push argument 6
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5564) pop temp 0
@5 // pop temp 0
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

// (-5566) pop pointer 1
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

// (-5568) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5570) pop that 0
@THAT // pop that 0
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

// (-5572) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5574) push local 0
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

// (-5576) add
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

// (-5578) push argument 7
@ARG // push argument 7
D=M
@7
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5580) pop temp 0
@5 // pop temp 0
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

// (-5582) pop pointer 1
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

// (-5584) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5586) pop that 0
@THAT // pop that 0
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

// (-5588) push constant 7
@7 // push constant 7
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5590) push local 0
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

// (-5592) add
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

// (-5594) push argument 8
@ARG // push argument 8
D=M
@8
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5596) pop temp 0
@5 // pop temp 0
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

// (-5598) pop pointer 1
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

// (-5600) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5602) pop that 0
@THAT // pop that 0
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

// (-5604) push constant 8
@8 // push constant 8
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5606) push local 0
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

// (-5608) add
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

// (-5610) push argument 9
@ARG // push argument 9
D=M
@9
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5612) pop temp 0
@5 // pop temp 0
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

// (-5614) pop pointer 1
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

// (-5616) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5618) pop that 0
@THAT // pop that 0
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

// (-5620) push constant 9
@9 // push constant 9
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5622) push local 0
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

// (-5624) add
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

// (-5626) push argument 10
@ARG // push argument 10
D=M
@10
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5628) pop temp 0
@5 // pop temp 0
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

// (-5630) pop pointer 1
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

// (-5632) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5634) pop that 0
@THAT // pop that 0
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

// (-5636) push constant 10
@10 // push constant 10
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5638) push local 0
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

// (-5640) add
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

// (-5642) push argument 11
@ARG // push argument 11
D=M
@11
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5644) pop temp 0
@5 // pop temp 0
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

// (-5646) pop pointer 1
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

// (-5648) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5650) pop that 0
@THAT // pop that 0
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

// (-5652) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5654) return

// (-5656) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-5658) function Output.createShiftedMap 4
(Output.createShiftedMap) // function Output.createShiftedMap 4

// (-5661) push constant 127
@127 // push constant 127 // function Output.createShiftedMap 4
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-5664) call Array.new 1
(Output.Array.new.202) // call Array.new 1
@Output.Array.new.202 // call Array.new // push RIP
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
@Array.new // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-5666) pop static 6
@19 // pop static 6 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
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

// (-5668) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5670) pop local 2
@LCL // pop local 2
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

// (-5672) label WHILE_EXP0
(Output.WHILE_EXP0) // label WHILE_EXP0

// (-5675) push local 2
@LCL // push local 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5677) push constant 127
@127 // push constant 127
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5679) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_203
D;JLT
(JLT_FALSE_203)
@0
D=A // d = false
@JLT_END_203
0;JMP
(JLT_TRUE_203)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_203)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-5684) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-5686) if-goto WHILE_END0
@0 // if-goto WHILE_END0
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
@Output.WHILE_END0
D;JNE // jump if not zero

// (-5688) push local 2
@LCL // push local 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5690) push static 5
@19 // push static 5 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5692) add
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

// (-5694) pop pointer 1
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

// (-5696) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5698) pop local 0
@LCL // pop local 0
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

// (-5700) push constant 11
@11 // push constant 11
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5703) call Array.new 1
(Output.Array.new.204) // call Array.new 1
@Output.Array.new.204 // call Array.new // push RIP
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
@Array.new // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-5705) pop local 1
@LCL // pop local 1
D=M
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

// (-5707) push local 2
@LCL // push local 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5709) push static 6
@19 // push static 6 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5711) add
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

// (-5713) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5715) pop temp 0
@5 // pop temp 0
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

// (-5717) pop pointer 1
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

// (-5719) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5721) pop that 0
@THAT // pop that 0
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

// (-5723) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5725) pop local 3
@LCL // pop local 3
D=M
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

// (-5727) label WHILE_EXP1
(Output.WHILE_EXP1) // label WHILE_EXP1

// (-5730) push local 3
@LCL // push local 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5732) push constant 11
@11 // push constant 11
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5734) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_205
D;JLT
(JLT_FALSE_205)
@0
D=A // d = false
@JLT_END_205
0;JMP
(JLT_TRUE_205)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_205)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-5739) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-5741) if-goto WHILE_END1
@0 // if-goto WHILE_END1
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
@Output.WHILE_END1
D;JNE // jump if not zero

// (-5743) push local 3
@LCL // push local 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5745) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5747) add
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

// (-5749) push local 3
@LCL // push local 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5751) push local 0
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

// (-5753) add
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

// (-5755) pop pointer 1
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

// (-5757) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5759) push constant 256
@256 // push constant 256
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5762) call Math.multiply 2
(Output.Math.multiply.206) // call Math.multiply 2
@Output.Math.multiply.206 // call Math.multiply // push RIP
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

// (-5764) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5766) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5768) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5770) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5772) push constant 0 // local(4) init
@0 // push constant 0 // local(4) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@10 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@99 // prologue_size
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@5 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Math.multiply // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-5774) pop temp 0
@5 // pop temp 0
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

// (-5776) pop pointer 1
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

// (-5778) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5780) pop that 0
@THAT // pop that 0
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

// (-5782) push local 3
@LCL // push local 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5784) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5786) add
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

// (-5788) pop local 3
@LCL // pop local 3
D=M
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

// (-5790) goto WHILE_EXP1
@Output.WHILE_EXP1 // goto WHILE_EXP1
0;JMP // unconditional jump

// (-5792) label WHILE_END1
(Output.WHILE_END1) // label WHILE_END1

// (-5795) push local 2
@LCL // push local 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5797) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5799) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_207
D;JEQ
(EQ_FALSE_207)
@0
D=A // d = false
@EQ_END_207
0;JMP
(EQ_TRUE_207)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_207)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-5804) if-goto IF_TRUE0
@0 // if-goto IF_TRUE0
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
@Output.IF_TRUE0
D;JNE // jump if not zero

// (-5806) goto IF_FALSE0
@Output.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-5808) label IF_TRUE0
(Output.IF_TRUE0) // label IF_TRUE0

// (-5811) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5813) pop local 2
@LCL // pop local 2
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

// (-5815) goto IF_END0
@Output.IF_END0 // goto IF_END0
0;JMP // unconditional jump

// (-5817) label IF_FALSE0
(Output.IF_FALSE0) // label IF_FALSE0

// (-5820) push local 2
@LCL // push local 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5822) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5824) add
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

// (-5826) pop local 2
@LCL // pop local 2
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

// (-5828) label IF_END0
(Output.IF_END0) // label IF_END0

// (-5831) goto WHILE_EXP0
@Output.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-5833) label WHILE_END0
(Output.WHILE_END0) // label WHILE_END0

// (-5836) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5838) return

// (-5840) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-5842) function Output.getMap 1
(Output.getMap) // function Output.getMap 1

// (-5845) push argument 0
@ARG // push argument 0 // function Output.getMap 1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-5847) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5849) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_208
D;JLT
(JLT_FALSE_208)
@0
D=A // d = false
@JLT_END_208
0;JMP
(JLT_TRUE_208)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_208)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-5854) push argument 0
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

// (-5856) push constant 126
@126 // push constant 126
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5858) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_209
D;JGT
(JGT_FALSE_209)
@0
D=A // d = false
@JGT_END_209
0;JMP
(JGT_TRUE_209)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_209)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-5863) or
@SP // or
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M|D
@SP
M=M+1

// (-5865) if-goto IF_TRUE0
@0 // if-goto IF_TRUE0
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
@Output.IF_TRUE0
D;JNE // jump if not zero

// (-5867) goto IF_FALSE0
@Output.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-5869) label IF_TRUE0
(Output.IF_TRUE0) // label IF_TRUE0

// (-5872) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5874) pop argument 0
@ARG // pop argument 0
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

// (-5876) label IF_FALSE0
(Output.IF_FALSE0) // label IF_FALSE0

// (-5879) push static 2
@19 // push static 2 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5881) if-goto IF_TRUE1
@0 // if-goto IF_TRUE1
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
@Output.IF_TRUE1
D;JNE // jump if not zero

// (-5883) goto IF_FALSE1
@Output.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-5885) label IF_TRUE1
(Output.IF_TRUE1) // label IF_TRUE1

// (-5888) push argument 0
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

// (-5890) push static 5
@19 // push static 5 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5892) add
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

// (-5894) pop pointer 1
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

// (-5896) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5898) pop local 0
@LCL // pop local 0
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

// (-5900) goto IF_END1
@Output.IF_END1 // goto IF_END1
0;JMP // unconditional jump

// (-5902) label IF_FALSE1
(Output.IF_FALSE1) // label IF_FALSE1

// (-5905) push argument 0
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

// (-5907) push static 6
@19 // push static 6 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5909) add
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

// (-5911) pop pointer 1
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

// (-5913) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5915) pop local 0
@LCL // pop local 0
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

// (-5917) label IF_END1
(Output.IF_END1) // label IF_END1

// (-5920) push local 0
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

// (-5922) return

// (-5924) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-5926) function Output.drawChar 4
(Output.drawChar) // function Output.drawChar 4

// (-5929) push argument 0
@ARG // push argument 0 // function Output.drawChar 4
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-5932) call Output.getMap 1
(Output.Output.getMap.210) // call Output.getMap 1
@Output.Output.getMap.210 // call Output.getMap // push RIP
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

// (-5934) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@6 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@71 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@6 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@6 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@1 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.getMap // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-5936) pop local 2
@LCL // pop local 2
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

// (-5938) push static 1
@19 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5940) pop local 0
@LCL // pop local 0
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

// (-5942) label WHILE_EXP0
(Output.WHILE_EXP0) // label WHILE_EXP0

// (-5945) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5947) push constant 11
@11 // push constant 11
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5949) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_211
D;JLT
(JLT_FALSE_211)
@0
D=A // d = false
@JLT_END_211
0;JMP
(JLT_TRUE_211)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_211)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-5954) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-5956) if-goto WHILE_END0
@0 // if-goto WHILE_END0
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
@Output.WHILE_END0
D;JNE // jump if not zero

// (-5958) push static 2
@19 // push static 2 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5960) if-goto IF_TRUE0
@0 // if-goto IF_TRUE0
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
@Output.IF_TRUE0
D;JNE // jump if not zero

// (-5962) goto IF_FALSE0
@Output.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-5964) label IF_TRUE0
(Output.IF_TRUE0) // label IF_TRUE0

// (-5967) push local 0
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

// (-5969) push static 4
@19 // push static 4 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5971) add
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

// (-5973) pop pointer 1
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

// (-5975) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5977) push constant 256
@256 // push constant 256
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5979) neg
@SP // neg
M=M-1
A=M
M=-M
@SP
M=M+1

// (-5981) and
@SP // and
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1

// (-5983) pop local 3
@LCL // pop local 3
D=M
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

// (-5985) goto IF_END0
@Output.IF_END0 // goto IF_END0
0;JMP // unconditional jump

// (-5987) label IF_FALSE0
(Output.IF_FALSE0) // label IF_FALSE0

// (-5990) push local 0
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

// (-5992) push static 4
@19 // push static 4 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5994) add
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

// (-5996) pop pointer 1
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

// (-5998) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6000) push constant 255
@255 // push constant 255
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6002) and
@SP // and
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1

// (-6004) pop local 3
@LCL // pop local 3
D=M
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

// (-6006) label IF_END0
(Output.IF_END0) // label IF_END0

// (-6009) push local 0
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

// (-6011) push static 4
@19 // push static 4 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6013) add
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

// (-6015) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6017) push local 2
@LCL // push local 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6019) add
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

// (-6021) pop pointer 1
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

// (-6023) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6025) push local 3
@LCL // push local 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6027) or
@SP // or
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M|D
@SP
M=M+1

// (-6029) pop temp 0
@5 // pop temp 0
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

// (-6031) pop pointer 1
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

// (-6033) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6035) pop that 0
@THAT // pop that 0
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

// (-6037) push local 0
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

// (-6039) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6041) add
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

// (-6043) pop local 0
@LCL // pop local 0
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

// (-6045) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6047) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6049) add
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

// (-6051) pop local 1
@LCL // pop local 1
D=M
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

// (-6053) goto WHILE_EXP0
@Output.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-6055) label WHILE_END0
(Output.WHILE_END0) // label WHILE_END0

// (-6058) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6060) return

// (-6062) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-6064) function Output.moveCursor 0
(Output.moveCursor) // function Output.moveCursor 0

// (-6067) push argument 0
@ARG // push argument 0 // function Output.moveCursor 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-6069) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6071) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_212
D;JLT
(JLT_FALSE_212)
@0
D=A // d = false
@JLT_END_212
0;JMP
(JLT_TRUE_212)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_212)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6076) push argument 0
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

// (-6078) push constant 22
@22 // push constant 22
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6080) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_213
D;JGT
(JGT_FALSE_213)
@0
D=A // d = false
@JGT_END_213
0;JMP
(JGT_TRUE_213)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_213)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6085) or
@SP // or
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M|D
@SP
M=M+1

// (-6087) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6089) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6091) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_214
D;JLT
(JLT_FALSE_214)
@0
D=A // d = false
@JLT_END_214
0;JMP
(JLT_TRUE_214)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_214)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6096) or
@SP // or
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M|D
@SP
M=M+1

// (-6098) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6100) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6102) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_215
D;JGT
(JGT_FALSE_215)
@0
D=A // d = false
@JGT_END_215
0;JMP
(JGT_TRUE_215)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_215)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6107) or
@SP // or
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M|D
@SP
M=M+1

// (-6109) if-goto IF_TRUE0
@0 // if-goto IF_TRUE0
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
@Output.IF_TRUE0
D;JNE // jump if not zero

// (-6111) goto IF_FALSE0
@Output.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-6113) label IF_TRUE0
(Output.IF_TRUE0) // label IF_TRUE0

// (-6116) push constant 20
@20 // push constant 20
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6119) call Sys.error 1
(Output.Sys.error.216) // call Sys.error 1
@Output.Sys.error.216 // call Sys.error // push RIP
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
@Sys.error // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-6121) pop temp 0
@5 // pop temp 0
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

// (-6123) label IF_FALSE0
(Output.IF_FALSE0) // label IF_FALSE0

// (-6126) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6128) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6131) call Math.divide 2
(Output.Math.divide.217) // call Math.divide 2
@Output.Math.divide.217 // call Math.divide // push RIP
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

// (-6133) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6135) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6137) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6139) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@9 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@92 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@9 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@9 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@4 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Math.divide // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-6141) pop static 0
@19 // pop static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
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

// (-6143) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6145) push argument 0
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

// (-6147) push constant 352
@352 // push constant 352
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6150) call Math.multiply 2
(Output.Math.multiply.218) // call Math.multiply 2
@Output.Math.multiply.218 // call Math.multiply // push RIP
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

// (-6152) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6154) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6156) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6158) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6160) push constant 0 // local(4) init
@0 // push constant 0 // local(4) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@10 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@99 // prologue_size
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@5 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Math.multiply // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-6162) add
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

// (-6164) push static 0
@19 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6166) add
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

// (-6168) pop static 1
@19 // pop static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
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

// (-6170) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6172) push static 0
@19 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6174) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6177) call Math.multiply 2
(Output.Math.multiply.219) // call Math.multiply 2
@Output.Math.multiply.219 // call Math.multiply // push RIP
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

// (-6179) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6181) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6183) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6185) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6187) push constant 0 // local(4) init
@0 // push constant 0 // local(4) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@10 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@99 // prologue_size
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@5 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Math.multiply // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-6189) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_220
D;JEQ
(EQ_FALSE_220)
@0
D=A // d = false
@EQ_END_220
0;JMP
(EQ_TRUE_220)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_220)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6194) pop static 2
@19 // pop static 2 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
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

// (-6196) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6199) call Output.drawChar 1
(Output.Output.drawChar.221) // call Output.drawChar 1
@Output.Output.drawChar.221 // call Output.drawChar // push RIP
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

// (-6201) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6203) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6205) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6207) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@9 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@92 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@9 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@9 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@1 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@4 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.drawChar // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-6209) pop temp 0
@5 // pop temp 0
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

// (-6211) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6213) return

// (-6215) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-6217) function Output.printChar 0
(Output.printChar) // function Output.printChar 0

// (-6220) push argument 0
@ARG // push argument 0 // function Output.printChar 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-6223) call String.newLine 0
(Output.String.newLine.222) // call String.newLine 0

// (-6225) push constant 9999 // call String.newLine // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call String.newLine // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Output.String.newLine.222 // push RIP
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
@71 // prologue_size
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
@String.newLine // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-6227) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_223
D;JEQ
(EQ_FALSE_223)
@0
D=A // d = false
@EQ_END_223
0;JMP
(EQ_TRUE_223)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_223)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6232) if-goto IF_TRUE0
@0 // if-goto IF_TRUE0
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
@Output.IF_TRUE0
D;JNE // jump if not zero

// (-6234) goto IF_FALSE0
@Output.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-6236) label IF_TRUE0
(Output.IF_TRUE0) // label IF_TRUE0

// (-6240) call Output.println 0
(Output.Output.println.224) // call Output.println 0

// (-6242) push constant 9999 // call Output.println // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Output.println // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Output.Output.println.224 // push RIP
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
@71 // prologue_size
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
@Output.println // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-6244) pop temp 0
@5 // pop temp 0
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

// (-6246) goto IF_END0
@Output.IF_END0 // goto IF_END0
0;JMP // unconditional jump

// (-6248) label IF_FALSE0
(Output.IF_FALSE0) // label IF_FALSE0

// (-6251) push argument 0
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

// (-6254) call String.backSpace 0
(Output.String.backSpace.225) // call String.backSpace 0

// (-6256) push constant 9999 // call String.backSpace // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call String.backSpace // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Output.String.backSpace.225 // push RIP
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
@71 // prologue_size
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
@String.backSpace // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-6258) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_226
D;JEQ
(EQ_FALSE_226)
@0
D=A // d = false
@EQ_END_226
0;JMP
(EQ_TRUE_226)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_226)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6263) if-goto IF_TRUE1
@0 // if-goto IF_TRUE1
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
@Output.IF_TRUE1
D;JNE // jump if not zero

// (-6265) goto IF_FALSE1
@Output.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-6267) label IF_TRUE1
(Output.IF_TRUE1) // label IF_TRUE1

// (-6271) call Output.backSpace 0
(Output.Output.backSpace.227) // call Output.backSpace 0

// (-6273) push constant 9999 // call Output.backSpace // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Output.backSpace // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Output.Output.backSpace.227 // push RIP
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
@71 // prologue_size
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
@Output.backSpace // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-6275) pop temp 0
@5 // pop temp 0
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

// (-6277) goto IF_END1
@Output.IF_END1 // goto IF_END1
0;JMP // unconditional jump

// (-6279) label IF_FALSE1
(Output.IF_FALSE1) // label IF_FALSE1

// (-6282) push argument 0
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

// (-6285) call Output.drawChar 1
(Output.Output.drawChar.228) // call Output.drawChar 1
@Output.Output.drawChar.228 // call Output.drawChar // push RIP
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

// (-6287) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6289) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6291) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6293) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@9 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@92 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@9 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@9 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@1 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@4 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.drawChar // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-6295) pop temp 0
@5 // pop temp 0
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

// (-6297) push static 2
@19 // push static 2 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6299) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-6301) if-goto IF_TRUE2
@0 // if-goto IF_TRUE2
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
@Output.IF_TRUE2
D;JNE // jump if not zero

// (-6303) goto IF_FALSE2
@Output.IF_FALSE2 // goto IF_FALSE2
0;JMP // unconditional jump

// (-6305) label IF_TRUE2
(Output.IF_TRUE2) // label IF_TRUE2

// (-6308) push static 0
@19 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6310) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6312) add
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

// (-6314) pop static 0
@19 // pop static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
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

// (-6316) push static 1
@19 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6318) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6320) add
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

// (-6322) pop static 1
@19 // pop static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
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

// (-6324) label IF_FALSE2
(Output.IF_FALSE2) // label IF_FALSE2

// (-6327) push static 0
@19 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6329) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6331) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_229
D;JEQ
(EQ_FALSE_229)
@0
D=A // d = false
@EQ_END_229
0;JMP
(EQ_TRUE_229)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_229)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6336) if-goto IF_TRUE3
@0 // if-goto IF_TRUE3
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
@Output.IF_TRUE3
D;JNE // jump if not zero

// (-6338) goto IF_FALSE3
@Output.IF_FALSE3 // goto IF_FALSE3
0;JMP // unconditional jump

// (-6340) label IF_TRUE3
(Output.IF_TRUE3) // label IF_TRUE3

// (-6344) call Output.println 0
(Output.Output.println.230) // call Output.println 0

// (-6346) push constant 9999 // call Output.println // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Output.println // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Output.Output.println.230 // push RIP
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
@71 // prologue_size
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
@Output.println // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-6348) pop temp 0
@5 // pop temp 0
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

// (-6350) goto IF_END3
@Output.IF_END3 // goto IF_END3
0;JMP // unconditional jump

// (-6352) label IF_FALSE3
(Output.IF_FALSE3) // label IF_FALSE3

// (-6355) push static 2
@19 // push static 2 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6357) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-6359) pop static 2
@19 // pop static 2 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
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

// (-6361) label IF_END3
(Output.IF_END3) // label IF_END3

// (-6364) label IF_END1
(Output.IF_END1) // label IF_END1

// (-6367) label IF_END0
(Output.IF_END0) // label IF_END0

// (-6370) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6372) return

// (-6374) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-6376) function Output.printString 2
(Output.printString) // function Output.printString 2

// (-6379) push argument 0
@ARG // push argument 0 // function Output.printString 2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-6382) call String.length 1
(Output.String.length.231) // call String.length 1
@Output.String.length.231 // call String.length // push RIP
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
@String.length // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-6384) pop local 1
@LCL // pop local 1
D=M
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

// (-6386) label WHILE_EXP0
(Output.WHILE_EXP0) // label WHILE_EXP0

// (-6389) push local 0
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

// (-6391) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6393) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_232
D;JLT
(JLT_FALSE_232)
@0
D=A // d = false
@JLT_END_232
0;JMP
(JLT_TRUE_232)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_232)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6398) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-6400) if-goto WHILE_END0
@0 // if-goto WHILE_END0
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
@Output.WHILE_END0
D;JNE // jump if not zero

// (-6402) push argument 0
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

// (-6404) push local 0
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

// (-6407) call String.charAt 2
(Output.String.charAt.233) // call String.charAt 2
@Output.String.charAt.233 // call String.charAt // push RIP
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@0 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@String.charAt // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-6410) call Output.printChar 1
(Output.Output.printChar.234) // call Output.printChar 1
@Output.Output.printChar.234 // call Output.printChar // push RIP
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
@Output.printChar // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-6412) pop temp 0
@5 // pop temp 0
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

// (-6414) push local 0
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

// (-6416) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6418) add
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

// (-6420) pop local 0
@LCL // pop local 0
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

// (-6422) goto WHILE_EXP0
@Output.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-6424) label WHILE_END0
(Output.WHILE_END0) // label WHILE_END0

// (-6427) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6429) return

// (-6431) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-6433) function Output.printInt 0
(Output.printInt) // function Output.printInt 0

// (-6436) push static 3
@19 // push static 3 // function Output.printInt 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-6438) push argument 0
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

// (-6441) call String.setInt 2
(Output.String.setInt.235) // call String.setInt 2
@Output.String.setInt.235 // call String.setInt // push RIP
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

// (-6443) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6445) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6447) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6449) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@9 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@92 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@9 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@9 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@4 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@String.setInt // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-6451) pop temp 0
@5 // pop temp 0
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

// (-6453) push static 3
@19 // push static 3 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6456) call Output.printString 1
(Output.Output.printString.236) // call Output.printString 1
@Output.Output.printString.236 // call Output.printString // push RIP
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

// (-6458) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6460) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@7 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@78 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@7 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@7 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@1 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@2 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.printString // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-6462) pop temp 0
@5 // pop temp 0
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

// (-6464) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6466) return

// (-6468) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-6470) function Output.println 0
(Output.println) // function Output.println 0

// (-6473) push static 1
@19 // push static 1 // function Output.println 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-6475) push constant 352
@352 // push constant 352
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6477) add
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

// (-6479) push static 0
@19 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6481) sub
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

// (-6483) pop static 1
@19 // pop static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
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

// (-6485) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6487) pop static 0
@19 // pop static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
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

// (-6489) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6491) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-6493) pop static 2
@19 // pop static 2 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
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

// (-6495) push static 1
@19 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6497) push constant 8128
@8128 // push constant 8128
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6499) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_237
D;JEQ
(EQ_FALSE_237)
@0
D=A // d = false
@EQ_END_237
0;JMP
(EQ_TRUE_237)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_237)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6504) if-goto IF_TRUE0
@0 // if-goto IF_TRUE0
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
@Output.IF_TRUE0
D;JNE // jump if not zero

// (-6506) goto IF_FALSE0
@Output.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-6508) label IF_TRUE0
(Output.IF_TRUE0) // label IF_TRUE0

// (-6511) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6513) pop static 1
@19 // pop static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
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

// (-6515) label IF_FALSE0
(Output.IF_FALSE0) // label IF_FALSE0

// (-6518) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6520) return

// (-6522) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-6524) function Output.backSpace 0
(Output.backSpace) // function Output.backSpace 0

// (-6527) push static 2
@19 // push static 2 // function Output.backSpace 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-6529) if-goto IF_TRUE0
@0 // if-goto IF_TRUE0
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
@Output.IF_TRUE0
D;JNE // jump if not zero

// (-6531) goto IF_FALSE0
@Output.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-6533) label IF_TRUE0
(Output.IF_TRUE0) // label IF_TRUE0

// (-6536) push static 0
@19 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6538) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6540) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_238
D;JGT
(JGT_FALSE_238)
@0
D=A // d = false
@JGT_END_238
0;JMP
(JGT_TRUE_238)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_238)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6545) if-goto IF_TRUE1
@0 // if-goto IF_TRUE1
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
@Output.IF_TRUE1
D;JNE // jump if not zero

// (-6547) goto IF_FALSE1
@Output.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-6549) label IF_TRUE1
(Output.IF_TRUE1) // label IF_TRUE1

// (-6552) push static 0
@19 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6554) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6556) sub
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

// (-6558) pop static 0
@19 // pop static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
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

// (-6560) push static 1
@19 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6562) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6564) sub
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

// (-6566) pop static 1
@19 // pop static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
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

// (-6568) goto IF_END1
@Output.IF_END1 // goto IF_END1
0;JMP // unconditional jump

// (-6570) label IF_FALSE1
(Output.IF_FALSE1) // label IF_FALSE1

// (-6573) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6575) pop static 0
@19 // pop static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
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

// (-6577) push static 1
@19 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6579) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6581) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_239
D;JEQ
(EQ_FALSE_239)
@0
D=A // d = false
@EQ_END_239
0;JMP
(EQ_TRUE_239)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_239)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6586) if-goto IF_TRUE2
@0 // if-goto IF_TRUE2
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
@Output.IF_TRUE2
D;JNE // jump if not zero

// (-6588) goto IF_FALSE2
@Output.IF_FALSE2 // goto IF_FALSE2
0;JMP // unconditional jump

// (-6590) label IF_TRUE2
(Output.IF_TRUE2) // label IF_TRUE2

// (-6593) push constant 8128
@8128 // push constant 8128
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6595) pop static 1
@19 // pop static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
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

// (-6597) label IF_FALSE2
(Output.IF_FALSE2) // label IF_FALSE2

// (-6600) push static 1
@19 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6602) push constant 321
@321 // push constant 321
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6604) sub
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

// (-6606) pop static 1
@19 // pop static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
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

// (-6608) label IF_END1
(Output.IF_END1) // label IF_END1

// (-6611) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6613) pop static 2
@19 // pop static 2 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
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

// (-6615) goto IF_END0
@Output.IF_END0 // goto IF_END0
0;JMP // unconditional jump

// (-6617) label IF_FALSE0
(Output.IF_FALSE0) // label IF_FALSE0

// (-6620) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6622) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-6624) pop static 2
@19 // pop static 2 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Output.vm)
D=A
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

// (-6626) label IF_END0
(Output.IF_END0) // label IF_END0

// (-6629) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6632) call Output.drawChar 1
(Output.Output.drawChar.240) // call Output.drawChar 1
@Output.Output.drawChar.240 // call Output.drawChar // push RIP
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

// (-6634) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6636) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6638) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6640) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@9 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@92 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@9 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@9 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@1 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@4 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Output.drawChar // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-6642) pop temp 0
@5 // pop temp 0
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

// (-6644) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6646) return

// (-6648) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-6650) function Screen.init 1
(Screen.init) // function Screen.init 1

// (-6653) push constant 16384
@16384 // push constant 16384 // function Screen.init 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-6655) pop static 1
@26 // pop static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Screen.vm)
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

// (-6657) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6659) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-6661) pop static 2
@26 // pop static 2 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Screen.vm)
D=A
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

// (-6663) push constant 17
@17 // push constant 17
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6666) call Array.new 1
(Screen.Array.new.241) // call Array.new 1
@Screen.Array.new.241 // call Array.new // push RIP
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
@Array.new // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-6668) pop static 0
@26 // pop static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Screen.vm)
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

// (-6670) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6672) push static 0
@26 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Screen.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6674) add
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

// (-6676) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6678) pop temp 0
@5 // pop temp 0
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

// (-6680) pop pointer 1
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

// (-6682) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6684) pop that 0
@THAT // pop that 0
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

// (-6686) label WHILE_EXP0
(Screen.WHILE_EXP0) // label WHILE_EXP0

// (-6689) push local 0
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

// (-6691) push constant 16
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6693) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_242
D;JLT
(JLT_FALSE_242)
@0
D=A // d = false
@JLT_END_242
0;JMP
(JLT_TRUE_242)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_242)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6698) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-6700) if-goto WHILE_END0
@0 // if-goto WHILE_END0
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
@Screen.WHILE_END0
D;JNE // jump if not zero

// (-6702) push local 0
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

// (-6704) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6706) add
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

// (-6708) pop local 0
@LCL // pop local 0
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

// (-6710) push local 0
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

// (-6712) push static 0
@26 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Screen.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6714) add
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

// (-6716) push local 0
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

// (-6718) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6720) sub
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

// (-6722) push static 0
@26 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Screen.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6724) add
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

// (-6726) pop pointer 1
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

// (-6728) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6730) push local 0
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

// (-6732) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6734) sub
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

// (-6736) push static 0
@26 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Screen.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6738) add
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

// (-6740) pop pointer 1
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

// (-6742) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6744) add
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

// (-6746) pop temp 0
@5 // pop temp 0
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

// (-6748) pop pointer 1
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

// (-6750) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6752) pop that 0
@THAT // pop that 0
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

// (-6754) goto WHILE_EXP0
@Screen.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-6756) label WHILE_END0
(Screen.WHILE_END0) // label WHILE_END0

// (-6759) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6761) return

// (-6763) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-6765) function Screen.clearScreen 1
(Screen.clearScreen) // function Screen.clearScreen 1

// (-6768) label WHILE_EXP0
(Screen.WHILE_EXP0) // label WHILE_EXP0

// (-6771) push local 0
@LCL // push local 0 // function Screen.clearScreen 1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-6773) push constant 8192
@8192 // push constant 8192
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6775) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_243
D;JLT
(JLT_FALSE_243)
@0
D=A // d = false
@JLT_END_243
0;JMP
(JLT_TRUE_243)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_243)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6780) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-6782) if-goto WHILE_END0
@0 // if-goto WHILE_END0
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
@Screen.WHILE_END0
D;JNE // jump if not zero

// (-6784) push local 0
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

// (-6786) push static 1
@26 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Screen.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6788) add
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

// (-6790) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6792) pop temp 0
@5 // pop temp 0
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

// (-6794) pop pointer 1
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

// (-6796) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6798) pop that 0
@THAT // pop that 0
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

// (-6800) push local 0
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

// (-6802) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6804) add
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

// (-6806) pop local 0
@LCL // pop local 0
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

// (-6808) goto WHILE_EXP0
@Screen.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-6810) label WHILE_END0
(Screen.WHILE_END0) // label WHILE_END0

// (-6813) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6815) return

// (-6817) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-6819) function Screen.updateLocation 0
(Screen.updateLocation) // function Screen.updateLocation 0

// (-6822) push static 2
@26 // push static 2 // function Screen.updateLocation 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Screen.vm)
D=A
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-6824) if-goto IF_TRUE0
@0 // if-goto IF_TRUE0
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
@Screen.IF_TRUE0
D;JNE // jump if not zero

// (-6826) goto IF_FALSE0
@Screen.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-6828) label IF_TRUE0
(Screen.IF_TRUE0) // label IF_TRUE0

// (-6831) push argument 0
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

// (-6833) push static 1
@26 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Screen.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6835) add
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

// (-6837) push argument 0
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

// (-6839) push static 1
@26 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Screen.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6841) add
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

// (-6843) pop pointer 1
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

// (-6845) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6847) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6849) or
@SP // or
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M|D
@SP
M=M+1

// (-6851) pop temp 0
@5 // pop temp 0
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

// (-6853) pop pointer 1
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

// (-6855) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6857) pop that 0
@THAT // pop that 0
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

// (-6859) goto IF_END0
@Screen.IF_END0 // goto IF_END0
0;JMP // unconditional jump

// (-6861) label IF_FALSE0
(Screen.IF_FALSE0) // label IF_FALSE0

// (-6864) push argument 0
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

// (-6866) push static 1
@26 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Screen.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6868) add
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

// (-6870) push argument 0
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

// (-6872) push static 1
@26 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Screen.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6874) add
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

// (-6876) pop pointer 1
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

// (-6878) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6880) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6882) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-6884) and
@SP // and
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1

// (-6886) pop temp 0
@5 // pop temp 0
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

// (-6888) pop pointer 1
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

// (-6890) push temp 0
@5 // push temp 0
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6892) pop that 0
@THAT // pop that 0
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

// (-6894) label IF_END0
(Screen.IF_END0) // label IF_END0

// (-6897) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6899) return

// (-6901) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-6903) function Screen.setColor 0
(Screen.setColor) // function Screen.setColor 0

// (-6906) push argument 0
@ARG // push argument 0 // function Screen.setColor 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-6908) pop static 2
@26 // pop static 2 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Screen.vm)
D=A
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

// (-6910) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6912) return

// (-6914) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-6916) function Screen.drawPixel 3
(Screen.drawPixel) // function Screen.drawPixel 3

// (-6919) push argument 0
@ARG // push argument 0 // function Screen.drawPixel 3
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-6921) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6923) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_244
D;JLT
(JLT_FALSE_244)
@0
D=A // d = false
@JLT_END_244
0;JMP
(JLT_TRUE_244)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_244)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6928) push argument 0
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

// (-6930) push constant 511
@511 // push constant 511
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6932) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_245
D;JGT
(JGT_FALSE_245)
@0
D=A // d = false
@JGT_END_245
0;JMP
(JGT_TRUE_245)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_245)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6937) or
@SP // or
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M|D
@SP
M=M+1

// (-6939) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6941) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6943) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_246
D;JLT
(JLT_FALSE_246)
@0
D=A // d = false
@JLT_END_246
0;JMP
(JLT_TRUE_246)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_246)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6948) or
@SP // or
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M|D
@SP
M=M+1

// (-6950) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6952) push constant 255
@255 // push constant 255
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6954) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_247
D;JGT
(JGT_FALSE_247)
@0
D=A // d = false
@JGT_END_247
0;JMP
(JGT_TRUE_247)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_247)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6959) or
@SP // or
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M|D
@SP
M=M+1

// (-6961) if-goto IF_TRUE0
@0 // if-goto IF_TRUE0
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
@Screen.IF_TRUE0
D;JNE // jump if not zero

// (-6963) goto IF_FALSE0
@Screen.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-6965) label IF_TRUE0
(Screen.IF_TRUE0) // label IF_TRUE0

// (-6968) push constant 7
@7 // push constant 7
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6971) call Sys.error 1
(Screen.Sys.error.248) // call Sys.error 1
@Screen.Sys.error.248 // call Sys.error // push RIP
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
@Sys.error // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-6973) pop temp 0
@5 // pop temp 0
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

// (-6975) label IF_FALSE0
(Screen.IF_FALSE0) // label IF_FALSE0

// (-6978) push argument 0
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

// (-6980) push constant 16
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6983) call Math.divide 2
(Screen.Math.divide.249) // call Math.divide 2
@Screen.Math.divide.249 // call Math.divide // push RIP
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

// (-6985) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6987) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6989) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6991) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@9 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@92 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@9 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@9 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@4 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Math.divide // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-6993) pop local 0
@LCL // pop local 0
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

// (-6995) push argument 0
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

// (-6997) push local 0
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

// (-6999) push constant 16
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7002) call Math.multiply 2
(Screen.Math.multiply.250) // call Math.multiply 2
@Screen.Math.multiply.250 // call Math.multiply // push RIP
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

// (-7004) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7006) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7008) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7010) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7012) push constant 0 // local(4) init
@0 // push constant 0 // local(4) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@10 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@99 // prologue_size
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@5 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Math.multiply // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-7014) sub
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

// (-7016) pop local 1
@LCL // pop local 1
D=M
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

// (-7018) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7020) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7023) call Math.multiply 2
(Screen.Math.multiply.251) // call Math.multiply 2
@Screen.Math.multiply.251 // call Math.multiply // push RIP
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

// (-7025) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7027) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7029) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7031) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7033) push constant 0 // local(4) init
@0 // push constant 0 // local(4) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@10 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@99 // prologue_size
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@5 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Math.multiply // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-7035) push local 0
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

// (-7037) add
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

// (-7039) pop local 2
@LCL // pop local 2
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

// (-7041) push local 2
@LCL // push local 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7043) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7045) push static 0
@26 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Screen.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7047) add
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

// (-7049) pop pointer 1
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

// (-7051) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7054) call Screen.updateLocation 2
(Screen.Screen.updateLocation.252) // call Screen.updateLocation 2
@Screen.Screen.updateLocation.252 // call Screen.updateLocation // push RIP
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@0 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Screen.updateLocation // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-7056) pop temp 0
@5 // pop temp 0
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

// (-7058) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7060) return

// (-7062) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-7064) function Screen.drawConditional 0
(Screen.drawConditional) // function Screen.drawConditional 0

// (-7067) push argument 2
@ARG // push argument 2 // function Screen.drawConditional 0
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-7069) if-goto IF_TRUE0
@0 // if-goto IF_TRUE0
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
@Screen.IF_TRUE0
D;JNE // jump if not zero

// (-7071) goto IF_FALSE0
@Screen.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-7073) label IF_TRUE0
(Screen.IF_TRUE0) // label IF_TRUE0

// (-7076) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7078) push argument 0
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

// (-7081) call Screen.drawPixel 2
(Screen.Screen.drawPixel.253) // call Screen.drawPixel 2
@Screen.Screen.drawPixel.253 // call Screen.drawPixel // push RIP
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

// (-7083) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7085) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7087) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@8 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@85 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@8 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@8 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@3 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Screen.drawPixel // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-7089) pop temp 0
@5 // pop temp 0
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

// (-7091) goto IF_END0
@Screen.IF_END0 // goto IF_END0
0;JMP // unconditional jump

// (-7093) label IF_FALSE0
(Screen.IF_FALSE0) // label IF_FALSE0

// (-7096) push argument 0
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

// (-7098) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7101) call Screen.drawPixel 2
(Screen.Screen.drawPixel.254) // call Screen.drawPixel 2
@Screen.Screen.drawPixel.254 // call Screen.drawPixel // push RIP
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

// (-7103) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7105) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7107) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@8 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@85 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@8 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@8 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@3 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Screen.drawPixel // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-7109) pop temp 0
@5 // pop temp 0
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

// (-7111) label IF_END0
(Screen.IF_END0) // label IF_END0

// (-7114) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7116) return

// (-7118) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-7120) function Screen.drawLine 11
(Screen.drawLine) // function Screen.drawLine 11

// (-7123) push argument 0
@ARG // push argument 0 // function Screen.drawLine 11
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-7125) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7127) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_255
D;JLT
(JLT_FALSE_255)
@0
D=A // d = false
@JLT_END_255
0;JMP
(JLT_TRUE_255)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_255)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7132) push argument 2
@ARG // push argument 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7134) push constant 511
@511 // push constant 511
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7136) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_256
D;JGT
(JGT_FALSE_256)
@0
D=A // d = false
@JGT_END_256
0;JMP
(JGT_TRUE_256)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_256)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7141) or
@SP // or
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M|D
@SP
M=M+1

// (-7143) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7145) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7147) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_257
D;JLT
(JLT_FALSE_257)
@0
D=A // d = false
@JLT_END_257
0;JMP
(JLT_TRUE_257)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_257)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7152) or
@SP // or
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M|D
@SP
M=M+1

// (-7154) push argument 3
@ARG // push argument 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7156) push constant 255
@255 // push constant 255
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7158) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_258
D;JGT
(JGT_FALSE_258)
@0
D=A // d = false
@JGT_END_258
0;JMP
(JGT_TRUE_258)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_258)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7163) or
@SP // or
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M|D
@SP
M=M+1

// (-7165) if-goto IF_TRUE0
@0 // if-goto IF_TRUE0
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
@Screen.IF_TRUE0
D;JNE // jump if not zero

// (-7167) goto IF_FALSE0
@Screen.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-7169) label IF_TRUE0
(Screen.IF_TRUE0) // label IF_TRUE0

// (-7172) push constant 8
@8 // push constant 8
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7175) call Sys.error 1
(Screen.Sys.error.259) // call Sys.error 1
@Screen.Sys.error.259 // call Sys.error // push RIP
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
@Sys.error // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-7177) pop temp 0
@5 // pop temp 0
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

// (-7179) label IF_FALSE0
(Screen.IF_FALSE0) // label IF_FALSE0

// (-7182) push argument 2
@ARG // push argument 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7184) push argument 0
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

// (-7186) sub
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

// (-7189) call Math.abs 1
(Screen.Math.abs.260) // call Math.abs 1
@Screen.Math.abs.260 // call Math.abs // push RIP
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
@Math.abs // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-7191) pop local 3
@LCL // pop local 3
D=M
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

// (-7193) push argument 3
@ARG // push argument 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7195) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7197) sub
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

// (-7200) call Math.abs 1
(Screen.Math.abs.261) // call Math.abs 1
@Screen.Math.abs.261 // call Math.abs // push RIP
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
@Math.abs // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-7202) pop local 2
@LCL // pop local 2
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

// (-7204) push local 3
@LCL // push local 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7206) push local 2
@LCL // push local 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7208) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_262
D;JLT
(JLT_FALSE_262)
@0
D=A // d = false
@JLT_END_262
0;JMP
(JLT_TRUE_262)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_262)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7213) pop local 6
@LCL // pop local 6
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

// (-7215) push local 6
@LCL // push local 6
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7217) push argument 3
@ARG // push argument 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7219) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7221) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_263
D;JLT
(JLT_FALSE_263)
@0
D=A // d = false
@JLT_END_263
0;JMP
(JLT_TRUE_263)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_263)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7226) and
@SP // and
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1

// (-7228) push local 6
@LCL // push local 6
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7230) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-7232) push argument 2
@ARG // push argument 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7234) push argument 0
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

// (-7236) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_264
D;JLT
(JLT_FALSE_264)
@0
D=A // d = false
@JLT_END_264
0;JMP
(JLT_TRUE_264)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_264)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7241) and
@SP // and
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1

// (-7243) or
@SP // or
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M|D
@SP
M=M+1

// (-7245) if-goto IF_TRUE1
@0 // if-goto IF_TRUE1
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
@Screen.IF_TRUE1
D;JNE // jump if not zero

// (-7247) goto IF_FALSE1
@Screen.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-7249) label IF_TRUE1
(Screen.IF_TRUE1) // label IF_TRUE1

// (-7252) push argument 0
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

// (-7254) pop local 4
@LCL // pop local 4
D=M
@4 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
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

// (-7256) push argument 2
@ARG // push argument 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7258) pop argument 0
@ARG // pop argument 0
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

// (-7260) push local 4
@LCL // push local 4
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7262) pop argument 2
@ARG // pop argument 2
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

// (-7264) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7266) pop local 4
@LCL // pop local 4
D=M
@4 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
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

// (-7268) push argument 3
@ARG // push argument 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7270) pop argument 1
@ARG // pop argument 1
D=M
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

// (-7272) push local 4
@LCL // push local 4
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7274) pop argument 3
@ARG // pop argument 3
D=M
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

// (-7276) label IF_FALSE1
(Screen.IF_FALSE1) // label IF_FALSE1

// (-7279) push local 6
@LCL // push local 6
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7281) if-goto IF_TRUE2
@0 // if-goto IF_TRUE2
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
@Screen.IF_TRUE2
D;JNE // jump if not zero

// (-7283) goto IF_FALSE2
@Screen.IF_FALSE2 // goto IF_FALSE2
0;JMP // unconditional jump

// (-7285) label IF_TRUE2
(Screen.IF_TRUE2) // label IF_TRUE2

// (-7288) push local 3
@LCL // push local 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7290) pop local 4
@LCL // pop local 4
D=M
@4 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
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

// (-7292) push local 2
@LCL // push local 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7294) pop local 3
@LCL // pop local 3
D=M
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

// (-7296) push local 4
@LCL // push local 4
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7298) pop local 2
@LCL // pop local 2
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

// (-7300) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7302) pop local 1
@LCL // pop local 1
D=M
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

// (-7304) push argument 0
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

// (-7306) pop local 0
@LCL // pop local 0
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

// (-7308) push argument 3
@ARG // push argument 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7310) pop local 8
@LCL // pop local 8
D=M
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

// (-7312) push argument 0
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

// (-7314) push argument 2
@ARG // push argument 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7316) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_265
D;JGT
(JGT_FALSE_265)
@0
D=A // d = false
@JGT_END_265
0;JMP
(JGT_TRUE_265)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_265)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7321) pop local 7
@LCL // pop local 7
D=M
@7 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
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

// (-7323) goto IF_END2
@Screen.IF_END2 // goto IF_END2
0;JMP // unconditional jump

// (-7325) label IF_FALSE2
(Screen.IF_FALSE2) // label IF_FALSE2

// (-7328) push argument 0
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

// (-7330) pop local 1
@LCL // pop local 1
D=M
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

// (-7332) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7334) pop local 0
@LCL // pop local 0
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

// (-7336) push argument 2
@ARG // push argument 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7338) pop local 8
@LCL // pop local 8
D=M
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

// (-7340) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7342) push argument 3
@ARG // push argument 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7344) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_266
D;JGT
(JGT_FALSE_266)
@0
D=A // d = false
@JGT_END_266
0;JMP
(JGT_TRUE_266)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_266)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7349) pop local 7
@LCL // pop local 7
D=M
@7 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
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

// (-7351) label IF_END2
(Screen.IF_END2) // label IF_END2

// (-7354) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7356) push local 2
@LCL // push local 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7359) call Math.multiply 2
(Screen.Math.multiply.267) // call Math.multiply 2
@Screen.Math.multiply.267 // call Math.multiply // push RIP
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

// (-7361) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7363) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7365) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7367) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7369) push constant 0 // local(4) init
@0 // push constant 0 // local(4) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@10 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@99 // prologue_size
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@5 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Math.multiply // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-7371) push local 3
@LCL // push local 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7373) sub
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

// (-7375) pop local 5
@LCL // pop local 5
D=M
@5 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
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

// (-7377) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7379) push local 2
@LCL // push local 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7382) call Math.multiply 2
(Screen.Math.multiply.268) // call Math.multiply 2
@Screen.Math.multiply.268 // call Math.multiply // push RIP
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

// (-7384) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7386) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7388) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7390) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7392) push constant 0 // local(4) init
@0 // push constant 0 // local(4) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@10 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@99 // prologue_size
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@5 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Math.multiply // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-7394) pop local 9
@LCL // pop local 9
D=M
@9 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
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

// (-7396) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7398) push local 2
@LCL // push local 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7400) push local 3
@LCL // push local 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7402) sub
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

// (-7405) call Math.multiply 2
(Screen.Math.multiply.269) // call Math.multiply 2
@Screen.Math.multiply.269 // call Math.multiply // push RIP
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

// (-7407) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7409) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7411) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7413) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7415) push constant 0 // local(4) init
@0 // push constant 0 // local(4) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@10 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@99 // prologue_size
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@5 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Math.multiply // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-7417) pop local 10
@LCL // pop local 10
D=M
@10 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
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

// (-7419) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7421) push local 0
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

// (-7423) push local 6
@LCL // push local 6
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7426) call Screen.drawConditional 3
(Screen.Screen.drawConditional.270) // call Screen.drawConditional 3
@Screen.Screen.drawConditional.270 // call Screen.drawConditional // push RIP
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
@3 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@0 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Screen.drawConditional // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-7428) pop temp 0
@5 // pop temp 0
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

// (-7430) label WHILE_EXP0
(Screen.WHILE_EXP0) // label WHILE_EXP0

// (-7433) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7435) push local 8
@LCL // push local 8
D=M
@8
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7437) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_271
D;JLT
(JLT_FALSE_271)
@0
D=A // d = false
@JLT_END_271
0;JMP
(JLT_TRUE_271)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_271)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7442) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-7444) if-goto WHILE_END0
@0 // if-goto WHILE_END0
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
@Screen.WHILE_END0
D;JNE // jump if not zero

// (-7446) push local 5
@LCL // push local 5
D=M
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7448) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7450) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_272
D;JLT
(JLT_FALSE_272)
@0
D=A // d = false
@JLT_END_272
0;JMP
(JLT_TRUE_272)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_272)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7455) if-goto IF_TRUE3
@0 // if-goto IF_TRUE3
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
@Screen.IF_TRUE3
D;JNE // jump if not zero

// (-7457) goto IF_FALSE3
@Screen.IF_FALSE3 // goto IF_FALSE3
0;JMP // unconditional jump

// (-7459) label IF_TRUE3
(Screen.IF_TRUE3) // label IF_TRUE3

// (-7462) push local 5
@LCL // push local 5
D=M
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7464) push local 9
@LCL // push local 9
D=M
@9
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7466) add
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

// (-7468) pop local 5
@LCL // pop local 5
D=M
@5 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
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

// (-7470) goto IF_END3
@Screen.IF_END3 // goto IF_END3
0;JMP // unconditional jump

// (-7472) label IF_FALSE3
(Screen.IF_FALSE3) // label IF_FALSE3

// (-7475) push local 5
@LCL // push local 5
D=M
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7477) push local 10
@LCL // push local 10
D=M
@10
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7479) add
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

// (-7481) pop local 5
@LCL // pop local 5
D=M
@5 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
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

// (-7483) push local 7
@LCL // push local 7
D=M
@7
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7485) if-goto IF_TRUE4
@0 // if-goto IF_TRUE4
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
@Screen.IF_TRUE4
D;JNE // jump if not zero

// (-7487) goto IF_FALSE4
@Screen.IF_FALSE4 // goto IF_FALSE4
0;JMP // unconditional jump

// (-7489) label IF_TRUE4
(Screen.IF_TRUE4) // label IF_TRUE4

// (-7492) push local 0
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

// (-7494) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7496) sub
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

// (-7498) pop local 0
@LCL // pop local 0
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

// (-7500) goto IF_END4
@Screen.IF_END4 // goto IF_END4
0;JMP // unconditional jump

// (-7502) label IF_FALSE4
(Screen.IF_FALSE4) // label IF_FALSE4

// (-7505) push local 0
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

// (-7507) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7509) add
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

// (-7511) pop local 0
@LCL // pop local 0
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

// (-7513) label IF_END4
(Screen.IF_END4) // label IF_END4

// (-7516) label IF_END3
(Screen.IF_END3) // label IF_END3

// (-7519) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7521) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7523) add
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

// (-7525) pop local 1
@LCL // pop local 1
D=M
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

// (-7527) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7529) push local 0
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

// (-7531) push local 6
@LCL // push local 6
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7534) call Screen.drawConditional 3
(Screen.Screen.drawConditional.273) // call Screen.drawConditional 3
@Screen.Screen.drawConditional.273 // call Screen.drawConditional // push RIP
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
@3 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@0 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Screen.drawConditional // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-7536) pop temp 0
@5 // pop temp 0
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

// (-7538) goto WHILE_EXP0
@Screen.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-7540) label WHILE_END0
(Screen.WHILE_END0) // label WHILE_END0

// (-7543) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7545) return

// (-7547) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-7549) function Screen.drawRectangle 9
(Screen.drawRectangle) // function Screen.drawRectangle 9

// (-7552) push argument 0
@ARG // push argument 0 // function Screen.drawRectangle 9
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-7554) push argument 2
@ARG // push argument 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7556) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_274
D;JGT
(JGT_FALSE_274)
@0
D=A // d = false
@JGT_END_274
0;JMP
(JGT_TRUE_274)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_274)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7561) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7563) push argument 3
@ARG // push argument 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7565) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_275
D;JGT
(JGT_FALSE_275)
@0
D=A // d = false
@JGT_END_275
0;JMP
(JGT_TRUE_275)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_275)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7570) or
@SP // or
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M|D
@SP
M=M+1

// (-7572) push argument 0
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

// (-7574) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7576) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_276
D;JLT
(JLT_FALSE_276)
@0
D=A // d = false
@JLT_END_276
0;JMP
(JLT_TRUE_276)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_276)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7581) or
@SP // or
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M|D
@SP
M=M+1

// (-7583) push argument 2
@ARG // push argument 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7585) push constant 511
@511 // push constant 511
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7587) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_277
D;JGT
(JGT_FALSE_277)
@0
D=A // d = false
@JGT_END_277
0;JMP
(JGT_TRUE_277)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_277)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7592) or
@SP // or
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M|D
@SP
M=M+1

// (-7594) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7596) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7598) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_278
D;JLT
(JLT_FALSE_278)
@0
D=A // d = false
@JLT_END_278
0;JMP
(JLT_TRUE_278)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_278)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7603) or
@SP // or
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M|D
@SP
M=M+1

// (-7605) push argument 3
@ARG // push argument 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7607) push constant 255
@255 // push constant 255
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7609) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_279
D;JGT
(JGT_FALSE_279)
@0
D=A // d = false
@JGT_END_279
0;JMP
(JGT_TRUE_279)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_279)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7614) or
@SP // or
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M|D
@SP
M=M+1

// (-7616) if-goto IF_TRUE0
@0 // if-goto IF_TRUE0
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
@Screen.IF_TRUE0
D;JNE // jump if not zero

// (-7618) goto IF_FALSE0
@Screen.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-7620) label IF_TRUE0
(Screen.IF_TRUE0) // label IF_TRUE0

// (-7623) push constant 9
@9 // push constant 9
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7626) call Sys.error 1
(Screen.Sys.error.280) // call Sys.error 1
@Screen.Sys.error.280 // call Sys.error // push RIP
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
@Sys.error // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-7628) pop temp 0
@5 // pop temp 0
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

// (-7630) label IF_FALSE0
(Screen.IF_FALSE0) // label IF_FALSE0

// (-7633) push argument 0
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

// (-7635) push constant 16
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7638) call Math.divide 2
(Screen.Math.divide.281) // call Math.divide 2
@Screen.Math.divide.281 // call Math.divide // push RIP
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

// (-7640) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7642) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7644) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7646) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@9 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@92 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@9 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@9 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@4 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Math.divide // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-7648) pop local 3
@LCL // pop local 3
D=M
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

// (-7650) push argument 0
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

// (-7652) push local 3
@LCL // push local 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7654) push constant 16
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7657) call Math.multiply 2
(Screen.Math.multiply.282) // call Math.multiply 2
@Screen.Math.multiply.282 // call Math.multiply // push RIP
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

// (-7659) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7661) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7663) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7665) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7667) push constant 0 // local(4) init
@0 // push constant 0 // local(4) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@10 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@99 // prologue_size
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@5 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Math.multiply // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-7669) sub
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

// (-7671) pop local 7
@LCL // pop local 7
D=M
@7 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
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

// (-7673) push argument 2
@ARG // push argument 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7675) push constant 16
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7678) call Math.divide 2
(Screen.Math.divide.283) // call Math.divide 2
@Screen.Math.divide.283 // call Math.divide // push RIP
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

// (-7680) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7682) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7684) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7686) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@9 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@92 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@9 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@9 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@4 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Math.divide // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-7688) pop local 4
@LCL // pop local 4
D=M
@4 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
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

// (-7690) push argument 2
@ARG // push argument 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7692) push local 4
@LCL // push local 4
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7694) push constant 16
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7697) call Math.multiply 2
(Screen.Math.multiply.284) // call Math.multiply 2
@Screen.Math.multiply.284 // call Math.multiply // push RIP
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

// (-7699) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7701) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7703) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7705) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7707) push constant 0 // local(4) init
@0 // push constant 0 // local(4) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@10 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@99 // prologue_size
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@5 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Math.multiply // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-7709) sub
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

// (-7711) pop local 8
@LCL // pop local 8
D=M
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

// (-7713) push local 7
@LCL // push local 7
D=M
@7
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7715) push static 0
@26 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Screen.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7717) add
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

// (-7719) pop pointer 1
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

// (-7721) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7723) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7725) sub
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

// (-7727) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-7729) pop local 6
@LCL // pop local 6
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

// (-7731) push local 8
@LCL // push local 8
D=M
@8
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7733) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7735) add
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

// (-7737) push static 0
@26 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Screen.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7739) add
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

// (-7741) pop pointer 1
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

// (-7743) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7745) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7747) sub
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

// (-7749) pop local 5
@LCL // pop local 5
D=M
@5 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
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

// (-7751) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7753) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7756) call Math.multiply 2
(Screen.Math.multiply.285) // call Math.multiply 2
@Screen.Math.multiply.285 // call Math.multiply // push RIP
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

// (-7758) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7760) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7762) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7764) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7766) push constant 0 // local(4) init
@0 // push constant 0 // local(4) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@10 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@99 // prologue_size
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@5 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Math.multiply // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-7768) push local 3
@LCL // push local 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7770) add
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

// (-7772) pop local 0
@LCL // pop local 0
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

// (-7774) push local 4
@LCL // push local 4
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7776) push local 3
@LCL // push local 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7778) sub
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

// (-7780) pop local 2
@LCL // pop local 2
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

// (-7782) label WHILE_EXP0
(Screen.WHILE_EXP0) // label WHILE_EXP0

// (-7785) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7787) push argument 3
@ARG // push argument 3
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7789) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_286
D;JGT
(JGT_FALSE_286)
@0
D=A // d = false
@JGT_END_286
0;JMP
(JGT_TRUE_286)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_286)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7794) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-7796) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-7798) if-goto WHILE_END0
@0 // if-goto WHILE_END0
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
@Screen.WHILE_END0
D;JNE // jump if not zero

// (-7800) push local 0
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

// (-7802) push local 2
@LCL // push local 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7804) add
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

// (-7806) pop local 1
@LCL // pop local 1
D=M
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

// (-7808) push local 2
@LCL // push local 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7810) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7812) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_287
D;JEQ
(EQ_FALSE_287)
@0
D=A // d = false
@EQ_END_287
0;JMP
(EQ_TRUE_287)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_287)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7817) if-goto IF_TRUE1
@0 // if-goto IF_TRUE1
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
@Screen.IF_TRUE1
D;JNE // jump if not zero

// (-7819) goto IF_FALSE1
@Screen.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-7821) label IF_TRUE1
(Screen.IF_TRUE1) // label IF_TRUE1

// (-7824) push local 0
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

// (-7826) push local 5
@LCL // push local 5
D=M
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7828) push local 6
@LCL // push local 6
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7830) and
@SP // and
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1

// (-7833) call Screen.updateLocation 2
(Screen.Screen.updateLocation.288) // call Screen.updateLocation 2
@Screen.Screen.updateLocation.288 // call Screen.updateLocation // push RIP
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@0 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Screen.updateLocation // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-7835) pop temp 0
@5 // pop temp 0
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

// (-7837) goto IF_END1
@Screen.IF_END1 // goto IF_END1
0;JMP // unconditional jump

// (-7839) label IF_FALSE1
(Screen.IF_FALSE1) // label IF_FALSE1

// (-7842) push local 0
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

// (-7844) push local 6
@LCL // push local 6
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7847) call Screen.updateLocation 2
(Screen.Screen.updateLocation.289) // call Screen.updateLocation 2
@Screen.Screen.updateLocation.289 // call Screen.updateLocation // push RIP
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@0 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Screen.updateLocation // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-7849) pop temp 0
@5 // pop temp 0
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

// (-7851) push local 0
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

// (-7853) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7855) add
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

// (-7857) pop local 0
@LCL // pop local 0
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

// (-7859) label WHILE_EXP1
(Screen.WHILE_EXP1) // label WHILE_EXP1

// (-7862) push local 0
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

// (-7864) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7866) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_290
D;JLT
(JLT_FALSE_290)
@0
D=A // d = false
@JLT_END_290
0;JMP
(JLT_TRUE_290)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_290)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7871) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-7873) if-goto WHILE_END1
@0 // if-goto WHILE_END1
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
@Screen.WHILE_END1
D;JNE // jump if not zero

// (-7875) push local 0
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

// (-7877) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7879) neg
@SP // neg
M=M-1
A=M
M=-M
@SP
M=M+1

// (-7882) call Screen.updateLocation 2
(Screen.Screen.updateLocation.291) // call Screen.updateLocation 2
@Screen.Screen.updateLocation.291 // call Screen.updateLocation // push RIP
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@0 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Screen.updateLocation // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-7884) pop temp 0
@5 // pop temp 0
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

// (-7886) push local 0
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

// (-7888) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7890) add
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

// (-7892) pop local 0
@LCL // pop local 0
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

// (-7894) goto WHILE_EXP1
@Screen.WHILE_EXP1 // goto WHILE_EXP1
0;JMP // unconditional jump

// (-7896) label WHILE_END1
(Screen.WHILE_END1) // label WHILE_END1

// (-7899) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7901) push local 5
@LCL // push local 5
D=M
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7904) call Screen.updateLocation 2
(Screen.Screen.updateLocation.292) // call Screen.updateLocation 2
@Screen.Screen.updateLocation.292 // call Screen.updateLocation // push RIP
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@0 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Screen.updateLocation // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-7906) pop temp 0
@5 // pop temp 0
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

// (-7908) label IF_END1
(Screen.IF_END1) // label IF_END1

// (-7911) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7913) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7915) add
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

// (-7917) pop argument 1
@ARG // pop argument 1
D=M
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

// (-7919) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7921) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7923) add
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

// (-7925) push local 2
@LCL // push local 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7927) sub
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

// (-7929) pop local 0
@LCL // pop local 0
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

// (-7931) goto WHILE_EXP0
@Screen.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-7933) label WHILE_END0
(Screen.WHILE_END0) // label WHILE_END0

// (-7936) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7938) return

// (-7940) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
@ARG // pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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
@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1
D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter
@SP // *esp // as the intent is to discard everything after result at this point
M=D // [esp] = *ARG[0]+1
@LCL // *LCL // return: restore caller stack (THAT)
A=M-1 // *LCL-1 (**THAT)
D=M // d = [LCL-1] (*THAT)
@THAT
M=D // [THAT] = [LCL-1] (*THAT)
@2 // return: restore caller stack (THIS)
D=A // d=2
@LCL // *LCL 
A=M-D // *LCL-2 (**THIS)
D=M // d = [LCL-2] (*THIS)
@THIS
M=D // [THIS] = [LCL-2] (*THIS)
@3 // return: restore caller stack (ARG)
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
@4 // return: restore caller stack (LCL)
D=A // d=4
@LCL // *LCL 
A=M-D // *LCL-4 (**LCL)
D=M // d = [LCL-4] (*LCL)
@LCL
M=D // [LCL] = [LCL-4] (*LCL)
@5 // return: unconditional jump to LCL-5 (RIP)
D=A // d=5
@R13 // *R13 (old *LCL)
A=M-D // *LCL-5 (*LCL)
A=M // d = [LCL-5] (*LCL)
0;JMP // return (jump to RIP)

// (-7942) function Screen.drawHorizontal 11
(Screen.drawHorizontal) // function Screen.drawHorizontal 11

// (-7945) push argument 1
@ARG // push argument 1 // function Screen.drawHorizontal 11
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-7947) push argument 2
@ARG // push argument 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7950) call Math.min 2
(Screen.Math.min.293) // call Math.min 2
@Screen.Math.min.293 // call Math.min // push RIP
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@0 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Math.min // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-7952) pop local 7
@LCL // pop local 7
D=M
@7 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
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

// (-7954) push argument 1
@ARG // push argument 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7956) push argument 2
@ARG // push argument 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7959) call Math.max 2
(Screen.Math.max.294) // call Math.max 2
@Screen.Math.max.294 // call Math.max // push RIP
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@0 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Math.max // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-7961) pop local 8
@LCL // pop local 8
D=M
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

// (-7963) push argument 0
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

// (-7965) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7967) neg
@SP // neg
M=M-1
A=M
M=-M
@SP
M=M+1

// (-7969) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_295
D;JGT
(JGT_FALSE_295)
@0
D=A // d = false
@JGT_END_295
0;JMP
(JGT_TRUE_295)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_295)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7974) push argument 0
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

// (-7976) push constant 256
@256 // push constant 256
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7978) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_296
D;JLT
(JLT_FALSE_296)
@0
D=A // d = false
@JLT_END_296
0;JMP
(JLT_TRUE_296)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_296)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7983) and
@SP // and
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1

// (-7985) push local 7
@LCL // push local 7
D=M
@7
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7987) push constant 512
@512 // push constant 512
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7989) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_297
D;JLT
(JLT_FALSE_297)
@0
D=A // d = false
@JLT_END_297
0;JMP
(JLT_TRUE_297)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_297)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7994) and
@SP // and
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1

// (-7996) push local 8
@LCL // push local 8
D=M
@8
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7998) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8000) neg
@SP // neg
M=M-1
A=M
M=-M
@SP
M=M+1

// (-8002) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_298
D;JGT
(JGT_FALSE_298)
@0
D=A // d = false
@JGT_END_298
0;JMP
(JGT_TRUE_298)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_298)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-8007) and
@SP // and
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1

// (-8009) if-goto IF_TRUE0
@0 // if-goto IF_TRUE0
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
@Screen.IF_TRUE0
D;JNE // jump if not zero

// (-8011) goto IF_FALSE0
@Screen.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-8013) label IF_TRUE0
(Screen.IF_TRUE0) // label IF_TRUE0

// (-8016) push local 7
@LCL // push local 7
D=M
@7
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8018) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8021) call Math.max 2
(Screen.Math.max.299) // call Math.max 2
@Screen.Math.max.299 // call Math.max // push RIP
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@0 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Math.max // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-8023) pop local 7
@LCL // pop local 7
D=M
@7 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
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

// (-8025) push local 8
@LCL // push local 8
D=M
@8
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8027) push constant 511
@511 // push constant 511
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8030) call Math.min 2
(Screen.Math.min.300) // call Math.min 2
@Screen.Math.min.300 // call Math.min // push RIP
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@0 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Math.min // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-8032) pop local 8
@LCL // pop local 8
D=M
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

// (-8034) push local 7
@LCL // push local 7
D=M
@7
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8036) push constant 16
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8039) call Math.divide 2
(Screen.Math.divide.301) // call Math.divide 2
@Screen.Math.divide.301 // call Math.divide // push RIP
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

// (-8041) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8043) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8045) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8047) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@9 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@92 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@9 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@9 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@4 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Math.divide // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-8049) pop local 1
@LCL // pop local 1
D=M
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

// (-8051) push local 7
@LCL // push local 7
D=M
@7
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8053) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8055) push constant 16
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8058) call Math.multiply 2
(Screen.Math.multiply.302) // call Math.multiply 2
@Screen.Math.multiply.302 // call Math.multiply // push RIP
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

// (-8060) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8062) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8064) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8066) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8068) push constant 0 // local(4) init
@0 // push constant 0 // local(4) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@10 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@99 // prologue_size
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@5 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Math.multiply // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-8070) sub
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

// (-8072) pop local 9
@LCL // pop local 9
D=M
@9 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
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

// (-8074) push local 8
@LCL // push local 8
D=M
@8
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8076) push constant 16
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8079) call Math.divide 2
(Screen.Math.divide.303) // call Math.divide 2
@Screen.Math.divide.303 // call Math.divide // push RIP
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

// (-8081) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8083) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8085) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8087) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@9 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@92 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@9 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@9 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@4 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Math.divide // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-8089) pop local 2
@LCL // pop local 2
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

// (-8091) push local 8
@LCL // push local 8
D=M
@8
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8093) push local 2
@LCL // push local 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8095) push constant 16
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8098) call Math.multiply 2
(Screen.Math.multiply.304) // call Math.multiply 2
@Screen.Math.multiply.304 // call Math.multiply // push RIP
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

// (-8100) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8102) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8104) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8106) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8108) push constant 0 // local(4) init
@0 // push constant 0 // local(4) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@10 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@99 // prologue_size
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@5 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Math.multiply // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-8110) sub
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

// (-8112) pop local 10
@LCL // pop local 10
D=M
@10 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
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

// (-8114) push local 9
@LCL // push local 9
D=M
@9
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8116) push static 0
@26 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Screen.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8118) add
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

// (-8120) pop pointer 1
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

// (-8122) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8124) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8126) sub
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

// (-8128) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-8130) pop local 5
@LCL // pop local 5
D=M
@5 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
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

// (-8132) push local 10
@LCL // push local 10
D=M
@10
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8134) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8136) add
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

// (-8138) push static 0
@26 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\List\Screen.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8140) add
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

// (-8142) pop pointer 1
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

// (-8144) push that 0
@THAT // push that 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8146) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8148) sub
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

// (-8150) pop local 4
@LCL // pop local 4
D=M
@4 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
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

// (-8152) push argument 0
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

// (-8154) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8157) call Math.multiply 2
(Screen.Math.multiply.305) // call Math.multiply 2
@Screen.Math.multiply.305 // call Math.multiply // push RIP
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

// (-8159) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8161) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8163) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8165) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8167) push constant 0 // local(4) init
@0 // push constant 0 // local(4) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@10 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@99 // prologue_size
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@5 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Math.multiply // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-8169) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8171) add
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

// (-8173) pop local 0
@LCL // pop local 0
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

// (-8175) push local 2
@LCL // push local 2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8177) push local 1
@LCL // push local 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8179) sub
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

// (-8181) pop local 6
@LCL // pop local 6
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

// (-8183) push local 0
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

// (-8185) push local 6
@LCL // push local 6
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8187) add
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

// (-8189) pop local 3
@LCL // pop local 3
D=M
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

// (-8191) push local 6
@LCL // push local 6
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8193) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8195) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_306
D;JEQ
(EQ_FALSE_306)
@0
D=A // d = false
@EQ_END_306
0;JMP
(EQ_TRUE_306)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_306)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-8200) if-goto IF_TRUE1
@0 // if-goto IF_TRUE1
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
@Screen.IF_TRUE1
D;JNE // jump if not zero

// (-8202) goto IF_FALSE1
@Screen.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-8204) label IF_TRUE1
(Screen.IF_TRUE1) // label IF_TRUE1

// (-8207) push local 0
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

// (-8209) push local 4
@LCL // push local 4
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8211) push local 5
@LCL // push local 5
D=M
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8213) and
@SP // and
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1

// (-8216) call Screen.updateLocation 2
(Screen.Screen.updateLocation.307) // call Screen.updateLocation 2
@Screen.Screen.updateLocation.307 // call Screen.updateLocation // push RIP
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@0 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Screen.updateLocation // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-8218) pop temp 0
@5 // pop temp 0
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

// (-8220) goto IF_END1
@Screen.IF_END1 // goto IF_END1
0;JMP // unconditional jump

// (-8222) label IF_FALSE1
(Screen.IF_FALSE1) // label IF_FALSE1

// (-8225) push local 0
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

// (-8227) push local 5
@LCL // push local 5
D=M
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8230) call Screen.updateLocation 2
(Screen.Screen.updateLocation.308) // call Screen.updateLocation 2
@Screen.Screen.updateLocation.308 // call Screen.updateLocation // push RIP
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@0 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Screen.updateLocation // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-8232) pop temp 0
@5 // pop temp 0
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

// (-8234) push local 0
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

// (-8236) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8238) add
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

// (-8240) pop local 0
@LCL // pop local 0
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

// (-8242) label WHILE_EXP0
(Screen.WHILE_EXP0) // label WHILE_EXP0

// (-8245) push local 0
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

// (-8247) push local 3
@LCL // push local 3
D=M
@3
D=M