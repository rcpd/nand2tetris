
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

// (-245) call SquareGame.new 0
(main.SquareGame.new.19) // call SquareGame.new 0 // function Main.main 1

// (-247) push constant 9999 // call SquareGame.new // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call SquareGame.new // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@main.SquareGame.new.19 // push RIP
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
@SquareGame.new // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)
// (-249) pop local 0
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

// (-251) push local 0
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

// (-254) call SquareGame.run 1
(main.SquareGame.run.20) // call SquareGame.run 1
@main.SquareGame.run.20 // call SquareGame.run // push RIP
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

// (-256) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-258) push constant 0 // local(1) init
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
@SquareGame.run // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-260) pop temp 0
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

// (-262) push local 0
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

// (-265) call SquareGame.dispose 1
(main.SquareGame.dispose.21) // call SquareGame.dispose 1
@main.SquareGame.dispose.21 // call SquareGame.dispose // push RIP
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
@SquareGame.dispose // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-267) pop temp 0
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

// (-269) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-271) return

// (-273) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-275) function Square.new 0
(Square.new) // function Square.new 0

// (-278) push constant 3
@3 // push constant 3 // function Square.new 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-281) call Memory.alloc 1
(Square.Memory.alloc.22) // call Memory.alloc 1
@Square.Memory.alloc.22 // call Memory.alloc // push RIP
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

// (-283) push constant 0 // local(0) init
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

// (-285) pop pointer 0
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

// (-287) push argument 0
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

// (-289) pop this 0
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

// (-291) push argument 1
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

// (-293) pop this 1
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

// (-295) push argument 2
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

// (-297) pop this 2
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

// (-299) push pointer 0
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

// (-302) call Square.draw 1
(Square.Square.draw.23) // call Square.draw 1
@Square.Square.draw.23 // call Square.draw // push RIP
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
@Square.draw // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-304) pop temp 0
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

// (-306) push pointer 0
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

// (-308) return

// (-310) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-312) function Square.dispose 0
(Square.dispose) // function Square.dispose 0

// (-315) push argument 0
@ARG // push argument 0 // function Square.dispose 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-317) pop pointer 0
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

// (-319) push pointer 0
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

// (-322) call Memory.deAlloc 1
(Square.Memory.deAlloc.24) // call Memory.deAlloc 1
@Square.Memory.deAlloc.24 // call Memory.deAlloc // push RIP
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

// (-324) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-326) push constant 0 // local(1) init
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

// (-328) pop temp 0
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

// (-330) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-332) return

// (-334) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-336) function Square.draw 0
(Square.draw) // function Square.draw 0

// (-339) push argument 0
@ARG // push argument 0 // function Square.draw 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-341) pop pointer 0
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

// (-343) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-345) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-348) call Screen.setColor 1
(Square.Screen.setColor.25) // call Screen.setColor 1
@Square.Screen.setColor.25 // call Screen.setColor // push RIP
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
@Screen.setColor // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-350) pop temp 0
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

// (-352) push this 0
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

// (-354) push this 1
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

// (-356) push this 0
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

// (-358) push this 2
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

// (-360) add
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

// (-362) push this 1
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

// (-364) push this 2
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

// (-366) add
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

// (-369) call Screen.drawRectangle 4
(Square.Screen.drawRectangle.26) // call Screen.drawRectangle 4
@Square.Screen.drawRectangle.26 // call Screen.drawRectangle // push RIP
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

// (-371) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-373) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-375) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-377) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-379) push constant 0 // local(4) init
@0 // push constant 0 // local(4) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-381) push constant 0 // local(5) init
@0 // push constant 0 // local(5) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-383) push constant 0 // local(6) init
@0 // push constant 0 // local(6) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-385) push constant 0 // local(7) init
@0 // push constant 0 // local(7) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-387) push constant 0 // local(8) init
@0 // push constant 0 // local(8) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@14 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@127 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@14 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@14 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@4 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@9 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Screen.drawRectangle // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-389) pop temp 0
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

// (-391) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-393) return

// (-395) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-397) function Square.erase 0
(Square.erase) // function Square.erase 0

// (-400) push argument 0
@ARG // push argument 0 // function Square.erase 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-402) pop pointer 0
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

// (-404) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-407) call Screen.setColor 1
(Square.Screen.setColor.27) // call Screen.setColor 1
@Square.Screen.setColor.27 // call Screen.setColor // push RIP
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
@Screen.setColor // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-409) pop temp 0
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

// (-411) push this 0
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

// (-413) push this 1
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

// (-415) push this 0
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

// (-417) push this 2
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

// (-419) add
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

// (-421) push this 1
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

// (-423) push this 2
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

// (-425) add
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

// (-428) call Screen.drawRectangle 4
(Square.Screen.drawRectangle.28) // call Screen.drawRectangle 4
@Square.Screen.drawRectangle.28 // call Screen.drawRectangle // push RIP
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

// (-430) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-432) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-434) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-436) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-438) push constant 0 // local(4) init
@0 // push constant 0 // local(4) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-440) push constant 0 // local(5) init
@0 // push constant 0 // local(5) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-442) push constant 0 // local(6) init
@0 // push constant 0 // local(6) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-444) push constant 0 // local(7) init
@0 // push constant 0 // local(7) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-446) push constant 0 // local(8) init
@0 // push constant 0 // local(8) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@14 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@127 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@14 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@14 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@4 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@9 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Screen.drawRectangle // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-448) pop temp 0
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

// (-450) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-452) return

// (-454) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-456) function Square.incSize 0
(Square.incSize) // function Square.incSize 0

// (-459) push argument 0
@ARG // push argument 0 // function Square.incSize 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-461) pop pointer 0
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

// (-463) push this 1
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

// (-465) push this 2
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

// (-467) add
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

// (-469) push constant 254
@254 // push constant 254
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-471) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_29
D;JLT
(JLT_FALSE_29)
@0
D=A // d = false
@JLT_END_29
0;JMP
(JLT_TRUE_29)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_29)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-476) push this 0
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

// (-478) push this 2
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

// (-480) add
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

// (-482) push constant 510
@510 // push constant 510
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-484) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_30
D;JLT
(JLT_FALSE_30)
@0
D=A // d = false
@JLT_END_30
0;JMP
(JLT_TRUE_30)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_30)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-489) and
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

// (-491) if-goto IF_TRUE0
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
@Square.IF_TRUE0
D;JNE // jump if not zero

// (-493) goto IF_FALSE0
@Square.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-495) label IF_TRUE0
(Square.IF_TRUE0) // label IF_TRUE0

// (-498) push pointer 0
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

// (-501) call Square.erase 1
(Square.Square.erase.31) // call Square.erase 1
@Square.Square.erase.31 // call Square.erase // push RIP
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
@Square.erase // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-503) pop temp 0
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

// (-505) push this 2
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

// (-507) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-509) add
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

// (-511) pop this 2
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

// (-513) push pointer 0
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

// (-516) call Square.draw 1
(Square.Square.draw.32) // call Square.draw 1
@Square.Square.draw.32 // call Square.draw // push RIP
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
@Square.draw // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-518) pop temp 0
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

// (-520) label IF_FALSE0
(Square.IF_FALSE0) // label IF_FALSE0

// (-523) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-525) return

// (-527) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-529) function Square.decSize 0
(Square.decSize) // function Square.decSize 0

// (-532) push argument 0
@ARG // push argument 0 // function Square.decSize 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-534) pop pointer 0
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

// (-536) push this 2
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

// (-538) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-540) gt
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

// (-545) if-goto IF_TRUE0
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
@Square.IF_TRUE0
D;JNE // jump if not zero

// (-547) goto IF_FALSE0
@Square.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-549) label IF_TRUE0
(Square.IF_TRUE0) // label IF_TRUE0

// (-552) push pointer 0
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

// (-555) call Square.erase 1
(Square.Square.erase.34) // call Square.erase 1
@Square.Square.erase.34 // call Square.erase // push RIP
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
@Square.erase // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-557) pop temp 0
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

// (-559) push this 2
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

// (-561) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-563) sub
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

// (-565) pop this 2
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

// (-567) push pointer 0
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

// (-570) call Square.draw 1
(Square.Square.draw.35) // call Square.draw 1
@Square.Square.draw.35 // call Square.draw // push RIP
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
@Square.draw // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-572) pop temp 0
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

// (-574) label IF_FALSE0
(Square.IF_FALSE0) // label IF_FALSE0

// (-577) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-579) return

// (-581) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-583) function Square.moveUp 0
(Square.moveUp) // function Square.moveUp 0

// (-586) push argument 0
@ARG // push argument 0 // function Square.moveUp 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-588) pop pointer 0
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

// (-590) push this 1
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

// (-592) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-594) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_36
D;JGT
(JGT_FALSE_36)
@0
D=A // d = false
@JGT_END_36
0;JMP
(JGT_TRUE_36)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_36)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-599) if-goto IF_TRUE0
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
@Square.IF_TRUE0
D;JNE // jump if not zero

// (-601) goto IF_FALSE0
@Square.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-603) label IF_TRUE0
(Square.IF_TRUE0) // label IF_TRUE0

// (-606) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-609) call Screen.setColor 1
(Square.Screen.setColor.37) // call Screen.setColor 1
@Square.Screen.setColor.37 // call Screen.setColor // push RIP
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
@Screen.setColor // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-611) pop temp 0
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

// (-613) push this 0
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

// (-615) push this 1
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

// (-617) push this 2
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

// (-619) add
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

// (-621) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-623) sub
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

// (-625) push this 0
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

// (-627) push this 2
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

// (-629) add
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

// (-631) push this 1
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

// (-633) push this 2
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

// (-635) add
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

// (-638) call Screen.drawRectangle 4
(Square.Screen.drawRectangle.38) // call Screen.drawRectangle 4
@Square.Screen.drawRectangle.38 // call Screen.drawRectangle // push RIP
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

// (-640) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-642) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-644) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-646) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-648) push constant 0 // local(4) init
@0 // push constant 0 // local(4) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-650) push constant 0 // local(5) init
@0 // push constant 0 // local(5) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-652) push constant 0 // local(6) init
@0 // push constant 0 // local(6) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-654) push constant 0 // local(7) init
@0 // push constant 0 // local(7) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-656) push constant 0 // local(8) init
@0 // push constant 0 // local(8) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@14 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@127 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@14 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@14 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@4 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@9 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Screen.drawRectangle // *func (parsed from call <label> <num_args>)
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

// (-660) push this 1
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

// (-662) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-664) sub
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

// (-666) pop this 1
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

// (-668) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-670) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-673) call Screen.setColor 1
(Square.Screen.setColor.39) // call Screen.setColor 1
@Square.Screen.setColor.39 // call Screen.setColor // push RIP
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
@Screen.setColor // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-675) pop temp 0
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

// (-677) push this 0
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

// (-679) push this 1
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

// (-681) push this 0
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

// (-683) push this 2
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

// (-685) add
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

// (-687) push this 1
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

// (-689) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-691) add
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

// (-694) call Screen.drawRectangle 4
(Square.Screen.drawRectangle.40) // call Screen.drawRectangle 4
@Square.Screen.drawRectangle.40 // call Screen.drawRectangle // push RIP
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

// (-696) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-698) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-700) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-702) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-704) push constant 0 // local(4) init
@0 // push constant 0 // local(4) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-706) push constant 0 // local(5) init
@0 // push constant 0 // local(5) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-708) push constant 0 // local(6) init
@0 // push constant 0 // local(6) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-710) push constant 0 // local(7) init
@0 // push constant 0 // local(7) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-712) push constant 0 // local(8) init
@0 // push constant 0 // local(8) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@14 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@127 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@14 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@14 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@4 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@9 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Screen.drawRectangle // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-714) pop temp 0
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

// (-716) label IF_FALSE0
(Square.IF_FALSE0) // label IF_FALSE0

// (-719) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-721) return

// (-723) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-725) function Square.moveDown 0
(Square.moveDown) // function Square.moveDown 0

// (-728) push argument 0
@ARG // push argument 0 // function Square.moveDown 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-730) pop pointer 0
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

// (-732) push this 1
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

// (-734) push this 2
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

// (-736) add
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

// (-738) push constant 254
@254 // push constant 254
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-740) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_41
D;JLT
(JLT_FALSE_41)
@0
D=A // d = false
@JLT_END_41
0;JMP
(JLT_TRUE_41)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_41)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-745) if-goto IF_TRUE0
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
@Square.IF_TRUE0
D;JNE // jump if not zero

// (-747) goto IF_FALSE0
@Square.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-749) label IF_TRUE0
(Square.IF_TRUE0) // label IF_TRUE0

// (-752) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-755) call Screen.setColor 1
(Square.Screen.setColor.42) // call Screen.setColor 1
@Square.Screen.setColor.42 // call Screen.setColor // push RIP
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
@Screen.setColor // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-757) pop temp 0
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

// (-759) push this 0
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

// (-761) push this 1
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

// (-763) push this 0
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

// (-765) push this 2
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

// (-767) add
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

// (-769) push this 1
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

// (-771) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-773) add
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

// (-776) call Screen.drawRectangle 4
(Square.Screen.drawRectangle.43) // call Screen.drawRectangle 4
@Square.Screen.drawRectangle.43 // call Screen.drawRectangle // push RIP
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

// (-778) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-780) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-782) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-784) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-786) push constant 0 // local(4) init
@0 // push constant 0 // local(4) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-788) push constant 0 // local(5) init
@0 // push constant 0 // local(5) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-790) push constant 0 // local(6) init
@0 // push constant 0 // local(6) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-792) push constant 0 // local(7) init
@0 // push constant 0 // local(7) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-794) push constant 0 // local(8) init
@0 // push constant 0 // local(8) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@14 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@127 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@14 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@14 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@4 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@9 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Screen.drawRectangle // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-796) pop temp 0
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

// (-798) push this 1
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

// (-800) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-802) add
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

// (-804) pop this 1
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

// (-806) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-808) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-811) call Screen.setColor 1
(Square.Screen.setColor.44) // call Screen.setColor 1
@Square.Screen.setColor.44 // call Screen.setColor // push RIP
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
@Screen.setColor // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-813) pop temp 0
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

// (-815) push this 0
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

// (-817) push this 1
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

// (-819) push this 2
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

// (-821) add
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

// (-823) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-825) sub
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

// (-827) push this 0
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

// (-829) push this 2
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

// (-831) add
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

// (-833) push this 1
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

// (-835) push this 2
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

// (-837) add
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

// (-840) call Screen.drawRectangle 4
(Square.Screen.drawRectangle.45) // call Screen.drawRectangle 4
@Square.Screen.drawRectangle.45 // call Screen.drawRectangle // push RIP
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

// (-842) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-844) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-846) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-848) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-850) push constant 0 // local(4) init
@0 // push constant 0 // local(4) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-852) push constant 0 // local(5) init
@0 // push constant 0 // local(5) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-854) push constant 0 // local(6) init
@0 // push constant 0 // local(6) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-856) push constant 0 // local(7) init
@0 // push constant 0 // local(7) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-858) push constant 0 // local(8) init
@0 // push constant 0 // local(8) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@14 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@127 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@14 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@14 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@4 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@9 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Screen.drawRectangle // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-860) pop temp 0
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

// (-862) label IF_FALSE0
(Square.IF_FALSE0) // label IF_FALSE0

// (-865) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-867) return

// (-869) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-871) function Square.moveLeft 0
(Square.moveLeft) // function Square.moveLeft 0

// (-874) push argument 0
@ARG // push argument 0 // function Square.moveLeft 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-876) pop pointer 0
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

// (-878) push this 0
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

// (-880) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-882) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_46
D;JGT
(JGT_FALSE_46)
@0
D=A // d = false
@JGT_END_46
0;JMP
(JGT_TRUE_46)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_46)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-887) if-goto IF_TRUE0
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
@Square.IF_TRUE0
D;JNE // jump if not zero

// (-889) goto IF_FALSE0
@Square.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-891) label IF_TRUE0
(Square.IF_TRUE0) // label IF_TRUE0

// (-894) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-897) call Screen.setColor 1
(Square.Screen.setColor.47) // call Screen.setColor 1
@Square.Screen.setColor.47 // call Screen.setColor // push RIP
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
@Screen.setColor // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-899) pop temp 0
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

// (-901) push this 0
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

// (-903) push this 2
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

// (-905) add
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

// (-907) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-909) sub
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

// (-911) push this 1
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

// (-913) push this 0
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

// (-915) push this 2
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

// (-917) add
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

// (-919) push this 1
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

// (-921) push this 2
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

// (-923) add
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

// (-926) call Screen.drawRectangle 4
(Square.Screen.drawRectangle.48) // call Screen.drawRectangle 4
@Square.Screen.drawRectangle.48 // call Screen.drawRectangle // push RIP
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

// (-928) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-930) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-932) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-934) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-936) push constant 0 // local(4) init
@0 // push constant 0 // local(4) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-938) push constant 0 // local(5) init
@0 // push constant 0 // local(5) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-940) push constant 0 // local(6) init
@0 // push constant 0 // local(6) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-942) push constant 0 // local(7) init
@0 // push constant 0 // local(7) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-944) push constant 0 // local(8) init
@0 // push constant 0 // local(8) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@14 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@127 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@14 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@14 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@4 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@9 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Screen.drawRectangle // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-946) pop temp 0
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

// (-948) push this 0
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

// (-950) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-952) sub
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

// (-954) pop this 0
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

// (-956) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-958) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-961) call Screen.setColor 1
(Square.Screen.setColor.49) // call Screen.setColor 1
@Square.Screen.setColor.49 // call Screen.setColor // push RIP
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
@Screen.setColor // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-963) pop temp 0
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

// (-965) push this 0
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

// (-967) push this 1
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

// (-969) push this 0
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

// (-971) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-973) add
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

// (-975) push this 1
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

// (-977) push this 2
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

// (-979) add
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

// (-982) call Screen.drawRectangle 4
(Square.Screen.drawRectangle.50) // call Screen.drawRectangle 4
@Square.Screen.drawRectangle.50 // call Screen.drawRectangle // push RIP
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

