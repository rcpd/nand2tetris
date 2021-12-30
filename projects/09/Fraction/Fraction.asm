
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

// (-52) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-54) push constant 0 // local(2) init
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
@92 // prologue_size
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
@1 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@3 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Main.main // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-56) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-59) call Sys.halt 0
(sys.Sys.halt.7) // call Sys.halt 0

// (-61) push constant 9999 // call Sys.halt // if no args, create a space on the stack for the return
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

// (-63) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-65) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-67) return

// (-69) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-71) function Sys.halt 0
(Sys.halt) // function Sys.halt 0

// (-74) label WHILE_EXP0
(sys.WHILE_EXP0) // label WHILE_EXP0

// (-77) push constant 0
@0 // push constant 0 // function Sys.halt 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-79) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-81) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-83) if-goto WHILE_END0
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

// (-85) goto WHILE_EXP0
@sys.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-87) label WHILE_END0
(sys.WHILE_END0) // label WHILE_END0

// (-90) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-92) return

// (-94) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-96) function Sys.wait 1
(Sys.wait) // function Sys.wait 1

// (-99) push argument 0
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
// (-101) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-103) lt
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

// (-108) if-goto IF_TRUE0
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

// (-110) goto IF_FALSE0
@sys.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-112) label IF_TRUE0
(sys.IF_TRUE0) // label IF_TRUE0

// (-115) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-118) call Sys.error 1
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

// (-120) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-122) label IF_FALSE0
(sys.IF_FALSE0) // label IF_FALSE0

// (-125) label WHILE_EXP0
(sys.WHILE_EXP0) // label WHILE_EXP0

// (-128) push argument 0
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

// (-130) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-132) gt
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

// (-137) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-139) if-goto WHILE_END0
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

// (-141) push constant 50
@50 // push constant 50
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-143) pop local 0
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

// (-145) label WHILE_EXP1
(sys.WHILE_EXP1) // label WHILE_EXP1

// (-148) push local 0
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

// (-150) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-152) gt
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

// (-157) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-159) if-goto WHILE_END1
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

// (-161) push local 0
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

// (-163) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-165) sub
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

// (-167) pop local 0
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

// (-169) goto WHILE_EXP1
@sys.WHILE_EXP1 // goto WHILE_EXP1
0;JMP // unconditional jump

// (-171) label WHILE_END1
(sys.WHILE_END1) // label WHILE_END1

// (-174) push argument 0
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

// (-176) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-178) sub
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

// (-180) pop argument 0
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

// (-182) goto WHILE_EXP0
@sys.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-184) label WHILE_END0
(sys.WHILE_END0) // label WHILE_END0

// (-187) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-189) return

// (-191) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-193) function Sys.error 0
(Sys.error) // function Sys.error 0

// (-196) push constant 3
@3 // push constant 3 // function Sys.error 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-199) call String.new 1
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

// (-201) push constant 69
@69 // push constant 69
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-204) call String.appendChar 2
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

// (-206) push constant 82
@82 // push constant 82
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-209) call String.appendChar 2
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

// (-211) push constant 82
@82 // push constant 82
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-214) call String.appendChar 2
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

// (-217) call Output.printString 1
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

// (-219) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-221) push constant 0 // local(1) init
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

// (-223) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-225) push argument 0
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

// (-228) call Output.printInt 1
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

// (-230) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-233) call Sys.halt 0
(sys.Sys.halt.18) // call Sys.halt 0

// (-235) push constant 9999 // call Sys.halt // if no args, create a space on the stack for the return
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

// (-237) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-239) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-241) return

// (-243) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-245) function Main.main 3
(Main.main) // function Main.main 3

// (-248) push constant 2
@2 // push constant 2 // function Main.main 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-250) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-253) call Fraction.new 2
(main.Fraction.new.19) // call Fraction.new 2
@main.Fraction.new.19 // call Fraction.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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
@Fraction.new // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-255) pop local 0
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

// (-257) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-259) push constant 5
@5 // push constant 5
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-262) call Fraction.new 2
(main.Fraction.new.20) // call Fraction.new 2
@main.Fraction.new.20 // call Fraction.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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
@Fraction.new // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-264) pop local 1
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

// (-266) push local 0
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

// (-268) push local 1
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

// (-271) call Fraction.plus 2
(main.Fraction.plus.21) // call Fraction.plus 2
@main.Fraction.plus.21 // call Fraction.plus // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-273) push constant 0 // local(0) init
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Fraction.plus // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-275) pop local 2
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

// (-277) push local 2
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

// (-280) call Fraction.print 1
(main.Fraction.print.22) // call Fraction.print 1
@main.Fraction.print.22 // call Fraction.print // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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
@Fraction.print // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-282) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-284) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-286) return

// (-288) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-290) function Fraction.new 0
(Fraction.new) // function Fraction.new 0

// (-293) push constant 2
@2 // push constant 2 // function Fraction.new 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-296) call Memory.alloc 1
(Fraction.Memory.alloc.23) // call Memory.alloc 1
@Fraction.Memory.alloc.23 // call Memory.alloc // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-298) push constant 0 // local(0) init
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

// (-300) pop pointer 0
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

// (-302) push argument 0
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

// (-304) pop this 0
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

// (-306) push argument 1
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

// (-308) pop this 1
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

// (-310) push pointer 0
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

// (-313) call Fraction.reduce 1
(Fraction.Fraction.reduce.24) // call Fraction.reduce 1
@Fraction.Fraction.reduce.24 // call Fraction.reduce // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-315) push constant 0 // local(0) init
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
@Fraction.reduce // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-317) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
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

// (-321) return

// (-323) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-325) function Fraction.reduce 1
(Fraction.reduce) // function Fraction.reduce 1

// (-328) push argument 0
@ARG // push argument 0 // function Fraction.reduce 1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-330) pop pointer 0
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

// (-332) push this 0
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

// (-334) push this 1
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

// (-337) call Fraction.gcd 2
(Fraction.Fraction.gcd.25) // call Fraction.gcd 2
@Fraction.Fraction.gcd.25 // call Fraction.gcd // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-339) push constant 0 // local(0) init
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
@2 // parse num_args from call <label> <num_args>
D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)
@ARG // *ARG
M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)
@1 // (num_locals) // initialize callee LCL (same as SP if none) 
D=A // d = num_locals
@SP // (SP currently at bottom of stack frame)
D=M-D // d = [SP]-num_locals ([LCL])
@LCL // *LCL
M=D // [LCL] = *SP-num_locals ([LCL])
@Fraction.gcd // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-341) pop local 0
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

// (-343) push local 0
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

// (-345) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-347) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_26
D;JGT
(JGT_FALSE_26)
@0
D=A // d = false
@JGT_END_26
0;JMP
(JGT_TRUE_26)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_26)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-352) if-goto IF_TRUE0
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
@Fraction.IF_TRUE0
D;JNE // jump if not zero

// (-354) goto IF_FALSE0
@Fraction.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-356) label IF_TRUE0
(Fraction.IF_TRUE0) // label IF_TRUE0

// (-359) push this 0
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

// (-361) push local 0
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

// (-364) call Math.divide 2
(Fraction.Math.divide.27) // call Math.divide 2
@Fraction.Math.divide.27 // call Math.divide // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-366) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-368) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-370) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-372) push constant 0 // local(3) init
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

// (-374) pop this 0
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

// (-376) push this 1
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

// (-378) push local 0
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

// (-381) call Math.divide 2
(Fraction.Math.divide.28) // call Math.divide 2
@Fraction.Math.divide.28 // call Math.divide // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-383) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-385) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-387) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-389) push constant 0 // local(3) init
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

// (-391) pop this 1
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

// (-393) label IF_FALSE0
(Fraction.IF_FALSE0) // label IF_FALSE0

// (-396) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-398) return

// (-400) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-402) function Fraction.getNumerator 0
(Fraction.getNumerator) // function Fraction.getNumerator 0

// (-405) push argument 0
@ARG // push argument 0 // function Fraction.getNumerator 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-407) pop pointer 0
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

// (-409) push this 0
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

// (-411) return

// (-413) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-415) function Fraction.getDenominator 0
(Fraction.getDenominator) // function Fraction.getDenominator 0

// (-418) push argument 0
@ARG // push argument 0 // function Fraction.getDenominator 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-420) pop pointer 0
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

// (-422) push this 1
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

// (-424) return

// (-426) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-428) function Fraction.plus 1
(Fraction.plus) // function Fraction.plus 1

// (-431) push argument 0
@ARG // push argument 0 // function Fraction.plus 1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-433) pop pointer 0
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

// (-435) push this 0
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

// (-437) push argument 1
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

// (-440) call Fraction.getDenominator 1
(Fraction.Fraction.getDenominator.29) // call Fraction.getDenominator 1
@Fraction.Fraction.getDenominator.29 // call Fraction.getDenominator // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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
@Fraction.getDenominator // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-443) call Math.multiply 2
(Fraction.Math.multiply.30) // call Math.multiply 2
@Fraction.Math.multiply.30 // call Math.multiply // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-449) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-451) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-453) push constant 0 // local(4) init
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

// (-455) push argument 1
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

// (-458) call Fraction.getNumerator 1
(Fraction.Fraction.getNumerator.31) // call Fraction.getNumerator 1
@Fraction.Fraction.getNumerator.31 // call Fraction.getNumerator // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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
@Fraction.getNumerator // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-460) push this 1
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

// (-463) call Math.multiply 2
(Fraction.Math.multiply.32) // call Math.multiply 2
@Fraction.Math.multiply.32 // call Math.multiply // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-465) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-467) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-469) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-471) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-473) push constant 0 // local(4) init
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

// (-475) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-477) pop local 0
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

// (-479) push local 0
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

// (-481) push this 1
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

// (-483) push argument 1
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

// (-486) call Fraction.getDenominator 1
(Fraction.Fraction.getDenominator.33) // call Fraction.getDenominator 1
@Fraction.Fraction.getDenominator.33 // call Fraction.getDenominator // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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
@Fraction.getDenominator // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-489) call Math.multiply 2
(Fraction.Math.multiply.34) // call Math.multiply 2
@Fraction.Math.multiply.34 // call Math.multiply // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-491) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-493) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-495) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-497) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-499) push constant 0 // local(4) init
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

// (-502) call Fraction.new 2
(Fraction.Fraction.new.35) // call Fraction.new 2
@Fraction.Fraction.new.35 // call Fraction.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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
@Fraction.new // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-504) return

// (-506) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-508) function Fraction.dispose 0
(Fraction.dispose) // function Fraction.dispose 0

// (-511) push argument 0
@ARG // push argument 0 // function Fraction.dispose 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-513) pop pointer 0
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

// (-515) push pointer 0
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

// (-518) call Memory.deAlloc 1
(Fraction.Memory.deAlloc.36) // call Memory.deAlloc 1
@Fraction.Memory.deAlloc.36 // call Memory.deAlloc // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-520) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-522) push constant 0 // local(1) init
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

// (-524) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-526) push constant 0
@0 // push constant 0
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

// (-532) function Fraction.print 0
(Fraction.print) // function Fraction.print 0

// (-535) push argument 0
@ARG // push argument 0 // function Fraction.print 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-537) pop pointer 0
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

// (-539) push this 0
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

// (-542) call Output.printInt 1
(Fraction.Output.printInt.37) // call Output.printInt 1
@Fraction.Output.printInt.37 // call Output.printInt // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-544) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-546) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-549) call String.new 1
(Fraction.String.new.38) // call String.new 1
@Fraction.String.new.38 // call String.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-551) push constant 47
@47 // push constant 47
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-554) call String.appendChar 2
(Fraction.String.appendChar.39) // call String.appendChar 2
@Fraction.String.appendChar.39 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-557) call Output.printString 1
(Fraction.Output.printString.40) // call Output.printString 1
@Fraction.Output.printString.40 // call Output.printString // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-559) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-561) push constant 0 // local(1) init
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

// (-563) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-565) push this 1
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

// (-568) call Output.printInt 1
(Fraction.Output.printInt.41) // call Output.printInt 1
@Fraction.Output.printInt.41 // call Output.printInt // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-570) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-572) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-574) return

// (-576) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-578) function Fraction.gcd 1
(Fraction.gcd) // function Fraction.gcd 1

// (-581) label WHILE_EXP0
(Fraction.WHILE_EXP0) // label WHILE_EXP0

// (-584) push argument 1
@ARG // push argument 1 // function Fraction.gcd 1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-586) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-588) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_42
D;JEQ
(EQ_FALSE_42)
@0
D=A // d = false
@EQ_END_42
0;JMP
(EQ_TRUE_42)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_42)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-593) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-595) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-597) if-goto WHILE_END0
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
@Fraction.WHILE_END0
D;JNE // jump if not zero

// (-599) push argument 0
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

// (-601) push argument 1
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

// (-603) push argument 0
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

// (-605) push argument 1
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

// (-608) call Math.divide 2
(Fraction.Math.divide.43) // call Math.divide 2
@Fraction.Math.divide.43 // call Math.divide // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-610) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-612) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-614) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-616) push constant 0 // local(3) init
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

// (-619) call Math.multiply 2
(Fraction.Math.multiply.44) // call Math.multiply 2
@Fraction.Math.multiply.44 // call Math.multiply // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-621) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-623) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-625) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-627) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-629) push constant 0 // local(4) init
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

// (-631) sub
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

// (-633) pop local 0
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

// (-635) push argument 1
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

// (-637) pop argument 0
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

// (-639) push local 0
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

// (-641) pop argument 1
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

// (-643) goto WHILE_EXP0
@Fraction.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-645) label WHILE_END0
(Fraction.WHILE_END0) // label WHILE_END0

// (-648) push argument 0
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

// (-650) return

// (-652) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-654) function Array.new 0
(Array.new) // function Array.new 0

// (-657) push argument 0
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
// (-659) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-661) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_45
D;JGT
(JGT_FALSE_45)
@0
D=A // d = false
@JGT_END_45
0;JMP
(JGT_TRUE_45)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_45)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-666) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-668) if-goto IF_TRUE0
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

// (-670) goto IF_FALSE0
@Array.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-672) label IF_TRUE0
(Array.IF_TRUE0) // label IF_TRUE0

// (-675) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-678) call Sys.error 1
(Array.Sys.error.46) // call Sys.error 1
@Array.Sys.error.46 // call Sys.error // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-680) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-682) label IF_FALSE0
(Array.IF_FALSE0) // label IF_FALSE0

// (-685) push argument 0
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

// (-688) call Memory.alloc 1
(Array.Memory.alloc.47) // call Memory.alloc 1
@Array.Memory.alloc.47 // call Memory.alloc // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-692) return

// (-694) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-696) function Array.dispose 0
(Array.dispose) // function Array.dispose 0

// (-699) push argument 0
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
// (-701) pop pointer 0
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

// (-703) push pointer 0
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

// (-706) call Memory.deAlloc 1
(Array.Memory.deAlloc.48) // call Memory.deAlloc 1
@Array.Memory.deAlloc.48 // call Memory.deAlloc // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-708) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-710) push constant 0 // local(1) init
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

// (-712) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-714) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-716) return

// (-718) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-720) function Keyboard.init 0
(Keyboard.init) // function Keyboard.init 0

// (-723) push constant 0
@0 // push constant 0 // function Keyboard.init 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-725) return

// (-727) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-729) function Keyboard.keyPressed 0
(Keyboard.keyPressed) // function Keyboard.keyPressed 0

// (-732) push constant 24576
@24576 // push constant 24576 // function Keyboard.keyPressed 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-735) call Memory.peek 1
(Keyboard.Memory.peek.49) // call Memory.peek 1
@Keyboard.Memory.peek.49 // call Memory.peek // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-737) return

// (-739) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-741) function Keyboard.readChar 2
(Keyboard.readChar) // function Keyboard.readChar 2

// (-744) push constant 0
@0 // push constant 0 // function Keyboard.readChar 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-747) call Output.printChar 1
(Keyboard.Output.printChar.50) // call Output.printChar 1
@Keyboard.Output.printChar.50 // call Output.printChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-749) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-751) label WHILE_EXP0
(Keyboard.WHILE_EXP0) // label WHILE_EXP0

// (-754) push local 1
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

// (-756) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-758) eq
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

// (-763) push local 0
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

// (-765) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-767) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_52
D;JGT
(JGT_FALSE_52)
@0
D=A // d = false
@JGT_END_52
0;JMP
(JGT_TRUE_52)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_52)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-772) or
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

// (-774) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-776) if-goto WHILE_END0
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

// (-779) call Keyboard.keyPressed 0
(Keyboard.Keyboard.keyPressed.53) // call Keyboard.keyPressed 0