// (-984) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-986) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-988) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-990) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-992) push constant 0 // local(4) init
@0 // push constant 0 // local(4) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-994) push constant 0 // local(5) init
@0 // push constant 0 // local(5) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-996) push constant 0 // local(6) init
@0 // push constant 0 // local(6) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-998) push constant 0 // local(7) init
@0 // push constant 0 // local(7) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1000) push constant 0 // local(8) init
@0 // push constant 0 // local(8) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@14 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@127 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@14 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@14 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@4 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@9 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Screen.drawRectangle // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-1002) pop temp 0
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

// (-1004) label IF_FALSE0
(Square.IF_FALSE0) // label IF_FALSE0

// (-1007) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1009) return

// (-1011) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-1013) function Square.moveRight 0
(Square.moveRight) // function Square.moveRight 0

// (-1016) push argument 0
@ARG // push argument 0 // function Square.moveRight 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-1018) pop pointer 0
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

// (-1020) push this 0
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

// (-1022) push this 2
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

// (-1024) add
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

// (-1026) push constant 510
@510 // push constant 510
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1028) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_51
D;JLT
(JLT_FALSE_51)
@0
D=A // d = false
@JLT_END_51
0;JMP
(JLT_TRUE_51)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_51)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1033) if-goto IF_TRUE0
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
@Square.IF_TRUE0
D;JNE // jump if not zero

// (-1035) goto IF_FALSE0
@Square.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-1037) label IF_TRUE0
(Square.IF_TRUE0) // label IF_TRUE0

// (-1040) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1043) call Screen.setColor 1
(Square.Screen.setColor.52) // call Screen.setColor 1
@Square.Screen.setColor.52 // call Screen.setColor // push RIP
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
@Screen.setColor // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-1045) pop temp 0
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

// (-1047) push this 0
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

// (-1049) push this 1
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

// (-1051) push this 0
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

// (-1053) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1055) add
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

// (-1057) push this 1
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

// (-1059) push this 2
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

// (-1061) add
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

// (-1064) call Screen.drawRectangle 4
(Square.Screen.drawRectangle.53) // call Screen.drawRectangle 4
@Square.Screen.drawRectangle.53 // call Screen.drawRectangle // push RIP
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

// (-1066) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1068) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1070) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1072) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1074) push constant 0 // local(4) init
@0 // push constant 0 // local(4) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1076) push constant 0 // local(5) init
@0 // push constant 0 // local(5) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1078) push constant 0 // local(6) init
@0 // push constant 0 // local(6) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1080) push constant 0 // local(7) init
@0 // push constant 0 // local(7) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1082) push constant 0 // local(8) init
@0 // push constant 0 // local(8) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@14 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@127 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@14 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@14 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@4 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@9 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Screen.drawRectangle // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-1084) pop temp 0
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

// (-1086) push this 0
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

// (-1088) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1090) add
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

// (-1092) pop this 0
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

// (-1094) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1096) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1099) call Screen.setColor 1
(Square.Screen.setColor.54) // call Screen.setColor 1
@Square.Screen.setColor.54 // call Screen.setColor // push RIP
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
@Screen.setColor // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-1101) pop temp 0
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

// (-1103) push this 0
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

// (-1105) push this 2
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

// (-1107) add
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

// (-1109) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1111) sub
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

// (-1113) push this 1
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

// (-1115) push this 0
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

// (-1117) push this 2
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

// (-1119) add
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

// (-1121) push this 1
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

// (-1123) push this 2
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

// (-1125) add
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

// (-1128) call Screen.drawRectangle 4
(Square.Screen.drawRectangle.55) // call Screen.drawRectangle 4
@Square.Screen.drawRectangle.55 // call Screen.drawRectangle // push RIP
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

// (-1130) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1132) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1134) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1136) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1138) push constant 0 // local(4) init
@0 // push constant 0 // local(4) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1140) push constant 0 // local(5) init
@0 // push constant 0 // local(5) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1142) push constant 0 // local(6) init
@0 // push constant 0 // local(6) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1144) push constant 0 // local(7) init
@0 // push constant 0 // local(7) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1146) push constant 0 // local(8) init
@0 // push constant 0 // local(8) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@14 // increment RIP (SP-5+num_locals) by prologue_size (all the instructions added by call)
D=A // d = 5+num_locals
@SP // **esp
M=M-D // *esp = *esp-(5+num_locals) (*rip)
@127 // prologue_size
D=A // d = prologue_size
@SP // **esp (**rip)
A=M // *rip
M=M+D // *rip = *rip+prologue_size
@14 // 5+num_locals
D=A // d = 5+num_locals
@SP // **esp
M=M+D // *esp = *esp+(5+num_locals)
@14 // (5+num_locals) // initialize ARG segment for callee
D=A // d = (5+num_locals)
@SP // *esp (bottom of stack)
D=M-D // d = [esp]-5-num_locals (*RIP) 
@4 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@9 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Screen.drawRectangle // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-1148) pop temp 0
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

// (-1150) label IF_FALSE0
(Square.IF_FALSE0) // label IF_FALSE0

// (-1153) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1155) return

// (-1157) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-1159) function Array.new 0
(Array.new) // function Array.new 0

// (-1162) push argument 0
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
// (-1164) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1166) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_56
D;JGT
(JGT_FALSE_56)
@0
D=A // d = false
@JGT_END_56
0;JMP
(JGT_TRUE_56)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_56)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1171) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1173) if-goto IF_TRUE0
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

// (-1175) goto IF_FALSE0
@Array.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-1177) label IF_TRUE0
(Array.IF_TRUE0) // label IF_TRUE0

// (-1180) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1183) call Sys.error 1
(Array.Sys.error.57) // call Sys.error 1
@Array.Sys.error.57 // call Sys.error // push RIP
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

// (-1185) pop temp 0
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

// (-1187) label IF_FALSE0
(Array.IF_FALSE0) // label IF_FALSE0

// (-1190) push argument 0
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

// (-1193) call Memory.alloc 1
(Array.Memory.alloc.58) // call Memory.alloc 1
@Array.Memory.alloc.58 // call Memory.alloc // push RIP
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

// (-1195) push constant 0 // local(0) init
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

// (-1197) return

// (-1199) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-1201) function Array.dispose 0
(Array.dispose) // function Array.dispose 0

// (-1204) push argument 0
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
// (-1206) pop pointer 0
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

// (-1208) push pointer 0
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

// (-1211) call Memory.deAlloc 1
(Array.Memory.deAlloc.59) // call Memory.deAlloc 1
@Array.Memory.deAlloc.59 // call Memory.deAlloc // push RIP
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

// (-1213) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1215) push constant 0 // local(1) init
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

// (-1217) pop temp 0
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

// (-1219) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1221) return

// (-1223) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-1225) function Keyboard.init 0
(Keyboard.init) // function Keyboard.init 0

// (-1228) push constant 0
@0 // push constant 0 // function Keyboard.init 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-1230) return

// (-1232) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-1234) function Keyboard.keyPressed 0
(Keyboard.keyPressed) // function Keyboard.keyPressed 0

// (-1237) push constant 24576
@24576 // push constant 24576 // function Keyboard.keyPressed 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-1240) call Memory.peek 1
(Keyboard.Memory.peek.60) // call Memory.peek 1
@Keyboard.Memory.peek.60 // call Memory.peek // push RIP
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

// (-1242) return

// (-1244) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-1246) function Keyboard.readChar 2
(Keyboard.readChar) // function Keyboard.readChar 2

// (-1249) push constant 0
@0 // push constant 0 // function Keyboard.readChar 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-1252) call Output.printChar 1
(Keyboard.Output.printChar.61) // call Output.printChar 1
@Keyboard.Output.printChar.61 // call Output.printChar // push RIP
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

// (-1254) pop temp 0
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

// (-1256) label WHILE_EXP0
(Keyboard.WHILE_EXP0) // label WHILE_EXP0

// (-1259) push local 1
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

// (-1261) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1263) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_62
D;JEQ
(EQ_FALSE_62)
@0
D=A // d = false
@EQ_END_62
0;JMP
(EQ_TRUE_62)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_62)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1268) push local 0
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

// (-1270) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1272) gt
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

// (-1277) or
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

// (-1279) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1281) if-goto WHILE_END0
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

// (-1284) call Keyboard.keyPressed 0
(Keyboard.Keyboard.keyPressed.64) // call Keyboard.keyPressed 0

// (-1286) push constant 9999 // call Keyboard.keyPressed // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Keyboard.keyPressed // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Keyboard.Keyboard.keyPressed.64 // push RIP
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

// (-1288) pop local 0
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

// (-1290) push local 0
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

// (-1292) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1294) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_65
D;JGT
(JGT_FALSE_65)
@0
D=A // d = false
@JGT_END_65
0;JMP
(JGT_TRUE_65)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_65)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1299) if-goto IF_TRUE0
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

// (-1301) goto IF_FALSE0
@Keyboard.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-1303) label IF_TRUE0
(Keyboard.IF_TRUE0) // label IF_TRUE0

// (-1306) push local 0
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

// (-1308) pop local 1
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

// (-1310) label IF_FALSE0
(Keyboard.IF_FALSE0) // label IF_FALSE0

// (-1313) goto WHILE_EXP0
@Keyboard.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-1315) label WHILE_END0
(Keyboard.WHILE_END0) // label WHILE_END0

// (-1319) call String.backSpace 0
(Keyboard.String.backSpace.66) // call String.backSpace 0

// (-1321) push constant 9999 // call String.backSpace // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call String.backSpace // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Keyboard.String.backSpace.66 // push RIP
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

// (-1324) call Output.printChar 1
(Keyboard.Output.printChar.67) // call Output.printChar 1
@Keyboard.Output.printChar.67 // call Output.printChar // push RIP
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

// (-1326) pop temp 0
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

// (-1328) push local 1
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

// (-1331) call Output.printChar 1
(Keyboard.Output.printChar.68) // call Output.printChar 1
@Keyboard.Output.printChar.68 // call Output.printChar // push RIP
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

// (-1333) pop temp 0
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

// (-1335) push local 1
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

// (-1337) return

// (-1339) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-1341) function Keyboard.readLine 5
(Keyboard.readLine) // function Keyboard.readLine 5

// (-1344) push constant 80
@80 // push constant 80 // function Keyboard.readLine 5
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-1347) call String.new 1
(Keyboard.String.new.69) // call String.new 1
@Keyboard.String.new.69 // call String.new // push RIP
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

// (-1349) pop local 3
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

// (-1351) push argument 0
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

// (-1354) call Output.printString 1
(Keyboard.Output.printString.70) // call Output.printString 1
@Keyboard.Output.printString.70 // call Output.printString // push RIP
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

// (-1356) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1358) push constant 0 // local(1) init
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

// (-1360) pop temp 0
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

// (-1363) call String.newLine 0
(Keyboard.String.newLine.71) // call String.newLine 0

// (-1365) push constant 9999 // call String.newLine // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call String.newLine // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Keyboard.String.newLine.71 // push RIP
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

// (-1367) pop local 1
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

// (-1370) call String.backSpace 0
(Keyboard.String.backSpace.72) // call String.backSpace 0

// (-1372) push constant 9999 // call String.backSpace // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call String.backSpace // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Keyboard.String.backSpace.72 // push RIP
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

// (-1374) pop local 2
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

// (-1376) label WHILE_EXP0
(Keyboard.WHILE_EXP0) // label WHILE_EXP0

// (-1379) push local 4
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

// (-1381) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1383) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1385) if-goto WHILE_END0
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

// (-1388) call Keyboard.readChar 0
(Keyboard.Keyboard.readChar.73) // call Keyboard.readChar 0

// (-1390) push constant 9999 // call Keyboard.readChar // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Keyboard.readChar // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Keyboard.Keyboard.readChar.73 // push RIP
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

// (-1392) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1394) push constant 0 // local(1) init
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

// (-1396) pop local 0
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

// (-1398) push local 0
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

// (-1400) push local 1
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

// (-1402) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_74
D;JEQ
(EQ_FALSE_74)
@0
D=A // d = false
@EQ_END_74
0;JMP
(EQ_TRUE_74)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_74)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1407) pop local 4
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

// (-1409) push local 4
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

// (-1411) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1413) if-goto IF_TRUE0
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

// (-1415) goto IF_FALSE0
@Keyboard.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-1417) label IF_TRUE0
(Keyboard.IF_TRUE0) // label IF_TRUE0

// (-1420) push local 0
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

// (-1422) push local 2
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

// (-1424) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_75
D;JEQ
(EQ_FALSE_75)
@0
D=A // d = false
@EQ_END_75
0;JMP
(EQ_TRUE_75)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_75)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1429) if-goto IF_TRUE1
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

// (-1431) goto IF_FALSE1
@Keyboard.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-1433) label IF_TRUE1
(Keyboard.IF_TRUE1) // label IF_TRUE1

// (-1436) push local 3
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

// (-1439) call String.eraseLastChar 1
(Keyboard.String.eraseLastChar.76) // call String.eraseLastChar 1
@Keyboard.String.eraseLastChar.76 // call String.eraseLastChar // push RIP
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

// (-1441) pop temp 0
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

// (-1443) goto IF_END1
@Keyboard.IF_END1 // goto IF_END1
0;JMP // unconditional jump

// (-1445) label IF_FALSE1
(Keyboard.IF_FALSE1) // label IF_FALSE1

// (-1448) push local 3
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

// (-1450) push local 0
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

// (-1453) call String.appendChar 2
(Keyboard.String.appendChar.77) // call String.appendChar 2
@Keyboard.String.appendChar.77 // call String.appendChar // push RIP
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

// (-1455) pop local 3
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

// (-1457) label IF_END1
(Keyboard.IF_END1) // label IF_END1

// (-1460) label IF_FALSE0
(Keyboard.IF_FALSE0) // label IF_FALSE0

// (-1463) goto WHILE_EXP0
@Keyboard.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-1465) label WHILE_END0
(Keyboard.WHILE_END0) // label WHILE_END0

// (-1468) push local 3
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

// (-1470) return

// (-1472) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-1474) function Keyboard.readInt 2
(Keyboard.readInt) // function Keyboard.readInt 2

// (-1477) push argument 0
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
// (-1480) call Keyboard.readLine 1
(Keyboard.Keyboard.readLine.78) // call Keyboard.readLine 1
@Keyboard.Keyboard.readLine.78 // call Keyboard.readLine // push RIP
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

// (-1482) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1484) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1486) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1488) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1490) push constant 0 // local(4) init
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

// (-1492) pop local 0
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

// (-1494) push local 0
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

// (-1497) call String.intValue 1
(Keyboard.String.intValue.79) // call String.intValue 1
@Keyboard.String.intValue.79 // call String.intValue // push RIP
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

// (-1499) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1501) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1503) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1505) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1507) push constant 0 // local(4) init
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

// (-1509) pop local 1
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

// (-1511) push local 0
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

// (-1514) call String.dispose 1
(Keyboard.String.dispose.80) // call String.dispose 1
@Keyboard.String.dispose.80 // call String.dispose // push RIP
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

// (-1516) pop temp 0
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

// (-1518) push local 1
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

// (-1520) return

// (-1522) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-1524) function Math.init 1
(Math.init) // function Math.init 1

// (-1527) push constant 16
@16 // push constant 16 // function Math.init 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-1530) call Array.new 1
(Math.Array.new.81) // call Array.new 1
@Math.Array.new.81 // call Array.new // push RIP
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

// (-1532) pop static 1
@16 // pop static 1 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Math.vm)
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

// (-1534) push constant 16
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1537) call Array.new 1
(Math.Array.new.82) // call Array.new 1
@Math.Array.new.82 // call Array.new // push RIP
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

// (-1539) pop static 0
@16 // pop static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Math.vm)
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

// (-1541) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1543) push static 0
@16 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Math.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1545) add
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

// (-1547) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1549) pop temp 0
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

// (-1551) pop pointer 1
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

// (-1553) push temp 0
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

// (-1555) pop that 0
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

// (-1557) label WHILE_EXP0
(Math.WHILE_EXP0) // label WHILE_EXP0

// (-1560) push local 0
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

// (-1562) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1564) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_83
D;JLT
(JLT_FALSE_83)
@0
D=A // d = false
@JLT_END_83
0;JMP
(JLT_TRUE_83)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_83)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1569) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1571) if-goto WHILE_END0
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

// (-1573) push local 0
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

// (-1575) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1577) add
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

// (-1579) pop local 0
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

// (-1581) push local 0
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

// (-1583) push static 0
@16 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Math.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1585) add
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

// (-1587) push local 0
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

// (-1589) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1591) sub
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

// (-1593) push static 0
@16 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Math.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1595) add
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

// (-1597) pop pointer 1
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

// (-1599) push that 0
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

// (-1601) push local 0
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

// (-1603) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1605) sub
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

// (-1607) push static 0
@16 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Math.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1609) add
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

// (-1611) pop pointer 1
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

// (-1613) push that 0
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

// (-1615) add
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

// (-1617) pop temp 0
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

// (-1619) pop pointer 1
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

// (-1621) push temp 0
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

// (-1623) pop that 0
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

// (-1625) goto WHILE_EXP0
@Math.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-1627) label WHILE_END0
(Math.WHILE_END0) // label WHILE_END0

// (-1630) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1632) return

// (-1634) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-1636) function Math.abs 0
(Math.abs) // function Math.abs 0

// (-1639) push argument 0
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
// (-1641) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1643) lt
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

// (-1648) if-goto IF_TRUE0
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

// (-1650) goto IF_FALSE0
@Math.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-1652) label IF_TRUE0
(Math.IF_TRUE0) // label IF_TRUE0

// (-1655) push argument 0
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

// (-1657) neg
@SP // neg
M=M-1
A=M
M=-M
@SP
M=M+1

// (-1659) pop argument 0
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

// (-1661) label IF_FALSE0
(Math.IF_FALSE0) // label IF_FALSE0

// (-1664) push argument 0
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

// (-1666) return

// (-1668) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-1670) function Math.multiply 5
(Math.multiply) // function Math.multiply 5

// (-1673) push argument 0
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
// (-1675) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1677) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_85
D;JLT
(JLT_FALSE_85)
@0
D=A // d = false
@JLT_END_85
0;JMP
(JLT_TRUE_85)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_85)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1682) push argument 1
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

// (-1684) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1686) gt
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

// (-1691) and
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

// (-1693) push argument 0
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

// (-1695) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1697) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_87
D;JGT
(JGT_FALSE_87)
@0
D=A // d = false
@JGT_END_87
0;JMP
(JGT_TRUE_87)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_87)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1702) push argument 1
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

// (-1704) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1706) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_88
D;JLT
(JLT_FALSE_88)
@0
D=A // d = false
@JLT_END_88
0;JMP
(JLT_TRUE_88)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_88)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1711) and
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

// (-1713) or
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

// (-1715) pop local 4
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

// (-1717) push argument 0
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

// (-1720) call Math.abs 1
(Math.Math.abs.89) // call Math.abs 1
@Math.Math.abs.89 // call Math.abs // push RIP
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

// (-1722) pop argument 0
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

// (-1724) push argument 1
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

// (-1727) call Math.abs 1
(Math.Math.abs.90) // call Math.abs 1
@Math.Math.abs.90 // call Math.abs // push RIP
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

// (-1729) pop argument 1
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

// (-1731) push argument 0
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

// (-1733) push argument 1
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

// (-1735) lt
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

// (-1740) if-goto IF_TRUE0
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

// (-1742) goto IF_FALSE0
@Math.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-1744) label IF_TRUE0
(Math.IF_TRUE0) // label IF_TRUE0

// (-1747) push argument 0
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

// (-1749) pop local 1
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

// (-1753) pop argument 0
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

// (-1755) push local 1
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

// (-1757) pop argument 1
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

// (-1759) label IF_FALSE0
(Math.IF_FALSE0) // label IF_FALSE0

// (-1762) label WHILE_EXP0
(Math.WHILE_EXP0) // label WHILE_EXP0

// (-1765) push local 2
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

// (-1767) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1769) sub
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

// (-1771) push argument 1
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

// (-1773) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1775) sub
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

// (-1777) lt
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

// (-1782) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1784) if-goto WHILE_END0
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

// (-1786) push local 3
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

// (-1788) push static 0
@16 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Math.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1790) add
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

// (-1792) pop pointer 1
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

// (-1794) push that 0
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

// (-1796) push argument 1
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

// (-1798) and
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

// (-1800) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1802) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_93
D;JEQ
(EQ_FALSE_93)
@0
D=A // d = false
@EQ_END_93
0;JMP
(EQ_TRUE_93)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_93)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1807) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1809) if-goto IF_TRUE1
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

// (-1811) goto IF_FALSE1
@Math.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-1813) label IF_TRUE1
(Math.IF_TRUE1) // label IF_TRUE1

// (-1816) push local 0
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

// (-1818) push argument 0
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

// (-1820) add
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

// (-1822) pop local 0
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

// (-1824) push local 2
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

// (-1826) push local 3
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

// (-1828) push static 0
@16 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Math.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1830) add
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

// (-1832) pop pointer 1
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

// (-1834) push that 0
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

// (-1836) add
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

// (-1838) pop local 2
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

// (-1840) label IF_FALSE1
(Math.IF_FALSE1) // label IF_FALSE1

// (-1843) push argument 0
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

// (-1845) push argument 0
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

// (-1847) add
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

// (-1849) pop argument 0
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

// (-1851) push local 3
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

// (-1853) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1855) add
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

// (-1857) pop local 3
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

// (-1859) goto WHILE_EXP0
@Math.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-1861) label WHILE_END0
(Math.WHILE_END0) // label WHILE_END0

// (-1864) push local 4
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

// (-1866) if-goto IF_TRUE2
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

// (-1868) goto IF_FALSE2
@Math.IF_FALSE2 // goto IF_FALSE2
0;JMP // unconditional jump

// (-1870) label IF_TRUE2
(Math.IF_TRUE2) // label IF_TRUE2

// (-1873) push local 0
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

// (-1875) neg
@SP // neg
M=M-1
A=M
M=-M
@SP
M=M+1

// (-1877) pop local 0
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

// (-1879) label IF_FALSE2
(Math.IF_FALSE2) // label IF_FALSE2

// (-1882) push local 0
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

// (-1884) return

// (-1886) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-1888) function Math.divide 4
(Math.divide) // function Math.divide 4

// (-1891) push argument 1
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
// (-1893) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1895) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_94
D;JEQ
(EQ_FALSE_94)
@0
D=A // d = false
@EQ_END_94
0;JMP
(EQ_TRUE_94)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_94)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1900) if-goto IF_TRUE0
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

// (-1902) goto IF_FALSE0
@Math.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-1904) label IF_TRUE0
(Math.IF_TRUE0) // label IF_TRUE0

// (-1907) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1910) call Sys.error 1
(Math.Sys.error.95) // call Sys.error 1
@Math.Sys.error.95 // call Sys.error // push RIP
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

// (-1912) pop temp 0
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

// (-1914) label IF_FALSE0
(Math.IF_FALSE0) // label IF_FALSE0

// (-1917) push argument 0
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

// (-1919) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1921) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_96
D;JLT
(JLT_FALSE_96)
@0
D=A // d = false
@JLT_END_96
0;JMP
(JLT_TRUE_96)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_96)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1926) push argument 1
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

// (-1928) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1930) gt
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

// (-1935) and
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

// (-1937) push argument 0
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

// (-1939) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1941) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_98
D;JGT
(JGT_FALSE_98)
@0
D=A // d = false
@JGT_END_98
0;JMP
(JGT_TRUE_98)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_98)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1946) push argument 1
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

// (-1948) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1950) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_99
D;JLT
(JLT_FALSE_99)
@0
D=A // d = false
@JLT_END_99
0;JMP
(JLT_TRUE_99)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_99)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1955) and
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

// (-1957) or
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

// (-1959) pop local 2
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

// (-1961) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1963) push static 1
@16 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1965) add
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

// (-1967) push argument 1
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

// (-1970) call Math.abs 1
(Math.Math.abs.100) // call Math.abs 1
@Math.Math.abs.100 // call Math.abs // push RIP
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

// (-1972) pop temp 0
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

// (-1974) pop pointer 1
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

// (-1976) push temp 0
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

// (-1978) pop that 0
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

// (-1980) push argument 0
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

// (-1983) call Math.abs 1
(Math.Math.abs.101) // call Math.abs 1
@Math.Math.abs.101 // call Math.abs // push RIP
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

// (-1985) pop argument 0
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

// (-1987) label WHILE_EXP0
(Math.WHILE_EXP0) // label WHILE_EXP0

// (-1990) push local 0
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

// (-1992) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1994) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_102
D;JLT
(JLT_FALSE_102)
@0
D=A // d = false
@JLT_END_102
0;JMP
(JLT_TRUE_102)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_102)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1999) push local 3
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

// (-2001) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-2003) and
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

// (-2005) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-2007) if-goto WHILE_END0
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

// (-2009) push constant 32767
@32767 // push constant 32767
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2011) push local 0
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

// (-2013) push static 1
@16 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2015) add
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

// (-2017) pop pointer 1
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

// (-2019) push that 0
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

// (-2021) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2023) sub
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

// (-2025) sub
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

// (-2027) push local 0
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

// (-2029) push static 1
@16 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2031) add
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

// (-2033) pop pointer 1
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

// (-2035) push that 0
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

// (-2037) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2039) sub
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

// (-2041) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_103
D;JLT
(JLT_FALSE_103)
@0
D=A // d = false
@JLT_END_103
0;JMP
(JLT_TRUE_103)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_103)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2046) pop local 3
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

// (-2048) push local 3
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

// (-2050) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-2052) if-goto IF_TRUE1
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

// (-2054) goto IF_FALSE1
@Math.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-2056) label IF_TRUE1
(Math.IF_TRUE1) // label IF_TRUE1

// (-2059) push local 0
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

// (-2061) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2063) add
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

// (-2065) push static 1
@16 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2067) add
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

// (-2069) push local 0
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

// (-2071) push static 1
@16 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2073) add
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

// (-2075) pop pointer 1
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

// (-2077) push that 0
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

// (-2079) push local 0
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

// (-2081) push static 1
@16 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2083) add
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

// (-2085) pop pointer 1
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

// (-2087) push that 0
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

// (-2089) add
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

// (-2091) pop temp 0
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

// (-2093) pop pointer 1
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

// (-2095) push temp 0
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

// (-2097) pop that 0
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

// (-2099) push local 0
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

// (-2101) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2103) add
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

// (-2105) push static 1
@16 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2107) add
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

// (-2109) pop pointer 1
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

// (-2111) push that 0
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

// (-2113) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2115) sub
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

// (-2117) push argument 0
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

// (-2119) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2121) sub
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

// (-2123) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_104
D;JGT
(JGT_FALSE_104)
@0
D=A // d = false
@JGT_END_104
0;JMP
(JGT_TRUE_104)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_104)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2128) pop local 3
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

// (-2130) push local 3
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

// (-2132) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-2134) if-goto IF_TRUE2
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

// (-2136) goto IF_FALSE2
@Math.IF_FALSE2 // goto IF_FALSE2
0;JMP // unconditional jump

// (-2138) label IF_TRUE2
(Math.IF_TRUE2) // label IF_TRUE2

// (-2141) push local 0
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

// (-2143) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2145) add
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

// (-2147) pop local 0
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

// (-2149) label IF_FALSE2
(Math.IF_FALSE2) // label IF_FALSE2

// (-2152) label IF_FALSE1
(Math.IF_FALSE1) // label IF_FALSE1

// (-2155) goto WHILE_EXP0
@Math.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-2157) label WHILE_END0
(Math.WHILE_END0) // label WHILE_END0

// (-2160) label WHILE_EXP1
(Math.WHILE_EXP1) // label WHILE_EXP1

// (-2163) push local 0
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

// (-2165) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2167) neg
@SP // neg
M=M-1
A=M
M=-M
@SP
M=M+1

// (-2169) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_105
D;JGT
(JGT_FALSE_105)
@0
D=A // d = false
@JGT_END_105
0;JMP
(JGT_TRUE_105)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_105)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2174) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-2176) if-goto WHILE_END1
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

// (-2178) push local 0
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

// (-2180) push static 1
@16 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2182) add
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

// (-2184) pop pointer 1
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

// (-2186) push that 0
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

// (-2188) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2190) sub
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

// (-2192) push argument 0
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

// (-2194) push constant 1
@1 // push constant 1
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

// (-2198) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_106
D;JGT
(JGT_FALSE_106)
@0
D=A // d = false
@JGT_END_106
0;JMP
(JGT_TRUE_106)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_106)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2203) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-2205) if-goto IF_TRUE3
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

// (-2207) goto IF_FALSE3
@Math.IF_FALSE3 // goto IF_FALSE3
0;JMP // unconditional jump

// (-2209) label IF_TRUE3
(Math.IF_TRUE3) // label IF_TRUE3

// (-2212) push local 1
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

// (-2214) push local 0
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

// (-2216) push static 0
@16 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Math.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2218) add
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

// (-2220) pop pointer 1
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

// (-2222) push that 0
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

// (-2224) add
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

// (-2226) pop local 1
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

// (-2228) push argument 0
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

// (-2230) push local 0
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

// (-2232) push static 1
@16 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2234) add
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

// (-2236) pop pointer 1
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

// (-2238) push that 0
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

// (-2240) sub
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

// (-2242) pop argument 0
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

// (-2244) label IF_FALSE3
(Math.IF_FALSE3) // label IF_FALSE3

// (-2247) push local 0
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

// (-2249) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2251) sub
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

// (-2253) pop local 0
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

// (-2255) goto WHILE_EXP1
@Math.WHILE_EXP1 // goto WHILE_EXP1
0;JMP // unconditional jump

// (-2257) label WHILE_END1
(Math.WHILE_END1) // label WHILE_END1

// (-2260) push local 2
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

// (-2262) if-goto IF_TRUE4
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

// (-2264) goto IF_FALSE4
@Math.IF_FALSE4 // goto IF_FALSE4
0;JMP // unconditional jump

// (-2266) label IF_TRUE4
(Math.IF_TRUE4) // label IF_TRUE4

// (-2269) push local 1
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

// (-2271) neg
@SP // neg
M=M-1
A=M
M=-M
@SP
M=M+1

// (-2273) pop local 1
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

// (-2275) label IF_FALSE4
(Math.IF_FALSE4) // label IF_FALSE4

// (-2278) push local 1
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

// (-2280) return

// (-2282) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-2284) function Math.sqrt 4
(Math.sqrt) // function Math.sqrt 4

// (-2287) push argument 0
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
// (-2289) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2291) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_107
D;JLT
(JLT_FALSE_107)
@0
D=A // d = false
@JLT_END_107
0;JMP
(JLT_TRUE_107)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_107)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2296) if-goto IF_TRUE0
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

// (-2298) goto IF_FALSE0
@Math.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-2300) label IF_TRUE0
(Math.IF_TRUE0) // label IF_TRUE0

// (-2303) push constant 4
@4 // push constant 4
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2306) call Sys.error 1
(Math.Sys.error.108) // call Sys.error 1
@Math.Sys.error.108 // call Sys.error // push RIP
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

// (-2308) pop temp 0
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

// (-2310) label IF_FALSE0
(Math.IF_FALSE0) // label IF_FALSE0

// (-2313) push constant 7
@7 // push constant 7
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2315) pop local 0
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

// (-2317) label WHILE_EXP0
(Math.WHILE_EXP0) // label WHILE_EXP0

// (-2320) push local 0
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

// (-2322) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2324) neg
@SP // neg
M=M-1
A=M
M=-M
@SP
M=M+1

// (-2326) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_109
D;JGT
(JGT_FALSE_109)
@0
D=A // d = false
@JGT_END_109
0;JMP
(JGT_TRUE_109)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_109)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2331) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-2333) if-goto WHILE_END0
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

// (-2335) push local 3
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

// (-2337) push local 0
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

// (-2339) push static 0
@16 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Math.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2341) add
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

// (-2343) pop pointer 1
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

// (-2345) push that 0
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

// (-2347) add
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

// (-2349) pop local 1
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

// (-2351) push local 1
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

// (-2353) push local 1
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

// (-2356) call Math.multiply 2
(Math.Math.multiply.110) // call Math.multiply 2
@Math.Math.multiply.110 // call Math.multiply // push RIP
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

// (-2358) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2360) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2362) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2364) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2366) push constant 0 // local(4) init
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

// (-2368) pop local 2
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

// (-2370) push local 2
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

// (-2372) push argument 0
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

// (-2374) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_111
D;JGT
(JGT_FALSE_111)
@0
D=A // d = false
@JGT_END_111
0;JMP
(JGT_TRUE_111)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_111)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2379) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-2381) push local 2
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

// (-2383) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2385) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_112
D;JLT
(JLT_FALSE_112)
@0
D=A // d = false
@JLT_END_112
0;JMP
(JLT_TRUE_112)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_112)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2390) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-2392) and
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

// (-2394) if-goto IF_TRUE1
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

// (-2396) goto IF_FALSE1
@Math.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-2398) label IF_TRUE1
(Math.IF_TRUE1) // label IF_TRUE1

// (-2401) push local 1
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

// (-2403) pop local 3
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

// (-2405) label IF_FALSE1
(Math.IF_FALSE1) // label IF_FALSE1

// (-2408) push local 0
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

// (-2410) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2412) sub
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

// (-2414) pop local 0
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

// (-2416) goto WHILE_EXP0
@Math.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-2418) label WHILE_END0
(Math.WHILE_END0) // label WHILE_END0

// (-2421) push local 3
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

// (-2423) return

// (-2425) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-2427) function Math.max 0
(Math.max) // function Math.max 0

// (-2430) push argument 0
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
// (-2432) push argument 1
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

// (-2434) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_113
D;JGT
(JGT_FALSE_113)
@0
D=A // d = false
@JGT_END_113
0;JMP
(JGT_TRUE_113)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_113)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2439) if-goto IF_TRUE0
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

// (-2441) goto IF_FALSE0
@Math.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-2443) label IF_TRUE0
(Math.IF_TRUE0) // label IF_TRUE0

// (-2446) push argument 0
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

// (-2448) pop argument 1
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

// (-2450) label IF_FALSE0
(Math.IF_FALSE0) // label IF_FALSE0

// (-2453) push argument 1
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

// (-2455) return

// (-2457) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-2459) function Math.min 0
(Math.min) // function Math.min 0

// (-2462) push argument 0
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
// (-2464) push argument 1
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

// (-2466) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_114
D;JLT
(JLT_FALSE_114)
@0
D=A // d = false
@JLT_END_114
0;JMP
(JLT_TRUE_114)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_114)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2471) if-goto IF_TRUE0
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

// (-2473) goto IF_FALSE0
@Math.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-2475) label IF_TRUE0
(Math.IF_TRUE0) // label IF_TRUE0

// (-2478) push argument 0
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

// (-2480) pop argument 1
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

// (-2482) label IF_FALSE0
(Math.IF_FALSE0) // label IF_FALSE0

// (-2485) push argument 1
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

// (-2487) return

// (-2489) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-2491) function Memory.init 0
(Memory.init) // function Memory.init 0

// (-2494) push constant 0
@0 // push constant 0 // function Memory.init 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-2496) pop static 0
@18 // pop static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Memory.vm)
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

// (-2498) push constant 2048
@2048 // push constant 2048
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2500) push static 0
@18 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Memory.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2502) add
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

// (-2504) push constant 14334
@14334 // push constant 14334
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2506) pop temp 0
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

// (-2508) pop pointer 1
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

// (-2510) push temp 0
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

// (-2512) pop that 0
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

// (-2514) push constant 2049
@2049 // push constant 2049
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2516) push static 0
@18 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Memory.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2518) add
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

// (-2520) push constant 2050
@2050 // push constant 2050
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2522) pop temp 0
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

// (-2524) pop pointer 1
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

// (-2526) push temp 0
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

// (-2528) pop that 0
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

// (-2530) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2532) return

// (-2534) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-2536) function Memory.peek 0
(Memory.peek) // function Memory.peek 0

// (-2539) push argument 0
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
// (-2541) push static 0
@18 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Memory.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2543) add
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

// (-2545) pop pointer 1
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

// (-2547) push that 0
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

// (-2549) return

// (-2551) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-2553) function Memory.poke 0
(Memory.poke) // function Memory.poke 0

// (-2556) push argument 0
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
// (-2558) push static 0
@18 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Memory.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2560) add
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

// (-2562) push argument 1
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

// (-2564) pop temp 0
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