// (-781) push constant 9999 // call Keyboard.keyPressed // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Keyboard.keyPressed // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Keyboard.Keyboard.keyPressed.53 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-783) pop local 0
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

// (-785) push local 0
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

// (-787) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-789) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_54
D;JGT
(JGT_FALSE_54)
@0
D=A // d = false
@JGT_END_54
0;JMP
(JGT_TRUE_54)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_54)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-794) if-goto IF_TRUE0
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

// (-796) goto IF_FALSE0
@Keyboard.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-798) label IF_TRUE0
(Keyboard.IF_TRUE0) // label IF_TRUE0

// (-801) push local 0
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

// (-803) pop local 1
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

// (-805) label IF_FALSE0
(Keyboard.IF_FALSE0) // label IF_FALSE0

// (-808) goto WHILE_EXP0
@Keyboard.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-810) label WHILE_END0
(Keyboard.WHILE_END0) // label WHILE_END0

// (-814) call String.backSpace 0
(Keyboard.String.backSpace.55) // call String.backSpace 0

// (-816) push constant 9999 // call String.backSpace // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call String.backSpace // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Keyboard.String.backSpace.55 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-819) call Output.printChar 1
(Keyboard.Output.printChar.56) // call Output.printChar 1
@Keyboard.Output.printChar.56 // call Output.printChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-821) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-823) push local 1
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

// (-826) call Output.printChar 1
(Keyboard.Output.printChar.57) // call Output.printChar 1
@Keyboard.Output.printChar.57 // call Output.printChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-828) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-830) push local 1
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

// (-832) return

// (-834) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-836) function Keyboard.readLine 5
(Keyboard.readLine) // function Keyboard.readLine 5

// (-839) push constant 80
@80 // push constant 80 // function Keyboard.readLine 5
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-842) call String.new 1
(Keyboard.String.new.58) // call String.new 1
@Keyboard.String.new.58 // call String.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-844) pop local 3
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

// (-846) push argument 0
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

// (-849) call Output.printString 1
(Keyboard.Output.printString.59) // call Output.printString 1
@Keyboard.Output.printString.59 // call Output.printString // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-851) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-853) push constant 0 // local(1) init
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

// (-855) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-858) call String.newLine 0
(Keyboard.String.newLine.60) // call String.newLine 0

// (-860) push constant 9999 // call String.newLine // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call String.newLine // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Keyboard.String.newLine.60 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-862) pop local 1
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

// (-865) call String.backSpace 0
(Keyboard.String.backSpace.61) // call String.backSpace 0

// (-867) push constant 9999 // call String.backSpace // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call String.backSpace // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Keyboard.String.backSpace.61 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-869) pop local 2
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

// (-871) label WHILE_EXP0
(Keyboard.WHILE_EXP0) // label WHILE_EXP0

// (-874) push local 4
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

// (-876) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-878) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-880) if-goto WHILE_END0
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

// (-883) call Keyboard.readChar 0
(Keyboard.Keyboard.readChar.62) // call Keyboard.readChar 0

// (-885) push constant 9999 // call Keyboard.readChar // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Keyboard.readChar // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Keyboard.Keyboard.readChar.62 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-887) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-889) push constant 0 // local(1) init
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

// (-891) pop local 0
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

// (-893) push local 0
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

// (-895) push local 1
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

// (-897) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_63
D;JEQ
(EQ_FALSE_63)
@0
D=A // d = false
@EQ_END_63
0;JMP
(EQ_TRUE_63)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_63)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-902) pop local 4
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

// (-904) push local 4
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

// (-906) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-908) if-goto IF_TRUE0
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

// (-910) goto IF_FALSE0
@Keyboard.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-912) label IF_TRUE0
(Keyboard.IF_TRUE0) // label IF_TRUE0

// (-915) push local 0
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

// (-917) push local 2
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

// (-919) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_64
D;JEQ
(EQ_FALSE_64)
@0
D=A // d = false
@EQ_END_64
0;JMP
(EQ_TRUE_64)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_64)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-924) if-goto IF_TRUE1
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

// (-926) goto IF_FALSE1
@Keyboard.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-928) label IF_TRUE1
(Keyboard.IF_TRUE1) // label IF_TRUE1

// (-931) push local 3
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

// (-934) call String.eraseLastChar 1
(Keyboard.String.eraseLastChar.65) // call String.eraseLastChar 1
@Keyboard.String.eraseLastChar.65 // call String.eraseLastChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-936) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-938) goto IF_END1
@Keyboard.IF_END1 // goto IF_END1
0;JMP // unconditional jump

// (-940) label IF_FALSE1
(Keyboard.IF_FALSE1) // label IF_FALSE1

// (-943) push local 3
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

// (-945) push local 0
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

// (-948) call String.appendChar 2
(Keyboard.String.appendChar.66) // call String.appendChar 2
@Keyboard.String.appendChar.66 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-950) pop local 3
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

// (-952) label IF_END1
(Keyboard.IF_END1) // label IF_END1

// (-955) label IF_FALSE0
(Keyboard.IF_FALSE0) // label IF_FALSE0

// (-958) goto WHILE_EXP0
@Keyboard.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-960) label WHILE_END0
(Keyboard.WHILE_END0) // label WHILE_END0

// (-963) push local 3
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

// (-965) return

// (-967) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-969) function Keyboard.readInt 2
(Keyboard.readInt) // function Keyboard.readInt 2

// (-972) push argument 0
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
// (-975) call Keyboard.readLine 1
(Keyboard.Keyboard.readLine.67) // call Keyboard.readLine 1
@Keyboard.Keyboard.readLine.67 // call Keyboard.readLine // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-977) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-979) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-981) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-983) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-985) push constant 0 // local(4) init
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

// (-987) pop local 0
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

// (-989) push local 0
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

// (-992) call String.intValue 1
(Keyboard.String.intValue.68) // call String.intValue 1
@Keyboard.String.intValue.68 // call String.intValue // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-994) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-996) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-998) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1000) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1002) push constant 0 // local(4) init
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

// (-1004) pop local 1
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

// (-1006) push local 0
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

// (-1009) call String.dispose 1
(Keyboard.String.dispose.69) // call String.dispose 1
@Keyboard.String.dispose.69 // call String.dispose // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1011) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-1013) push local 1
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

// (-1015) return

// (-1017) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-1019) function Math.init 1
(Math.init) // function Math.init 1

// (-1022) push constant 16
@16 // push constant 16 // function Math.init 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-1025) call Array.new 1
(Math.Array.new.70) // call Array.new 1
@Math.Array.new.70 // call Array.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1027) pop static 1
@16 // pop static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Math.vm)
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

// (-1029) push constant 16
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1032) call Array.new 1
(Math.Array.new.71) // call Array.new 1
@Math.Array.new.71 // call Array.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1034) pop static 0
@16 // pop static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Math.vm)
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-1036) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1038) push static 0
@16 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Math.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1040) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-1042) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1044) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-1046) pop pointer 1
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

// (-1048) push temp 0
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

// (-1050) pop that 0
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

// (-1052) label WHILE_EXP0
(Math.WHILE_EXP0) // label WHILE_EXP0

// (-1055) push local 0
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

// (-1057) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1059) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_72
D;JLT
(JLT_FALSE_72)
@0
D=A // d = false
@JLT_END_72
0;JMP
(JLT_TRUE_72)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_72)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1064) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1066) if-goto WHILE_END0
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

// (-1068) push local 0
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

// (-1070) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1072) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-1074) pop local 0
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

// (-1076) push local 0
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

// (-1078) push static 0
@16 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Math.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1080) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-1082) push local 0
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

// (-1084) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1086) sub
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

// (-1088) push static 0
@16 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Math.vm)
D=A
@0
A=D+A
D=M
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

// (-1092) pop pointer 1
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

// (-1094) push that 0
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

// (-1096) push local 0
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

// (-1098) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1100) sub
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

// (-1102) push static 0
@16 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Math.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1104) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-1106) pop pointer 1
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

// (-1108) push that 0
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

// (-1110) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-1112) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-1114) pop pointer 1
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

// (-1116) push temp 0
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

// (-1118) pop that 0
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

// (-1120) goto WHILE_EXP0
@Math.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-1122) label WHILE_END0
(Math.WHILE_END0) // label WHILE_END0

// (-1125) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1127) return

// (-1129) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-1131) function Math.abs 0
(Math.abs) // function Math.abs 0

// (-1134) push argument 0
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
// (-1136) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1138) lt
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

// (-1143) if-goto IF_TRUE0
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

// (-1145) goto IF_FALSE0
@Math.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-1147) label IF_TRUE0
(Math.IF_TRUE0) // label IF_TRUE0

// (-1150) push argument 0
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

// (-1152) neg
@SP // neg
M=M-1
A=M
M=-M
@SP
M=M+1

// (-1154) pop argument 0
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

// (-1156) label IF_FALSE0
(Math.IF_FALSE0) // label IF_FALSE0

// (-1159) push argument 0
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

// (-1161) return

// (-1163) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-1165) function Math.multiply 5
(Math.multiply) // function Math.multiply 5

// (-1168) push argument 0
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
// (-1170) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1172) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_74
D;JLT
(JLT_FALSE_74)
@0
D=A // d = false
@JLT_END_74
0;JMP
(JLT_TRUE_74)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_74)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1177) push argument 1
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

// (-1179) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1181) gt
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

// (-1186) and
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

// (-1188) push argument 0
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

// (-1190) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1192) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_76
D;JGT
(JGT_FALSE_76)
@0
D=A // d = false
@JGT_END_76
0;JMP
(JGT_TRUE_76)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_76)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1197) push argument 1
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

// (-1199) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1201) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_77
D;JLT
(JLT_FALSE_77)
@0
D=A // d = false
@JLT_END_77
0;JMP
(JLT_TRUE_77)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_77)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1206) and
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

// (-1208) or
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

// (-1210) pop local 4
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

// (-1212) push argument 0
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

// (-1215) call Math.abs 1
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

// (-1217) pop argument 0
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

// (-1219) push argument 1
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

// (-1222) call Math.abs 1
(Math.Math.abs.79) // call Math.abs 1
@Math.Math.abs.79 // call Math.abs // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1224) pop argument 1
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

// (-1226) push argument 0
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

// (-1228) push argument 1
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

// (-1230) lt
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

// (-1235) if-goto IF_TRUE0
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

// (-1237) goto IF_FALSE0
@Math.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-1239) label IF_TRUE0
(Math.IF_TRUE0) // label IF_TRUE0

// (-1242) push argument 0
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

// (-1244) pop local 1
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

// (-1246) push argument 1
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

// (-1248) pop argument 0
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

// (-1250) push local 1
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

// (-1252) pop argument 1
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

// (-1254) label IF_FALSE0
(Math.IF_FALSE0) // label IF_FALSE0

// (-1257) label WHILE_EXP0
(Math.WHILE_EXP0) // label WHILE_EXP0

// (-1260) push local 2
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

// (-1262) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1264) sub
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

// (-1266) push argument 1
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

// (-1268) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1270) sub
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

// (-1272) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_81
D;JLT
(JLT_FALSE_81)
@0
D=A // d = false
@JLT_END_81
0;JMP
(JLT_TRUE_81)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_81)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1277) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1279) if-goto WHILE_END0
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

// (-1281) push local 3
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

// (-1283) push static 0
@16 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Math.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1285) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-1287) pop pointer 1
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

// (-1289) push that 0
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

// (-1291) push argument 1
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

// (-1293) and
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

// (-1295) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1297) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_82
D;JEQ
(EQ_FALSE_82)
@0
D=A // d = false
@EQ_END_82
0;JMP
(EQ_TRUE_82)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_82)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1302) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1304) if-goto IF_TRUE1
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

// (-1306) goto IF_FALSE1
@Math.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-1308) label IF_TRUE1
(Math.IF_TRUE1) // label IF_TRUE1

// (-1311) push local 0
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

// (-1313) push argument 0
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

// (-1315) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-1317) pop local 0
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

// (-1319) push local 2
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

// (-1321) push local 3
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

// (-1323) push static 0
@16 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Math.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1325) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-1327) pop pointer 1
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

// (-1329) push that 0
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

// (-1331) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-1333) pop local 2
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

// (-1335) label IF_FALSE1
(Math.IF_FALSE1) // label IF_FALSE1

// (-1338) push argument 0
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

// (-1340) push argument 0
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

// (-1342) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-1344) pop argument 0
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

// (-1348) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1350) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-1352) pop local 3
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

// (-1354) goto WHILE_EXP0
@Math.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-1356) label WHILE_END0
(Math.WHILE_END0) // label WHILE_END0

// (-1359) push local 4
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

// (-1361) if-goto IF_TRUE2
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

// (-1363) goto IF_FALSE2
@Math.IF_FALSE2 // goto IF_FALSE2
0;JMP // unconditional jump

// (-1365) label IF_TRUE2
(Math.IF_TRUE2) // label IF_TRUE2

// (-1368) push local 0
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

// (-1370) neg
@SP // neg
M=M-1
A=M
M=-M
@SP
M=M+1

// (-1372) pop local 0
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

// (-1374) label IF_FALSE2
(Math.IF_FALSE2) // label IF_FALSE2

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

// (-1379) return

// (-1381) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-1383) function Math.divide 4
(Math.divide) // function Math.divide 4

// (-1386) push argument 1
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
// (-1388) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1390) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_83
D;JEQ
(EQ_FALSE_83)
@0
D=A // d = false
@EQ_END_83
0;JMP
(EQ_TRUE_83)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_83)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1395) if-goto IF_TRUE0
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

// (-1397) goto IF_FALSE0
@Math.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-1399) label IF_TRUE0
(Math.IF_TRUE0) // label IF_TRUE0

// (-1402) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1405) call Sys.error 1
(Math.Sys.error.84) // call Sys.error 1
@Math.Sys.error.84 // call Sys.error // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1407) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-1409) label IF_FALSE0
(Math.IF_FALSE0) // label IF_FALSE0

// (-1412) push argument 0
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

// (-1414) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1416) lt
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

// (-1421) push argument 1
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

// (-1423) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1425) gt
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

// (-1430) and
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

// (-1432) push argument 0
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

// (-1434) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1436) gt
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

// (-1441) push argument 1
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

// (-1443) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1445) lt
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

// (-1450) and
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

// (-1452) or
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

// (-1454) pop local 2
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

// (-1456) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1458) push static 1
@16 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1460) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-1462) push argument 1
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

// (-1465) call Math.abs 1
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

// (-1467) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-1469) pop pointer 1
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

// (-1471) push temp 0
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

// (-1473) pop that 0
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

// (-1475) push argument 0
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

// (-1478) call Math.abs 1
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

// (-1480) pop argument 0
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

// (-1482) label WHILE_EXP0
(Math.WHILE_EXP0) // label WHILE_EXP0

// (-1485) push local 0
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

// (-1487) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1489) lt
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

// (-1494) push local 3
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

// (-1496) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1498) and
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

// (-1500) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1502) if-goto WHILE_END0
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

// (-1504) push constant 32767
@32767 // push constant 32767
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1506) push local 0
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

// (-1508) push static 1
@16 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1510) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-1512) pop pointer 1
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

// (-1514) push that 0
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

// (-1516) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1518) sub
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

// (-1520) sub
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

// (-1522) push local 0
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

// (-1524) push static 1
@16 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1526) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-1528) pop pointer 1
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

// (-1530) push that 0
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

// (-1532) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1534) sub
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

// (-1536) lt
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

// (-1541) pop local 3
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

// (-1543) push local 3
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

// (-1545) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1547) if-goto IF_TRUE1
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

// (-1549) goto IF_FALSE1
@Math.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-1551) label IF_TRUE1
(Math.IF_TRUE1) // label IF_TRUE1

// (-1554) push local 0
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

// (-1556) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1558) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-1560) push static 1
@16 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1562) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-1564) push local 0
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

// (-1566) push static 1
@16 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1568) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-1570) pop pointer 1
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

// (-1572) push that 0
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

// (-1574) push local 0
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

// (-1576) push static 1
@16 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1578) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-1580) pop pointer 1
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

// (-1582) push that 0
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

// (-1584) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-1586) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-1588) pop pointer 1
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

// (-1590) push temp 0
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

// (-1592) pop that 0
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

// (-1594) push local 0
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

// (-1596) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1598) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-1600) push static 1
@16 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1602) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-1604) pop pointer 1
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

// (-1606) push that 0
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

// (-1608) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1610) sub
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

// (-1612) push argument 0
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

// (-1614) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1616) sub
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

// (-1618) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_93
D;JGT
(JGT_FALSE_93)
@0
D=A // d = false
@JGT_END_93
0;JMP
(JGT_TRUE_93)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_93)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1623) pop local 3
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