// (-2566) pop pointer 1
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

// (-2568) push temp 0
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

// (-2570) pop that 0
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

// (-2572) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2574) return

// (-2576) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-2578) function Memory.alloc 1
(Memory.alloc) // function Memory.alloc 1

// (-2581) push argument 0
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
// (-2583) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2585) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_115
D;JLT
(JLT_FALSE_115)
@0
D=A // d = false
@JLT_END_115
0;JMP
(JLT_TRUE_115)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_115)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2590) if-goto IF_TRUE0
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

// (-2592) goto IF_FALSE0
@Memory.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-2594) label IF_TRUE0
(Memory.IF_TRUE0) // label IF_TRUE0

// (-2597) push constant 5
@5 // push constant 5
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2600) call Sys.error 1
(Memory.Sys.error.116) // call Sys.error 1
@Memory.Sys.error.116 // call Sys.error // push RIP
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

// (-2602) pop temp 0
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

// (-2604) label IF_FALSE0
(Memory.IF_FALSE0) // label IF_FALSE0

// (-2607) push constant 2048
@2048 // push constant 2048
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2609) pop local 0
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

// (-2611) label WHILE_EXP0
(Memory.WHILE_EXP0) // label WHILE_EXP0

// (-2614) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2616) push local 0
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

// (-2618) add
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

// (-2620) pop pointer 1
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

// (-2622) push that 0
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

// (-2624) push argument 0
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

// (-2626) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_117
D;JLT
(JLT_FALSE_117)
@0
D=A // d = false
@JLT_END_117
0;JMP
(JLT_TRUE_117)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_117)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2631) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-2633) if-goto WHILE_END0
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

// (-2635) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2637) push local 0
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

// (-2639) add
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

// (-2641) pop pointer 1
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

// (-2643) push that 0
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

// (-2645) pop local 0
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

// (-2647) goto WHILE_EXP0
@Memory.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-2649) label WHILE_END0
(Memory.WHILE_END0) // label WHILE_END0

// (-2652) push local 0
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

// (-2654) push argument 0
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

// (-2656) add
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

// (-2658) push constant 16379
@16379 // push constant 16379
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2660) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_118
D;JGT
(JGT_FALSE_118)
@0
D=A // d = false
@JGT_END_118
0;JMP
(JGT_TRUE_118)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_118)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2665) if-goto IF_TRUE1
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

// (-2667) goto IF_FALSE1
@Memory.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-2669) label IF_TRUE1
(Memory.IF_TRUE1) // label IF_TRUE1

// (-2672) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2675) call Sys.error 1
(Memory.Sys.error.119) // call Sys.error 1
@Memory.Sys.error.119 // call Sys.error // push RIP
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

// (-2677) pop temp 0
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

// (-2679) label IF_FALSE1
(Memory.IF_FALSE1) // label IF_FALSE1

// (-2682) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2684) push local 0
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

// (-2686) add
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

// (-2688) pop pointer 1
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

// (-2690) push that 0
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

// (-2692) push argument 0
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

// (-2694) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2696) add
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

// (-2698) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_120
D;JGT
(JGT_FALSE_120)
@0
D=A // d = false
@JGT_END_120
0;JMP
(JGT_TRUE_120)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_120)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2703) if-goto IF_TRUE2
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

// (-2705) goto IF_FALSE2
@Memory.IF_FALSE2 // goto IF_FALSE2
0;JMP // unconditional jump

// (-2707) label IF_TRUE2
(Memory.IF_TRUE2) // label IF_TRUE2

// (-2710) push argument 0
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

// (-2712) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2714) add
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

// (-2716) push local 0
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

// (-2718) add
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

// (-2720) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2722) push local 0
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

// (-2724) add
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

// (-2726) pop pointer 1
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

// (-2728) push that 0
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

// (-2730) push argument 0
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

// (-2732) sub
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

// (-2734) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2736) sub
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

// (-2738) pop temp 0
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

// (-2740) pop pointer 1
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

// (-2742) push temp 0
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

// (-2744) pop that 0
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

// (-2746) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2748) push local 0
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

// (-2750) add
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

// (-2752) pop pointer 1
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

// (-2754) push that 0
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

// (-2756) push local 0
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

// (-2758) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2760) add
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

// (-2762) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_121
D;JEQ
(EQ_FALSE_121)
@0
D=A // d = false
@EQ_END_121
0;JMP
(EQ_TRUE_121)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_121)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2767) if-goto IF_TRUE3
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

// (-2769) goto IF_FALSE3
@Memory.IF_FALSE3 // goto IF_FALSE3
0;JMP // unconditional jump

// (-2771) label IF_TRUE3
(Memory.IF_TRUE3) // label IF_TRUE3

// (-2774) push argument 0
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

// (-2776) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2778) add
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

// (-2780) push local 0
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

// (-2782) add
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

// (-2784) push local 0
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

// (-2786) push argument 0
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

// (-2788) add
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

// (-2790) push constant 4
@4 // push constant 4
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2792) add
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

// (-2794) pop temp 0
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

// (-2796) pop pointer 1
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

// (-2798) push temp 0
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

// (-2800) pop that 0
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

// (-2802) goto IF_END3
@Memory.IF_END3 // goto IF_END3
0;JMP // unconditional jump

// (-2804) label IF_FALSE3
(Memory.IF_FALSE3) // label IF_FALSE3

// (-2807) push argument 0
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

// (-2809) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2811) add
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

// (-2813) push local 0
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

// (-2815) add
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

// (-2817) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2819) push local 0
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

// (-2821) add
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

// (-2823) pop pointer 1
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

// (-2825) push that 0
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

// (-2827) pop temp 0
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

// (-2829) pop pointer 1
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

// (-2831) push temp 0
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

// (-2833) pop that 0
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

// (-2835) label IF_END3
(Memory.IF_END3) // label IF_END3

// (-2838) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2840) push local 0
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

// (-2842) add
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

// (-2844) push local 0
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

// (-2846) push argument 0
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

// (-2848) add
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

// (-2850) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2852) add
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

// (-2854) pop temp 0
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

// (-2856) pop pointer 1
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

// (-2858) push temp 0
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

// (-2860) pop that 0
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

// (-2862) label IF_FALSE2
(Memory.IF_FALSE2) // label IF_FALSE2

// (-2865) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2867) push local 0
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

// (-2869) add
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

// (-2871) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2873) pop temp 0
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

// (-2875) pop pointer 1
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

// (-2877) push temp 0
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

// (-2879) pop that 0
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

// (-2881) push local 0
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

// (-2883) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2885) add
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

// (-2887) return

// (-2889) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-2891) function Memory.deAlloc 2
(Memory.deAlloc) // function Memory.deAlloc 2

// (-2894) push argument 0
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
// (-2896) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2898) sub
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

// (-2900) pop local 0
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

// (-2902) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2904) push local 0
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

// (-2906) add
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

// (-2908) pop pointer 1
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

// (-2910) push that 0
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

// (-2912) pop local 1
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

// (-2914) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2916) push local 1
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

// (-2918) add
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

// (-2920) pop pointer 1
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

// (-2922) push that 0
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

// (-2924) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2926) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_122
D;JEQ
(EQ_FALSE_122)
@0
D=A // d = false
@EQ_END_122
0;JMP
(EQ_TRUE_122)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_122)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2931) if-goto IF_TRUE0
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

// (-2933) goto IF_FALSE0
@Memory.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-2935) label IF_TRUE0
(Memory.IF_TRUE0) // label IF_TRUE0

// (-2938) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2940) push local 0
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

// (-2942) add
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

// (-2944) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2946) push local 0
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

// (-2948) add
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

// (-2950) pop pointer 1
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

// (-2952) push that 0
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

// (-2954) push local 0
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

// (-2956) sub
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

// (-2958) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2960) sub
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

// (-2964) pop pointer 1
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

// (-2966) push temp 0
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

// (-2968) pop that 0
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

// (-2970) goto IF_END0
@Memory.IF_END0 // goto IF_END0
0;JMP // unconditional jump

// (-2972) label IF_FALSE0
(Memory.IF_FALSE0) // label IF_FALSE0

// (-2975) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2977) push local 0
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

// (-2979) add
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

// (-2981) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2983) push local 0
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

// (-2985) add
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

// (-2987) pop pointer 1
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

// (-2989) push that 0
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

// (-2991) push local 0
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

// (-2993) sub
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

// (-2995) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2997) push local 1
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

// (-2999) add
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

// (-3001) pop pointer 1
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

// (-3003) push that 0
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

// (-3005) add
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

// (-3007) pop temp 0
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

// (-3009) pop pointer 1
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

// (-3011) push temp 0
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

// (-3013) pop that 0
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

// (-3015) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3017) push local 1
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

// (-3019) add
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

// (-3021) pop pointer 1
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

// (-3023) push that 0
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

// (-3025) push local 1
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

// (-3027) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3029) add
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

// (-3031) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_123
D;JEQ
(EQ_FALSE_123)
@0
D=A // d = false
@EQ_END_123
0;JMP
(EQ_TRUE_123)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_123)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-3036) if-goto IF_TRUE1
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

// (-3038) goto IF_FALSE1
@Memory.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-3040) label IF_TRUE1
(Memory.IF_TRUE1) // label IF_TRUE1

// (-3043) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3045) push local 0
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

// (-3047) add
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

// (-3049) push local 0
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

// (-3051) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3053) add
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

// (-3057) pop pointer 1
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

// (-3059) push temp 0
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

// (-3061) pop that 0
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

// (-3063) goto IF_END1
@Memory.IF_END1 // goto IF_END1
0;JMP // unconditional jump

// (-3065) label IF_FALSE1
(Memory.IF_FALSE1) // label IF_FALSE1

// (-3068) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3070) push local 0
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

// (-3072) add
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

// (-3074) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3076) push local 1
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

// (-3078) add
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

// (-3080) pop pointer 1
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

// (-3082) push that 0
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

// (-3084) pop temp 0
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

// (-3086) pop pointer 1
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

// (-3088) push temp 0
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

// (-3090) pop that 0
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

// (-3092) label IF_END1
(Memory.IF_END1) // label IF_END1

// (-3095) label IF_END0
(Memory.IF_END0) // label IF_END0

// (-3098) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3100) return

// (-3102) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-3104) function Output.init 0
(Output.init) // function Output.init 0

// (-3107) push constant 16384
@16384 // push constant 16384 // function Output.init 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-3109) pop static 4
@19 // pop static 4 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
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

// (-3111) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3113) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-3115) pop static 2
@19 // pop static 2 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
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

// (-3117) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3119) pop static 1
@19 // pop static 1 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
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

// (-3121) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3123) pop static 0
@19 // pop static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
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

// (-3125) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3128) call String.new 1
(Output.String.new.124) // call String.new 1
@Output.String.new.124 // call String.new // push RIP
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

// (-3130) pop static 3
@19 // pop static 3 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
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

// (-3133) call Output.initMap 0
(Output.Output.initMap.125) // call Output.initMap 0

// (-3135) push constant 9999 // call Output.initMap // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Output.initMap // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Output.Output.initMap.125 // push RIP
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

// (-3137) pop temp 0
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

// (-3140) call Output.createShiftedMap 0
(Output.Output.createShiftedMap.126) // call Output.createShiftedMap 0

// (-3142) push constant 9999 // call Output.createShiftedMap // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Output.createShiftedMap // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Output.Output.createShiftedMap.126 // push RIP
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

// (-3144) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3146) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3148) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3150) push constant 0 // local(3) init
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

// (-3152) pop temp 0
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

// (-3154) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3156) return

// (-3158) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-3160) function Output.initMap 0
(Output.initMap) // function Output.initMap 0

// (-3163) push constant 127
@127 // push constant 127 // function Output.initMap 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-3166) call Array.new 1
(Output.Array.new.127) // call Array.new 1
@Output.Array.new.127 // call Array.new // push RIP
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

// (-3168) pop static 5
@19 // pop static 5 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
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

// (-3170) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3172) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3174) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3176) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3178) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3180) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3182) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3184) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3186) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3188) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3190) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3192) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3195) call Output.create 12
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

// (-3197) push constant 0 // local(0) init
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

// (-3199) pop temp 0
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

// (-3201) push constant 32
@32 // push constant 32
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

// (-3205) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3207) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3209) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3211) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3213) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3215) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3217) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3219) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3221) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3223) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3226) call Output.create 12
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

// (-3228) push constant 0 // local(0) init
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

// (-3230) pop temp 0
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

// (-3232) push constant 33
@33 // push constant 33
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3234) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3236) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3238) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3240) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3242) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3244) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3246) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3248) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3250) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3252) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3254) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3257) call Output.create 12
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

// (-3259) push constant 0 // local(0) init
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

// (-3261) pop temp 0
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

// (-3263) push constant 34
@34 // push constant 34
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3265) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3267) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3269) push constant 20
@20 // push constant 20
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3271) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3273) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3275) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3277) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3279) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3281) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3283) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3285) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3288) call Output.create 12
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

// (-3290) push constant 0 // local(0) init
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

// (-3292) pop temp 0
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

// (-3294) push constant 35
@35 // push constant 35
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

// (-3298) push constant 18
@18 // push constant 18
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3300) push constant 18
@18 // push constant 18
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3302) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3304) push constant 18
@18 // push constant 18
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3306) push constant 18
@18 // push constant 18
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3308) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3310) push constant 18
@18 // push constant 18
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3312) push constant 18
@18 // push constant 18
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3314) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3316) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3319) call Output.create 12
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

// (-3321) push constant 0 // local(0) init
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

// (-3323) pop temp 0
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

// (-3325) push constant 36
@36 // push constant 36
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3327) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3329) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3331) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3333) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3335) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3337) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3339) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3341) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3343) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3345) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3347) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3350) call Output.create 12
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

// (-3352) push constant 0 // local(0) init
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

// (-3354) pop temp 0
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

// (-3356) push constant 37
@37 // push constant 37
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

// (-3360) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3362) push constant 35
@35 // push constant 35
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3364) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3366) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3368) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3370) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3372) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3374) push constant 49
@49 // push constant 49
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3376) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3378) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3381) call Output.create 12
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

// (-3383) push constant 0 // local(0) init
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

// (-3385) pop temp 0
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

// (-3387) push constant 38
@38 // push constant 38
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3389) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3391) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3393) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3395) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3397) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3399) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3401) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3403) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3405) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3407) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3409) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3412) call Output.create 12
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

// (-3414) push constant 0 // local(0) init
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

// (-3416) pop temp 0
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

// (-3418) push constant 39
@39 // push constant 39
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3420) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3422) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3424) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3426) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3428) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3430) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3432) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3434) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3436) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3438) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3440) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3443) call Output.create 12
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

// (-3445) push constant 0 // local(0) init
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

// (-3447) pop temp 0
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

// (-3449) push constant 40
@40 // push constant 40
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3451) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3453) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3455) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3457) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3459) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3461) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3463) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3465) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3467) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3469) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3471) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3474) call Output.create 12
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

// (-3476) push constant 0 // local(0) init
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

// (-3478) pop temp 0
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

// (-3480) push constant 41
@41 // push constant 41
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3482) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3484) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3486) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3488) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3490) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3492) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3494) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3496) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3498) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3500) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3502) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3505) call Output.create 12
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

// (-3507) push constant 0 // local(0) init
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

// (-3509) pop temp 0
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

// (-3511) push constant 42
@42 // push constant 42
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

// (-3515) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3517) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3519) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3521) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3523) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3525) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3527) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3529) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3531) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3533) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3536) call Output.create 12
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

// (-3538) push constant 0 // local(0) init
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

// (-3540) pop temp 0
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

// (-3542) push constant 43
@43 // push constant 43
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

// (-3546) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3548) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3550) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3552) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3554) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3556) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3558) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3560) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3562) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3564) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3567) call Output.create 12
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

// (-3569) push constant 0 // local(0) init
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

// (-3571) pop temp 0
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

// (-3573) push constant 44
@44 // push constant 44
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

// (-3577) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3579) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3581) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3583) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3585) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3587) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3589) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3591) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3593) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3595) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3598) call Output.create 12
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

// (-3600) push constant 0 // local(0) init
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

// (-3602) pop temp 0
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

// (-3604) push constant 45
@45 // push constant 45
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

// (-3608) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3610) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3612) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3614) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3616) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3618) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3620) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3622) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3624) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3626) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3629) call Output.create 12
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

// (-3631) push constant 0 // local(0) init
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

// (-3633) pop temp 0
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

// (-3635) push constant 46
@46 // push constant 46
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

// (-3639) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3641) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3643) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3645) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3647) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3649) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3651) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3653) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3655) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3657) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3660) call Output.create 12
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

// (-3662) push constant 0 // local(0) init
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

// (-3664) pop temp 0
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

// (-3666) push constant 47
@47 // push constant 47
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

// (-3670) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3672) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3674) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3676) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3678) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3680) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3682) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3684) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3686) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3688) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3691) call Output.create 12
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

// (-3693) push constant 0 // local(0) init
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

// (-3695) pop temp 0
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

// (-3697) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3699) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3701) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3703) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3705) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3707) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3709) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3711) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3713) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3715) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3717) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3719) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3722) call Output.create 12
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

// (-3724) push constant 0 // local(0) init
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

// (-3726) pop temp 0
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

// (-3728) push constant 49
@49 // push constant 49
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3730) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3732) push constant 14
@14 // push constant 14
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3734) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3736) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3738) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3740) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3742) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3744) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3746) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3748) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3750) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3753) call Output.create 12
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

// (-3755) push constant 0 // local(0) init
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

// (-3757) pop temp 0
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

// (-3759) push constant 50
@50 // push constant 50
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3761) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3763) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3765) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3767) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3769) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3771) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3773) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3775) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3777) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3779) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3781) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3784) call Output.create 12
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

// (-3786) push constant 0 // local(0) init
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

// (-3788) pop temp 0
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

// (-3790) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3792) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3794) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3796) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3798) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3800) push constant 28
@28 // push constant 28
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3802) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3804) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3806) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3808) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3810) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3812) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3815) call Output.create 12
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

// (-3817) push constant 0 // local(0) init
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

// (-3819) pop temp 0
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

// (-3821) push constant 52
@52 // push constant 52
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3823) push constant 16
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3825) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3827) push constant 28
@28 // push constant 28
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3829) push constant 26
@26 // push constant 26
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3831) push constant 25
@25 // push constant 25
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3833) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3835) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3837) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3839) push constant 60
@60 // push constant 60
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3841) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3843) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3846) call Output.create 12
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

// (-3848) push constant 0 // local(0) init
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

// (-3850) pop temp 0
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

// (-3852) push constant 53
@53 // push constant 53
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3854) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3856) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3858) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3860) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3862) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3864) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3866) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3868) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3870) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3872) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3874) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3877) call Output.create 12
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

// (-3879) push constant 0 // local(0) init
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

// (-3881) pop temp 0
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

// (-3883) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3885) push constant 28
@28 // push constant 28
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3887) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3889) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3891) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3893) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3895) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3897) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3899) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3901) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3903) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3905) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3908) call Output.create 12
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

// (-3910) push constant 0 // local(0) init
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

// (-3912) pop temp 0
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

// (-3914) push constant 55
@55 // push constant 55
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3916) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3918) push constant 49
@49 // push constant 49
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3920) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3922) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3924) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3926) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3928) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3930) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3932) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3934) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3936) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3939) call Output.create 12
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

// (-3941) push constant 0 // local(0) init
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

// (-3943) pop temp 0
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

// (-3945) push constant 56
@56 // push constant 56
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3947) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3949) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3951) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3953) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3955) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3957) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3959) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3961) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3963) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3965) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3967) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3970) call Output.create 12
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

// (-3972) push constant 0 // local(0) init
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

// (-3974) pop temp 0
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

// (-3976) push constant 57
@57 // push constant 57
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3978) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3980) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3982) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3984) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3986) push constant 62
@62 // push constant 62
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3988) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3990) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3992) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3994) push constant 14
@14 // push constant 14
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3996) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3998) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4001) call Output.create 12
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

// (-4003) push constant 0 // local(0) init
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

// (-4005) pop temp 0
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

// (-4007) push constant 58
@58 // push constant 58
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

// (-4011) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4013) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4015) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4017) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4019) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4021) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4023) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4025) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4027) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4029) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4032) call Output.create 12
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

// (-4034) push constant 0 // local(0) init
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

// (-4036) pop temp 0
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

// (-4038) push constant 59
@59 // push constant 59
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

// (-4042) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4044) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4046) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4048) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4050) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4052) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4054) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4056) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4058) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4060) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4063) call Output.create 12
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

// (-4065) push constant 0 // local(0) init
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

// (-4067) pop temp 0
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

// (-4069) push constant 60
@60 // push constant 60
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

// (-4073) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4075) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4077) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4079) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4081) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4083) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4085) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4087) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4089) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4091) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4094) call Output.create 12
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

// (-4096) push constant 0 // local(0) init
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

// (-4098) pop temp 0
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

// (-4100) push constant 61
@61 // push constant 61
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

// (-4104) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4106) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4108) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4110) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4112) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4114) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4116) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4118) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4120) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4122) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4125) call Output.create 12
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

// (-4127) push constant 0 // local(0) init
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

// (-4129) pop temp 0
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

// (-4131) push constant 62
@62 // push constant 62
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

// (-4135) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4137) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4139) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4141) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4143) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4145) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4147) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4149) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4151) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4153) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4156) call Output.create 12
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

// (-4158) push constant 0 // local(0) init
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

// (-4160) pop temp 0
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

// (-4162) push constant 64
@64 // push constant 64
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4164) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4166) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4168) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4170) push constant 59
@59 // push constant 59
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4172) push constant 59
@59 // push constant 59
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4174) push constant 59
@59 // push constant 59
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4176) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4178) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4180) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4182) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4184) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4187) call Output.create 12
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

// (-4189) push constant 0 // local(0) init
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

// (-4191) pop temp 0
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

// (-4193) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4195) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4197) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4199) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4201) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4203) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4205) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4207) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4209) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4211) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4213) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4215) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4218) call Output.create 12
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

// (-4220) push constant 0 // local(0) init
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

// (-4222) pop temp 0
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

// (-4224) push constant 65
@65 // push constant 65
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4226) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4228) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4230) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4232) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4234) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4236) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4238) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4240) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4242) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4244) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4246) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4249) call Output.create 12
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

// (-4251) push constant 0 // local(0) init
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

// (-4253) pop temp 0
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

// (-4255) push constant 66
@66 // push constant 66
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4257) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4259) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4261) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4263) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4265) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4267) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4269) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4271) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4273) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4275) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4277) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4280) call Output.create 12
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

// (-4282) push constant 0 // local(0) init
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

// (-4284) pop temp 0
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

// (-4286) push constant 67
@67 // push constant 67
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4288) push constant 28
@28 // push constant 28
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4290) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4292) push constant 35
@35 // push constant 35
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4294) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4296) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4298) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4300) push constant 35
@35 // push constant 35
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4302) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4304) push constant 28
@28 // push constant 28
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4306) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4308) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4311) call Output.create 12
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

// (-4313) push constant 0 // local(0) init
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

// (-4315) pop temp 0
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

// (-4317) push constant 68
@68 // push constant 68
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4319) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4321) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4323) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4325) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4327) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4329) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4331) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4333) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4335) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4337) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4339) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4342) call Output.create 12
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

// (-4344) push constant 0 // local(0) init
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

// (-4346) pop temp 0
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

// (-4348) push constant 69
@69 // push constant 69
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4350) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4352) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4354) push constant 35
@35 // push constant 35
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4356) push constant 11
@11 // push constant 11
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4358) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4360) push constant 11
@11 // push constant 11
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4362) push constant 35
@35 // push constant 35
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4364) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4366) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4368) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4370) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4373) call Output.create 12
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

// (-4375) push constant 0 // local(0) init
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

// (-4377) pop temp 0
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

// (-4379) push constant 70
@70 // push constant 70
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4381) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4383) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4385) push constant 35
@35 // push constant 35
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4387) push constant 11
@11 // push constant 11
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4389) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4391) push constant 11
@11 // push constant 11
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4393) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4395) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4397) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4399) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4401) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4404) call Output.create 12
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

// (-4406) push constant 0 // local(0) init
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

// (-4408) pop temp 0
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

// (-4410) push constant 71
@71 // push constant 71
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4412) push constant 28
@28 // push constant 28
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4414) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4416) push constant 35
@35 // push constant 35
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4418) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4420) push constant 59
@59 // push constant 59
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4422) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4424) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4426) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4428) push constant 44
@44 // push constant 44
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4430) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4432) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4435) call Output.create 12
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

// (-4437) push constant 0 // local(0) init
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

// (-4439) pop temp 0
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

// (-4441) push constant 72
@72 // push constant 72
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4443) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4445) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4447) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4449) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4451) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4453) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4455) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4457) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4459) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4461) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4463) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4466) call Output.create 12
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

// (-4468) push constant 0 // local(0) init
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

// (-4470) pop temp 0
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

// (-4472) push constant 73
@73 // push constant 73
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4474) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4476) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4478) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4480) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4482) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4484) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4486) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4488) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4490) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4492) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4494) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4497) call Output.create 12
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

// (-4499) push constant 0 // local(0) init
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

// (-4501) pop temp 0
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

// (-4503) push constant 74
@74 // push constant 74
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4505) push constant 60
@60 // push constant 60
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4507) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4509) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4511) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4513) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4515) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4517) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4519) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4521) push constant 14
@14 // push constant 14
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4523) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4525) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4528) call Output.create 12
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

// (-4530) push constant 0 // local(0) init
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

// (-4532) pop temp 0
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

// (-4534) push constant 75
@75 // push constant 75
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4536) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4538) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4540) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4542) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4544) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4546) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4548) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4550) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4552) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4554) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4556) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4559) call Output.create 12
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

// (-4561) push constant 0 // local(0) init
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

// (-4563) pop temp 0
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

// (-4565) push constant 76
@76 // push constant 76
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4567) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4569) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4571) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4573) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4575) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4577) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4579) push constant 35
@35 // push constant 35
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4581) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4583) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4585) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4587) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4590) call Output.create 12
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

// (-4592) push constant 0 // local(0) init
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

// (-4594) pop temp 0
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

// (-4596) push constant 77
@77 // push constant 77
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4598) push constant 33
@33 // push constant 33
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4600) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4602) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4604) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4606) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4608) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4610) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4612) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4614) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4616) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4618) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4621) call Output.create 12
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

// (-4623) push constant 0 // local(0) init
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

// (-4625) pop temp 0
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

// (-4627) push constant 78
@78 // push constant 78
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4629) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4631) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4633) push constant 55
@55 // push constant 55
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4635) push constant 55
@55 // push constant 55
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4637) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4639) push constant 59
@59 // push constant 59
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4641) push constant 59
@59 // push constant 59
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4643) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4645) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4647) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4649) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4652) call Output.create 12
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

// (-4654) push constant 0 // local(0) init
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

// (-4656) pop temp 0
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

// (-4658) push constant 79
@79 // push constant 79
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4660) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4662) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4664) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4666) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4668) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4670) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4672) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4674) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4676) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4678) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4680) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4683) call Output.create 12
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

// (-4685) push constant 0 // local(0) init
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

// (-4687) pop temp 0
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

// (-4689) push constant 80
@80 // push constant 80
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4691) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4693) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4695) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4697) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4699) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4701) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4703) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4705) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4707) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4709) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4711) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4714) call Output.create 12
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

// (-4716) push constant 0 // local(0) init
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

// (-4718) pop temp 0
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

// (-4720) push constant 81
@81 // push constant 81
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4722) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4724) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4726) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4728) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4730) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4732) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4734) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4736) push constant 59
@59 // push constant 59
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4738) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4740) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4742) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4745) call Output.create 12
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

// (-4747) push constant 0 // local(0) init
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

// (-4749) pop temp 0
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

// (-4751) push constant 82
@82 // push constant 82
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4753) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4755) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4757) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4759) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4761) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4763) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4765) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4767) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4769) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4771) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4773) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4776) call Output.create 12
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

// (-4778) push constant 0 // local(0) init
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

// (-4780) pop temp 0
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

// (-4782) push constant 83
@83 // push constant 83
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4784) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4786) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4788) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4790) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4792) push constant 28
@28 // push constant 28
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4794) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4796) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4798) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4800) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4802) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4804) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4807) call Output.create 12
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

// (-4809) push constant 0 // local(0) init
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

// (-4811) pop temp 0
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

// (-4813) push constant 84
@84 // push constant 84
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4815) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4817) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4819) push constant 45
@45 // push constant 45
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4821) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4823) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4825) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4827) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4829) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4831) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4833) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4835) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4838) call Output.create 12
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

// (-4840) push constant 0 // local(0) init
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

// (-4842) pop temp 0
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

// (-4844) push constant 85
@85 // push constant 85
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4846) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4848) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4850) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4852) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4854) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4856) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4858) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4860) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4862) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4864) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4866) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4869) call Output.create 12
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

// (-4871) push constant 0 // local(0) init
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

// (-4873) pop temp 0
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

// (-4875) push constant 86
@86 // push constant 86
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4877) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4879) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4881) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4883) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4885) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4887) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4889) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4891) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4893) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4895) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4897) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4900) call Output.create 12
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

// (-4902) push constant 0 // local(0) init
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

// (-4904) pop temp 0
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

// (-4906) push constant 87
@87 // push constant 87
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4908) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4910) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4912) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4914) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4916) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4918) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4920) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4922) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4924) push constant 18
@18 // push constant 18
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4926) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4928) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4931) call Output.create 12
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

// (-4933) push constant 0 // local(0) init
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

// (-4935) pop temp 0
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

// (-4937) push constant 88
@88 // push constant 88
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4939) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4941) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4943) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4945) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4947) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4949) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4951) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4953) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4955) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4957) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4959) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4962) call Output.create 12
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

// (-4964) push constant 0 // local(0) init
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

// (-4966) pop temp 0
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

// (-4968) push constant 89
@89 // push constant 89
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4970) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4972) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4974) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4976) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4978) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4980) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4982) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4984) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4986) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4988) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4990) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4993) call Output.create 12
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

// (-4995) push constant 0 // local(0) init
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

// (-4997) pop temp 0
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

// (-4999) push constant 90
@90 // push constant 90
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5001) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5003) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5005) push constant 49
@49 // push constant 49
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5007) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5009) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5011) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5013) push constant 35
@35 // push constant 35
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5015) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5017) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5019) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5021) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5024) call Output.create 12
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

// (-5026) push constant 0 // local(0) init
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

// (-5028) pop temp 0
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

// (-5030) push constant 91
@91 // push constant 91
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5032) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5034) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5036) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5038) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5040) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5042) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5044) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5046) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5048) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5050) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5052) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5055) call Output.create 12
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

// (-5057) push constant 0 // local(0) init
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

// (-5059) pop temp 0
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

// (-5061) push constant 92
@92 // push constant 92
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

// (-5065) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5067) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5069) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5071) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5073) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5075) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5077) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5079) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5081) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5083) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5086) call Output.create 12
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

// (-5088) push constant 0 // local(0) init
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

// (-5090) pop temp 0
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

// (-5092) push constant 93
@93 // push constant 93
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5094) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5096) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5098) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5100) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5102) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5104) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5106) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5108) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5110) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5112) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5114) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5117) call Output.create 12
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

// (-5119) push constant 0 // local(0) init
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

// (-5121) pop temp 0
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

// (-5123) push constant 94
@94 // push constant 94
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5125) push constant 8
@8 // push constant 8
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5127) push constant 28
@28 // push constant 28
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5129) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5131) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5133) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5135) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5137) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5139) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5141) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5143) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5145) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5148) call Output.create 12
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

// (-5150) push constant 0 // local(0) init
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

// (-5152) pop temp 0
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

// (-5154) push constant 95
@95 // push constant 95
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

// (-5158) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5160) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5162) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5164) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5166) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5168) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5170) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5172) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5174) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5176) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5179) call Output.create 12
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

// (-5181) push constant 0 // local(0) init
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

// (-5183) pop temp 0
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

// (-5185) push constant 96
@96 // push constant 96
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5187) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5189) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5191) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5193) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5195) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5197) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5199) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5201) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5203) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5205) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5207) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5210) call Output.create 12
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

// (-5212) push constant 0 // local(0) init
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

// (-5214) pop temp 0
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

// (-5216) push constant 97
@97 // push constant 97
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

// (-5220) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5222) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5224) push constant 14
@14 // push constant 14
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5226) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5228) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5230) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5232) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5234) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5236) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5238) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5241) call Output.create 12
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

// (-5243) push constant 0 // local(0) init
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

// (-5245) pop temp 0
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

// (-5247) push constant 98
@98 // push constant 98
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5249) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5251) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5253) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5255) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5257) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5259) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5261) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5263) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5265) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5267) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5269) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5272) call Output.create 12
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

// (-5274) push constant 0 // local(0) init
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

// (-5276) pop temp 0
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

// (-5278) push constant 99
@99 // push constant 99
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

// (-5282) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5284) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5286) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5288) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5290) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5292) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5294) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5296) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5298) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5300) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5303) call Output.create 12
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

// (-5305) push constant 0 // local(0) init
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

// (-5307) pop temp 0
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

// (-5309) push constant 100
@100 // push constant 100
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5311) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5313) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5315) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5317) push constant 60
@60 // push constant 60
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5319) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5321) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5323) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5325) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5327) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5329) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5331) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5334) call Output.create 12
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

// (-5336) push constant 0 // local(0) init
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

// (-5338) pop temp 0
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

// (-5340) push constant 101
@101 // push constant 101
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

// (-5344) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5346) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5348) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5350) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5352) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5354) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5356) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5358) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5360) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5362) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5365) call Output.create 12
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

// (-5367) push constant 0 // local(0) init
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

// (-5369) pop temp 0
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

// (-5371) push constant 102
@102 // push constant 102
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5373) push constant 28
@28 // push constant 28
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5375) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5377) push constant 38
@38 // push constant 38
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5379) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5381) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5383) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5385) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5387) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5389) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5391) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5393) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5396) call Output.create 12
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

// (-5398) push constant 0 // local(0) init
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

// (-5400) pop temp 0
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

// (-5402) push constant 103
@103 // push constant 103
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

// (-5406) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5408) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5410) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5412) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5414) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5416) push constant 62
@62 // push constant 62
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5418) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5420) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5422) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5424) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5427) call Output.create 12
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

// (-5429) push constant 0 // local(0) init
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

// (-5431) pop temp 0
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

// (-5433) push constant 104
@104 // push constant 104
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5435) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5437) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5439) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5441) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5443) push constant 55
@55 // push constant 55
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5445) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5447) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5449) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5451) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5453) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5455) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5458) call Output.create 12
(Output.Output.create.201) // call Output.create 12
@Output.Output.create.201 // call Output.create // push RIP
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

// (-5460) push constant 0 // local(0) init
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

// (-5462) pop temp 0
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

// (-5464) push constant 105
@105 // push constant 105
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5466) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5468) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5470) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5472) push constant 14
@14 // push constant 14
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5474) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5476) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5478) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5480) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5482) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5484) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5486) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5489) call Output.create 12
(Output.Output.create.202) // call Output.create 12
@Output.Output.create.202 // call Output.create // push RIP
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

// (-5491) push constant 0 // local(0) init
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

// (-5493) pop temp 0
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

// (-5495) push constant 106
@106 // push constant 106
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5497) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5499) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5501) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5503) push constant 56
@56 // push constant 56
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5505) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5507) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5509) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5511) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5513) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5515) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5517) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5520) call Output.create 12
(Output.Output.create.203) // call Output.create 12
@Output.Output.create.203 // call Output.create // push RIP
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

// (-5522) push constant 0 // local(0) init
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

// (-5524) pop temp 0
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

// (-5526) push constant 107
@107 // push constant 107
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5528) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5530) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5532) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5534) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5536) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5538) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5540) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5542) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5544) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5546) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5548) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5551) call Output.create 12
(Output.Output.create.204) // call Output.create 12
@Output.Output.create.204 // call Output.create // push RIP
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

// (-5553) push constant 0 // local(0) init
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

// (-5555) pop temp 0
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