// (-1625) push local 3
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

// (-1627) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1629) if-goto IF_TRUE2
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

// (-1631) goto IF_FALSE2
@Math.IF_FALSE2 // goto IF_FALSE2
0;JMP // unconditional jump

// (-1633) label IF_TRUE2
(Math.IF_TRUE2) // label IF_TRUE2

// (-1636) push local 0
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

// (-1638) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1640) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-1642) pop local 0
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

// (-1644) label IF_FALSE2
(Math.IF_FALSE2) // label IF_FALSE2

// (-1647) label IF_FALSE1
(Math.IF_FALSE1) // label IF_FALSE1

// (-1650) goto WHILE_EXP0
@Math.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-1652) label WHILE_END0
(Math.WHILE_END0) // label WHILE_END0

// (-1655) label WHILE_EXP1
(Math.WHILE_EXP1) // label WHILE_EXP1

// (-1658) push local 0
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

// (-1660) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1662) neg
@SP // neg
M=M-1
A=M
M=-M
@SP
M=M+1

// (-1664) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_94
D;JGT
(JGT_FALSE_94)
@0
D=A // d = false
@JGT_END_94
0;JMP
(JGT_TRUE_94)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_94)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1669) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1671) if-goto WHILE_END1
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

// (-1673) push local 0
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

// (-1675) push static 1
@16 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1677) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-1679) pop pointer 1
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

// (-1681) push that 0
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

// (-1683) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1685) sub
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

// (-1687) push argument 0
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

// (-1689) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1691) sub
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

// (-1693) gt
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

// (-1698) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1700) if-goto IF_TRUE3
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

// (-1702) goto IF_FALSE3
@Math.IF_FALSE3 // goto IF_FALSE3
0;JMP // unconditional jump

// (-1704) label IF_TRUE3
(Math.IF_TRUE3) // label IF_TRUE3

// (-1707) push local 1
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

// (-1709) push local 0
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

// (-1711) push static 0
@16 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Math.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1713) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-1715) pop pointer 1
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

// (-1717) push that 0
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

// (-1719) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-1721) pop local 1
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

// (-1723) push argument 0
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

// (-1725) push local 0
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

// (-1727) push static 1
@16 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1729) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-1731) pop pointer 1
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

// (-1733) push that 0
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

// (-1735) sub
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

// (-1737) pop argument 0
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

// (-1739) label IF_FALSE3
(Math.IF_FALSE3) // label IF_FALSE3

// (-1742) push local 0
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

// (-1744) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1746) sub
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

// (-1748) pop local 0
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

// (-1750) goto WHILE_EXP1
@Math.WHILE_EXP1 // goto WHILE_EXP1
0;JMP // unconditional jump

// (-1752) label WHILE_END1
(Math.WHILE_END1) // label WHILE_END1

// (-1755) push local 2
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

// (-1757) if-goto IF_TRUE4
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

// (-1759) goto IF_FALSE4
@Math.IF_FALSE4 // goto IF_FALSE4
0;JMP // unconditional jump

// (-1761) label IF_TRUE4
(Math.IF_TRUE4) // label IF_TRUE4

// (-1764) push local 1
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

// (-1766) neg
@SP // neg
M=M-1
A=M
M=-M
@SP
M=M+1

// (-1768) pop local 1
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

// (-1770) label IF_FALSE4
(Math.IF_FALSE4) // label IF_FALSE4

// (-1773) push local 1
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

// (-1775) return

// (-1777) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-1779) function Math.sqrt 4
(Math.sqrt) // function Math.sqrt 4

// (-1782) push argument 0
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
// (-1784) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1786) lt
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

// (-1791) if-goto IF_TRUE0
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

// (-1793) goto IF_FALSE0
@Math.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-1795) label IF_TRUE0
(Math.IF_TRUE0) // label IF_TRUE0

// (-1798) push constant 4
@4 // push constant 4
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1801) call Sys.error 1
(Math.Sys.error.97) // call Sys.error 1
@Math.Sys.error.97 // call Sys.error // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1803) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-1805) label IF_FALSE0
(Math.IF_FALSE0) // label IF_FALSE0

// (-1808) push constant 7
@7 // push constant 7
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1810) pop local 0
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

// (-1812) label WHILE_EXP0
(Math.WHILE_EXP0) // label WHILE_EXP0

// (-1815) push local 0
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

// (-1817) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1819) neg
@SP // neg
M=M-1
A=M
M=-M
@SP
M=M+1

// (-1821) gt
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

// (-1826) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1828) if-goto WHILE_END0
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

// (-1830) push local 3
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

// (-1832) push local 0
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

// (-1834) push static 0
@16 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Math.vm)
D=A
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

// (-1838) pop pointer 1
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

// (-1840) push that 0
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

// (-1842) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-1844) pop local 1
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

// (-1846) push local 1
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

// (-1848) push local 1
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

// (-1851) call Math.multiply 2
(Math.Math.multiply.99) // call Math.multiply 2
@Math.Math.multiply.99 // call Math.multiply // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-1853) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1855) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1857) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1859) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1861) push constant 0 // local(4) init
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

// (-1863) pop local 2
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

// (-1865) push local 2
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

// (-1867) push argument 0
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

// (-1869) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_100
D;JGT
(JGT_FALSE_100)
@0
D=A // d = false
@JGT_END_100
0;JMP
(JGT_TRUE_100)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_100)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1874) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1876) push local 2
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

// (-1878) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1880) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_101
D;JLT
(JLT_FALSE_101)
@0
D=A // d = false
@JLT_END_101
0;JMP
(JLT_TRUE_101)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_101)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1885) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1887) and
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

// (-1889) if-goto IF_TRUE1
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

// (-1891) goto IF_FALSE1
@Math.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-1893) label IF_TRUE1
(Math.IF_TRUE1) // label IF_TRUE1

// (-1896) push local 1
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

// (-1898) pop local 3
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

// (-1900) label IF_FALSE1
(Math.IF_FALSE1) // label IF_FALSE1

// (-1903) push local 0
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

// (-1905) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1907) sub
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

// (-1909) pop local 0
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

// (-1911) goto WHILE_EXP0
@Math.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-1913) label WHILE_END0
(Math.WHILE_END0) // label WHILE_END0

// (-1916) push local 3
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

// (-1918) return

// (-1920) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-1922) function Math.max 0
(Math.max) // function Math.max 0

// (-1925) push argument 0
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
// (-1927) push argument 1
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

// (-1929) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_102
D;JGT
(JGT_FALSE_102)
@0
D=A // d = false
@JGT_END_102
0;JMP
(JGT_TRUE_102)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_102)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1934) if-goto IF_TRUE0
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

// (-1936) goto IF_FALSE0
@Math.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-1938) label IF_TRUE0
(Math.IF_TRUE0) // label IF_TRUE0

// (-1941) push argument 0
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

// (-1943) pop argument 1
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

// (-1945) label IF_FALSE0
(Math.IF_FALSE0) // label IF_FALSE0

// (-1948) push argument 1
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

// (-1950) return

// (-1952) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-1954) function Math.min 0
(Math.min) // function Math.min 0

// (-1957) push argument 0
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
// (-1959) push argument 1
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

// (-1961) lt
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

// (-1966) if-goto IF_TRUE0
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

// (-1968) goto IF_FALSE0
@Math.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-1970) label IF_TRUE0
(Math.IF_TRUE0) // label IF_TRUE0

// (-1973) push argument 0
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

// (-1975) pop argument 1
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

// (-1977) label IF_FALSE0
(Math.IF_FALSE0) // label IF_FALSE0

// (-1980) push argument 1
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

// (-1982) return

// (-1984) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-1986) function Memory.init 0
(Memory.init) // function Memory.init 0

// (-1989) push constant 0
@0 // push constant 0 // function Memory.init 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-1991) pop static 0
@18 // pop static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Memory.vm)
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-1993) push constant 2048
@2048 // push constant 2048
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1995) push static 0
@18 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Memory.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1997) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-1999) push constant 14334
@14334 // push constant 14334
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2001) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2003) pop pointer 1
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

// (-2005) push temp 0
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

// (-2007) pop that 0
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

// (-2009) push constant 2049
@2049 // push constant 2049
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2011) push static 0
@18 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Memory.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2013) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2015) push constant 2050
@2050 // push constant 2050
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2017) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2019) pop pointer 1
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

// (-2021) push temp 0
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

// (-2023) pop that 0
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

// (-2025) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2027) return

// (-2029) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-2031) function Memory.peek 0
(Memory.peek) // function Memory.peek 0

// (-2034) push argument 0
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
// (-2036) push static 0
@18 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Memory.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2038) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2040) pop pointer 1
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

// (-2042) push that 0
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

// (-2044) return

// (-2046) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-2048) function Memory.poke 0
(Memory.poke) // function Memory.poke 0

// (-2051) push argument 0
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
// (-2053) push static 0
@18 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Memory.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2055) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2057) push argument 1
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

// (-2059) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2061) pop pointer 1
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

// (-2063) push temp 0
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

// (-2065) pop that 0
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

// (-2067) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2069) return

// (-2071) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-2073) function Memory.alloc 1
(Memory.alloc) // function Memory.alloc 1

// (-2076) push argument 0
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
// (-2078) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2080) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_104
D;JLT
(JLT_FALSE_104)
@0
D=A // d = false
@JLT_END_104
0;JMP
(JLT_TRUE_104)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_104)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2085) if-goto IF_TRUE0
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

// (-2087) goto IF_FALSE0
@Memory.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-2089) label IF_TRUE0
(Memory.IF_TRUE0) // label IF_TRUE0

// (-2092) push constant 5
@5 // push constant 5
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2095) call Sys.error 1
(Memory.Sys.error.105) // call Sys.error 1
@Memory.Sys.error.105 // call Sys.error // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2097) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2099) label IF_FALSE0
(Memory.IF_FALSE0) // label IF_FALSE0

// (-2102) push constant 2048
@2048 // push constant 2048
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2104) pop local 0
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

// (-2106) label WHILE_EXP0
(Memory.WHILE_EXP0) // label WHILE_EXP0

// (-2109) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

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

// (-2115) pop pointer 1
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

// (-2117) push that 0
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

// (-2119) push argument 0
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

// (-2121) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_106
D;JLT
(JLT_FALSE_106)
@0
D=A // d = false
@JLT_END_106
0;JMP
(JLT_TRUE_106)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_106)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2126) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-2128) if-goto WHILE_END0
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

// (-2130) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2132) push local 0
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

// (-2134) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2136) pop pointer 1
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

// (-2138) push that 0
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

// (-2140) pop local 0
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

// (-2142) goto WHILE_EXP0
@Memory.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-2144) label WHILE_END0
(Memory.WHILE_END0) // label WHILE_END0

// (-2147) push local 0
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

// (-2149) push argument 0
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

// (-2151) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2153) push constant 16379
@16379 // push constant 16379
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2155) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_107
D;JGT
(JGT_FALSE_107)
@0
D=A // d = false
@JGT_END_107
0;JMP
(JGT_TRUE_107)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_107)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2160) if-goto IF_TRUE1
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

// (-2162) goto IF_FALSE1
@Memory.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-2164) label IF_TRUE1
(Memory.IF_TRUE1) // label IF_TRUE1

// (-2167) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2170) call Sys.error 1
(Memory.Sys.error.108) // call Sys.error 1
@Memory.Sys.error.108 // call Sys.error // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2172) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2174) label IF_FALSE1
(Memory.IF_FALSE1) // label IF_FALSE1

// (-2177) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

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

// (-2181) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2183) pop pointer 1
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

// (-2185) push that 0
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

// (-2187) push argument 0
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

// (-2189) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2191) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2193) gt
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

// (-2198) if-goto IF_TRUE2
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

// (-2200) goto IF_FALSE2
@Memory.IF_FALSE2 // goto IF_FALSE2
0;JMP // unconditional jump

// (-2202) label IF_TRUE2
(Memory.IF_TRUE2) // label IF_TRUE2

// (-2205) push argument 0
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

// (-2207) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2209) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2211) push local 0
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

// (-2213) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2215) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2217) push local 0
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

// (-2219) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2221) pop pointer 1
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

// (-2223) push that 0
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

// (-2225) push argument 0
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

// (-2227) sub
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

// (-2229) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2231) sub
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

// (-2233) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2235) pop pointer 1
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

// (-2237) push temp 0
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

// (-2239) pop that 0
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

// (-2241) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2243) push local 0
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

// (-2245) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2247) pop pointer 1
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

// (-2249) push that 0
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

// (-2251) push local 0
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

// (-2253) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2255) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2257) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_110
D;JEQ
(EQ_FALSE_110)
@0
D=A // d = false
@EQ_END_110
0;JMP
(EQ_TRUE_110)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_110)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2262) if-goto IF_TRUE3
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

// (-2264) goto IF_FALSE3
@Memory.IF_FALSE3 // goto IF_FALSE3
0;JMP // unconditional jump

// (-2266) label IF_TRUE3
(Memory.IF_TRUE3) // label IF_TRUE3

// (-2269) push argument 0
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

// (-2271) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2273) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

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

// (-2279) push local 0
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

// (-2281) push argument 0
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

// (-2285) push constant 4
@4 // push constant 4
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2287) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2289) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2291) pop pointer 1
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

// (-2293) push temp 0
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

// (-2295) pop that 0
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

// (-2297) goto IF_END3
@Memory.IF_END3 // goto IF_END3
0;JMP // unconditional jump

// (-2299) label IF_FALSE3
(Memory.IF_FALSE3) // label IF_FALSE3

// (-2302) push argument 0
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

// (-2304) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2306) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2308) push local 0
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

// (-2310) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2312) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2314) push local 0
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

// (-2316) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2318) pop pointer 1
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

// (-2320) push that 0
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

// (-2322) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2324) pop pointer 1
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

// (-2326) push temp 0
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

// (-2328) pop that 0
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

// (-2330) label IF_END3
(Memory.IF_END3) // label IF_END3

// (-2333) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2335) push local 0
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

// (-2337) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2339) push local 0
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

// (-2341) push argument 0
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

// (-2343) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2345) push constant 2
@2 // push constant 2
D=A
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

// (-2349) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2351) pop pointer 1
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

// (-2353) push temp 0
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

// (-2355) pop that 0
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

// (-2357) label IF_FALSE2
(Memory.IF_FALSE2) // label IF_FALSE2

// (-2360) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2362) push local 0
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

// (-2364) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2366) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2368) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2370) pop pointer 1
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

// (-2372) push temp 0
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

// (-2374) pop that 0
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

// (-2376) push local 0
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

// (-2378) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2380) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2382) return

// (-2384) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-2386) function Memory.deAlloc 2
(Memory.deAlloc) // function Memory.deAlloc 2

// (-2389) push argument 0
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
// (-2391) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2393) sub
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

// (-2395) pop local 0
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

// (-2397) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2399) push local 0
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

// (-2401) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2403) pop pointer 1
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

// (-2405) push that 0
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

// (-2407) pop local 1
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

// (-2409) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2411) push local 1
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

// (-2413) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2415) pop pointer 1
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

// (-2417) push that 0
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

// (-2419) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2421) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_111
D;JEQ
(EQ_FALSE_111)
@0
D=A // d = false
@EQ_END_111
0;JMP
(EQ_TRUE_111)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_111)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2426) if-goto IF_TRUE0
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

// (-2428) goto IF_FALSE0
@Memory.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-2430) label IF_TRUE0
(Memory.IF_TRUE0) // label IF_TRUE0

// (-2433) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2435) push local 0
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

// (-2437) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2439) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2441) push local 0
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

// (-2443) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2445) pop pointer 1
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

// (-2447) push that 0
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

// (-2449) push local 0
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

// (-2451) sub
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

// (-2453) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2455) sub
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

// (-2457) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2459) pop pointer 1
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

// (-2461) push temp 0
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

// (-2463) pop that 0
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

// (-2465) goto IF_END0
@Memory.IF_END0 // goto IF_END0
0;JMP // unconditional jump

// (-2467) label IF_FALSE0
(Memory.IF_FALSE0) // label IF_FALSE0

// (-2470) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2472) push local 0
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

// (-2474) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2476) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2478) push local 0
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

// (-2480) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2482) pop pointer 1
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

// (-2484) push that 0
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

// (-2486) push local 0
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

// (-2488) sub
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

// (-2490) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2492) push local 1
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

// (-2494) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2496) pop pointer 1
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

// (-2498) push that 0
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

// (-2500) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2502) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2504) pop pointer 1
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

// (-2506) push temp 0
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

// (-2508) pop that 0
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

// (-2510) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2512) push local 1
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

// (-2514) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2516) pop pointer 1
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

// (-2518) push that 0
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

// (-2520) push local 1
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

// (-2522) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2524) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2526) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_112
D;JEQ
(EQ_FALSE_112)
@0
D=A // d = false
@EQ_END_112
0;JMP
(EQ_TRUE_112)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_112)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2531) if-goto IF_TRUE1
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

// (-2533) goto IF_FALSE1
@Memory.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-2535) label IF_TRUE1
(Memory.IF_TRUE1) // label IF_TRUE1

// (-2538) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2540) push local 0
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

// (-2542) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2544) push local 0
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

// (-2546) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2548) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2550) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2552) pop pointer 1
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

// (-2554) push temp 0
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

// (-2556) pop that 0
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

// (-2558) goto IF_END1
@Memory.IF_END1 // goto IF_END1
0;JMP // unconditional jump

// (-2560) label IF_FALSE1
(Memory.IF_FALSE1) // label IF_FALSE1

// (-2563) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2565) push local 0
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

// (-2567) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2569) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2571) push local 1
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

// (-2573) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-2575) pop pointer 1
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

// (-2577) push that 0
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

// (-2579) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2581) pop pointer 1
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

// (-2583) push temp 0
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

// (-2585) pop that 0
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

// (-2587) label IF_END1
(Memory.IF_END1) // label IF_END1

// (-2590) label IF_END0
(Memory.IF_END0) // label IF_END0

// (-2593) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2595) return

// (-2597) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-2599) function Output.init 0
(Output.init) // function Output.init 0

// (-2602) push constant 16384
@16384 // push constant 16384 // function Output.init 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-2604) pop static 4
@19 // pop static 4 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
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

// (-2606) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2608) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-2610) pop static 2
@19 // pop static 2 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
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

// (-2612) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2614) pop static 1
@19 // pop static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
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

// (-2616) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2618) pop static 0
@19 // pop static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2620) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2623) call String.new 1
(Output.String.new.113) // call String.new 1
@Output.String.new.113 // call String.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2625) pop static 3
@19 // pop static 3 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
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

// (-2628) call Output.initMap 0
(Output.Output.initMap.114) // call Output.initMap 0

// (-2630) push constant 9999 // call Output.initMap // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Output.initMap // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Output.Output.initMap.114 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2632) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2635) call Output.createShiftedMap 0
(Output.Output.createShiftedMap.115) // call Output.createShiftedMap 0

// (-2637) push constant 9999 // call Output.createShiftedMap // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Output.createShiftedMap // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Output.Output.createShiftedMap.115 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-2639) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2641) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2643) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2645) push constant 0 // local(3) init
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

// (-2647) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2649) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2651) return

// (-2653) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-2655) function Output.initMap 0
(Output.initMap) // function Output.initMap 0

// (-2658) push constant 127
@127 // push constant 127 // function Output.initMap 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-2661) call Array.new 1
(Output.Array.new.116) // call Array.new 1
@Output.Array.new.116 // call Array.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2663) pop static 5
@19 // pop static 5 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
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

// (-2665) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2667) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2669) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2671) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2673) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2675) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2677) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2679) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2681) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2683) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2685) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2687) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2690) call Output.create 12
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

// (-2692) push constant 0 // local(0) init
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

// (-2694) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2696) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2698) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2700) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2702) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2704) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2706) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2708) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2710) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2712) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2714) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2716) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2718) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2721) call Output.create 12
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

// (-2723) push constant 0 // local(0) init
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

// (-2725) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2727) push constant 33
@33 // push constant 33
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2729) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2731) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2733) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2735) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2737) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2739) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2741) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2743) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2745) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2747) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2749) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2752) call Output.create 12
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

// (-2754) push constant 0 // local(0) init
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

// (-2756) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2758) push constant 34
@34 // push constant 34
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2760) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2762) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2764) push constant 20
@20 // push constant 20
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2766) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2768) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2770) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2772) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2774) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2776) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2778) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2780) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2783) call Output.create 12
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

// (-2785) push constant 0 // local(0) init
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

// (-2787) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2789) push constant 35
@35 // push constant 35
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2791) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2793) push constant 18
@18 // push constant 18
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2795) push constant 18
@18 // push constant 18
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2797) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2799) push constant 18
@18 // push constant 18
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2801) push constant 18
@18 // push constant 18
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2803) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2805) push constant 18
@18 // push constant 18
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2807) push constant 18
@18 // push constant 18
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2809) push constant 0
@0 // push constant 0
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

// (-2814) call Output.create 12
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

// (-2816) push constant 0 // local(0) init
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

// (-2818) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2820) push constant 36
@36 // push constant 36
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2822) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2824) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2826) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2828) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2830) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2832) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2834) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2836) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2838) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2840) push constant 12
@12 // push constant 12
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

// (-2845) call Output.create 12
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

// (-2847) push constant 0 // local(0) init
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

// (-2849) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2851) push constant 37
@37 // push constant 37
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2853) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2855) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2857) push constant 35
@35 // push constant 35
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2859) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2861) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2863) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2865) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2867) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2869) push constant 49
@49 // push constant 49
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2871) push constant 0
@0 // push constant 0
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

// (-2876) call Output.create 12
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

// (-2878) push constant 0 // local(0) init
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

// (-2880) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2882) push constant 38
@38 // push constant 38
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2884) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2886) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2888) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2890) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2892) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2894) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2896) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2898) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2900) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2902) push constant 0
@0 // push constant 0
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

// (-2907) call Output.create 12
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

// (-2909) push constant 0 // local(0) init
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

// (-2911) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2913) push constant 39
@39 // push constant 39
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2915) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2917) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2919) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2921) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2923) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2925) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2927) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2929) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2931) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2933) push constant 0
@0 // push constant 0
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

// (-2938) call Output.create 12
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

// (-2940) push constant 0 // local(0) init
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

// (-2942) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2944) push constant 40
@40 // push constant 40
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2946) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2948) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2950) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2952) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2954) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2956) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2958) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2960) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2962) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2964) push constant 0
@0 // push constant 0
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

// (-2969) call Output.create 12
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

// (-2971) push constant 0 // local(0) init
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

// (-2973) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2975) push constant 41
@41 // push constant 41
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2977) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2979) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2981) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2983) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2985) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2987) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2989) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2991) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2993) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2995) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2997) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3000) call Output.create 12
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

// (-3002) push constant 0 // local(0) init
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

// (-3004) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3006) push constant 42
@42 // push constant 42
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3008) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3010) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3012) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3014) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3016) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3018) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3020) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3022) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3024) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3026) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3028) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3031) call Output.create 12
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

// (-3033) push constant 0 // local(0) init
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

// (-3035) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3037) push constant 43
@43 // push constant 43
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3039) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3041) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3043) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3045) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3047) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3049) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3051) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3053) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3055) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3057) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3059) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3062) call Output.create 12
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

// (-3064) push constant 0 // local(0) init
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

// (-3066) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3068) push constant 44
@44 // push constant 44
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3070) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3072) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3074) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3076) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3078) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3080) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3082) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3084) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3086) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3088) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3090) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3093) call Output.create 12
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

// (-3095) push constant 0 // local(0) init
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

// (-3097) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3099) push constant 45
@45 // push constant 45
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3101) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3103) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3105) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3107) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3109) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3111) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3113) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3115) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3117) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3119) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3121) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3124) call Output.create 12
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

// (-3126) push constant 0 // local(0) init
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

// (-3128) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3130) push constant 46
@46 // push constant 46
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3132) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3134) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3136) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3138) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3140) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3142) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3144) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3146) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3148) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3150) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3152) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3155) call Output.create 12
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

// (-3157) push constant 0 // local(0) init
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

// (-3159) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3161) push constant 47
@47 // push constant 47
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3163) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3165) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3167) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3169) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3171) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3173) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3175) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3177) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3179) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3181) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3183) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3186) call Output.create 12
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

// (-3188) push constant 0 // local(0) init
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

// (-3190) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3192) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3194) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3196) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3198) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3200) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3202) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3204) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3206) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3208) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3210) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3212) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3214) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3217) call Output.create 12
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

// (-3219) push constant 0 // local(0) init
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

// (-3221) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3223) push constant 49
@49 // push constant 49
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3225) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3227) push constant 14
@14 // push constant 14
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3229) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3231) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3233) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3235) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3237) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3239) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3241) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3243) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3245) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3248) call Output.create 12
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

// (-3250) push constant 0 // local(0) init
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

// (-3252) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3254) push constant 50
@50 // push constant 50
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3256) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3258) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3260) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3262) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3264) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3266) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3268) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3270) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3272) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3274) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3276) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3279) call Output.create 12
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

// (-3281) push constant 0 // local(0) init
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

// (-3283) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3285) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3287) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3289) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3291) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3293) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3295) push constant 28
@28 // push constant 28
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3297) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3299) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3301) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3303) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3305) push constant 0
@0 // push constant 0
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

// (-3310) call Output.create 12
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

// (-3312) push constant 0 // local(0) init
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

// (-3314) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3316) push constant 52
@52 // push constant 52
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3318) push constant 16
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3320) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3322) push constant 28
@28 // push constant 28
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3324) push constant 26
@26 // push constant 26
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3326) push constant 25
@25 // push constant 25
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3328) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3330) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3332) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3334) push constant 60
@60 // push constant 60
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3336) push constant 0
@0 // push constant 0
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

// (-3341) call Output.create 12
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

// (-3343) push constant 0 // local(0) init
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

// (-3345) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3347) push constant 53
@53 // push constant 53
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3349) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3351) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3353) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3355) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3357) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3359) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3361) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3363) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3365) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3367) push constant 0
@0 // push constant 0
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

// (-3372) call Output.create 12
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

// (-3374) push constant 0 // local(0) init
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

// (-3376) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3378) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3380) push constant 28
@28 // push constant 28
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3382) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3384) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3386) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3388) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3390) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3392) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3394) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3396) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3398) push constant 0
@0 // push constant 0
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

// (-3403) call Output.create 12
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

// (-3405) push constant 0 // local(0) init
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

// (-3407) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3409) push constant 55
@55 // push constant 55
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3411) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3413) push constant 49
@49 // push constant 49
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3415) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3417) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3419) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3421) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3423) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3425) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3427) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3429) push constant 0
@0 // push constant 0
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

// (-3434) call Output.create 12
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

// (-3436) push constant 0 // local(0) init
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

// (-3438) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3440) push constant 56
@56 // push constant 56
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3442) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3444) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3446) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3448) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3450) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3452) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3454) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3456) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3458) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3460) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3462) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3465) call Output.create 12
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

// (-3467) push constant 0 // local(0) init
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

// (-3469) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3471) push constant 57
@57 // push constant 57
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3473) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3475) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3477) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3479) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3481) push constant 62
@62 // push constant 62
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3483) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3485) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3487) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3489) push constant 14
@14 // push constant 14
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3491) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3493) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3496) call Output.create 12
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

// (-3498) push constant 0 // local(0) init
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

// (-3500) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3502) push constant 58
@58 // push constant 58
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3504) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3506) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3508) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3510) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3512) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3514) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3516) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3518) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3520) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3522) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3524) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3527) call Output.create 12
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

// (-3529) push constant 0 // local(0) init
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

// (-3531) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3533) push constant 59
@59 // push constant 59
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3535) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3537) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3539) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3541) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3543) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3545) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3547) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3549) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3551) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3553) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3555) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3558) call Output.create 12
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

// (-3560) push constant 0 // local(0) init
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

// (-3562) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3564) push constant 60
@60 // push constant 60
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3566) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3568) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3570) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3572) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3574) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3576) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3578) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3580) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3582) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3584) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3586) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3589) call Output.create 12
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

// (-3591) push constant 0 // local(0) init
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

// (-3593) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3595) push constant 61
@61 // push constant 61
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3597) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3599) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3601) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3603) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3605) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3607) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3609) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3611) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3613) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3615) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3617) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3620) call Output.create 12
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

// (-3622) push constant 0 // local(0) init
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

// (-3624) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3626) push constant 62
@62 // push constant 62
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3628) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3630) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3632) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3634) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3636) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3638) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3640) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3642) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3644) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3646) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3648) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3651) call Output.create 12
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

// (-3653) push constant 0 // local(0) init
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

// (-3655) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3657) push constant 64
@64 // push constant 64
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3659) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3661) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3663) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3665) push constant 59
@59 // push constant 59
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3667) push constant 59
@59 // push constant 59
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3669) push constant 59
@59 // push constant 59
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3671) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3673) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3675) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3677) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3679) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3682) call Output.create 12
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

// (-3684) push constant 0 // local(0) init
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

// (-3686) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3688) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3690) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3692) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3694) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3696) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3698) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3700) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3702) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3704) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3706) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3708) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3710) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3713) call Output.create 12
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

// (-3715) push constant 0 // local(0) init
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

// (-3717) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3719) push constant 65
@65 // push constant 65
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3721) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3723) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3725) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3727) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3729) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3731) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3733) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3735) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3737) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3739) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3741) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3744) call Output.create 12
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

// (-3746) push constant 0 // local(0) init
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

// (-3748) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3750) push constant 66
@66 // push constant 66
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3752) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3754) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3756) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3758) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3760) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3762) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3764) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3766) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3768) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3770) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3772) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3775) call Output.create 12
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

// (-3777) push constant 0 // local(0) init
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

// (-3779) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3781) push constant 67
@67 // push constant 67
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3783) push constant 28
@28 // push constant 28
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3785) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3787) push constant 35
@35 // push constant 35
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3789) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3791) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3793) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3795) push constant 35
@35 // push constant 35
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3797) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3799) push constant 28
@28 // push constant 28
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3801) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3803) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3806) call Output.create 12
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

// (-3808) push constant 0 // local(0) init
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

// (-3810) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3812) push constant 68
@68 // push constant 68
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3814) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3816) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3818) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3820) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3822) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3824) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3826) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3828) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3830) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3832) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3834) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3837) call Output.create 12
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

// (-3839) push constant 0 // local(0) init
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

// (-3841) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3843) push constant 69
@69 // push constant 69
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3845) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3847) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3849) push constant 35
@35 // push constant 35
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3851) push constant 11
@11 // push constant 11
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3853) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3855) push constant 11
@11 // push constant 11
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3857) push constant 35
@35 // push constant 35
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3859) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3861) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3863) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3865) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3868) call Output.create 12
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

// (-3870) push constant 0 // local(0) init
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

// (-3872) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3874) push constant 70
@70 // push constant 70
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3876) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3878) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3880) push constant 35
@35 // push constant 35
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3882) push constant 11
@11 // push constant 11
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3884) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3886) push constant 11
@11 // push constant 11
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3888) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3890) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3892) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3894) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3896) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3899) call Output.create 12
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

// (-3901) push constant 0 // local(0) init
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

// (-3903) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3905) push constant 71
@71 // push constant 71
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3907) push constant 28
@28 // push constant 28
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3909) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3911) push constant 35
@35 // push constant 35
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3913) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3915) push constant 59
@59 // push constant 59
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3917) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3919) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3921) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3923) push constant 44
@44 // push constant 44
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3925) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3927) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3930) call Output.create 12
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

// (-3932) push constant 0 // local(0) init
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

// (-3934) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3936) push constant 72
@72 // push constant 72
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3938) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3940) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3942) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3944) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3946) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3948) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3950) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3952) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3954) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3956) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3958) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3961) call Output.create 12
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

// (-3963) push constant 0 // local(0) init
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

// (-3965) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3967) push constant 73
@73 // push constant 73
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3969) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3971) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3973) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3975) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3977) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3979) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3981) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3983) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3985) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3987) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3989) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3992) call Output.create 12
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

// (-3994) push constant 0 // local(0) init
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

// (-3996) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3998) push constant 74
@74 // push constant 74
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4000) push constant 60
@60 // push constant 60
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4002) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4004) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4006) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4008) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4010) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4012) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4014) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4016) push constant 14
@14 // push constant 14
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4018) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4020) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4023) call Output.create 12
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

// (-4025) push constant 0 // local(0) init
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

// (-4027) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4029) push constant 75
@75 // push constant 75
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4031) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4033) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4035) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4037) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4039) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4041) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4043) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4045) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4047) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4049) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4051) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4054) call Output.create 12
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

// (-4056) push constant 0 // local(0) init
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

// (-4058) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4060) push constant 76
@76 // push constant 76
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4062) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4064) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4066) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4068) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4070) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4072) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4074) push constant 35
@35 // push constant 35
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4076) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4078) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4080) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4082) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4085) call Output.create 12
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

// (-4087) push constant 0 // local(0) init
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