// (-5557) push constant 108
@108 // push constant 108
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5559) push constant 14
@14 // push constant 14
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5561) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5563) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5565) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5567) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5569) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5571) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5573) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5575) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5577) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5579) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5582) call Output.create 12
(Output.Output.create.205) // call Output.create 12
@Output.Output.create.205 // call Output.create // push RIP
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

// (-5584) push constant 0 // local(0) init
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

// (-5586) pop temp 0
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

// (-5588) push constant 109
@109 // push constant 109
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5590) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5592) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5594) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5596) push constant 29
@29 // push constant 29
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5598) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5600) push constant 43
@43 // push constant 43
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5602) push constant 43
@43 // push constant 43
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5604) push constant 43
@43 // push constant 43
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5606) push constant 43
@43 // push constant 43
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5608) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5610) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5613) call Output.create 12
(Output.Output.create.206) // call Output.create 12
@Output.Output.create.206 // call Output.create // push RIP
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

// (-5615) push constant 0 // local(0) init
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

// (-5617) pop temp 0
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

// (-5619) push constant 110
@110 // push constant 110
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5621) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5623) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5625) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5627) push constant 29
@29 // push constant 29
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5629) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5631) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5633) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5635) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5637) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5639) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5641) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5644) call Output.create 12
(Output.Output.create.207) // call Output.create 12
@Output.Output.create.207 // call Output.create // push RIP
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

// (-5646) push constant 0 // local(0) init
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

// (-5648) pop temp 0
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

// (-5650) push constant 111
@111 // push constant 111
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5652) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5654) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5656) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5658) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5660) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5662) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5664) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5666) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5668) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5670) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5672) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5675) call Output.create 12
(Output.Output.create.208) // call Output.create 12
@Output.Output.create.208 // call Output.create // push RIP
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

// (-5677) push constant 0 // local(0) init
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

// (-5679) pop temp 0
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

// (-5681) push constant 112
@112 // push constant 112
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5683) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5685) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5687) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5689) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5691) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5693) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5695) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5697) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5699) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5701) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5703) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5706) call Output.create 12
(Output.Output.create.209) // call Output.create 12
@Output.Output.create.209 // call Output.create // push RIP
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

// (-5708) push constant 0 // local(0) init
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

// (-5710) pop temp 0
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

// (-5712) push constant 113
@113 // push constant 113
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5714) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5716) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5718) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5720) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5722) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5724) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5726) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5728) push constant 62
@62 // push constant 62
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5730) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5732) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5734) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5737) call Output.create 12
(Output.Output.create.210) // call Output.create 12
@Output.Output.create.210 // call Output.create // push RIP
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

// (-5739) push constant 0 // local(0) init
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

// (-5741) pop temp 0
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

// (-5743) push constant 114
@114 // push constant 114
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5745) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5747) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5749) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5751) push constant 29
@29 // push constant 29
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5753) push constant 55
@55 // push constant 55
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5755) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5757) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5759) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5761) push constant 7
@7 // push constant 7
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5763) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5765) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5768) call Output.create 12
(Output.Output.create.211) // call Output.create 12
@Output.Output.create.211 // call Output.create // push RIP
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

// (-5770) push constant 0 // local(0) init
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

// (-5772) pop temp 0
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

// (-5774) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5776) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5778) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5780) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5782) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5784) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5786) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5788) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5790) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5792) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5794) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5796) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5799) call Output.create 12
(Output.Output.create.212) // call Output.create 12
@Output.Output.create.212 // call Output.create // push RIP
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

// (-5801) push constant 0 // local(0) init
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

// (-5803) pop temp 0
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

// (-5805) push constant 116
@116 // push constant 116
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5807) push constant 4
@4 // push constant 4
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5809) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5811) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5813) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5815) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5817) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5819) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5821) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5823) push constant 28
@28 // push constant 28
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5825) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5827) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5830) call Output.create 12
(Output.Output.create.213) // call Output.create 12
@Output.Output.create.213 // call Output.create // push RIP
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

// (-5832) push constant 0 // local(0) init
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

// (-5834) pop temp 0
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

// (-5836) push constant 117
@117 // push constant 117
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5838) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5840) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5842) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5844) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5846) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5848) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5850) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5852) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5854) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5856) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5858) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5861) call Output.create 12
(Output.Output.create.214) // call Output.create 12
@Output.Output.create.214 // call Output.create // push RIP
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

// (-5863) push constant 0 // local(0) init
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

// (-5865) pop temp 0
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

// (-5867) push constant 118
@118 // push constant 118
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5869) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5871) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5873) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5875) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5877) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5879) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5881) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5883) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5885) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5887) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5889) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5892) call Output.create 12
(Output.Output.create.215) // call Output.create 12
@Output.Output.create.215 // call Output.create // push RIP
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

// (-5894) push constant 0 // local(0) init
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

// (-5896) pop temp 0
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

// (-5898) push constant 119
@119 // push constant 119
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5900) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5902) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5904) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5906) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5908) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5910) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5912) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5914) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5916) push constant 18
@18 // push constant 18
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5918) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5920) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5923) call Output.create 12
(Output.Output.create.216) // call Output.create 12
@Output.Output.create.216 // call Output.create // push RIP
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

// (-5925) push constant 0 // local(0) init
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

// (-5927) pop temp 0
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

// (-5929) push constant 120
@120 // push constant 120
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5931) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5933) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5935) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5937) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5939) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5941) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5943) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5945) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5947) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5949) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5951) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5954) call Output.create 12
(Output.Output.create.217) // call Output.create 12
@Output.Output.create.217 // call Output.create // push RIP
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

// (-5956) push constant 0 // local(0) init
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

// (-5958) pop temp 0
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

// (-5960) push constant 121
@121 // push constant 121
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5962) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5964) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5966) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5968) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5970) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5972) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5974) push constant 62
@62 // push constant 62
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5976) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5978) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5980) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5982) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5985) call Output.create 12
(Output.Output.create.218) // call Output.create 12
@Output.Output.create.218 // call Output.create // push RIP
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

// (-5987) push constant 0 // local(0) init
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

// (-5989) pop temp 0
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

// (-5991) push constant 122
@122 // push constant 122
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5993) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5995) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5997) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5999) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6001) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6003) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6005) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6007) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6009) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6011) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6013) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6016) call Output.create 12
(Output.Output.create.219) // call Output.create 12
@Output.Output.create.219 // call Output.create // push RIP
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

// (-6018) push constant 0 // local(0) init
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

// (-6020) pop temp 0
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

// (-6022) push constant 123
@123 // push constant 123
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6024) push constant 56
@56 // push constant 56
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6026) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6028) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6030) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6032) push constant 7
@7 // push constant 7
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6034) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6036) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6038) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6040) push constant 56
@56 // push constant 56
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6042) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6044) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6047) call Output.create 12
(Output.Output.create.220) // call Output.create 12
@Output.Output.create.220 // call Output.create // push RIP
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

// (-6049) push constant 0 // local(0) init
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

// (-6051) pop temp 0
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

// (-6053) push constant 124
@124 // push constant 124
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6055) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6057) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6059) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6061) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6063) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6065) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6067) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6069) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6071) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6073) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6075) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6078) call Output.create 12
(Output.Output.create.221) // call Output.create 12
@Output.Output.create.221 // call Output.create // push RIP
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

// (-6080) push constant 0 // local(0) init
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

// (-6082) pop temp 0
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

// (-6084) push constant 125
@125 // push constant 125
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6086) push constant 7
@7 // push constant 7
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6088) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6090) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6092) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6094) push constant 56
@56 // push constant 56
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6096) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6098) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6100) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6102) push constant 7
@7 // push constant 7
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6104) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6106) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6109) call Output.create 12
(Output.Output.create.222) // call Output.create 12
@Output.Output.create.222 // call Output.create // push RIP
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

// (-6111) push constant 0 // local(0) init
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

// (-6113) pop temp 0
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

// (-6115) push constant 126
@126 // push constant 126
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6117) push constant 38
@38 // push constant 38
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6119) push constant 45
@45 // push constant 45
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6121) push constant 25
@25 // push constant 25
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6123) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6125) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6127) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6129) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6131) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6133) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6135) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6137) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6140) call Output.create 12
(Output.Output.create.223) // call Output.create 12
@Output.Output.create.223 // call Output.create // push RIP
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

// (-6142) push constant 0 // local(0) init
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

// (-6144) pop temp 0
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

// (-6146) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6148) return

// (-6150) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-6152) function Output.create 1
(Output.create) // function Output.create 1

// (-6155) push constant 11
@11 // push constant 11 // function Output.create 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-6158) call Array.new 1
(Output.Array.new.224) // call Array.new 1
@Output.Array.new.224 // call Array.new // push RIP
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

// (-6160) pop local 0
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

// (-6162) push argument 0
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

// (-6164) push static 5
@19 // push static 5 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
D=A
@5
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

// (-6168) push local 0
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

// (-6170) pop temp 0
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

// (-6172) pop pointer 1
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

// (-6174) push temp 0
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

// (-6176) pop that 0
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

// (-6178) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6180) push local 0
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

// (-6182) add
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

// (-6184) push argument 1
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

// (-6186) pop temp 0
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

// (-6188) pop pointer 1
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

// (-6190) push temp 0
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

// (-6192) pop that 0
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

// (-6194) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6196) push local 0
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

// (-6198) add
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

// (-6200) push argument 2
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

// (-6202) pop temp 0
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

// (-6204) pop pointer 1
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

// (-6206) push temp 0
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

// (-6208) pop that 0
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

// (-6210) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6212) push local 0
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

// (-6214) add
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

// (-6216) push argument 3
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

// (-6218) pop temp 0
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

// (-6220) pop pointer 1
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

// (-6222) push temp 0
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

// (-6224) pop that 0
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

// (-6226) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6228) push local 0
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

// (-6230) add
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

// (-6232) push argument 4
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

// (-6234) pop temp 0
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

// (-6236) pop pointer 1
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

// (-6238) push temp 0
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

// (-6240) pop that 0
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

// (-6242) push constant 4
@4 // push constant 4
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6244) push local 0
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

// (-6246) add
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

// (-6248) push argument 5
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

// (-6250) pop temp 0
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

// (-6252) pop pointer 1
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

// (-6254) push temp 0
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

// (-6256) pop that 0
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

// (-6258) push constant 5
@5 // push constant 5
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6260) push local 0
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

// (-6262) add
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

// (-6264) push argument 6
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

// (-6266) pop temp 0
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

// (-6268) pop pointer 1
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

// (-6270) push temp 0
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

// (-6272) pop that 0
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

// (-6274) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6276) push local 0
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

// (-6278) add
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

// (-6280) push argument 7
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

// (-6282) pop temp 0
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

// (-6284) pop pointer 1
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

// (-6286) push temp 0
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

// (-6288) pop that 0
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

// (-6290) push constant 7
@7 // push constant 7
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6292) push local 0
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

// (-6294) add
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

// (-6296) push argument 8
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

// (-6298) pop temp 0
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

// (-6300) pop pointer 1
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

// (-6302) push temp 0
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

// (-6304) pop that 0
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

// (-6306) push constant 8
@8 // push constant 8
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6308) push local 0
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

// (-6310) add
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

// (-6312) push argument 9
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

// (-6314) pop temp 0
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

// (-6316) pop pointer 1
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

// (-6318) push temp 0
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

// (-6320) pop that 0
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

// (-6322) push constant 9
@9 // push constant 9
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6324) push local 0
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

// (-6326) add
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

// (-6328) push argument 10
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

// (-6330) pop temp 0
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

// (-6332) pop pointer 1
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

// (-6334) push temp 0
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

// (-6336) pop that 0
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

// (-6338) push constant 10
@10 // push constant 10
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6340) push local 0
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

// (-6342) add
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

// (-6344) push argument 11
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

// (-6346) pop temp 0
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

// (-6348) pop pointer 1
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

// (-6350) push temp 0
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

// (-6352) pop that 0
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

// (-6354) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6356) return

// (-6358) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-6360) function Output.createShiftedMap 4
(Output.createShiftedMap) // function Output.createShiftedMap 4

// (-6363) push constant 127
@127 // push constant 127 // function Output.createShiftedMap 4
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-6366) call Array.new 1
(Output.Array.new.225) // call Array.new 1
@Output.Array.new.225 // call Array.new // push RIP
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

// (-6368) pop static 6
@19 // pop static 6 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
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

// (-6370) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6372) pop local 2
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

// (-6374) label WHILE_EXP0
(Output.WHILE_EXP0) // label WHILE_EXP0

// (-6377) push local 2
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

// (-6379) push constant 127
@127 // push constant 127
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6381) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_226
D;JLT
(JLT_FALSE_226)
@0
D=A // d = false
@JLT_END_226
0;JMP
(JLT_TRUE_226)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_226)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6386) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-6388) if-goto WHILE_END0
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

// (-6390) push local 2
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

// (-6392) push static 5
@19 // push static 5 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
D=A
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6394) add
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

// (-6396) pop pointer 1
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

// (-6398) push that 0
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

// (-6400) pop local 0
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

// (-6402) push constant 11
@11 // push constant 11
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6405) call Array.new 1
(Output.Array.new.227) // call Array.new 1
@Output.Array.new.227 // call Array.new // push RIP
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

// (-6407) pop local 1
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

// (-6409) push local 2
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

// (-6411) push static 6
@19 // push static 6 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
D=A
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6413) add
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

// (-6415) push local 1
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

// (-6417) pop temp 0
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

// (-6419) pop pointer 1
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

// (-6421) push temp 0
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

// (-6423) pop that 0
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

// (-6425) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6427) pop local 3
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

// (-6429) label WHILE_EXP1
(Output.WHILE_EXP1) // label WHILE_EXP1

// (-6432) push local 3
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

// (-6434) push constant 11
@11 // push constant 11
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6436) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_228
D;JLT
(JLT_FALSE_228)
@0
D=A // d = false
@JLT_END_228
0;JMP
(JLT_TRUE_228)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_228)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6441) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-6443) if-goto WHILE_END1
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

// (-6445) push local 3
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

// (-6447) push local 1
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

// (-6449) add
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

// (-6451) push local 3
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

// (-6453) push local 0
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

// (-6455) add
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

// (-6457) pop pointer 1
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

// (-6459) push that 0
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

// (-6461) push constant 256
@256 // push constant 256
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6464) call Math.multiply 2
(Output.Math.multiply.229) // call Math.multiply 2
@Output.Math.multiply.229 // call Math.multiply // push RIP
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

// (-6466) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6468) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6470) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6472) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6474) push constant 0 // local(4) init
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

// (-6476) pop temp 0
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

// (-6478) pop pointer 1
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

// (-6480) push temp 0
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

// (-6482) pop that 0
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

// (-6484) push local 3
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

// (-6486) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6488) add
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

// (-6490) pop local 3
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

// (-6492) goto WHILE_EXP1
@Output.WHILE_EXP1 // goto WHILE_EXP1
0;JMP // unconditional jump

// (-6494) label WHILE_END1
(Output.WHILE_END1) // label WHILE_END1

// (-6497) push local 2
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

// (-6499) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6501) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_230
D;JEQ
(EQ_FALSE_230)
@0
D=A // d = false
@EQ_END_230
0;JMP
(EQ_TRUE_230)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_230)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6506) if-goto IF_TRUE0
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

// (-6508) goto IF_FALSE0
@Output.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-6510) label IF_TRUE0
(Output.IF_TRUE0) // label IF_TRUE0

// (-6513) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6515) pop local 2
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

// (-6517) goto IF_END0
@Output.IF_END0 // goto IF_END0
0;JMP // unconditional jump

// (-6519) label IF_FALSE0
(Output.IF_FALSE0) // label IF_FALSE0

// (-6522) push local 2
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

// (-6524) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6526) add
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

// (-6528) pop local 2
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

// (-6530) label IF_END0
(Output.IF_END0) // label IF_END0

// (-6533) goto WHILE_EXP0
@Output.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-6535) label WHILE_END0
(Output.WHILE_END0) // label WHILE_END0

// (-6538) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6540) return

// (-6542) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-6544) function Output.getMap 1
(Output.getMap) // function Output.getMap 1

// (-6547) push argument 0
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
// (-6549) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6551) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_231
D;JLT
(JLT_FALSE_231)
@0
D=A // d = false
@JLT_END_231
0;JMP
(JLT_TRUE_231)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_231)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6556) push argument 0
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

// (-6558) push constant 126
@126 // push constant 126
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6560) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_232
D;JGT
(JGT_FALSE_232)
@0
D=A // d = false
@JGT_END_232
0;JMP
(JGT_TRUE_232)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_232)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6565) or
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

// (-6567) if-goto IF_TRUE0
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

// (-6569) goto IF_FALSE0
@Output.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-6571) label IF_TRUE0
(Output.IF_TRUE0) // label IF_TRUE0

// (-6574) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6576) pop argument 0
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

// (-6578) label IF_FALSE0
(Output.IF_FALSE0) // label IF_FALSE0

// (-6581) push static 2
@19 // push static 2 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
D=A
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6583) if-goto IF_TRUE1
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

// (-6585) goto IF_FALSE1
@Output.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-6587) label IF_TRUE1
(Output.IF_TRUE1) // label IF_TRUE1

// (-6590) push argument 0
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

// (-6592) push static 5
@19 // push static 5 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
D=A
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6594) add
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

// (-6596) pop pointer 1
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

// (-6598) push that 0
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

// (-6600) pop local 0
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

// (-6602) goto IF_END1
@Output.IF_END1 // goto IF_END1
0;JMP // unconditional jump

// (-6604) label IF_FALSE1
(Output.IF_FALSE1) // label IF_FALSE1

// (-6607) push argument 0
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

// (-6609) push static 6
@19 // push static 6 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
D=A
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6611) add
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

// (-6613) pop pointer 1
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

// (-6615) push that 0
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

// (-6617) pop local 0
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

// (-6619) label IF_END1
(Output.IF_END1) // label IF_END1

// (-6622) push local 0
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

// (-6624) return

// (-6626) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-6628) function Output.drawChar 4
(Output.drawChar) // function Output.drawChar 4

// (-6631) push argument 0
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
// (-6634) call Output.getMap 1
(Output.Output.getMap.233) // call Output.getMap 1
@Output.Output.getMap.233 // call Output.getMap // push RIP
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

// (-6636) push constant 0 // local(0) init
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

// (-6638) pop local 2
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

// (-6640) push static 1
@19 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6642) pop local 0
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