// (-4089) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4091) push constant 77
@77 // push constant 77
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4093) push constant 33
@33 // push constant 33
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4095) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4097) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4099) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4101) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4103) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4105) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4107) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4109) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4111) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4113) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4116) call Output.create 12
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

// (-4118) push constant 0 // local(0) init
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

// (-4120) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4122) push constant 78
@78 // push constant 78
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4124) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4126) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4128) push constant 55
@55 // push constant 55
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4130) push constant 55
@55 // push constant 55
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4132) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4134) push constant 59
@59 // push constant 59
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4136) push constant 59
@59 // push constant 59
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4138) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4140) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4142) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4144) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4147) call Output.create 12
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

// (-4149) push constant 0 // local(0) init
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

// (-4151) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4153) push constant 79
@79 // push constant 79
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4155) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4157) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4159) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4161) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4163) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4165) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4167) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4169) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4171) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4173) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4175) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4178) call Output.create 12
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

// (-4180) push constant 0 // local(0) init
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

// (-4182) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4184) push constant 80
@80 // push constant 80
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4186) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4188) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4190) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4192) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4194) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4196) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4198) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4200) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4202) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4204) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4206) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4209) call Output.create 12
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

// (-4211) push constant 0 // local(0) init
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

// (-4213) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4215) push constant 81
@81 // push constant 81
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4217) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4219) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4221) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4223) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4225) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4227) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4229) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4231) push constant 59
@59 // push constant 59
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4233) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4235) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4237) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4240) call Output.create 12
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

// (-4242) push constant 0 // local(0) init
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

// (-4244) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4246) push constant 82
@82 // push constant 82
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4248) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4250) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4252) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4254) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4256) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4258) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4260) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4262) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4264) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4266) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4268) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4271) call Output.create 12
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

// (-4273) push constant 0 // local(0) init
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

// (-4275) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4277) push constant 83
@83 // push constant 83
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4279) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4281) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4283) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4285) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4287) push constant 28
@28 // push constant 28
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4289) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4291) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4293) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4295) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4297) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4299) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4302) call Output.create 12
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

// (-4304) push constant 0 // local(0) init
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

// (-4306) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4308) push constant 84
@84 // push constant 84
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4310) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4312) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4314) push constant 45
@45 // push constant 45
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4316) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4318) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4320) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4322) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4324) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4326) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4328) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4330) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4333) call Output.create 12
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

// (-4335) push constant 0 // local(0) init
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

// (-4337) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4339) push constant 85
@85 // push constant 85
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4341) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4343) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4345) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4347) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4349) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4351) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4353) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4355) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4357) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4359) push constant 0
@0 // push constant 0
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

// (-4364) call Output.create 12
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

// (-4366) push constant 0 // local(0) init
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

// (-4368) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4370) push constant 86
@86 // push constant 86
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4372) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4374) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4376) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4378) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4380) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4382) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4384) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4386) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4388) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4390) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4392) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4395) call Output.create 12
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

// (-4397) push constant 0 // local(0) init
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

// (-4399) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4401) push constant 87
@87 // push constant 87
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4403) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4405) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4407) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4409) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4411) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4413) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4415) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4417) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4419) push constant 18
@18 // push constant 18
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4421) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4423) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4426) call Output.create 12
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

// (-4428) push constant 0 // local(0) init
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

// (-4430) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4432) push constant 88
@88 // push constant 88
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4434) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4436) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4438) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4440) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4442) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4444) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4446) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4448) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4450) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4452) push constant 0
@0 // push constant 0
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

// (-4457) call Output.create 12
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

// (-4459) push constant 0 // local(0) init
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

// (-4461) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4463) push constant 89
@89 // push constant 89
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4465) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4467) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4469) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4471) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4473) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4475) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4477) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4479) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4481) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4483) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4485) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4488) call Output.create 12
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

// (-4490) push constant 0 // local(0) init
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

// (-4492) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4494) push constant 90
@90 // push constant 90
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4496) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4498) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4500) push constant 49
@49 // push constant 49
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4502) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4504) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4506) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4508) push constant 35
@35 // push constant 35
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4510) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4512) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4514) push constant 0
@0 // push constant 0
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

// (-4519) call Output.create 12
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

// (-4521) push constant 0 // local(0) init
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

// (-4523) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4525) push constant 91
@91 // push constant 91
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4527) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4529) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4531) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4533) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4535) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4537) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4539) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4541) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4543) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4545) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4547) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4550) call Output.create 12
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

// (-4552) push constant 0 // local(0) init
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

// (-4554) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4556) push constant 92
@92 // push constant 92
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4558) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4560) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4562) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4564) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4566) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4568) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4570) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4572) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4574) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4576) push constant 0
@0 // push constant 0
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

// (-4581) call Output.create 12
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

// (-4583) push constant 0 // local(0) init
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

// (-4585) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4587) push constant 93
@93 // push constant 93
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4589) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4591) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4593) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4595) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4597) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4599) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4601) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4603) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4605) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4607) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4609) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4612) call Output.create 12
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

// (-4614) push constant 0 // local(0) init
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

// (-4616) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4618) push constant 94
@94 // push constant 94
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4620) push constant 8
@8 // push constant 8
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4622) push constant 28
@28 // push constant 28
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4624) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4626) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4628) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4630) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4632) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4634) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4636) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4638) push constant 0
@0 // push constant 0
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

// (-4643) call Output.create 12
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

// (-4645) push constant 0 // local(0) init
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

// (-4647) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4649) push constant 95
@95 // push constant 95
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4651) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4653) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4655) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4657) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4659) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4661) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4663) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4665) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4667) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4669) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4671) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4674) call Output.create 12
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

// (-4676) push constant 0 // local(0) init
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

// (-4678) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4680) push constant 96
@96 // push constant 96
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4682) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4684) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4686) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4688) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4690) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4692) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4694) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4696) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4698) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4700) push constant 0
@0 // push constant 0
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

// (-4705) call Output.create 12
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

// (-4707) push constant 0 // local(0) init
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

// (-4709) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4711) push constant 97
@97 // push constant 97
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4713) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4715) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4717) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4719) push constant 14
@14 // push constant 14
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4721) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4723) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4725) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4727) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4729) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4731) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4733) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4736) call Output.create 12
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

// (-4738) push constant 0 // local(0) init
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

// (-4740) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4742) push constant 98
@98 // push constant 98
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4744) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4746) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4748) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4750) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4752) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4754) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4756) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4758) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4760) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4762) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4764) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4767) call Output.create 12
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

// (-4769) push constant 0 // local(0) init
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

// (-4771) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4773) push constant 99
@99 // push constant 99
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4775) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4777) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4779) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4781) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4783) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4785) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4787) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4789) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4791) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4793) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4795) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4798) call Output.create 12
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

// (-4800) push constant 0 // local(0) init
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

// (-4802) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4804) push constant 100
@100 // push constant 100
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4806) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4808) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4810) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4812) push constant 60
@60 // push constant 60
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4814) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4816) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4818) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4820) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4822) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4824) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4826) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4829) call Output.create 12
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

// (-4831) push constant 0 // local(0) init
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

// (-4833) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4835) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4837) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4839) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4841) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4843) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4845) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4847) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4849) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4851) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4853) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4855) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4857) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4860) call Output.create 12
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

// (-4862) push constant 0 // local(0) init
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

// (-4864) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4866) push constant 102
@102 // push constant 102
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4868) push constant 28
@28 // push constant 28
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4870) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4872) push constant 38
@38 // push constant 38
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4874) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4876) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4878) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4880) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4882) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4884) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4886) push constant 0
@0 // push constant 0
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

// (-4891) call Output.create 12
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

// (-4893) push constant 0 // local(0) init
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

// (-4895) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4897) push constant 103
@103 // push constant 103
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4899) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4901) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4903) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4905) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4907) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4909) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4911) push constant 62
@62 // push constant 62
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4913) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4915) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4917) push constant 30
@30 // push constant 30
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

// (-4922) call Output.create 12
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

// (-4924) push constant 0 // local(0) init
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

// (-4926) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4928) push constant 104
@104 // push constant 104
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4930) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4932) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4934) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4936) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4938) push constant 55
@55 // push constant 55
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4940) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4942) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4944) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4946) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4948) push constant 0
@0 // push constant 0
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

// (-4953) call Output.create 12
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

// (-4955) push constant 0 // local(0) init
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

// (-4957) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4959) push constant 105
@105 // push constant 105
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4961) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4963) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4965) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4967) push constant 14
@14 // push constant 14
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4969) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4971) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4973) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4975) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4977) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4979) push constant 0
@0 // push constant 0
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

// (-4984) call Output.create 12
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

// (-4986) push constant 0 // local(0) init
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

// (-4988) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4990) push constant 106
@106 // push constant 106
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4992) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4994) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4996) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4998) push constant 56
@56 // push constant 56
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5000) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5002) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5004) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5006) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5008) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5010) push constant 30
@30 // push constant 30
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

// (-5015) call Output.create 12
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

// (-5017) push constant 0 // local(0) init
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

// (-5019) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5021) push constant 107
@107 // push constant 107
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5023) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5025) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5027) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5029) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5031) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5033) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5035) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5037) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5039) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5041) push constant 0
@0 // push constant 0
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

// (-5046) call Output.create 12
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

// (-5048) push constant 0 // local(0) init
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

// (-5050) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5052) push constant 108
@108 // push constant 108
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5054) push constant 14
@14 // push constant 14
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5056) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5058) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5060) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5062) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5064) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5066) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5068) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5070) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5072) push constant 0
@0 // push constant 0
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

// (-5077) call Output.create 12
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

// (-5079) push constant 0 // local(0) init
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

// (-5081) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5083) push constant 109
@109 // push constant 109
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5085) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5087) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5089) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5091) push constant 29
@29 // push constant 29
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5093) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5095) push constant 43
@43 // push constant 43
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5097) push constant 43
@43 // push constant 43
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5099) push constant 43
@43 // push constant 43
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5101) push constant 43
@43 // push constant 43
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5103) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5105) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5108) call Output.create 12
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

// (-5110) push constant 0 // local(0) init
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

// (-5112) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5114) push constant 110
@110 // push constant 110
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5116) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5118) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5120) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5122) push constant 29
@29 // push constant 29
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5124) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5126) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5128) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5130) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5132) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5134) push constant 0
@0 // push constant 0
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

// (-5139) call Output.create 12
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

// (-5141) push constant 0 // local(0) init
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

// (-5143) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5145) push constant 111
@111 // push constant 111
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5147) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5149) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5151) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5153) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5155) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5157) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5159) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5161) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5163) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5165) push constant 0
@0 // push constant 0
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

// (-5170) call Output.create 12
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

// (-5172) push constant 0 // local(0) init
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

// (-5174) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5176) push constant 112
@112 // push constant 112
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5178) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5180) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5182) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5184) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5186) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5188) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5190) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5192) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5194) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5196) push constant 3
@3 // push constant 3
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

// (-5201) call Output.create 12
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

// (-5203) push constant 0 // local(0) init
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

// (-5205) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5207) push constant 113
@113 // push constant 113
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5209) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5211) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5213) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5215) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5217) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5219) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5221) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5223) push constant 62
@62 // push constant 62
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5225) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5227) push constant 48
@48 // push constant 48
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

// (-5232) call Output.create 12
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

// (-5234) push constant 0 // local(0) init
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

// (-5236) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5238) push constant 114
@114 // push constant 114
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5240) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5242) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5244) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5246) push constant 29
@29 // push constant 29
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5248) push constant 55
@55 // push constant 55
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5250) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5252) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5254) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5256) push constant 7
@7 // push constant 7
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5258) push constant 0
@0 // push constant 0
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

// (-5263) call Output.create 12
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

// (-5265) push constant 0 // local(0) init
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

// (-5267) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5269) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5271) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5273) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5275) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5277) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5279) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5281) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5283) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5285) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5287) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5289) push constant 0
@0 // push constant 0
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

// (-5294) call Output.create 12
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

// (-5296) push constant 0 // local(0) init
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

// (-5298) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5300) push constant 116
@116 // push constant 116
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5302) push constant 4
@4 // push constant 4
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5304) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5306) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5308) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5310) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5312) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5314) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5316) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5318) push constant 28
@28 // push constant 28
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5320) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5322) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5325) call Output.create 12
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

// (-5327) push constant 0 // local(0) init
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

// (-5329) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5331) push constant 117
@117 // push constant 117
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5333) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5335) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5337) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5339) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5341) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5343) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5345) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5347) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5349) push constant 54
@54 // push constant 54
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5351) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5353) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5356) call Output.create 12
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

// (-5358) push constant 0 // local(0) init
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

// (-5360) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5362) push constant 118
@118 // push constant 118
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5364) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5366) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5368) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5370) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5372) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5374) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5376) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5378) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5380) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5382) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5384) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5387) call Output.create 12
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

// (-5389) push constant 0 // local(0) init
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

// (-5391) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5393) push constant 119
@119 // push constant 119
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5395) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5397) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5399) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5401) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5403) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5405) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5407) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5409) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5411) push constant 18
@18 // push constant 18
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5413) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5415) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5418) call Output.create 12
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

// (-5420) push constant 0 // local(0) init
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

// (-5422) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5424) push constant 120
@120 // push constant 120
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5426) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5428) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5430) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5432) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5434) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5436) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5438) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5440) push constant 30
@30 // push constant 30
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5442) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5444) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5446) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5449) call Output.create 12
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

// (-5451) push constant 0 // local(0) init
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

// (-5453) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5455) push constant 121
@121 // push constant 121
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5457) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5459) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5461) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5463) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5465) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5467) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5469) push constant 62
@62 // push constant 62
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5471) push constant 48
@48 // push constant 48
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5473) push constant 24
@24 // push constant 24
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5475) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5477) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5480) call Output.create 12
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

// (-5482) push constant 0 // local(0) init
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

// (-5486) push constant 122
@122 // push constant 122
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5488) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5490) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5492) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5494) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5496) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5498) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5500) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5502) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5504) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5506) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5508) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5511) call Output.create 12
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

// (-5513) push constant 0 // local(0) init
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

// (-5515) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5517) push constant 123
@123 // push constant 123
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5519) push constant 56
@56 // push constant 56
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5521) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5523) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5525) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5527) push constant 7
@7 // push constant 7
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5529) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5531) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5533) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5535) push constant 56
@56 // push constant 56
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5537) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5539) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5542) call Output.create 12
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

// (-5544) push constant 0 // local(0) init
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

// (-5546) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5548) push constant 124
@124 // push constant 124
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5550) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5552) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5554) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5556) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5558) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5560) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5562) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5564) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5566) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5568) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5570) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5573) call Output.create 12
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

// (-5575) push constant 0 // local(0) init
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

// (-5577) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5579) push constant 125
@125 // push constant 125
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5581) push constant 7
@7 // push constant 7
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5583) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5585) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5587) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5589) push constant 56
@56 // push constant 56
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5591) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5593) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5595) push constant 12
@12 // push constant 12
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5597) push constant 7
@7 // push constant 7
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5599) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5601) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5604) call Output.create 12
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

// (-5606) push constant 0 // local(0) init
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

// (-5608) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5610) push constant 126
@126 // push constant 126
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5612) push constant 38
@38 // push constant 38
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5614) push constant 45
@45 // push constant 45
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5616) push constant 25
@25 // push constant 25
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5618) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5620) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5622) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5624) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5626) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5628) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5630) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5632) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5635) call Output.create 12
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

// (-5637) push constant 0 // local(0) init
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

// (-5639) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5641) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5643) return

// (-5645) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-5647) function Output.create 1
(Output.create) // function Output.create 1

// (-5650) push constant 11
@11 // push constant 11 // function Output.create 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-5653) call Array.new 1
(Output.Array.new.213) // call Array.new 1
@Output.Array.new.213 // call Array.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-5655) pop local 0
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

// (-5657) push argument 0
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

// (-5659) push static 5
@19 // push static 5 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5661) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-5663) push local 0
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

// (-5665) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5667) pop pointer 1
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

// (-5669) push temp 0
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

// (-5671) pop that 0
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

// (-5673) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5675) push local 0
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

// (-5677) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-5679) push argument 1
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

// (-5681) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5683) pop pointer 1
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

// (-5685) push temp 0
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

// (-5687) pop that 0
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

// (-5689) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5691) push local 0
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

// (-5693) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-5695) push argument 2
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

// (-5697) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5699) pop pointer 1
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

// (-5701) push temp 0
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

// (-5703) pop that 0
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

// (-5705) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5707) push local 0
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

// (-5709) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-5711) push argument 3
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

// (-5713) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5715) pop pointer 1
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

// (-5717) push temp 0
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

// (-5719) pop that 0
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

// (-5721) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5723) push local 0
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

// (-5725) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-5727) push argument 4
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

// (-5729) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5731) pop pointer 1
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

// (-5733) push temp 0
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

// (-5735) pop that 0
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

// (-5737) push constant 4
@4 // push constant 4
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5739) push local 0
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

// (-5741) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-5743) push argument 5
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

// (-5745) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5747) pop pointer 1
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

// (-5749) push temp 0
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

// (-5751) pop that 0
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

// (-5753) push constant 5
@5 // push constant 5
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5755) push local 0
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

// (-5757) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-5759) push argument 6
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

// (-5761) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5763) pop pointer 1
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

// (-5765) push temp 0
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

// (-5767) pop that 0
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

// (-5769) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5771) push local 0
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

// (-5773) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-5775) push argument 7
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

// (-5777) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5779) pop pointer 1
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

// (-5781) push temp 0
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

// (-5783) pop that 0
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

// (-5785) push constant 7
@7 // push constant 7
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5787) push local 0
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

// (-5789) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-5791) push argument 8
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

// (-5793) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5795) pop pointer 1
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

// (-5797) push temp 0
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

// (-5799) pop that 0
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

// (-5801) push constant 8
@8 // push constant 8
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5803) push local 0
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

// (-5805) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-5807) push argument 9
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

// (-5809) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5811) pop pointer 1
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

// (-5813) push temp 0
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

// (-5815) pop that 0
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

// (-5817) push constant 9
@9 // push constant 9
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5819) push local 0
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

// (-5821) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-5823) push argument 10
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

// (-5825) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5827) pop pointer 1
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

// (-5829) push temp 0
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

// (-5831) pop that 0
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

// (-5833) push constant 10
@10 // push constant 10
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5835) push local 0
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

// (-5837) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-5839) push argument 11
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

// (-5841) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5843) pop pointer 1
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

// (-5845) push temp 0
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

// (-5847) pop that 0
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

// (-5849) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5851) return

// (-5853) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-5855) function Output.createShiftedMap 4
(Output.createShiftedMap) // function Output.createShiftedMap 4

// (-5858) push constant 127
@127 // push constant 127 // function Output.createShiftedMap 4
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-5861) call Array.new 1
(Output.Array.new.214) // call Array.new 1
@Output.Array.new.214 // call Array.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-5863) pop static 6
@19 // pop static 6 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
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

// (-5865) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5867) pop local 2
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

// (-5869) label WHILE_EXP0
(Output.WHILE_EXP0) // label WHILE_EXP0

// (-5872) push local 2
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

// (-5874) push constant 127
@127 // push constant 127
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5876) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_215
D;JLT
(JLT_FALSE_215)
@0
D=A // d = false
@JLT_END_215
0;JMP
(JLT_TRUE_215)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_215)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-5881) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-5883) if-goto WHILE_END0
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

// (-5885) push local 2
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

// (-5887) push static 5
@19 // push static 5 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5889) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-5891) pop pointer 1
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

// (-5893) push that 0
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

// (-5895) pop local 0
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

// (-5897) push constant 11
@11 // push constant 11
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5900) call Array.new 1
(Output.Array.new.216) // call Array.new 1
@Output.Array.new.216 // call Array.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-5902) pop local 1
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

// (-5904) push local 2
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

// (-5906) push static 6
@19 // push static 6 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5908) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-5910) push local 1
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

// (-5912) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-5914) pop pointer 1
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

// (-5916) push temp 0
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

// (-5918) pop that 0
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

// (-5920) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5922) pop local 3
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

// (-5924) label WHILE_EXP1
(Output.WHILE_EXP1) // label WHILE_EXP1

// (-5927) push local 3
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

// (-5929) push constant 11
@11 // push constant 11
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5931) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_217
D;JLT
(JLT_FALSE_217)
@0
D=A // d = false
@JLT_END_217
0;JMP
(JLT_TRUE_217)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_217)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-5936) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-5938) if-goto WHILE_END1
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

// (-5940) push local 3
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

// (-5942) push local 1
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

// (-5944) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-5946) push local 3
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

// (-5948) push local 0
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

// (-5950) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-5952) pop pointer 1
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

// (-5954) push that 0
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

// (-5956) push constant 256
@256 // push constant 256
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5959) call Math.multiply 2
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

// (-5961) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5963) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5965) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5967) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5969) push constant 0 // local(4) init
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

// (-5971) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

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

// (-5975) push temp 0
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

// (-5977) pop that 0
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

// (-5979) push local 3
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

// (-5981) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5983) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-5985) pop local 3
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

// (-5987) goto WHILE_EXP1
@Output.WHILE_EXP1 // goto WHILE_EXP1
0;JMP // unconditional jump

// (-5989) label WHILE_END1
(Output.WHILE_END1) // label WHILE_END1

// (-5992) push local 2
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

// (-5994) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-5996) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_219
D;JEQ
(EQ_FALSE_219)
@0
D=A // d = false
@EQ_END_219
0;JMP
(EQ_TRUE_219)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_219)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6001) if-goto IF_TRUE0
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

// (-6003) goto IF_FALSE0
@Output.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-6005) label IF_TRUE0
(Output.IF_TRUE0) // label IF_TRUE0

// (-6008) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6010) pop local 2
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

// (-6012) goto IF_END0
@Output.IF_END0 // goto IF_END0
0;JMP // unconditional jump

// (-6014) label IF_FALSE0
(Output.IF_FALSE0) // label IF_FALSE0

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

// (-6019) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6021) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-6023) pop local 2
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

// (-6025) label IF_END0
(Output.IF_END0) // label IF_END0

// (-6028) goto WHILE_EXP0
@Output.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-6030) label WHILE_END0
(Output.WHILE_END0) // label WHILE_END0

// (-6033) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6035) return

// (-6037) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-6039) function Output.getMap 1
(Output.getMap) // function Output.getMap 1

// (-6042) push argument 0
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
// (-6044) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6046) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_220
D;JLT
(JLT_FALSE_220)
@0
D=A // d = false
@JLT_END_220
0;JMP
(JLT_TRUE_220)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_220)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6051) push argument 0
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

// (-6053) push constant 126
@126 // push constant 126
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6055) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_221
D;JGT
(JGT_FALSE_221)
@0
D=A // d = false
@JGT_END_221
0;JMP
(JGT_TRUE_221)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_221)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6060) or
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

// (-6062) if-goto IF_TRUE0
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

// (-6064) goto IF_FALSE0
@Output.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-6066) label IF_TRUE0
(Output.IF_TRUE0) // label IF_TRUE0

// (-6069) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6071) pop argument 0
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

// (-6073) label IF_FALSE0
(Output.IF_FALSE0) // label IF_FALSE0

// (-6076) push static 2
@19 // push static 2 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6078) if-goto IF_TRUE1
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

// (-6080) goto IF_FALSE1
@Output.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-6082) label IF_TRUE1
(Output.IF_TRUE1) // label IF_TRUE1

// (-6085) push argument 0
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

// (-6087) push static 5
@19 // push static 5 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6089) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-6091) pop pointer 1
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

// (-6093) push that 0
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

// (-6095) pop local 0
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

// (-6097) goto IF_END1
@Output.IF_END1 // goto IF_END1
0;JMP // unconditional jump

// (-6099) label IF_FALSE1
(Output.IF_FALSE1) // label IF_FALSE1

// (-6102) push argument 0
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

// (-6104) push static 6
@19 // push static 6 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6106) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-6108) pop pointer 1
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

// (-6110) push that 0
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

// (-6112) pop local 0
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

// (-6114) label IF_END1
(Output.IF_END1) // label IF_END1

// (-6117) push local 0
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

// (-6119) return

// (-6121) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-6123) function Output.drawChar 4
(Output.drawChar) // function Output.drawChar 4

// (-6126) push argument 0
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
// (-6129) call Output.getMap 1
(Output.Output.getMap.222) // call Output.getMap 1
@Output.Output.getMap.222 // call Output.getMap // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-6131) push constant 0 // local(0) init
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

// (-6133) pop local 2
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

// (-6135) push static 1
@19 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6137) pop local 0
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

// (-6139) label WHILE_EXP0
(Output.WHILE_EXP0) // label WHILE_EXP0

// (-6142) push local 1
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

// (-6144) push constant 11
@11 // push constant 11
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6146) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_223
D;JLT
(JLT_FALSE_223)
@0
D=A // d = false
@JLT_END_223
0;JMP
(JLT_TRUE_223)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_223)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6151) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-6153) if-goto WHILE_END0
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

// (-6155) push static 2
@19 // push static 2 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6157) if-goto IF_TRUE0
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

// (-6159) goto IF_FALSE0
@Output.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-6161) label IF_TRUE0
(Output.IF_TRUE0) // label IF_TRUE0

// (-6164) push local 0
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

// (-6166) push static 4
@19 // push static 4 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6168) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-6170) pop pointer 1
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

// (-6172) push that 0
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

// (-6174) push constant 256
@256 // push constant 256
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6176) neg
@SP // neg
M=M-1
A=M
M=-M
@SP
M=M+1

// (-6178) and
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

// (-6180) pop local 3
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

// (-6182) goto IF_END0
@Output.IF_END0 // goto IF_END0
0;JMP // unconditional jump

// (-6184) label IF_FALSE0
(Output.IF_FALSE0) // label IF_FALSE0

// (-6187) push local 0
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

// (-6189) push static 4
@19 // push static 4 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6191) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-6193) pop pointer 1
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

// (-6195) push that 0
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

// (-6197) push constant 255
@255 // push constant 255
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6199) and
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

// (-6201) pop local 3
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

// (-6203) label IF_END0
(Output.IF_END0) // label IF_END0

// (-6206) push local 0
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

// (-6208) push static 4
@19 // push static 4 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6210) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-6212) push local 1
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

// (-6214) push local 2
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

// (-6216) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-6218) pop pointer 1
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

// (-6220) push that 0
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

// (-6222) push local 3
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

// (-6224) or
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

// (-6226) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-6228) pop pointer 1
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

// (-6230) push temp 0
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

// (-6232) pop that 0
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

// (-6234) push local 0
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

// (-6236) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6238) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-6240) pop local 0
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

// (-6242) push local 1
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

// (-6244) push constant 1
@1 // push constant 1
D=A
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

// (-6248) pop local 1
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

// (-6250) goto WHILE_EXP0
@Output.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-6252) label WHILE_END0
(Output.WHILE_END0) // label WHILE_END0

// (-6255) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6257) return

// (-6259) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-6261) function Output.moveCursor 0
(Output.moveCursor) // function Output.moveCursor 0

// (-6264) push argument 0
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
// (-6266) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6268) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_224
D;JLT
(JLT_FALSE_224)
@0
D=A // d = false
@JLT_END_224
0;JMP
(JLT_TRUE_224)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_224)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6273) push argument 0
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

// (-6275) push constant 22
@22 // push constant 22
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6277) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_225
D;JGT
(JGT_FALSE_225)
@0
D=A // d = false
@JGT_END_225
0;JMP
(JGT_TRUE_225)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_225)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6282) or
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

// (-6284) push argument 1
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

// (-6286) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6288) lt
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

// (-6293) or
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

// (-6295) push argument 1
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

// (-6297) push constant 63
@63 // push constant 63
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6299) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_227
D;JGT
(JGT_FALSE_227)
@0
D=A // d = false
@JGT_END_227
0;JMP
(JGT_TRUE_227)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_227)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6304) or
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

// (-6306) if-goto IF_TRUE0
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

// (-6308) goto IF_FALSE0
@Output.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-6310) label IF_TRUE0
(Output.IF_TRUE0) // label IF_TRUE0

// (-6313) push constant 20
@20 // push constant 20
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6316) call Sys.error 1
(Output.Sys.error.228) // call Sys.error 1
@Output.Sys.error.228 // call Sys.error // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-6318) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-6320) label IF_FALSE0
(Output.IF_FALSE0) // label IF_FALSE0

// (-6323) push argument 1
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

// (-6325) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6328) call Math.divide 2
(Output.Math.divide.229) // call Math.divide 2
@Output.Math.divide.229 // call Math.divide // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-6330) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6332) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6334) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6336) push constant 0 // local(3) init
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

// (-6338) pop static 0
@19 // pop static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-6340) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6342) push argument 0
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

// (-6344) push constant 352
@352 // push constant 352
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6347) call Math.multiply 2
(Output.Math.multiply.230) // call Math.multiply 2
@Output.Math.multiply.230 // call Math.multiply // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-6349) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6351) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6353) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6355) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6357) push constant 0 // local(4) init
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

// (-6359) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-6361) push static 0
@19 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6363) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-6365) pop static 1
@19 // pop static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
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

// (-6367) push argument 1
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

// (-6369) push static 0
@19 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6371) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6374) call Math.multiply 2
(Output.Math.multiply.231) // call Math.multiply 2
@Output.Math.multiply.231 // call Math.multiply // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-6376) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6378) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6380) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6382) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6384) push constant 0 // local(4) init
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

// (-6386) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_232
D;JEQ
(EQ_FALSE_232)
@0
D=A // d = false
@EQ_END_232
0;JMP
(EQ_TRUE_232)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_232)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6391) pop static 2
@19 // pop static 2 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
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

// (-6393) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6396) call Output.drawChar 1
(Output.Output.drawChar.233) // call Output.drawChar 1
@Output.Output.drawChar.233 // call Output.drawChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-6398) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6400) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6402) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6404) push constant 0 // local(3) init
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

// (-6406) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-6408) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6410) return

// (-6412) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-6414) function Output.printChar 0
(Output.printChar) // function Output.printChar 0

// (-6417) push argument 0
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
// (-6420) call String.newLine 0
(Output.String.newLine.234) // call String.newLine 0

// (-6422) push constant 9999 // call String.newLine // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call String.newLine // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Output.String.newLine.234 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-6424) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_235
D;JEQ
(EQ_FALSE_235)
@0
D=A // d = false
@EQ_END_235
0;JMP
(EQ_TRUE_235)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_235)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6429) if-goto IF_TRUE0
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

// (-6431) goto IF_FALSE0
@Output.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-6433) label IF_TRUE0
(Output.IF_TRUE0) // label IF_TRUE0

// (-6437) call Output.println 0
(Output.Output.println.236) // call Output.println 0

// (-6439) push constant 9999 // call Output.println // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Output.println // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Output.Output.println.236 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-6441) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-6443) goto IF_END0
@Output.IF_END0 // goto IF_END0
0;JMP // unconditional jump

// (-6445) label IF_FALSE0
(Output.IF_FALSE0) // label IF_FALSE0

// (-6448) push argument 0
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

// (-6451) call String.backSpace 0
(Output.String.backSpace.237) // call String.backSpace 0

// (-6453) push constant 9999 // call String.backSpace // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call String.backSpace // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Output.String.backSpace.237 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-6455) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_238
D;JEQ
(EQ_FALSE_238)
@0
D=A // d = false
@EQ_END_238
0;JMP
(EQ_TRUE_238)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_238)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6460) if-goto IF_TRUE1
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

// (-6462) goto IF_FALSE1
@Output.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-6464) label IF_TRUE1
(Output.IF_TRUE1) // label IF_TRUE1

// (-6468) call Output.backSpace 0
(Output.Output.backSpace.239) // call Output.backSpace 0

// (-6470) push constant 9999 // call Output.backSpace // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Output.backSpace // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Output.Output.backSpace.239 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-6472) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-6474) goto IF_END1
@Output.IF_END1 // goto IF_END1
0;JMP // unconditional jump

// (-6476) label IF_FALSE1
(Output.IF_FALSE1) // label IF_FALSE1

// (-6479) push argument 0
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

// (-6482) call Output.drawChar 1
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

// (-6484) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6486) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6488) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6490) push constant 0 // local(3) init
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

// (-6492) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-6494) push static 2
@19 // push static 2 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6496) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-6498) if-goto IF_TRUE2
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

// (-6500) goto IF_FALSE2
@Output.IF_FALSE2 // goto IF_FALSE2
0;JMP // unconditional jump

// (-6502) label IF_TRUE2
(Output.IF_TRUE2) // label IF_TRUE2

// (-6505) push static 0
@19 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6507) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6509) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-6511) pop static 0
@19 // pop static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-6513) push static 1
@19 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6515) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6517) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-6519) pop static 1
@19 // pop static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
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

// (-6521) label IF_FALSE2
(Output.IF_FALSE2) // label IF_FALSE2

// (-6524) push static 0
@19 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6526) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6528) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_241
D;JEQ
(EQ_FALSE_241)
@0
D=A // d = false
@EQ_END_241
0;JMP
(EQ_TRUE_241)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_241)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6533) if-goto IF_TRUE3
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