// (-6644) label WHILE_EXP0
(Output.WHILE_EXP0) // label WHILE_EXP0

// (-6647) push local 1
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

// (-6649) push constant 11
@11 // push constant 11
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6651) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_234
D;JLT
(JLT_FALSE_234)
@0
D=A // d = false
@JLT_END_234
0;JMP
(JLT_TRUE_234)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_234)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6656) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-6658) if-goto WHILE_END0
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

// (-6660) push static 2
@19 // push static 2 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
D=A
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6662) if-goto IF_TRUE0
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

// (-6664) goto IF_FALSE0
@Output.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-6666) label IF_TRUE0
(Output.IF_TRUE0) // label IF_TRUE0

// (-6669) push local 0
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

// (-6671) push static 4
@19 // push static 4 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
D=A
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6673) add
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

// (-6675) pop pointer 1
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

// (-6677) push that 0
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

// (-6679) push constant 256
@256 // push constant 256
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6681) neg
@SP // neg
M=M-1
A=M
M=-M
@SP
M=M+1

// (-6683) and
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

// (-6685) pop local 3
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

// (-6687) goto IF_END0
@Output.IF_END0 // goto IF_END0
0;JMP // unconditional jump

// (-6689) label IF_FALSE0
(Output.IF_FALSE0) // label IF_FALSE0

// (-6692) push local 0
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

// (-6694) push static 4
@19 // push static 4 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
D=A
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6696) add
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

// (-6698) pop pointer 1
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

// (-6700) push that 0
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

// (-6702) push constant 255
@255 // push constant 255
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6704) and
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

// (-6706) pop local 3
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

// (-6708) label IF_END0
(Output.IF_END0) // label IF_END0

// (-6711) push local 0
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

// (-6713) push static 4
@19 // push static 4 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
D=A
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6715) add
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

// (-6717) push local 1
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

// (-6719) push local 2
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

// (-6721) add
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

// (-6723) pop pointer 1
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

// (-6725) push that 0
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

// (-6727) push local 3
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

// (-6729) or
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

// (-6731) pop temp 0
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

// (-6733) pop pointer 1
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

// (-6735) push temp 0
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

// (-6737) pop that 0
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

// (-6739) push local 0
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

// (-6741) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6743) add
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

// (-6745) pop local 0
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

// (-6747) push local 1
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

// (-6749) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6751) add
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

// (-6753) pop local 1
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

// (-6755) goto WHILE_EXP0
@Output.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-6757) label WHILE_END0
(Output.WHILE_END0) // label WHILE_END0

// (-6760) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6762) return

// (-6764) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-6766) function Output.moveCursor 0
(Output.moveCursor) // function Output.moveCursor 0

// (-6769) push argument 0
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
// (-6771) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6773) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_235
D;JLT
(JLT_FALSE_235)
@0
D=A // d = false
@JLT_END_235
0;JMP
(JLT_TRUE_235)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_235)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6778) push argument 0
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

// (-6780) push constant 22
@22 // push constant 22
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6782) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_236
D;JGT
(JGT_FALSE_236)
@0
D=A // d = false
@JGT_END_236
0;JMP
(JGT_TRUE_236)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_236)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6787) or
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

// (-6789) push argument 1
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

// (-6791) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6793) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_237
D;JLT
(JLT_FALSE_237)
@0
D=A // d = false
@JLT_END_237
0;JMP
(JLT_TRUE_237)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_237)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6798) or
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

// (-6800) push argument 1
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

// (-6802) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6804) gt
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

// (-6809) or
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

// (-6811) if-goto IF_TRUE0
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

// (-6813) goto IF_FALSE0
@Output.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-6815) label IF_TRUE0
(Output.IF_TRUE0) // label IF_TRUE0

// (-6818) push constant 20
@20 // push constant 20
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6821) call Sys.error 1
(Output.Sys.error.239) // call Sys.error 1
@Output.Sys.error.239 // call Sys.error // push RIP
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

// (-6823) pop temp 0
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

// (-6825) label IF_FALSE0
(Output.IF_FALSE0) // label IF_FALSE0

// (-6828) push argument 1
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

// (-6830) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6833) call Math.divide 2
(Output.Math.divide.240) // call Math.divide 2
@Output.Math.divide.240 // call Math.divide // push RIP
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

// (-6835) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6837) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6839) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6841) push constant 0 // local(3) init
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

// (-6843) pop static 0
@19 // pop static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
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

// (-6845) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6847) push argument 0
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

// (-6849) push constant 352
@352 // push constant 352
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6852) call Math.multiply 2
(Output.Math.multiply.241) // call Math.multiply 2
@Output.Math.multiply.241 // call Math.multiply // push RIP
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

// (-6854) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6856) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6858) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6860) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6862) push constant 0 // local(4) init
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

// (-6864) add
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

// (-6866) push static 0
@19 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
D=A
@0
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

// (-6870) pop static 1
@19 // pop static 1 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
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

// (-6872) push argument 1
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

// (-6874) push static 0
@19 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6876) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6879) call Math.multiply 2
(Output.Math.multiply.242) // call Math.multiply 2
@Output.Math.multiply.242 // call Math.multiply // push RIP
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

// (-6881) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6883) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6885) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6887) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6889) push constant 0 // local(4) init
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

// (-6891) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_243
D;JEQ
(EQ_FALSE_243)
@0
D=A // d = false
@EQ_END_243
0;JMP
(EQ_TRUE_243)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_243)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6896) pop static 2
@19 // pop static 2 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
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

// (-6898) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6901) call Output.drawChar 1
(Output.Output.drawChar.244) // call Output.drawChar 1
@Output.Output.drawChar.244 // call Output.drawChar // push RIP
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

// (-6903) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6905) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6907) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6909) push constant 0 // local(3) init
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

// (-6911) pop temp 0
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

// (-6913) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6915) return

// (-6917) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-6919) function Output.printChar 0
(Output.printChar) // function Output.printChar 0

// (-6922) push argument 0
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
// (-6925) call String.newLine 0
(Output.String.newLine.245) // call String.newLine 0

// (-6927) push constant 9999 // call String.newLine // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call String.newLine // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Output.String.newLine.245 // push RIP
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

// (-6929) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_246
D;JEQ
(EQ_FALSE_246)
@0
D=A // d = false
@EQ_END_246
0;JMP
(EQ_TRUE_246)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_246)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6934) if-goto IF_TRUE0
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

// (-6936) goto IF_FALSE0
@Output.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-6938) label IF_TRUE0
(Output.IF_TRUE0) // label IF_TRUE0

// (-6942) call Output.println 0
(Output.Output.println.247) // call Output.println 0

// (-6944) push constant 9999 // call Output.println // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Output.println // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Output.Output.println.247 // push RIP
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

// (-6946) pop temp 0
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

// (-6948) goto IF_END0
@Output.IF_END0 // goto IF_END0
0;JMP // unconditional jump

// (-6950) label IF_FALSE0
(Output.IF_FALSE0) // label IF_FALSE0

// (-6953) push argument 0
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

// (-6956) call String.backSpace 0
(Output.String.backSpace.248) // call String.backSpace 0

// (-6958) push constant 9999 // call String.backSpace // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call String.backSpace // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Output.String.backSpace.248 // push RIP
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

// (-6960) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_249
D;JEQ
(EQ_FALSE_249)
@0
D=A // d = false
@EQ_END_249
0;JMP
(EQ_TRUE_249)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_249)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6965) if-goto IF_TRUE1
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

// (-6967) goto IF_FALSE1
@Output.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-6969) label IF_TRUE1
(Output.IF_TRUE1) // label IF_TRUE1

// (-6973) call Output.backSpace 0
(Output.Output.backSpace.250) // call Output.backSpace 0

// (-6975) push constant 9999 // call Output.backSpace // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Output.backSpace // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Output.Output.backSpace.250 // push RIP
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

// (-6977) pop temp 0
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

// (-6979) goto IF_END1
@Output.IF_END1 // goto IF_END1
0;JMP // unconditional jump

// (-6981) label IF_FALSE1
(Output.IF_FALSE1) // label IF_FALSE1

// (-6984) push argument 0
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

// (-6987) call Output.drawChar 1
(Output.Output.drawChar.251) // call Output.drawChar 1
@Output.Output.drawChar.251 // call Output.drawChar // push RIP
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

// (-6989) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6991) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6993) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6995) push constant 0 // local(3) init
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

// (-6997) pop temp 0
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

// (-6999) push static 2
@19 // push static 2 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
D=A
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7001) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-7003) if-goto IF_TRUE2
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

// (-7005) goto IF_FALSE2
@Output.IF_FALSE2 // goto IF_FALSE2
0;JMP // unconditional jump

// (-7007) label IF_TRUE2
(Output.IF_TRUE2) // label IF_TRUE2

// (-7010) push static 0
@19 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7012) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7014) add
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

// (-7016) pop static 0
@19 // pop static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
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

// (-7018) push static 1
@19 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7020) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7022) add
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

// (-7024) pop static 1
@19 // pop static 1 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
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

// (-7026) label IF_FALSE2
(Output.IF_FALSE2) // label IF_FALSE2

// (-7029) push static 0
@19 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7031) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7033) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_252
D;JEQ
(EQ_FALSE_252)
@0
D=A // d = false
@EQ_END_252
0;JMP
(EQ_TRUE_252)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_252)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7038) if-goto IF_TRUE3
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

// (-7040) goto IF_FALSE3
@Output.IF_FALSE3 // goto IF_FALSE3
0;JMP // unconditional jump

// (-7042) label IF_TRUE3
(Output.IF_TRUE3) // label IF_TRUE3

// (-7046) call Output.println 0
(Output.Output.println.253) // call Output.println 0

// (-7048) push constant 9999 // call Output.println // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Output.println // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Output.Output.println.253 // push RIP
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

// (-7050) pop temp 0
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

// (-7052) goto IF_END3
@Output.IF_END3 // goto IF_END3
0;JMP // unconditional jump

// (-7054) label IF_FALSE3
(Output.IF_FALSE3) // label IF_FALSE3

// (-7057) push static 2
@19 // push static 2 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
D=A
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7059) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-7061) pop static 2
@19 // pop static 2 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
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

// (-7063) label IF_END3
(Output.IF_END3) // label IF_END3

// (-7066) label IF_END1
(Output.IF_END1) // label IF_END1

// (-7069) label IF_END0
(Output.IF_END0) // label IF_END0

// (-7072) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7074) return

// (-7076) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-7078) function Output.printString 2
(Output.printString) // function Output.printString 2

// (-7081) push argument 0
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
// (-7084) call String.length 1
(Output.String.length.254) // call String.length 1
@Output.String.length.254 // call String.length // push RIP
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

// (-7086) pop local 1
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

// (-7088) label WHILE_EXP0
(Output.WHILE_EXP0) // label WHILE_EXP0

// (-7091) push local 0
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

// (-7093) push local 1
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

// (-7095) lt
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

// (-7100) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-7102) if-goto WHILE_END0
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

// (-7104) push argument 0
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

// (-7106) push local 0
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

// (-7109) call String.charAt 2
(Output.String.charAt.256) // call String.charAt 2
@Output.String.charAt.256 // call String.charAt // push RIP
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

// (-7112) call Output.printChar 1
(Output.Output.printChar.257) // call Output.printChar 1
@Output.Output.printChar.257 // call Output.printChar // push RIP
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

// (-7114) pop temp 0
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

// (-7116) push local 0
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

// (-7118) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7120) add
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

// (-7122) pop local 0
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

// (-7124) goto WHILE_EXP0
@Output.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-7126) label WHILE_END0
(Output.WHILE_END0) // label WHILE_END0

// (-7129) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7131) return

// (-7133) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-7135) function Output.printInt 0
(Output.printInt) // function Output.printInt 0

// (-7138) push static 3
@19 // push static 3 // function Output.printInt 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
D=A
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-7140) push argument 0
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

// (-7143) call String.setInt 2
(Output.String.setInt.258) // call String.setInt 2
@Output.String.setInt.258 // call String.setInt // push RIP
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

// (-7145) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7147) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7149) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7151) push constant 0 // local(3) init
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

// (-7153) pop temp 0
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

// (-7155) push static 3
@19 // push static 3 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
D=A
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7158) call Output.printString 1
(Output.Output.printString.259) // call Output.printString 1
@Output.Output.printString.259 // call Output.printString // push RIP
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

// (-7160) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7162) push constant 0 // local(1) init
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

// (-7164) pop temp 0
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

// (-7166) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7168) return

// (-7170) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-7172) function Output.println 0
(Output.println) // function Output.println 0

// (-7175) push static 1
@19 // push static 1 // function Output.println 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-7177) push constant 352
@352 // push constant 352
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7179) add
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

// (-7181) push static 0
@19 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7183) sub
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

// (-7185) pop static 1
@19 // pop static 1 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
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

// (-7187) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7189) pop static 0
@19 // pop static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
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

// (-7191) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7193) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-7195) pop static 2
@19 // pop static 2 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
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

// (-7197) push static 1
@19 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7199) push constant 8128
@8128 // push constant 8128
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7201) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_260
D;JEQ
(EQ_FALSE_260)
@0
D=A // d = false
@EQ_END_260
0;JMP
(EQ_TRUE_260)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_260)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7206) if-goto IF_TRUE0
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

// (-7208) goto IF_FALSE0
@Output.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-7210) label IF_TRUE0
(Output.IF_TRUE0) // label IF_TRUE0

// (-7213) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7215) pop static 1
@19 // pop static 1 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
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

// (-7217) label IF_FALSE0
(Output.IF_FALSE0) // label IF_FALSE0

// (-7220) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7222) return

// (-7224) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-7226) function Output.backSpace 0
(Output.backSpace) // function Output.backSpace 0

// (-7229) push static 2
@19 // push static 2 // function Output.backSpace 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
D=A
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-7231) if-goto IF_TRUE0
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

// (-7233) goto IF_FALSE0
@Output.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-7235) label IF_TRUE0
(Output.IF_TRUE0) // label IF_TRUE0

// (-7238) push static 0
@19 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7240) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7242) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_261
D;JGT
(JGT_FALSE_261)
@0
D=A // d = false
@JGT_END_261
0;JMP
(JGT_TRUE_261)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_261)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7247) if-goto IF_TRUE1
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

// (-7249) goto IF_FALSE1
@Output.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-7251) label IF_TRUE1
(Output.IF_TRUE1) // label IF_TRUE1

// (-7254) push static 0
@19 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7256) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7258) sub
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

// (-7260) pop static 0
@19 // pop static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
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

// (-7262) push static 1
@19 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7264) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7266) sub
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

// (-7268) pop static 1
@19 // pop static 1 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
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

// (-7270) goto IF_END1
@Output.IF_END1 // goto IF_END1
0;JMP // unconditional jump

// (-7272) label IF_FALSE1
(Output.IF_FALSE1) // label IF_FALSE1

// (-7275) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7277) pop static 0
@19 // pop static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
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

// (-7279) push static 1
@19 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7281) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7283) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_262
D;JEQ
(EQ_FALSE_262)
@0
D=A // d = false
@EQ_END_262
0;JMP
(EQ_TRUE_262)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_262)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7288) if-goto IF_TRUE2
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

// (-7290) goto IF_FALSE2
@Output.IF_FALSE2 // goto IF_FALSE2
0;JMP // unconditional jump

// (-7292) label IF_TRUE2
(Output.IF_TRUE2) // label IF_TRUE2

// (-7295) push constant 8128
@8128 // push constant 8128
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7297) pop static 1
@19 // pop static 1 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
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

// (-7299) label IF_FALSE2
(Output.IF_FALSE2) // label IF_FALSE2

// (-7302) push static 1
@19 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7304) push constant 321
@321 // push constant 321
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7306) sub
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

// (-7308) pop static 1
@19 // pop static 1 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
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

// (-7310) label IF_END1
(Output.IF_END1) // label IF_END1

// (-7313) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7315) pop static 2
@19 // pop static 2 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
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

// (-7317) goto IF_END0
@Output.IF_END0 // goto IF_END0
0;JMP // unconditional jump

// (-7319) label IF_FALSE0
(Output.IF_FALSE0) // label IF_FALSE0

// (-7322) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7324) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-7326) pop static 2
@19 // pop static 2 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Output.vm)
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

// (-7328) label IF_END0
(Output.IF_END0) // label IF_END0

// (-7331) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7334) call Output.drawChar 1
(Output.Output.drawChar.263) // call Output.drawChar 1
@Output.Output.drawChar.263 // call Output.drawChar // push RIP
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

// (-7336) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7338) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7340) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7342) push constant 0 // local(3) init
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

// (-7344) pop temp 0
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

// (-7346) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7348) return

// (-7350) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-7352) function Screen.init 1
(Screen.init) // function Screen.init 1

// (-7355) push constant 16384
@16384 // push constant 16384 // function Screen.init 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-7357) pop static 1
@26 // pop static 1 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Screen.vm)
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

// (-7359) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7361) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-7363) pop static 2
@26 // pop static 2 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Screen.vm)
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

// (-7365) push constant 17
@17 // push constant 17
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7368) call Array.new 1
(Screen.Array.new.264) // call Array.new 1
@Screen.Array.new.264 // call Array.new // push RIP
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

// (-7370) pop static 0
@26 // pop static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Screen.vm)
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

// (-7372) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7374) push static 0
@26 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Screen.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7376) add
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

// (-7378) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7380) pop temp 0
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

// (-7382) pop pointer 1
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

// (-7384) push temp 0
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

// (-7386) pop that 0
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

// (-7388) label WHILE_EXP0
(Screen.WHILE_EXP0) // label WHILE_EXP0

// (-7391) push local 0
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

// (-7393) push constant 16
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7395) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_265
D;JLT
(JLT_FALSE_265)
@0
D=A // d = false
@JLT_END_265
0;JMP
(JLT_TRUE_265)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_265)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7400) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-7402) if-goto WHILE_END0
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

// (-7404) push local 0
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

// (-7406) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7408) add
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

// (-7410) pop local 0
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

// (-7412) push local 0
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

// (-7414) push static 0
@26 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Screen.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7416) add
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

// (-7418) push local 0
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

// (-7420) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7422) sub
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

// (-7424) push static 0
@26 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Screen.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7426) add
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