// (-6535) goto IF_FALSE3
@Output.IF_FALSE3 // goto IF_FALSE3
0;JMP // unconditional jump

// (-6537) label IF_TRUE3
(Output.IF_TRUE3) // label IF_TRUE3

// (-6541) call Output.println 0
(Output.Output.println.242) // call Output.println 0

// (-6543) push constant 9999 // call Output.println // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Output.println // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Output.Output.println.242 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-6545) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-6547) goto IF_END3
@Output.IF_END3 // goto IF_END3
0;JMP // unconditional jump

// (-6549) label IF_FALSE3
(Output.IF_FALSE3) // label IF_FALSE3

// (-6552) push static 2
@19 // push static 2 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6554) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-6556) pop static 2
@19 // pop static 2 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
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

// (-6558) label IF_END3
(Output.IF_END3) // label IF_END3

// (-6561) label IF_END1
(Output.IF_END1) // label IF_END1

// (-6564) label IF_END0
(Output.IF_END0) // label IF_END0

// (-6567) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6569) return

// (-6571) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-6573) function Output.printString 2
(Output.printString) // function Output.printString 2

// (-6576) push argument 0
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
// (-6579) call String.length 1
(Output.String.length.243) // call String.length 1
@Output.String.length.243 // call String.length // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-6581) pop local 1
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

// (-6583) label WHILE_EXP0
(Output.WHILE_EXP0) // label WHILE_EXP0

// (-6586) push local 0
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

// (-6588) push local 1
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

// (-6590) lt
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

// (-6595) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-6597) if-goto WHILE_END0
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

// (-6599) push argument 0
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

// (-6601) push local 0
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

// (-6604) call String.charAt 2
(Output.String.charAt.245) // call String.charAt 2
@Output.String.charAt.245 // call String.charAt // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-6607) call Output.printChar 1
(Output.Output.printChar.246) // call Output.printChar 1
@Output.Output.printChar.246 // call Output.printChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-6609) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-6611) push local 0
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

// (-6613) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6615) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

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

// (-6619) goto WHILE_EXP0
@Output.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-6621) label WHILE_END0
(Output.WHILE_END0) // label WHILE_END0

// (-6624) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6626) return

// (-6628) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-6630) function Output.printInt 0
(Output.printInt) // function Output.printInt 0

// (-6633) push static 3
@19 // push static 3 // function Output.printInt 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-6635) push argument 0
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

// (-6638) call String.setInt 2
(Output.String.setInt.247) // call String.setInt 2
@Output.String.setInt.247 // call String.setInt // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-6640) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6642) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6644) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6646) push constant 0 // local(3) init
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

// (-6648) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-6650) push static 3
@19 // push static 3 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6653) call Output.printString 1
(Output.Output.printString.248) // call Output.printString 1
@Output.Output.printString.248 // call Output.printString // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-6655) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6657) push constant 0 // local(1) init
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

// (-6659) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-6661) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6663) return

// (-6665) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-6667) function Output.println 0
(Output.println) // function Output.println 0

// (-6670) push static 1
@19 // push static 1 // function Output.println 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-6672) push constant 352
@352 // push constant 352
D=A
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

// (-6676) push static 0
@19 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6678) sub
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

// (-6680) pop static 1
@19 // pop static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
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

// (-6682) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6684) pop static 0
@19 // pop static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-6686) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6688) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-6690) pop static 2
@19 // pop static 2 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
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

// (-6692) push static 1
@19 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6694) push constant 8128
@8128 // push constant 8128
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6696) eq
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

// (-6701) if-goto IF_TRUE0
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

// (-6703) goto IF_FALSE0
@Output.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-6705) label IF_TRUE0
(Output.IF_TRUE0) // label IF_TRUE0

// (-6708) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6710) pop static 1
@19 // pop static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
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

// (-6712) label IF_FALSE0
(Output.IF_FALSE0) // label IF_FALSE0

// (-6715) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6717) return

// (-6719) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-6721) function Output.backSpace 0
(Output.backSpace) // function Output.backSpace 0

// (-6724) push static 2
@19 // push static 2 // function Output.backSpace 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-6726) if-goto IF_TRUE0
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

// (-6728) goto IF_FALSE0
@Output.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-6730) label IF_TRUE0
(Output.IF_TRUE0) // label IF_TRUE0

// (-6733) push static 0
@19 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6735) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6737) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_250
D;JGT
(JGT_FALSE_250)
@0
D=A // d = false
@JGT_END_250
0;JMP
(JGT_TRUE_250)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_250)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6742) if-goto IF_TRUE1
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

// (-6744) goto IF_FALSE1
@Output.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-6746) label IF_TRUE1
(Output.IF_TRUE1) // label IF_TRUE1

// (-6749) push static 0
@19 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6751) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6753) sub
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

// (-6755) pop static 0
@19 // pop static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-6757) push static 1
@19 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6759) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6761) sub
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

// (-6763) pop static 1
@19 // pop static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
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

// (-6765) goto IF_END1
@Output.IF_END1 // goto IF_END1
0;JMP // unconditional jump

// (-6767) label IF_FALSE1
(Output.IF_FALSE1) // label IF_FALSE1

// (-6770) push constant 31
@31 // push constant 31
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6772) pop static 0
@19 // pop static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-6774) push static 1
@19 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6776) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6778) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_251
D;JEQ
(EQ_FALSE_251)
@0
D=A // d = false
@EQ_END_251
0;JMP
(EQ_TRUE_251)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_251)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6783) if-goto IF_TRUE2
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

// (-6785) goto IF_FALSE2
@Output.IF_FALSE2 // goto IF_FALSE2
0;JMP // unconditional jump

// (-6787) label IF_TRUE2
(Output.IF_TRUE2) // label IF_TRUE2

// (-6790) push constant 8128
@8128 // push constant 8128
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6792) pop static 1
@19 // pop static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
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

// (-6794) label IF_FALSE2
(Output.IF_FALSE2) // label IF_FALSE2

// (-6797) push static 1
@19 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6799) push constant 321
@321 // push constant 321
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6801) sub
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

// (-6803) pop static 1
@19 // pop static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
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

// (-6805) label IF_END1
(Output.IF_END1) // label IF_END1

// (-6808) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6810) pop static 2
@19 // pop static 2 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
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

// (-6812) goto IF_END0
@Output.IF_END0 // goto IF_END0
0;JMP // unconditional jump

// (-6814) label IF_FALSE0
(Output.IF_FALSE0) // label IF_FALSE0

// (-6817) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6819) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-6821) pop static 2
@19 // pop static 2 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Output.vm)
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

// (-6823) label IF_END0
(Output.IF_END0) // label IF_END0

// (-6826) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6829) call Output.drawChar 1
(Output.Output.drawChar.252) // call Output.drawChar 1
@Output.Output.drawChar.252 // call Output.drawChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-6831) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6833) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6835) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6837) push constant 0 // local(3) init
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

// (-6839) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-6841) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6843) return

// (-6845) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-6847) function Screen.init 1
(Screen.init) // function Screen.init 1

// (-6850) push constant 16384
@16384 // push constant 16384 // function Screen.init 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-6852) pop static 1
@26 // pop static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Screen.vm)
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

// (-6854) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6856) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-6858) pop static 2
@26 // pop static 2 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Screen.vm)
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

// (-6860) push constant 17
@17 // push constant 17
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6863) call Array.new 1
(Screen.Array.new.253) // call Array.new 1
@Screen.Array.new.253 // call Array.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-6865) pop static 0
@26 // pop static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Screen.vm)
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-6867) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6869) push static 0
@26 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Screen.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6871) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-6873) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6875) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-6877) pop pointer 1
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

// (-6879) push temp 0
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

// (-6881) pop that 0
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

// (-6883) label WHILE_EXP0
(Screen.WHILE_EXP0) // label WHILE_EXP0

// (-6886) push local 0
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

// (-6888) push constant 16
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6890) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_254
D;JLT
(JLT_FALSE_254)
@0
D=A // d = false
@JLT_END_254
0;JMP
(JLT_TRUE_254)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_254)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-6895) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-6897) if-goto WHILE_END0
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

// (-6899) push local 0
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

// (-6901) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6903) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-6905) pop local 0
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

// (-6907) push local 0
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

// (-6909) push static 0
@26 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Screen.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6911) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-6913) push local 0
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

// (-6915) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6917) sub
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

// (-6919) push static 0
@26 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Screen.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6921) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-6923) pop pointer 1
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

// (-6925) push that 0
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

// (-6927) push local 0
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

// (-6929) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6931) sub
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

// (-6933) push static 0
@26 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Screen.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6935) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-6937) pop pointer 1
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

// (-6939) push that 0
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

// (-6941) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-6943) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-6945) pop pointer 1
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

// (-6947) push temp 0
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

// (-6949) pop that 0
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

// (-6951) goto WHILE_EXP0
@Screen.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-6953) label WHILE_END0
(Screen.WHILE_END0) // label WHILE_END0

// (-6956) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6958) return

// (-6960) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-6962) function Screen.clearScreen 1
(Screen.clearScreen) // function Screen.clearScreen 1

// (-6965) label WHILE_EXP0
(Screen.WHILE_EXP0) // label WHILE_EXP0

// (-6968) push local 0
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
// (-6970) push constant 8192
@8192 // push constant 8192
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6972) lt
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

// (-6977) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-6979) if-goto WHILE_END0
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

// (-6981) push local 0
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

// (-6983) push static 1
@26 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Screen.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6985) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-6987) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-6989) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-6991) pop pointer 1
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

// (-6993) push temp 0
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

// (-6995) pop that 0
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

// (-6999) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7001) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-7003) pop local 0
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

// (-7005) goto WHILE_EXP0
@Screen.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-7007) label WHILE_END0
(Screen.WHILE_END0) // label WHILE_END0

// (-7010) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7012) return

// (-7014) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-7016) function Screen.updateLocation 0
(Screen.updateLocation) // function Screen.updateLocation 0

// (-7019) push static 2
@26 // push static 2 // function Screen.updateLocation 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Screen.vm)
D=A
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-7021) if-goto IF_TRUE0
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

// (-7023) goto IF_FALSE0
@Screen.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-7025) label IF_TRUE0
(Screen.IF_TRUE0) // label IF_TRUE0

// (-7028) push argument 0
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

// (-7030) push static 1
@26 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Screen.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7032) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-7034) push argument 0
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

// (-7036) push static 1
@26 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Screen.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7038) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-7040) pop pointer 1
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

// (-7042) push that 0
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

// (-7044) push argument 1
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

// (-7046) or
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

// (-7048) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-7050) pop pointer 1
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

// (-7052) push temp 0
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

// (-7054) pop that 0
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

// (-7056) goto IF_END0
@Screen.IF_END0 // goto IF_END0
0;JMP // unconditional jump

// (-7058) label IF_FALSE0
(Screen.IF_FALSE0) // label IF_FALSE0

// (-7061) push argument 0
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

// (-7063) push static 1
@26 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Screen.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7065) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-7067) push argument 0
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

// (-7069) push static 1
@26 // push static 1 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Screen.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7071) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-7073) pop pointer 1
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

// (-7075) push that 0
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

// (-7077) push argument 1
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

// (-7079) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-7081) and
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

// (-7083) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-7085) pop pointer 1
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

// (-7087) push temp 0
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

// (-7089) pop that 0
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

// (-7091) label IF_END0
(Screen.IF_END0) // label IF_END0

// (-7094) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7096) return

// (-7098) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-7100) function Screen.setColor 0
(Screen.setColor) // function Screen.setColor 0

// (-7103) push argument 0
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
// (-7105) pop static 2
@26 // pop static 2 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Screen.vm)
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

// (-7107) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7109) return

// (-7111) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-7113) function Screen.drawPixel 3
(Screen.drawPixel) // function Screen.drawPixel 3

// (-7116) push argument 0
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
// (-7118) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7120) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_256
D;JLT
(JLT_FALSE_256)
@0
D=A // d = false
@JLT_END_256
0;JMP
(JLT_TRUE_256)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_256)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7125) push argument 0
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

// (-7127) push constant 511
@511 // push constant 511
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7129) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_257
D;JGT
(JGT_FALSE_257)
@0
D=A // d = false
@JGT_END_257
0;JMP
(JGT_TRUE_257)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_257)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7134) or
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

// (-7136) push argument 1
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

// (-7138) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7140) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_258
D;JLT
(JLT_FALSE_258)
@0
D=A // d = false
@JLT_END_258
0;JMP
(JLT_TRUE_258)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_258)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7145) or
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

// (-7147) push argument 1
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

// (-7149) push constant 255
@255 // push constant 255
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7151) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_259
D;JGT
(JGT_FALSE_259)
@0
D=A // d = false
@JGT_END_259
0;JMP
(JGT_TRUE_259)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_259)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7156) or
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

// (-7158) if-goto IF_TRUE0
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

// (-7160) goto IF_FALSE0
@Screen.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-7162) label IF_TRUE0
(Screen.IF_TRUE0) // label IF_TRUE0

// (-7165) push constant 7
@7 // push constant 7
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7168) call Sys.error 1
(Screen.Sys.error.260) // call Sys.error 1
@Screen.Sys.error.260 // call Sys.error // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-7170) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-7172) label IF_FALSE0
(Screen.IF_FALSE0) // label IF_FALSE0

// (-7175) push argument 0
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

// (-7177) push constant 16
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7180) call Math.divide 2
(Screen.Math.divide.261) // call Math.divide 2
@Screen.Math.divide.261 // call Math.divide // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-7182) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7184) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7186) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7188) push constant 0 // local(3) init
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

// (-7190) pop local 0
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

// (-7192) push argument 0
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

// (-7194) push local 0
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

// (-7196) push constant 16
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7199) call Math.multiply 2
(Screen.Math.multiply.262) // call Math.multiply 2
@Screen.Math.multiply.262 // call Math.multiply // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-7201) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7203) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7205) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7207) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7209) push constant 0 // local(4) init
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

// (-7211) sub
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

// (-7213) pop local 1
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

// (-7215) push argument 1
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

// (-7217) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7220) call Math.multiply 2
(Screen.Math.multiply.263) // call Math.multiply 2
@Screen.Math.multiply.263 // call Math.multiply // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-7222) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7224) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7226) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7228) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7230) push constant 0 // local(4) init
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

// (-7232) push local 0
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

// (-7234) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-7236) pop local 2
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

// (-7238) push local 2
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

// (-7240) push local 1
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

// (-7242) push static 0
@26 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Screen.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7244) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-7246) pop pointer 1
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

// (-7248) push that 0
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

// (-7251) call Screen.updateLocation 2
(Screen.Screen.updateLocation.264) // call Screen.updateLocation 2
@Screen.Screen.updateLocation.264 // call Screen.updateLocation // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-7253) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-7255) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7257) return

// (-7259) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-7261) function Screen.drawConditional 0
(Screen.drawConditional) // function Screen.drawConditional 0

// (-7264) push argument 2
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
// (-7266) if-goto IF_TRUE0
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

// (-7268) goto IF_FALSE0
@Screen.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-7270) label IF_TRUE0
(Screen.IF_TRUE0) // label IF_TRUE0

// (-7273) push argument 1
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

// (-7275) push argument 0
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

// (-7278) call Screen.drawPixel 2
(Screen.Screen.drawPixel.265) // call Screen.drawPixel 2
@Screen.Screen.drawPixel.265 // call Screen.drawPixel // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-7280) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7282) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7284) push constant 0 // local(2) init
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

// (-7286) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-7288) goto IF_END0
@Screen.IF_END0 // goto IF_END0
0;JMP // unconditional jump

// (-7290) label IF_FALSE0
(Screen.IF_FALSE0) // label IF_FALSE0

// (-7293) push argument 0
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

// (-7295) push argument 1
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

// (-7298) call Screen.drawPixel 2
(Screen.Screen.drawPixel.266) // call Screen.drawPixel 2
@Screen.Screen.drawPixel.266 // call Screen.drawPixel // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-7300) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7302) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7304) push constant 0 // local(2) init
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

// (-7306) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-7308) label IF_END0
(Screen.IF_END0) // label IF_END0

// (-7311) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7313) return

// (-7315) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-7317) function Screen.drawLine 11
(Screen.drawLine) // function Screen.drawLine 11

// (-7320) push argument 0
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
// (-7322) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7324) lt
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

// (-7329) push argument 2
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

// (-7331) push constant 511
@511 // push constant 511
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7333) gt
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

// (-7338) or
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

// (-7342) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7344) lt
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

// (-7349) or
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

// (-7351) push argument 3
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

// (-7353) push constant 255
@255 // push constant 255
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7355) gt
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

// (-7360) or
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

// (-7362) if-goto IF_TRUE0
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

// (-7364) goto IF_FALSE0
@Screen.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-7366) label IF_TRUE0
(Screen.IF_TRUE0) // label IF_TRUE0

// (-7369) push constant 8
@8 // push constant 8
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7372) call Sys.error 1
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

// (-7374) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-7376) label IF_FALSE0
(Screen.IF_FALSE0) // label IF_FALSE0

// (-7379) push argument 2
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

// (-7381) push argument 0
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

// (-7383) sub
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

// (-7386) call Math.abs 1
(Screen.Math.abs.272) // call Math.abs 1
@Screen.Math.abs.272 // call Math.abs // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-7388) pop local 3
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

// (-7390) push argument 3
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

// (-7392) push argument 1
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

// (-7394) sub
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

// (-7397) call Math.abs 1
(Screen.Math.abs.273) // call Math.abs 1
@Screen.Math.abs.273 // call Math.abs // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-7399) pop local 2
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

// (-7401) push local 3
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

// (-7403) push local 2
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

// (-7405) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_274
D;JLT
(JLT_FALSE_274)
@0
D=A // d = false
@JLT_END_274
0;JMP
(JLT_TRUE_274)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_274)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7410) pop local 6
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

// (-7412) push local 6
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

// (-7414) push argument 3
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

// (-7416) push argument 1
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

// (-7418) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_275
D;JLT
(JLT_FALSE_275)
@0
D=A // d = false
@JLT_END_275
0;JMP
(JLT_TRUE_275)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_275)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7423) and
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

// (-7425) push local 6
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

// (-7427) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-7429) push argument 2
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

// (-7431) push argument 0
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

// (-7433) lt
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

// (-7438) and
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

// (-7440) or
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

// (-7442) if-goto IF_TRUE1
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

// (-7444) goto IF_FALSE1
@Screen.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-7446) label IF_TRUE1
(Screen.IF_TRUE1) // label IF_TRUE1

// (-7449) push argument 0
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

// (-7451) pop local 4
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

// (-7453) push argument 2
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

// (-7455) pop argument 0
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

// (-7457) push local 4
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

// (-7459) pop argument 2
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

// (-7461) push argument 1
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

// (-7463) pop local 4
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

// (-7465) push argument 3
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

// (-7467) pop argument 1
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

// (-7469) push local 4
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

// (-7471) pop argument 3
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

// (-7473) label IF_FALSE1
(Screen.IF_FALSE1) // label IF_FALSE1

// (-7476) push local 6
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

// (-7478) if-goto IF_TRUE2
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

// (-7480) goto IF_FALSE2
@Screen.IF_FALSE2 // goto IF_FALSE2
0;JMP // unconditional jump

// (-7482) label IF_TRUE2
(Screen.IF_TRUE2) // label IF_TRUE2

// (-7485) push local 3
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

// (-7487) pop local 4
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

// (-7489) push local 2
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

// (-7491) pop local 3
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

// (-7493) push local 4
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

// (-7495) pop local 2
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

// (-7497) push argument 1
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

// (-7499) pop local 1
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

// (-7501) push argument 0
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

// (-7503) pop local 0
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

// (-7505) push argument 3
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

// (-7507) pop local 8
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

// (-7509) push argument 0
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

// (-7511) push argument 2
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

// (-7513) gt
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

// (-7518) pop local 7
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

// (-7520) goto IF_END2
@Screen.IF_END2 // goto IF_END2
0;JMP // unconditional jump

// (-7522) label IF_FALSE2
(Screen.IF_FALSE2) // label IF_FALSE2

// (-7525) push argument 0
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

// (-7527) pop local 1
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

// (-7529) push argument 1
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

// (-7531) pop local 0
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

// (-7533) push argument 2
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

// (-7535) pop local 8
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

// (-7537) push argument 1
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

// (-7539) push argument 3
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

// (-7541) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_278
D;JGT
(JGT_FALSE_278)
@0
D=A // d = false
@JGT_END_278
0;JMP
(JGT_TRUE_278)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_278)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7546) pop local 7
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

// (-7548) label IF_END2
(Screen.IF_END2) // label IF_END2

// (-7551) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7553) push local 2
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

// (-7556) call Math.multiply 2
(Screen.Math.multiply.279) // call Math.multiply 2
@Screen.Math.multiply.279 // call Math.multiply // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-7558) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7560) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7562) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7564) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7566) push constant 0 // local(4) init
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

// (-7568) push local 3
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

// (-7570) sub
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

// (-7572) pop local 5
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

// (-7574) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7576) push local 2
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

// (-7579) call Math.multiply 2
(Screen.Math.multiply.280) // call Math.multiply 2
@Screen.Math.multiply.280 // call Math.multiply // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-7581) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7583) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7585) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7587) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7589) push constant 0 // local(4) init
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

// (-7591) pop local 9
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

// (-7593) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7595) push local 2
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

// (-7597) push local 3
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

// (-7599) sub
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

// (-7602) call Math.multiply 2
(Screen.Math.multiply.281) // call Math.multiply 2
@Screen.Math.multiply.281 // call Math.multiply // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-7604) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7606) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7608) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7610) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7612) push constant 0 // local(4) init
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

// (-7614) pop local 10
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

// (-7616) push local 1
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

// (-7618) push local 0
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

// (-7620) push local 6
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

// (-7623) call Screen.drawConditional 3
(Screen.Screen.drawConditional.282) // call Screen.drawConditional 3
@Screen.Screen.drawConditional.282 // call Screen.drawConditional // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-7625) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-7627) label WHILE_EXP0
(Screen.WHILE_EXP0) // label WHILE_EXP0

// (-7630) push local 1
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

// (-7632) push local 8
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

// (-7634) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_283
D;JLT
(JLT_FALSE_283)
@0
D=A // d = false
@JLT_END_283
0;JMP
(JLT_TRUE_283)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_283)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7639) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-7641) if-goto WHILE_END0
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

// (-7643) push local 5
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

// (-7645) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7647) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_284
D;JLT
(JLT_FALSE_284)
@0
D=A // d = false
@JLT_END_284
0;JMP
(JLT_TRUE_284)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_284)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7652) if-goto IF_TRUE3
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

// (-7654) goto IF_FALSE3
@Screen.IF_FALSE3 // goto IF_FALSE3
0;JMP // unconditional jump

// (-7656) label IF_TRUE3
(Screen.IF_TRUE3) // label IF_TRUE3

// (-7659) push local 5
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

// (-7661) push local 9
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

// (-7663) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-7665) pop local 5
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

// (-7667) goto IF_END3
@Screen.IF_END3 // goto IF_END3
0;JMP // unconditional jump

// (-7669) label IF_FALSE3
(Screen.IF_FALSE3) // label IF_FALSE3

// (-7672) push local 5
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

// (-7674) push local 10
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

// (-7676) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-7678) pop local 5
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

// (-7680) push local 7
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

// (-7682) if-goto IF_TRUE4
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

// (-7684) goto IF_FALSE4
@Screen.IF_FALSE4 // goto IF_FALSE4
0;JMP // unconditional jump

// (-7686) label IF_TRUE4
(Screen.IF_TRUE4) // label IF_TRUE4

// (-7689) push local 0
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

// (-7691) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7693) sub
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

// (-7697) goto IF_END4
@Screen.IF_END4 // goto IF_END4
0;JMP // unconditional jump

// (-7699) label IF_FALSE4
(Screen.IF_FALSE4) // label IF_FALSE4

// (-7702) push local 0
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

// (-7704) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7706) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-7708) pop local 0
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

// (-7710) label IF_END4
(Screen.IF_END4) // label IF_END4

// (-7713) label IF_END3
(Screen.IF_END3) // label IF_END3

// (-7716) push local 1
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

// (-7718) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7720) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-7722) pop local 1
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

// (-7724) push local 1
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

// (-7726) push local 0
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

// (-7728) push local 6
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

// (-7731) call Screen.drawConditional 3
(Screen.Screen.drawConditional.285) // call Screen.drawConditional 3
@Screen.Screen.drawConditional.285 // call Screen.drawConditional // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-7733) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-7735) goto WHILE_EXP0
@Screen.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-7737) label WHILE_END0
(Screen.WHILE_END0) // label WHILE_END0

// (-7740) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7742) return

// (-7744) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-7746) function Screen.drawRectangle 9
(Screen.drawRectangle) // function Screen.drawRectangle 9

// (-7749) push argument 0
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
// (-7751) push argument 2
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

// (-7753) gt
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

// (-7758) push argument 1
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

// (-7760) push argument 3
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

// (-7762) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_287
D;JGT
(JGT_FALSE_287)
@0
D=A // d = false
@JGT_END_287
0;JMP
(JGT_TRUE_287)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_287)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7767) or
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

// (-7769) push argument 0
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

// (-7771) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7773) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_288
D;JLT
(JLT_FALSE_288)
@0
D=A // d = false
@JLT_END_288
0;JMP
(JLT_TRUE_288)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_288)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7778) or
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

// (-7780) push argument 2
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

// (-7782) push constant 511
@511 // push constant 511
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7784) gt
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

// (-7789) or
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

// (-7791) push argument 1
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

// (-7793) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7795) lt
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

// (-7800) or
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

// (-7802) push argument 3
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

// (-7804) push constant 255
@255 // push constant 255
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7806) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_291
D;JGT
(JGT_FALSE_291)
@0
D=A // d = false
@JGT_END_291
0;JMP
(JGT_TRUE_291)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_291)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-7811) or
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

// (-7813) if-goto IF_TRUE0
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

// (-7815) goto IF_FALSE0
@Screen.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-7817) label IF_TRUE0
(Screen.IF_TRUE0) // label IF_TRUE0

// (-7820) push constant 9
@9 // push constant 9
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7823) call Sys.error 1
(Screen.Sys.error.292) // call Sys.error 1
@Screen.Sys.error.292 // call Sys.error // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-7825) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-7827) label IF_FALSE0
(Screen.IF_FALSE0) // label IF_FALSE0

// (-7830) push argument 0
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

// (-7832) push constant 16
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7835) call Math.divide 2
(Screen.Math.divide.293) // call Math.divide 2
@Screen.Math.divide.293 // call Math.divide // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-7837) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7839) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7841) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7843) push constant 0 // local(3) init
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

// (-7845) pop local 3
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

// (-7847) push argument 0
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

// (-7849) push local 3
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

// (-7851) push constant 16
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7854) call Math.multiply 2
(Screen.Math.multiply.294) // call Math.multiply 2
@Screen.Math.multiply.294 // call Math.multiply // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-7856) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7858) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7860) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7862) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7864) push constant 0 // local(4) init
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

// (-7866) sub
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

// (-7868) pop local 7
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

// (-7870) push argument 2
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

// (-7872) push constant 16
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7875) call Math.divide 2
(Screen.Math.divide.295) // call Math.divide 2
@Screen.Math.divide.295 // call Math.divide // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-7877) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7879) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7881) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7883) push constant 0 // local(3) init
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

// (-7885) pop local 4
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

// (-7887) push argument 2
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

// (-7889) push local 4
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

// (-7891) push constant 16
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7894) call Math.multiply 2
(Screen.Math.multiply.296) // call Math.multiply 2
@Screen.Math.multiply.296 // call Math.multiply // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-7896) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7898) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7900) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7902) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7904) push constant 0 // local(4) init
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

// (-7906) sub
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

// (-7908) pop local 8
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

// (-7910) push local 7
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

// (-7912) push static 0
@26 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Screen.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7914) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-7916) pop pointer 1
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

// (-7918) push that 0
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

// (-7920) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7922) sub
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

// (-7924) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-7926) pop local 6
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

// (-7928) push local 8
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

// (-7930) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7932) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-7934) push static 0
@26 // push static 0 // static + src segment offset (D:\dev\nand2tetris\projects\09\Fraction\Screen.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7936) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-7938) pop pointer 1
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

// (-7940) push that 0
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

// (-7942) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7944) sub
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

// (-7946) pop local 5
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

// (-7948) push argument 1
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

// (-7950) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7953) call Math.multiply 2
(Screen.Math.multiply.297) // call Math.multiply 2
@Screen.Math.multiply.297 // call Math.multiply // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-7955) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7957) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7959) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7961) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-7963) push constant 0 // local(4) init
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

// (-7965) push local 3
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

// (-7967) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-7969) pop local 0
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

// (-7971) push local 4
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

// (-7973) push local 3
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

// (-7975) sub
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

// (-7977) pop local 2
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

// (-7979) label WHILE_EXP0
(Screen.WHILE_EXP0) // label WHILE_EXP0

// (-7982) push argument 1
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

// (-7984) push argument 3
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

// (-7986) gt
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

// (-7991) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-7993) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-7995) if-goto WHILE_END0
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

// (-7997) push local 0
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

// (-7999) push local 2
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

// (-8001) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-8003) pop local 1
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

// (-8005) push local 2
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

// (-8007) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8009) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_299
D;JEQ
(EQ_FALSE_299)
@0
D=A // d = false
@EQ_END_299
0;JMP
(EQ_TRUE_299)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_299)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-8014) if-goto IF_TRUE1
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

// (-8016) goto IF_FALSE1
@Screen.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-8018) label IF_TRUE1
(Screen.IF_TRUE1) // label IF_TRUE1

// (-8021) push local 0
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

// (-8023) push local 5
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

// (-8025) push local 6
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

// (-8027) and
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

// (-8030) call Screen.updateLocation 2
(Screen.Screen.updateLocation.300) // call Screen.updateLocation 2
@Screen.Screen.updateLocation.300 // call Screen.updateLocation // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-8032) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-8034) goto IF_END1
@Screen.IF_END1 // goto IF_END1
0;JMP // unconditional jump

// (-8036) label IF_FALSE1
(Screen.IF_FALSE1) // label IF_FALSE1

// (-8039) push local 0
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

// (-8041) push local 6
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

// (-8044) call Screen.updateLocation 2
(Screen.Screen.updateLocation.301) // call Screen.updateLocation 2
@Screen.Screen.updateLocation.301 // call Screen.updateLocation // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-8046) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-8048) push local 0
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

// (-8050) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8052) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-8054) pop local 0
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

// (-8056) label WHILE_EXP1
(Screen.WHILE_EXP1) // label WHILE_EXP1

// (-8059) push local 0
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

// (-8061) push local 1
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

// (-8063) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_302
D;JLT
(JLT_FALSE_302)
@0
D=A // d = false
@JLT_END_302
0;JMP
(JLT_TRUE_302)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_302)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-8068) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-8070) if-goto WHILE_END1
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

// (-8072) push local 0
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

// (-8074) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8076) neg
@SP // neg
M=M-1
A=M
M=-M
@SP
M=M+1

// (-8079) call Screen.updateLocation 2
(Screen.Screen.updateLocation.303) // call Screen.updateLocation 2
@Screen.Screen.updateLocation.303 // call Screen.updateLocation // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-8081) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-8083) push local 0
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

// (-8085) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8087) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-8089) pop local 0
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

// (-8091) goto WHILE_EXP1
@Screen.WHILE_EXP1 // goto WHILE_EXP1
0;JMP // unconditional jump

// (-8093) label WHILE_END1
(Screen.WHILE_END1) // label WHILE_END1

// (-8096) push local 1
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

// (-8098) push local 5
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

// (-8101) call Screen.updateLocation 2
(Screen.Screen.updateLocation.304) // call Screen.updateLocation 2
@Screen.Screen.updateLocation.304 // call Screen.updateLocation // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-8103) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-8105) label IF_END1
(Screen.IF_END1) // label IF_END1

// (-8108) push argument 1
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

// (-8110) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8112) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-8114) pop argument 1
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

// (-8116) push local 1
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

// (-8118) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8120) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-8122) push local 2
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

// (-8124) sub
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

// (-8126) pop local 0
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

// (-8128) goto WHILE_EXP0
@Screen.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-8130) label WHILE_END0
(Screen.WHILE_END0) // label WHILE_END0

// (-8133) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-8135) return

// (-8137) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-8139) function Screen.drawHorizontal 11
(Screen.drawHorizontal) // function Screen.drawHorizontal 11

// (-8142) push argument 1
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
// (-8144) push argument 2
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

// (-8147) call Math.min 2
(Screen.Math.min.305) // call Math.min 2
@Screen.Math.min.305 // call Math.min // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-8149) pop local 7
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

// (-8151) push argument 1
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

// (-8153) push argument 2
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

// (-8156) call Math.max 2
(Screen.Math.max.306) // call Math.max 2
@Screen.Math.max.306 // call Math.max // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
D=M
@SP
A=M
M=D
@SP
M=M+1