// (-7428) pop pointer 1
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

// (-7430) push that 0
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

// (-7432) push local 0
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

// (-7434) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7436) sub
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

// (-7438) push static 0
@26 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Screen.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7440) add
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

// (-7442) pop pointer 1
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

// (-7444) push that 0
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

// (-7446) add
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

// (-7448) pop temp 0
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

// (-7450) pop pointer 1
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

// (-7452) push temp 0
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

// (-7454) pop that 0
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

// (-7456) goto WHILE_EXP0
@Screen.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-7458) label WHILE_END0
(Screen.WHILE_END0) // label WHILE_END0

// (-7461) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7463) return

// (-7465) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-7467) function Screen.clearScreen 1
(Screen.clearScreen) // function Screen.clearScreen 1

// (-7470) label WHILE_EXP0
(Screen.WHILE_EXP0) // label WHILE_EXP0

// (-7473) push local 0
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
// (-7475) push constant 8192
@8192 // push constant 8192
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7477) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_266
D;JLT
(JLT_FALSE_266)
@0
D=A // d = false
@JLT_END_266
0;JMP
(JLT_TRUE_266)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_266)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7482) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-7484) if-goto WHILE_END0
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

// (-7486) push local 0
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

// (-7488) push static 1
@26 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Screen.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7490) add
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

// (-7492) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7494) pop temp 0
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

// (-7496) pop pointer 1
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

// (-7498) push temp 0
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

// (-7500) pop that 0
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

// (-7502) push local 0
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

// (-7504) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7506) add
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

// (-7508) pop local 0
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

// (-7510) goto WHILE_EXP0
@Screen.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-7512) label WHILE_END0
(Screen.WHILE_END0) // label WHILE_END0

// (-7515) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7517) return

// (-7519) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-7521) function Screen.updateLocation 0
(Screen.updateLocation) // function Screen.updateLocation 0

// (-7524) push static 2
@26 // push static 2 // function Screen.updateLocation 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Screen.vm)
D=A
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-7526) if-goto IF_TRUE0
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

// (-7528) goto IF_FALSE0
@Screen.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-7530) label IF_TRUE0
(Screen.IF_TRUE0) // label IF_TRUE0

// (-7533) push argument 0
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

// (-7535) push static 1
@26 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Screen.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7537) add
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

// (-7539) push argument 0
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

// (-7541) push static 1
@26 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Screen.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7543) add
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

// (-7545) pop pointer 1
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

// (-7547) push that 0
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

// (-7549) push argument 1
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

// (-7551) or
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

// (-7553) pop temp 0
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

// (-7555) pop pointer 1
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

// (-7557) push temp 0
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

// (-7559) pop that 0
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

// (-7561) goto IF_END0
@Screen.IF_END0 // goto IF_END0
0;JMP // unconditional jump

// (-7563) label IF_FALSE0
(Screen.IF_FALSE0) // label IF_FALSE0

// (-7566) push argument 0
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

// (-7568) push static 1
@26 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Screen.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7570) add
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

// (-7574) push static 1
@26 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Screen.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7576) add
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

// (-7578) pop pointer 1
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

// (-7580) push that 0
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

// (-7582) push argument 1
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

// (-7584) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-7586) and
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

// (-7588) pop temp 0
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

// (-7590) pop pointer 1
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

// (-7592) push temp 0
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

// (-7594) pop that 0
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

// (-7596) label IF_END0
(Screen.IF_END0) // label IF_END0

// (-7599) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7601) return

// (-7603) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-7605) function Screen.setColor 0
(Screen.setColor) // function Screen.setColor 0

// (-7608) push argument 0
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
// (-7610) pop static 2
@26 // pop static 2 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Screen.vm)
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

// (-7612) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7614) return

// (-7616) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-7618) function Screen.drawPixel 3
(Screen.drawPixel) // function Screen.drawPixel 3

// (-7621) push argument 0
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
// (-7623) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7625) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_267
D;JLT
(JLT_FALSE_267)
@0
D=A // d = false
@JLT_END_267
0;JMP
(JLT_TRUE_267)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_267)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7630) push argument 0
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

// (-7632) push constant 511
@511 // push constant 511
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7634) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_268
D;JGT
(JGT_FALSE_268)
@0
D=A // d = false
@JGT_END_268
0;JMP
(JGT_TRUE_268)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_268)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7639) or
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

// (-7641) push argument 1
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

// (-7643) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7645) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_269
D;JLT
(JLT_FALSE_269)
@0
D=A // d = false
@JLT_END_269
0;JMP
(JLT_TRUE_269)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_269)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7650) or
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

// (-7652) push argument 1
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

// (-7654) push constant 255
@255 // push constant 255
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7656) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_270
D;JGT
(JGT_FALSE_270)
@0
D=A // d = false
@JGT_END_270
0;JMP
(JGT_TRUE_270)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_270)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7661) or
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

// (-7663) if-goto IF_TRUE0
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

// (-7665) goto IF_FALSE0
@Screen.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-7667) label IF_TRUE0
(Screen.IF_TRUE0) // label IF_TRUE0

// (-7670) push constant 7
@7 // push constant 7
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7673) call Sys.error 1
(Screen.Sys.error.271) // call Sys.error 1
@Screen.Sys.error.271 // call Sys.error // push RIP
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

// (-7675) pop temp 0
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

// (-7677) label IF_FALSE0
(Screen.IF_FALSE0) // label IF_FALSE0

// (-7680) push argument 0
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

// (-7682) push constant 16
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7685) call Math.divide 2
(Screen.Math.divide.272) // call Math.divide 2
@Screen.Math.divide.272 // call Math.divide // push RIP
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

// (-7687) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7689) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7691) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7693) push constant 0 // local(3) init
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

// (-7695) pop local 0
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

// (-7697) push argument 0
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

// (-7699) push local 0
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

// (-7701) push constant 16
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7704) call Math.multiply 2
(Screen.Math.multiply.273) // call Math.multiply 2
@Screen.Math.multiply.273 // call Math.multiply // push RIP
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

// (-7706) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7708) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7710) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7712) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7714) push constant 0 // local(4) init
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

// (-7716) sub
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

// (-7718) pop local 1
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

// (-7720) push argument 1
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

// (-7722) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7725) call Math.multiply 2
(Screen.Math.multiply.274) // call Math.multiply 2
@Screen.Math.multiply.274 // call Math.multiply // push RIP
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

// (-7727) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7729) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7731) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7733) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7735) push constant 0 // local(4) init
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

// (-7737) push local 0
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

// (-7741) pop local 2
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

// (-7743) push local 2
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

// (-7745) push local 1
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

// (-7747) push static 0
@26 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\11\Square\Screen.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7749) add
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

// (-7751) pop pointer 1
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

// (-7753) push that 0
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

// (-7756) call Screen.updateLocation 2
(Screen.Screen.updateLocation.275) // call Screen.updateLocation 2
@Screen.Screen.updateLocation.275 // call Screen.updateLocation // push RIP
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

// (-7758) pop temp 0
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

// (-7760) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7762) return

// (-7764) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-7766) function Screen.drawConditional 0
(Screen.drawConditional) // function Screen.drawConditional 0

// (-7769) push argument 2
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
// (-7771) if-goto IF_TRUE0
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

// (-7773) goto IF_FALSE0
@Screen.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-7775) label IF_TRUE0
(Screen.IF_TRUE0) // label IF_TRUE0

// (-7778) push argument 1
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

// (-7780) push argument 0
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

// (-7783) call Screen.drawPixel 2
(Screen.Screen.drawPixel.276) // call Screen.drawPixel 2
@Screen.Screen.drawPixel.276 // call Screen.drawPixel // push RIP
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

// (-7785) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7787) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7789) push constant 0 // local(2) init
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

// (-7791) pop temp 0
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

// (-7793) goto IF_END0
@Screen.IF_END0 // goto IF_END0
0;JMP // unconditional jump

// (-7795) label IF_FALSE0
(Screen.IF_FALSE0) // label IF_FALSE0

// (-7798) push argument 0
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

// (-7800) push argument 1
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

// (-7803) call Screen.drawPixel 2
(Screen.Screen.drawPixel.277) // call Screen.drawPixel 2
@Screen.Screen.drawPixel.277 // call Screen.drawPixel // push RIP
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

// (-7805) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7807) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7809) push constant 0 // local(2) init
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

// (-7811) pop temp 0
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

// (-7813) label IF_END0
(Screen.IF_END0) // label IF_END0

// (-7816) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7818) return

// (-7820) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-7822) function Screen.drawLine 11
(Screen.drawLine) // function Screen.drawLine 11

// (-7825) push argument 0
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
// (-7827) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7829) lt
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

// (-7834) push argument 2
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

// (-7836) push constant 511
@511 // push constant 511
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7838) gt
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

// (-7843) or
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

// (-7845) push argument 1
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

// (-7847) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7849) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_280
D;JLT
(JLT_FALSE_280)
@0
D=A // d = false
@JLT_END_280
0;JMP
(JLT_TRUE_280)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_280)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7854) or
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

// (-7856) push argument 3
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

// (-7858) push constant 255
@255 // push constant 255
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7860) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_281
D;JGT
(JGT_FALSE_281)
@0
D=A // d = false
@JGT_END_281
0;JMP
(JGT_TRUE_281)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_281)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7865) or
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

// (-7867) if-goto IF_TRUE0
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

// (-7869) goto IF_FALSE0
@Screen.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-7871) label IF_TRUE0
(Screen.IF_TRUE0) // label IF_TRUE0

// (-7874) push constant 8
@8 // push constant 8
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7877) call Sys.error 1
(Screen.Sys.error.282) // call Sys.error 1
@Screen.Sys.error.282 // call Sys.error // push RIP
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

// (-7879) pop temp 0
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

// (-7881) label IF_FALSE0
(Screen.IF_FALSE0) // label IF_FALSE0

// (-7884) push argument 2
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

// (-7886) push argument 0
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

// (-7888) sub
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

// (-7891) call Math.abs 1
(Screen.Math.abs.283) // call Math.abs 1
@Screen.Math.abs.283 // call Math.abs // push RIP
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

// (-7893) pop local 3
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

// (-7895) push argument 3
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

// (-7897) push argument 1
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

// (-7899) sub
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

// (-7902) call Math.abs 1
(Screen.Math.abs.284) // call Math.abs 1
@Screen.Math.abs.284 // call Math.abs // push RIP
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

// (-7904) pop local 2
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

// (-7906) push local 3
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

// (-7908) push local 2
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

// (-7910) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_285
D;JLT
(JLT_FALSE_285)
@0
D=A // d = false
@JLT_END_285
0;JMP
(JLT_TRUE_285)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_285)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7915) pop local 6
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

// (-7917) push local 6
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

// (-7919) push argument 3
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

// (-7921) push argument 1
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

// (-7923) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_286
D;JLT
(JLT_FALSE_286)
@0
D=A // d = false
@JLT_END_286
0;JMP
(JLT_TRUE_286)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_286)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7928) and
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

// (-7930) push local 6
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

// (-7932) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-7934) push argument 2
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

// (-7936) push argument 0
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

// (-7938) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_287
D;JLT
(JLT_FALSE_287)
@0
D=A // d = false
@JLT_END_287
0;JMP
(JLT_TRUE_287)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_287)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7943) and
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

// (-7945) or
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

// (-7947) if-goto IF_TRUE1
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

// (-7949) goto IF_FALSE1
@Screen.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-7951) label IF_TRUE1
(Screen.IF_TRUE1) // label IF_TRUE1

// (-7954) push argument 0
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

// (-7956) pop local 4
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

// (-7958) push argument 2
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

// (-7960) pop argument 0
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

// (-7962) push local 4
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

// (-7964) pop argument 2
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

// (-7966) push argument 1
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

// (-7968) pop local 4
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

// (-7970) push argument 3
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

// (-7972) pop argument 1
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

// (-7974) push local 4
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

// (-7976) pop argument 3
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

// (-7978) label IF_FALSE1
(Screen.IF_FALSE1) // label IF_FALSE1

// (-7981) push local 6
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

// (-7983) if-goto IF_TRUE2
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

// (-7985) goto IF_FALSE2
@Screen.IF_FALSE2 // goto IF_FALSE2
0;JMP // unconditional jump

// (-7987) label IF_TRUE2
(Screen.IF_TRUE2) // label IF_TRUE2

// (-7990) push local 3
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

// (-7992) pop local 4
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

// (-7994) push local 2
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

// (-7996) pop local 3
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

// (-7998) push local 4
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

// (-8000) pop local 2
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

// (-8002) push argument 1
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

// (-8004) pop local 1
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

// (-8006) push argument 0
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

// (-8008) pop local 0
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

// (-8010) push argument 3
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

// (-8012) pop local 8
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

// (-8014) push argument 0
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

// (-8016) push argument 2
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

// (-8018) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_288
D;JGT
(JGT_FALSE_288)
@0
D=A // d = false
@JGT_END_288
0;JMP
(JGT_TRUE_288)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_288)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

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

// (-8025) goto IF_END2
@Screen.IF_END2 // goto IF_END2
0;JMP // unconditional jump

// (-8027) label IF_FALSE2
(Screen.IF_FALSE2) // label IF_FALSE2

// (-8030) push argument 0
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

// (-8032) pop local 1
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

// (-8034) push argument 1
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

// (-8036) pop local 0
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

// (-8038) push argument 2
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

// (-8040) pop local 8
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

// (-8042) push argument 1
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

// (-8044) push argument 3
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

// (-8046) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_289
D;JGT
(JGT_FALSE_289)
@0
D=A // d = false
@JGT_END_289
0;JMP
(JGT_TRUE_289)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_289)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-8051) pop local 7
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

// (-8053) label IF_END2
(Screen.IF_END2) // label IF_END2

// (-8056) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8058) push local 2
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

// (-8061) call Math.multiply 2
(Screen.Math.multiply.290) // call Math.multiply 2
@Screen.Math.multiply.290 // call Math.multiply // push RIP
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

// (-8063) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8065) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8067) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8069) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8071) push constant 0 // local(4) init
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

// (-8073) push local 3
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

// (-8075) sub
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

// (-8077) pop local 5
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

// (-8079) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8081) push local 2
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

// (-8084) call Math.multiply 2
(Screen.Math.multiply.291) // call Math.multiply 2
@Screen.Math.multiply.291 // call Math.multiply // push RIP
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

// (-8086) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8088) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8090) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8092) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8094) push constant 0 // local(4) init
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

// (-8096) pop local 9
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

// (-8098) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8100) push local 2
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

// (-8102) push local 3
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

// (-8104) sub
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

// (-8107) call Math.multiply 2
(Screen.Math.multiply.292) // call Math.multiply 2
@Screen.Math.multiply.292 // call Math.multiply // push RIP
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

// (-8109) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8111) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8113) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8115) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8117) push constant 0 // local(4) init
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

// (-8119) pop local 10
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

// (-8121) push local 1
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

// (-8123) push local 0
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

// (-8125) push local 6
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

// (-8128) call Screen.drawConditional 3
(Screen.Screen.drawConditional.293) // call Screen.drawConditional 3
@Screen.Screen.drawConditional.293 // call Screen.drawConditional // push RIP
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

// (-8130) pop temp 0
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

// (-8132) label WHILE_EXP0
(Screen.WHILE_EXP0) // label WHILE_EXP0

// (-8135) push local 1
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

// (-8137) push local 8
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

// (-8139) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_294
D;JLT
(JLT_FALSE_294)
@0
D=A // d = false
@JLT_END_294
0;JMP
(JLT_TRUE_294)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_294)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-8144) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-8146) if-goto WHILE_END0
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

// (-8148) push local 5
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

// (-8150) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8152) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_295
D;JLT
(JLT_FALSE_295)
@0
D=A // d = false
@JLT_END_295
0;JMP
(JLT_TRUE_295)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_295)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-8157) if-goto IF_TRUE3
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

// (-8159) goto IF_FALSE3
@Screen.IF_FALSE3 // goto IF_FALSE3
0;JMP // unconditional jump

// (-8161) label IF_TRUE3
(Screen.IF_TRUE3) // label IF_TRUE3

// (-8164) push local 5
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

// (-8166) push local 9
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

// (-8168) add
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

// (-8170) pop local 5
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

// (-8172) goto IF_END3
@Screen.IF_END3 // goto IF_END3
0;JMP // unconditional jump

// (-8174) label IF_FALSE3
(Screen.IF_FALSE3) // label IF_FALSE3

// (-8177) push local 5
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

// (-8179) push local 10
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

// (-8181) add
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

// (-8183) pop local 5
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

// (-8185) push local 7
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

// (-8187) if-goto IF_TRUE4
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

// (-8189) goto IF_FALSE4
@Screen.IF_FALSE4 // goto IF_FALSE4
0;JMP // unconditional jump

// (-8191) label IF_TRUE4
(Screen.IF_TRUE4) // label IF_TRUE4

// (-8194) push local 0
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

// (-8196) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8198) sub
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

// (-8200) pop local 0
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

// (-8202) goto IF_END4
@Screen.IF_END4 // goto IF_END4
0;JMP // unconditional jump

// (-8204) label IF_FALSE4
(Screen.IF_FALSE4) // label IF_FALSE4

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

// (-8209) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8211) add
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

// (-8213) pop local 0
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

// (-8215) label IF_END4
(Screen.IF_END4) // label IF_END4

// (-8218) label IF_END3
(Screen.IF_END3) // label IF_END3

// (-8221) push local 1
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

// (-8223) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8225) add
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

// (-8227) pop local 1
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

// (-8229) push local 1
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

// (-8231) push local 0
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

// (-8233) push local 6
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

// (-8236) call Screen.drawConditional 3
(Screen.Screen.drawConditional.296) // call Screen.drawConditional 3
@Screen.Screen.drawConditional.296 // call Screen.drawConditional // push RIP
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

// (-8238) pop temp 0
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

// (-8240) goto WHILE_EXP0
@Screen.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-8242) label WHILE_END0
(Screen.WHILE_END0) // label WHILE_END0

// (-8245) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8247) return

// (-8249) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-8251) function Screen.drawRectangle 9
(Screen.drawRectangle) // function Screen.drawRectangle 9

// (-8254) push argument 0
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
// (-8256) push argument 2
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

// (-8258) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
D;JGT
