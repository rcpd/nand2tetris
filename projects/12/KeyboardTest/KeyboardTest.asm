
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

// (-56) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-58) push constant 0 // local(4) init
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
@Main.main // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-60) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-63) call Sys.halt 0
(sys.Sys.halt.7) // call Sys.halt 0

// (-65) push constant 9999 // call Sys.halt // if no args, create a space on the stack for the return
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

// (-67) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-69) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-71) return

// (-73) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-75) function Sys.halt 0
(Sys.halt) // function Sys.halt 0

// (-78) label WHILE_EXP0
(sys.WHILE_EXP0) // label WHILE_EXP0

// (-81) push constant 0
@0 // push constant 0 // function Sys.halt 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-83) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-85) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-87) if-goto WHILE_END0
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

// (-89) goto WHILE_EXP0
@sys.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-91) label WHILE_END0
(sys.WHILE_END0) // label WHILE_END0

// (-94) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-96) return

// (-98) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-100) function Sys.wait 1
(Sys.wait) // function Sys.wait 1

// (-103) push argument 0
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
// (-105) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-107) lt
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

// (-112) if-goto IF_TRUE0
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

// (-114) goto IF_FALSE0
@sys.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-116) label IF_TRUE0
(sys.IF_TRUE0) // label IF_TRUE0

// (-119) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-122) call Sys.error 1
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

// (-124) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-126) label IF_FALSE0
(sys.IF_FALSE0) // label IF_FALSE0

// (-129) label WHILE_EXP0
(sys.WHILE_EXP0) // label WHILE_EXP0

// (-132) push argument 0
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

// (-134) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-136) gt
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

// (-141) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-143) if-goto WHILE_END0
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

// (-145) push constant 50
@50 // push constant 50
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-147) pop local 0
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

// (-149) label WHILE_EXP1
(sys.WHILE_EXP1) // label WHILE_EXP1

// (-152) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-154) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-156) gt
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

// (-161) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-163) if-goto WHILE_END1
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

// (-165) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-167) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-169) sub
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

// (-171) pop local 0
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

// (-173) goto WHILE_EXP1
@sys.WHILE_EXP1 // goto WHILE_EXP1
0;JMP // unconditional jump

// (-175) label WHILE_END1
(sys.WHILE_END1) // label WHILE_END1

// (-178) push argument 0
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

// (-180) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-182) sub
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

// (-184) pop argument 0
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

// (-186) goto WHILE_EXP0
@sys.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-188) label WHILE_END0
(sys.WHILE_END0) // label WHILE_END0

// (-191) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-193) return

// (-195) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-197) function Sys.error 0
(Sys.error) // function Sys.error 0

// (-200) push constant 69
@69 // push constant 69 // function Sys.error 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-203) call Output.printChar 1
(sys.Output.printChar.12) // call Output.printChar 1
@sys.Output.printChar.12 // call Output.printChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-205) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-207) push constant 82
@82 // push constant 82
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-210) call Output.printChar 1
(sys.Output.printChar.13) // call Output.printChar 1
@sys.Output.printChar.13 // call Output.printChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-212) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-214) push constant 82
@82 // push constant 82
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-217) call Output.printChar 1
(sys.Output.printChar.14) // call Output.printChar 1
@sys.Output.printChar.14 // call Output.printChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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
(sys.Output.printInt.15) // call Output.printInt 1
@sys.Output.printInt.15 // call Output.printInt // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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
(sys.Sys.halt.16) // call Sys.halt 0

// (-231) push constant 9999 // call Sys.halt // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Sys.halt // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@sys.Sys.halt.16 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-241) function Main.main 5
(Main.main) // function Main.main 5

// (-244) push constant 0
@0 // push constant 0 // function Main.main 5
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-246) pop local 4
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

// (-248) push constant 16
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-251) call String.new 1
(main.String.new.17) // call String.new 1
@main.String.new.17 // call String.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-253) push constant 107
@107 // push constant 107
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-256) call String.appendChar 2
(main.String.appendChar.18) // call String.appendChar 2
@main.String.appendChar.18 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-258) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-261) call String.appendChar 2
(main.String.appendChar.19) // call String.appendChar 2
@main.String.appendChar.19 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-263) push constant 121
@121 // push constant 121
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-266) call String.appendChar 2
(main.String.appendChar.20) // call String.appendChar 2
@main.String.appendChar.20 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-268) push constant 80
@80 // push constant 80
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-271) call String.appendChar 2
(main.String.appendChar.21) // call String.appendChar 2
@main.String.appendChar.21 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-273) push constant 114
@114 // push constant 114
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-276) call String.appendChar 2
(main.String.appendChar.22) // call String.appendChar 2
@main.String.appendChar.22 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-278) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-281) call String.appendChar 2
(main.String.appendChar.23) // call String.appendChar 2
@main.String.appendChar.23 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-283) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-286) call String.appendChar 2
(main.String.appendChar.24) // call String.appendChar 2
@main.String.appendChar.24 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-288) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-291) call String.appendChar 2
(main.String.appendChar.25) // call String.appendChar 2
@main.String.appendChar.25 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-293) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-296) call String.appendChar 2
(main.String.appendChar.26) // call String.appendChar 2
@main.String.appendChar.26 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-298) push constant 100
@100 // push constant 100
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-301) call String.appendChar 2
(main.String.appendChar.27) // call String.appendChar 2
@main.String.appendChar.27 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-303) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-306) call String.appendChar 2
(main.String.appendChar.28) // call String.appendChar 2
@main.String.appendChar.28 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-308) push constant 116
@116 // push constant 116
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-311) call String.appendChar 2
(main.String.appendChar.29) // call String.appendChar 2
@main.String.appendChar.29 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-313) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-316) call String.appendChar 2
(main.String.appendChar.30) // call String.appendChar 2
@main.String.appendChar.30 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-318) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-321) call String.appendChar 2
(main.String.appendChar.31) // call String.appendChar 2
@main.String.appendChar.31 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-323) push constant 116
@116 // push constant 116
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-326) call String.appendChar 2
(main.String.appendChar.32) // call String.appendChar 2
@main.String.appendChar.32 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-328) push constant 58
@58 // push constant 58
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-331) call String.appendChar 2
(main.String.appendChar.33) // call String.appendChar 2
@main.String.appendChar.33 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-334) call Output.printString 1
(main.Output.printString.34) // call Output.printString 1
@main.Output.printString.34 // call Output.printString // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-336) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-338) push constant 0 // local(1) init
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

// (-340) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-343) call Output.println 0
(main.Output.println.35) // call Output.println 0

// (-345) push constant 9999 // call Output.println // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Output.println // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@main.Output.println.35 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-347) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-349) label WHILE_EXP0
(main.WHILE_EXP0) // label WHILE_EXP0

// (-352) push local 4
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

// (-354) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-356) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-358) if-goto WHILE_END0
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
@main.WHILE_END0
D;JNE // jump if not zero

// (-360) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-363) call String.new 1
(main.String.new.36) // call String.new 1
@main.String.new.36 // call String.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-365) push constant 80
@80 // push constant 80
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-368) call String.appendChar 2
(main.String.appendChar.37) // call String.appendChar 2
@main.String.appendChar.37 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-370) push constant 108
@108 // push constant 108
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-373) call String.appendChar 2
(main.String.appendChar.38) // call String.appendChar 2
@main.String.appendChar.38 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-375) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-378) call String.appendChar 2
(main.String.appendChar.39) // call String.appendChar 2
@main.String.appendChar.39 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-380) push constant 97
@97 // push constant 97
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-383) call String.appendChar 2
(main.String.appendChar.40) // call String.appendChar 2
@main.String.appendChar.40 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-385) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-388) call String.appendChar 2
(main.String.appendChar.41) // call String.appendChar 2
@main.String.appendChar.41 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-390) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-393) call String.appendChar 2
(main.String.appendChar.42) // call String.appendChar 2
@main.String.appendChar.42 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-395) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-398) call String.appendChar 2
(main.String.appendChar.43) // call String.appendChar 2
@main.String.appendChar.43 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-400) push constant 112
@112 // push constant 112
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-403) call String.appendChar 2
(main.String.appendChar.44) // call String.appendChar 2
@main.String.appendChar.44 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-405) push constant 114
@114 // push constant 114
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-408) call String.appendChar 2
(main.String.appendChar.45) // call String.appendChar 2
@main.String.appendChar.45 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-410) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-413) call String.appendChar 2
(main.String.appendChar.46) // call String.appendChar 2
@main.String.appendChar.46 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-415) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-418) call String.appendChar 2
(main.String.appendChar.47) // call String.appendChar 2
@main.String.appendChar.47 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-420) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-423) call String.appendChar 2
(main.String.appendChar.48) // call String.appendChar 2
@main.String.appendChar.48 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-425) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-428) call String.appendChar 2
(main.String.appendChar.49) // call String.appendChar 2
@main.String.appendChar.49 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-430) push constant 116
@116 // push constant 116
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-433) call String.appendChar 2
(main.String.appendChar.50) // call String.appendChar 2
@main.String.appendChar.50 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-435) push constant 104
@104 // push constant 104
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-438) call String.appendChar 2
(main.String.appendChar.51) // call String.appendChar 2
@main.String.appendChar.51 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-440) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-443) call String.appendChar 2
(main.String.appendChar.52) // call String.appendChar 2
@main.String.appendChar.52 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-445) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-448) call String.appendChar 2
(main.String.appendChar.53) // call String.appendChar 2
@main.String.appendChar.53 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-450) push constant 39
@39 // push constant 39
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-453) call String.appendChar 2
(main.String.appendChar.54) // call String.appendChar 2
@main.String.appendChar.54 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-455) push constant 80
@80 // push constant 80
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-458) call String.appendChar 2
(main.String.appendChar.55) // call String.appendChar 2
@main.String.appendChar.55 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-460) push constant 97
@97 // push constant 97
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-463) call String.appendChar 2
(main.String.appendChar.56) // call String.appendChar 2
@main.String.appendChar.56 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-465) push constant 103
@103 // push constant 103
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-468) call String.appendChar 2
(main.String.appendChar.57) // call String.appendChar 2
@main.String.appendChar.57 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-470) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-473) call String.appendChar 2
(main.String.appendChar.58) // call String.appendChar 2
@main.String.appendChar.58 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-475) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-478) call String.appendChar 2
(main.String.appendChar.59) // call String.appendChar 2
@main.String.appendChar.59 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-480) push constant 68
@68 // push constant 68
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-483) call String.appendChar 2
(main.String.appendChar.60) // call String.appendChar 2
@main.String.appendChar.60 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-485) push constant 111
@111 // push constant 111
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-488) call String.appendChar 2
(main.String.appendChar.61) // call String.appendChar 2
@main.String.appendChar.61 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-490) push constant 119
@119 // push constant 119
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-493) call String.appendChar 2
(main.String.appendChar.62) // call String.appendChar 2
@main.String.appendChar.62 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-495) push constant 110
@110 // push constant 110
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-498) call String.appendChar 2
(main.String.appendChar.63) // call String.appendChar 2
@main.String.appendChar.63 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-500) push constant 39
@39 // push constant 39
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-503) call String.appendChar 2
(main.String.appendChar.64) // call String.appendChar 2
@main.String.appendChar.64 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-505) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-508) call String.appendChar 2
(main.String.appendChar.65) // call String.appendChar 2
@main.String.appendChar.65 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-510) push constant 107
@107 // push constant 107
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-513) call String.appendChar 2
(main.String.appendChar.66) // call String.appendChar 2
@main.String.appendChar.66 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-515) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-518) call String.appendChar 2
(main.String.appendChar.67) // call String.appendChar 2
@main.String.appendChar.67 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-520) push constant 121
@121 // push constant 121
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-523) call String.appendChar 2
(main.String.appendChar.68) // call String.appendChar 2
@main.String.appendChar.68 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-526) call Output.printString 1
(main.Output.printString.69) // call Output.printString 1
@main.Output.printString.69 // call Output.printString // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-528) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-530) push constant 0 // local(1) init
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

// (-532) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-534) label WHILE_EXP1
(main.WHILE_EXP1) // label WHILE_EXP1

// (-537) push local 1
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

// (-539) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-541) eq
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

// (-546) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-548) if-goto WHILE_END1
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
@main.WHILE_END1
D;JNE // jump if not zero

// (-551) call Keyboard.keyPressed 0
(main.Keyboard.keyPressed.71) // call Keyboard.keyPressed 0

// (-553) push constant 9999 // call Keyboard.keyPressed // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Keyboard.keyPressed // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@main.Keyboard.keyPressed.71 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-555) pop local 1
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

// (-557) goto WHILE_EXP1
@main.WHILE_EXP1 // goto WHILE_EXP1
0;JMP // unconditional jump

// (-559) label WHILE_END1
(main.WHILE_END1) // label WHILE_END1

// (-562) push local 1
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

// (-564) pop local 0
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

// (-566) label WHILE_EXP2
(main.WHILE_EXP2) // label WHILE_EXP2

// (-569) push local 1
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

// (-571) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-573) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_72
D;JEQ
(EQ_FALSE_72)
@0
D=A // d = false
@EQ_END_72
0;JMP
(EQ_TRUE_72)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_72)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-578) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-580) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-582) if-goto WHILE_END2
@0 // if-goto WHILE_END2
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
@main.WHILE_END2
D;JNE // jump if not zero

// (-585) call Keyboard.keyPressed 0
(main.Keyboard.keyPressed.73) // call Keyboard.keyPressed 0

// (-587) push constant 9999 // call Keyboard.keyPressed // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Keyboard.keyPressed // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@main.Keyboard.keyPressed.73 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-589) pop local 1
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

// (-591) goto WHILE_EXP2
@main.WHILE_EXP2 // goto WHILE_EXP2
0;JMP // unconditional jump

// (-593) label WHILE_END2
(main.WHILE_END2) // label WHILE_END2

// (-597) call Output.println 0
(main.Output.println.74) // call Output.println 0

// (-599) push constant 9999 // call Output.println // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Output.println // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@main.Output.println.74 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-601) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-603) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-605) push constant 137
@137 // push constant 137
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-607) eq
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

// (-612) if-goto IF_TRUE0
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
@main.IF_TRUE0
D;JNE // jump if not zero

// (-614) goto IF_FALSE0
@main.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-616) label IF_TRUE0
(main.IF_TRUE0) // label IF_TRUE0

// (-619) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-622) call String.new 1
(main.String.new.76) // call String.new 1
@main.String.new.76 // call String.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-624) push constant 111
@111 // push constant 111
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-627) call String.appendChar 2
(main.String.appendChar.77) // call String.appendChar 2
@main.String.appendChar.77 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-629) push constant 107
@107 // push constant 107
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-632) call String.appendChar 2
(main.String.appendChar.78) // call String.appendChar 2
@main.String.appendChar.78 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-635) call Output.printString 1
(main.Output.printString.79) // call Output.printString 1
@main.Output.printString.79 // call Output.printString // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-637) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-639) push constant 0 // local(1) init
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

// (-641) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-644) call Output.println 0
(main.Output.println.80) // call Output.println 0

// (-646) push constant 9999 // call Output.println // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Output.println // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@main.Output.println.80 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-648) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-650) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-652) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-654) pop local 4
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

// (-656) label IF_FALSE0
(main.IF_FALSE0) // label IF_FALSE0

// (-659) goto WHILE_EXP0
@main.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-661) label WHILE_END0
(main.WHILE_END0) // label WHILE_END0

// (-664) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-666) pop local 4
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

// (-668) push constant 14
@14 // push constant 14
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-671) call String.new 1
(main.String.new.81) // call String.new 1
@main.String.new.81 // call String.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-673) push constant 114
@114 // push constant 114
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-676) call String.appendChar 2
(main.String.appendChar.82) // call String.appendChar 2
@main.String.appendChar.82 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-678) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-681) call String.appendChar 2
(main.String.appendChar.83) // call String.appendChar 2
@main.String.appendChar.83 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-683) push constant 97
@97 // push constant 97
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-686) call String.appendChar 2
(main.String.appendChar.84) // call String.appendChar 2
@main.String.appendChar.84 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-688) push constant 100
@100 // push constant 100
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-691) call String.appendChar 2
(main.String.appendChar.85) // call String.appendChar 2
@main.String.appendChar.85 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-693) push constant 67
@67 // push constant 67
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-696) call String.appendChar 2
(main.String.appendChar.86) // call String.appendChar 2
@main.String.appendChar.86 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-698) push constant 104
@104 // push constant 104
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-701) call String.appendChar 2
(main.String.appendChar.87) // call String.appendChar 2
@main.String.appendChar.87 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-703) push constant 97
@97 // push constant 97
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-706) call String.appendChar 2
(main.String.appendChar.88) // call String.appendChar 2
@main.String.appendChar.88 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-708) push constant 114
@114 // push constant 114
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-711) call String.appendChar 2
(main.String.appendChar.89) // call String.appendChar 2
@main.String.appendChar.89 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-713) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-716) call String.appendChar 2
(main.String.appendChar.90) // call String.appendChar 2
@main.String.appendChar.90 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-718) push constant 116
@116 // push constant 116
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-721) call String.appendChar 2
(main.String.appendChar.91) // call String.appendChar 2
@main.String.appendChar.91 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-723) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-726) call String.appendChar 2
(main.String.appendChar.92) // call String.appendChar 2
@main.String.appendChar.92 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-728) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-731) call String.appendChar 2
(main.String.appendChar.93) // call String.appendChar 2
@main.String.appendChar.93 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-733) push constant 116
@116 // push constant 116
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-736) call String.appendChar 2
(main.String.appendChar.94) // call String.appendChar 2
@main.String.appendChar.94 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-738) push constant 58
@58 // push constant 58
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-741) call String.appendChar 2
(main.String.appendChar.95) // call String.appendChar 2
@main.String.appendChar.95 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-744) call Output.printString 1
(main.Output.printString.96) // call Output.printString 1
@main.Output.printString.96 // call Output.printString // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-746) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-748) push constant 0 // local(1) init
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

// (-750) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-753) call Output.println 0
(main.Output.println.97) // call Output.println 0

// (-755) push constant 9999 // call Output.println // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Output.println // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@main.Output.println.97 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-759) push constant 59
@59 // push constant 59
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-762) call String.new 1
(main.String.new.98) // call String.new 1
@main.String.new.98 // call String.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-764) push constant 40
@40 // push constant 40
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-767) call String.appendChar 2
(main.String.appendChar.99) // call String.appendChar 2
@main.String.appendChar.99 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-769) push constant 86
@86 // push constant 86
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-772) call String.appendChar 2
(main.String.appendChar.100) // call String.appendChar 2
@main.String.appendChar.100 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-774) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-777) call String.appendChar 2
(main.String.appendChar.101) // call String.appendChar 2
@main.String.appendChar.101 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-779) push constant 114
@114 // push constant 114
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-782) call String.appendChar 2
(main.String.appendChar.102) // call String.appendChar 2
@main.String.appendChar.102 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-784) push constant 105
@105 // push constant 105
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-787) call String.appendChar 2
(main.String.appendChar.103) // call String.appendChar 2
@main.String.appendChar.103 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-789) push constant 102
@102 // push constant 102
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-792) call String.appendChar 2
(main.String.appendChar.104) // call String.appendChar 2
@main.String.appendChar.104 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-794) push constant 121
@121 // push constant 121
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-797) call String.appendChar 2
(main.String.appendChar.105) // call String.appendChar 2
@main.String.appendChar.105 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-799) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-802) call String.appendChar 2
(main.String.appendChar.106) // call String.appendChar 2
@main.String.appendChar.106 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-804) push constant 116
@116 // push constant 116
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-807) call String.appendChar 2
(main.String.appendChar.107) // call String.appendChar 2
@main.String.appendChar.107 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-809) push constant 104
@104 // push constant 104
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-812) call String.appendChar 2
(main.String.appendChar.108) // call String.appendChar 2
@main.String.appendChar.108 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-814) push constant 97
@97 // push constant 97
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-817) call String.appendChar 2
(main.String.appendChar.109) // call String.appendChar 2
@main.String.appendChar.109 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-819) push constant 116
@116 // push constant 116
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-822) call String.appendChar 2
(main.String.appendChar.110) // call String.appendChar 2
@main.String.appendChar.110 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-824) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-827) call String.appendChar 2
(main.String.appendChar.111) // call String.appendChar 2
@main.String.appendChar.111 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-829) push constant 116
@116 // push constant 116
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-832) call String.appendChar 2
(main.String.appendChar.112) // call String.appendChar 2
@main.String.appendChar.112 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-834) push constant 104
@104 // push constant 104
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-837) call String.appendChar 2
(main.String.appendChar.113) // call String.appendChar 2
@main.String.appendChar.113 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-839) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-842) call String.appendChar 2
(main.String.appendChar.114) // call String.appendChar 2
@main.String.appendChar.114 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-844) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-847) call String.appendChar 2
(main.String.appendChar.115) // call String.appendChar 2
@main.String.appendChar.115 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-849) push constant 112
@112 // push constant 112
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-852) call String.appendChar 2
(main.String.appendChar.116) // call String.appendChar 2
@main.String.appendChar.116 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-854) push constant 114
@114 // push constant 114
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-857) call String.appendChar 2
(main.String.appendChar.117) // call String.appendChar 2
@main.String.appendChar.117 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-859) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-862) call String.appendChar 2
(main.String.appendChar.118) // call String.appendChar 2
@main.String.appendChar.118 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-864) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-867) call String.appendChar 2
(main.String.appendChar.119) // call String.appendChar 2
@main.String.appendChar.119 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-869) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-872) call String.appendChar 2
(main.String.appendChar.120) // call String.appendChar 2
@main.String.appendChar.120 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-874) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-877) call String.appendChar 2
(main.String.appendChar.121) // call String.appendChar 2
@main.String.appendChar.121 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-879) push constant 100
@100 // push constant 100
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-882) call String.appendChar 2
(main.String.appendChar.122) // call String.appendChar 2
@main.String.appendChar.122 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-884) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-887) call String.appendChar 2
(main.String.appendChar.123) // call String.appendChar 2
@main.String.appendChar.123 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-889) push constant 99
@99 // push constant 99
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-892) call String.appendChar 2
(main.String.appendChar.124) // call String.appendChar 2
@main.String.appendChar.124 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-894) push constant 104
@104 // push constant 104
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-897) call String.appendChar 2
(main.String.appendChar.125) // call String.appendChar 2
@main.String.appendChar.125 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-899) push constant 97
@97 // push constant 97
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-902) call String.appendChar 2
(main.String.appendChar.126) // call String.appendChar 2
@main.String.appendChar.126 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-904) push constant 114
@114 // push constant 114
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-907) call String.appendChar 2
(main.String.appendChar.127) // call String.appendChar 2
@main.String.appendChar.127 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-909) push constant 97
@97 // push constant 97
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-912) call String.appendChar 2
(main.String.appendChar.128) // call String.appendChar 2
@main.String.appendChar.128 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-914) push constant 99
@99 // push constant 99
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-917) call String.appendChar 2
(main.String.appendChar.129) // call String.appendChar 2
@main.String.appendChar.129 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-919) push constant 116
@116 // push constant 116
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-922) call String.appendChar 2
(main.String.appendChar.130) // call String.appendChar 2
@main.String.appendChar.130 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-924) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-927) call String.appendChar 2
(main.String.appendChar.131) // call String.appendChar 2
@main.String.appendChar.131 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-929) push constant 114
@114 // push constant 114
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-932) call String.appendChar 2
(main.String.appendChar.132) // call String.appendChar 2
@main.String.appendChar.132 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-934) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-937) call String.appendChar 2
(main.String.appendChar.133) // call String.appendChar 2
@main.String.appendChar.133 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-939) push constant 105
@105 // push constant 105
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-942) call String.appendChar 2
(main.String.appendChar.134) // call String.appendChar 2
@main.String.appendChar.134 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-944) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-947) call String.appendChar 2
(main.String.appendChar.135) // call String.appendChar 2
@main.String.appendChar.135 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-949) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-952) call String.appendChar 2
(main.String.appendChar.136) // call String.appendChar 2
@main.String.appendChar.136 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-954) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-957) call String.appendChar 2
(main.String.appendChar.137) // call String.appendChar 2
@main.String.appendChar.137 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-959) push constant 99
@99 // push constant 99
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-962) call String.appendChar 2
(main.String.appendChar.138) // call String.appendChar 2
@main.String.appendChar.138 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-964) push constant 104
@104 // push constant 104
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-967) call String.appendChar 2
(main.String.appendChar.139) // call String.appendChar 2
@main.String.appendChar.139 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-969) push constant 111
@111 // push constant 111
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-972) call String.appendChar 2
(main.String.appendChar.140) // call String.appendChar 2
@main.String.appendChar.140 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-974) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-977) call String.appendChar 2
(main.String.appendChar.141) // call String.appendChar 2
@main.String.appendChar.141 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-979) push constant 100
@100 // push constant 100
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-982) call String.appendChar 2
(main.String.appendChar.142) // call String.appendChar 2
@main.String.appendChar.142 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-984) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-987) call String.appendChar 2
(main.String.appendChar.143) // call String.appendChar 2
@main.String.appendChar.143 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-989) push constant 116
@116 // push constant 116
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-992) call String.appendChar 2
(main.String.appendChar.144) // call String.appendChar 2
@main.String.appendChar.144 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-994) push constant 111
@111 // push constant 111
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-997) call String.appendChar 2
(main.String.appendChar.145) // call String.appendChar 2
@main.String.appendChar.145 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-999) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1002) call String.appendChar 2
(main.String.appendChar.146) // call String.appendChar 2
@main.String.appendChar.146 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1004) push constant 116
@116 // push constant 116
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1007) call String.appendChar 2
(main.String.appendChar.147) // call String.appendChar 2
@main.String.appendChar.147 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1009) push constant 104
@104 // push constant 104
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1012) call String.appendChar 2
(main.String.appendChar.148) // call String.appendChar 2
@main.String.appendChar.148 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1014) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1017) call String.appendChar 2
(main.String.appendChar.149) // call String.appendChar 2
@main.String.appendChar.149 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1019) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1022) call String.appendChar 2
(main.String.appendChar.150) // call String.appendChar 2
@main.String.appendChar.150 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1024) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1027) call String.appendChar 2
(main.String.appendChar.151) // call String.appendChar 2
@main.String.appendChar.151 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1029) push constant 99
@99 // push constant 99
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1032) call String.appendChar 2
(main.String.appendChar.152) // call String.appendChar 2
@main.String.appendChar.152 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1034) push constant 114
@114 // push constant 114
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1037) call String.appendChar 2
(main.String.appendChar.153) // call String.appendChar 2
@main.String.appendChar.153 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1039) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1042) call String.appendChar 2
(main.String.appendChar.154) // call String.appendChar 2
@main.String.appendChar.154 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1044) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1047) call String.appendChar 2
(main.String.appendChar.155) // call String.appendChar 2
@main.String.appendChar.155 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1049) push constant 110
@110 // push constant 110
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1052) call String.appendChar 2
(main.String.appendChar.156) // call String.appendChar 2
@main.String.appendChar.156 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1054) push constant 41
@41 // push constant 41
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1057) call String.appendChar 2
(main.String.appendChar.157) // call String.appendChar 2
@main.String.appendChar.157 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1060) call Output.printString 1
(main.Output.printString.158) // call Output.printString 1
@main.Output.printString.158 // call Output.printString // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-1062) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1064) push constant 0 // local(1) init
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

// (-1066) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-1069) call Output.println 0
(main.Output.println.159) // call Output.println 0

// (-1071) push constant 9999 // call Output.println // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Output.println // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@main.Output.println.159 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1073) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-1075) label WHILE_EXP3
(main.WHILE_EXP3) // label WHILE_EXP3

// (-1078) push local 4
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

// (-1080) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1082) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1084) if-goto WHILE_END3
@0 // if-goto WHILE_END3
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
@main.WHILE_END3
D;JNE // jump if not zero

// (-1086) push constant 29
@29 // push constant 29
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1089) call String.new 1
(main.String.new.160) // call String.new 1
@main.String.new.160 // call String.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1091) push constant 80
@80 // push constant 80
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1094) call String.appendChar 2
(main.String.appendChar.161) // call String.appendChar 2
@main.String.appendChar.161 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1096) push constant 108
@108 // push constant 108
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1099) call String.appendChar 2
(main.String.appendChar.162) // call String.appendChar 2
@main.String.appendChar.162 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1101) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1104) call String.appendChar 2
(main.String.appendChar.163) // call String.appendChar 2
@main.String.appendChar.163 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1106) push constant 97
@97 // push constant 97
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1109) call String.appendChar 2
(main.String.appendChar.164) // call String.appendChar 2
@main.String.appendChar.164 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1111) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1114) call String.appendChar 2
(main.String.appendChar.165) // call String.appendChar 2
@main.String.appendChar.165 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1116) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1119) call String.appendChar 2
(main.String.appendChar.166) // call String.appendChar 2
@main.String.appendChar.166 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1121) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1124) call String.appendChar 2
(main.String.appendChar.167) // call String.appendChar 2
@main.String.appendChar.167 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1126) push constant 112
@112 // push constant 112
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1129) call String.appendChar 2
(main.String.appendChar.168) // call String.appendChar 2
@main.String.appendChar.168 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1131) push constant 114
@114 // push constant 114
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1134) call String.appendChar 2
(main.String.appendChar.169) // call String.appendChar 2
@main.String.appendChar.169 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1136) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1139) call String.appendChar 2
(main.String.appendChar.170) // call String.appendChar 2
@main.String.appendChar.170 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1141) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1144) call String.appendChar 2
(main.String.appendChar.171) // call String.appendChar 2
@main.String.appendChar.171 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1146) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1149) call String.appendChar 2
(main.String.appendChar.172) // call String.appendChar 2
@main.String.appendChar.172 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1151) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1154) call String.appendChar 2
(main.String.appendChar.173) // call String.appendChar 2
@main.String.appendChar.173 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1156) push constant 116
@116 // push constant 116
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1159) call String.appendChar 2
(main.String.appendChar.174) // call String.appendChar 2
@main.String.appendChar.174 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1161) push constant 104
@104 // push constant 104
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1164) call String.appendChar 2
(main.String.appendChar.175) // call String.appendChar 2
@main.String.appendChar.175 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1166) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1169) call String.appendChar 2
(main.String.appendChar.176) // call String.appendChar 2
@main.String.appendChar.176 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1171) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1174) call String.appendChar 2
(main.String.appendChar.177) // call String.appendChar 2
@main.String.appendChar.177 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1176) push constant 110
@110 // push constant 110
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1179) call String.appendChar 2
(main.String.appendChar.178) // call String.appendChar 2
@main.String.appendChar.178 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1181) push constant 117
@117 // push constant 117
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1184) call String.appendChar 2
(main.String.appendChar.179) // call String.appendChar 2
@main.String.appendChar.179 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1186) push constant 109
@109 // push constant 109
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1189) call String.appendChar 2
(main.String.appendChar.180) // call String.appendChar 2
@main.String.appendChar.180 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1191) push constant 98
@98 // push constant 98
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1194) call String.appendChar 2
(main.String.appendChar.181) // call String.appendChar 2
@main.String.appendChar.181 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1196) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1199) call String.appendChar 2
(main.String.appendChar.182) // call String.appendChar 2
@main.String.appendChar.182 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1201) push constant 114
@114 // push constant 114
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1204) call String.appendChar 2
(main.String.appendChar.183) // call String.appendChar 2
@main.String.appendChar.183 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1206) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1209) call String.appendChar 2
(main.String.appendChar.184) // call String.appendChar 2
@main.String.appendChar.184 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1211) push constant 39
@39 // push constant 39
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1214) call String.appendChar 2
(main.String.appendChar.185) // call String.appendChar 2
@main.String.appendChar.185 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1216) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1219) call String.appendChar 2
(main.String.appendChar.186) // call String.appendChar 2
@main.String.appendChar.186 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1221) push constant 39
@39 // push constant 39
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1224) call String.appendChar 2
(main.String.appendChar.187) // call String.appendChar 2
@main.String.appendChar.187 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1226) push constant 58
@58 // push constant 58
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1229) call String.appendChar 2
(main.String.appendChar.188) // call String.appendChar 2
@main.String.appendChar.188 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1231) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1234) call String.appendChar 2
(main.String.appendChar.189) // call String.appendChar 2
@main.String.appendChar.189 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1237) call Output.printString 1
(main.Output.printString.190) // call Output.printString 1
@main.Output.printString.190 // call Output.printString // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-1239) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1241) push constant 0 // local(1) init
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

// (-1243) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-1246) call Keyboard.readChar 0
(main.Keyboard.readChar.191) // call Keyboard.readChar 0

// (-1248) push constant 9999 // call Keyboard.readChar // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Keyboard.readChar // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@main.Keyboard.readChar.191 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-1250) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1252) push constant 0 // local(1) init
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

// (-1254) pop local 0
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

// (-1257) call Output.println 0
(main.Output.println.192) // call Output.println 0

// (-1259) push constant 9999 // call Output.println // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Output.println // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@main.Output.println.192 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1261) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-1263) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1265) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1267) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_193
D;JEQ
(EQ_FALSE_193)
@0
D=A // d = false
@EQ_END_193
0;JMP
(EQ_TRUE_193)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_193)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1272) if-goto IF_TRUE1
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
@main.IF_TRUE1
D;JNE // jump if not zero

// (-1274) goto IF_FALSE1
@main.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-1276) label IF_TRUE1
(main.IF_TRUE1) // label IF_TRUE1

// (-1279) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1282) call String.new 1
(main.String.new.194) // call String.new 1
@main.String.new.194 // call String.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1284) push constant 111
@111 // push constant 111
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1287) call String.appendChar 2
(main.String.appendChar.195) // call String.appendChar 2
@main.String.appendChar.195 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1289) push constant 107
@107 // push constant 107
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1292) call String.appendChar 2
(main.String.appendChar.196) // call String.appendChar 2
@main.String.appendChar.196 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1295) call Output.printString 1
(main.Output.printString.197) // call Output.printString 1
@main.Output.printString.197 // call Output.printString // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-1297) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1299) push constant 0 // local(1) init
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

// (-1301) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-1304) call Output.println 0
(main.Output.println.198) // call Output.println 0

// (-1306) push constant 9999 // call Output.println // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Output.println // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@main.Output.println.198 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1308) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-1310) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1312) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1314) pop local 4
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

// (-1316) label IF_FALSE1
(main.IF_FALSE1) // label IF_FALSE1

// (-1319) goto WHILE_EXP3
@main.WHILE_EXP3 // goto WHILE_EXP3
0;JMP // unconditional jump

// (-1321) label WHILE_END3
(main.WHILE_END3) // label WHILE_END3

// (-1324) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1326) pop local 4
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

// (-1328) push constant 14
@14 // push constant 14
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1331) call String.new 1
(main.String.new.199) // call String.new 1
@main.String.new.199 // call String.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1333) push constant 114
@114 // push constant 114
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1336) call String.appendChar 2
(main.String.appendChar.200) // call String.appendChar 2
@main.String.appendChar.200 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1338) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1341) call String.appendChar 2
(main.String.appendChar.201) // call String.appendChar 2
@main.String.appendChar.201 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1343) push constant 97
@97 // push constant 97
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1346) call String.appendChar 2
(main.String.appendChar.202) // call String.appendChar 2
@main.String.appendChar.202 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1348) push constant 100
@100 // push constant 100
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1351) call String.appendChar 2
(main.String.appendChar.203) // call String.appendChar 2
@main.String.appendChar.203 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1353) push constant 76
@76 // push constant 76
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1356) call String.appendChar 2
(main.String.appendChar.204) // call String.appendChar 2
@main.String.appendChar.204 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1358) push constant 105
@105 // push constant 105
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1361) call String.appendChar 2
(main.String.appendChar.205) // call String.appendChar 2
@main.String.appendChar.205 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1363) push constant 110
@110 // push constant 110
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1366) call String.appendChar 2
(main.String.appendChar.206) // call String.appendChar 2
@main.String.appendChar.206 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1368) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1371) call String.appendChar 2
(main.String.appendChar.207) // call String.appendChar 2
@main.String.appendChar.207 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1373) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1376) call String.appendChar 2
(main.String.appendChar.208) // call String.appendChar 2
@main.String.appendChar.208 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1378) push constant 116
@116 // push constant 116
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1381) call String.appendChar 2
(main.String.appendChar.209) // call String.appendChar 2
@main.String.appendChar.209 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1383) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1386) call String.appendChar 2
(main.String.appendChar.210) // call String.appendChar 2
@main.String.appendChar.210 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1388) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1391) call String.appendChar 2
(main.String.appendChar.211) // call String.appendChar 2
@main.String.appendChar.211 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1393) push constant 116
@116 // push constant 116
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1396) call String.appendChar 2
(main.String.appendChar.212) // call String.appendChar 2
@main.String.appendChar.212 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1398) push constant 58
@58 // push constant 58
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1401) call String.appendChar 2
(main.String.appendChar.213) // call String.appendChar 2
@main.String.appendChar.213 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1404) call Output.printString 1
(main.Output.printString.214) // call Output.printString 1
@main.Output.printString.214 // call Output.printString // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-1406) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1408) push constant 0 // local(1) init
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

// (-1410) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-1413) call Output.println 0
(main.Output.println.215) // call Output.println 0

// (-1415) push constant 9999 // call Output.println // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Output.println // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@main.Output.println.215 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1417) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-1419) push constant 38
@38 // push constant 38
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1422) call String.new 1
(main.String.new.216) // call String.new 1
@main.String.new.216 // call String.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1424) push constant 40
@40 // push constant 40
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1427) call String.appendChar 2
(main.String.appendChar.217) // call String.appendChar 2
@main.String.appendChar.217 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1429) push constant 86
@86 // push constant 86
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1432) call String.appendChar 2
(main.String.appendChar.218) // call String.appendChar 2
@main.String.appendChar.218 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1434) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1437) call String.appendChar 2
(main.String.appendChar.219) // call String.appendChar 2
@main.String.appendChar.219 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1439) push constant 114
@114 // push constant 114
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1442) call String.appendChar 2
(main.String.appendChar.220) // call String.appendChar 2
@main.String.appendChar.220 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1444) push constant 105
@105 // push constant 105
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1447) call String.appendChar 2
(main.String.appendChar.221) // call String.appendChar 2
@main.String.appendChar.221 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1449) push constant 102
@102 // push constant 102
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1452) call String.appendChar 2
(main.String.appendChar.222) // call String.appendChar 2
@main.String.appendChar.222 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1454) push constant 121
@121 // push constant 121
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1457) call String.appendChar 2
(main.String.appendChar.223) // call String.appendChar 2
@main.String.appendChar.223 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1459) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1462) call String.appendChar 2
(main.String.appendChar.224) // call String.appendChar 2
@main.String.appendChar.224 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1464) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1467) call String.appendChar 2
(main.String.appendChar.225) // call String.appendChar 2
@main.String.appendChar.225 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1469) push constant 99
@99 // push constant 99
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1472) call String.appendChar 2
(main.String.appendChar.226) // call String.appendChar 2
@main.String.appendChar.226 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1474) push constant 104
@104 // push constant 104
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1477) call String.appendChar 2
(main.String.appendChar.227) // call String.appendChar 2
@main.String.appendChar.227 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1479) push constant 111
@111 // push constant 111
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1482) call String.appendChar 2
(main.String.appendChar.228) // call String.appendChar 2
@main.String.appendChar.228 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1484) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1487) call String.appendChar 2
(main.String.appendChar.229) // call String.appendChar 2
@main.String.appendChar.229 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1489) push constant 97
@97 // push constant 97
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1492) call String.appendChar 2
(main.String.appendChar.230) // call String.appendChar 2
@main.String.appendChar.230 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1494) push constant 110
@110 // push constant 110
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1497) call String.appendChar 2
(main.String.appendChar.231) // call String.appendChar 2
@main.String.appendChar.231 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1499) push constant 100
@100 // push constant 100
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1502) call String.appendChar 2
(main.String.appendChar.232) // call String.appendChar 2
@main.String.appendChar.232 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1504) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1507) call String.appendChar 2
(main.String.appendChar.233) // call String.appendChar 2
@main.String.appendChar.233 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1509) push constant 117
@117 // push constant 117
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1512) call String.appendChar 2
(main.String.appendChar.234) // call String.appendChar 2
@main.String.appendChar.234 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1514) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1517) call String.appendChar 2
(main.String.appendChar.235) // call String.appendChar 2
@main.String.appendChar.235 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1519) push constant 97
@97 // push constant 97
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1522) call String.appendChar 2
(main.String.appendChar.236) // call String.appendChar 2
@main.String.appendChar.236 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1524) push constant 103
@103 // push constant 103
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1527) call String.appendChar 2
(main.String.appendChar.237) // call String.appendChar 2
@main.String.appendChar.237 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1529) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1532) call String.appendChar 2
(main.String.appendChar.238) // call String.appendChar 2
@main.String.appendChar.238 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1534) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1537) call String.appendChar 2
(main.String.appendChar.239) // call String.appendChar 2
@main.String.appendChar.239 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1539) push constant 111
@111 // push constant 111
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1542) call String.appendChar 2
(main.String.appendChar.240) // call String.appendChar 2
@main.String.appendChar.240 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1544) push constant 102
@102 // push constant 102
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1547) call String.appendChar 2
(main.String.appendChar.241) // call String.appendChar 2
@main.String.appendChar.241 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1549) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1552) call String.appendChar 2
(main.String.appendChar.242) // call String.appendChar 2
@main.String.appendChar.242 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1554) push constant 39
@39 // push constant 39
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1557) call String.appendChar 2
(main.String.appendChar.243) // call String.appendChar 2
@main.String.appendChar.243 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1559) push constant 98
@98 // push constant 98
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1562) call String.appendChar 2
(main.String.appendChar.244) // call String.appendChar 2
@main.String.appendChar.244 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1564) push constant 97
@97 // push constant 97
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1567) call String.appendChar 2
(main.String.appendChar.245) // call String.appendChar 2
@main.String.appendChar.245 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1569) push constant 99
@99 // push constant 99
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1572) call String.appendChar 2
(main.String.appendChar.246) // call String.appendChar 2
@main.String.appendChar.246 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1574) push constant 107
@107 // push constant 107
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1577) call String.appendChar 2
(main.String.appendChar.247) // call String.appendChar 2
@main.String.appendChar.247 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1579) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1582) call String.appendChar 2
(main.String.appendChar.248) // call String.appendChar 2
@main.String.appendChar.248 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1584) push constant 112
@112 // push constant 112
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1587) call String.appendChar 2
(main.String.appendChar.249) // call String.appendChar 2
@main.String.appendChar.249 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1589) push constant 97
@97 // push constant 97
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1592) call String.appendChar 2
(main.String.appendChar.250) // call String.appendChar 2
@main.String.appendChar.250 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1594) push constant 99
@99 // push constant 99
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1597) call String.appendChar 2
(main.String.appendChar.251) // call String.appendChar 2
@main.String.appendChar.251 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1599) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1602) call String.appendChar 2
(main.String.appendChar.252) // call String.appendChar 2
@main.String.appendChar.252 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1604) push constant 39
@39 // push constant 39
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1607) call String.appendChar 2
(main.String.appendChar.253) // call String.appendChar 2
@main.String.appendChar.253 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1609) push constant 41
@41 // push constant 41
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1612) call String.appendChar 2
(main.String.appendChar.254) // call String.appendChar 2
@main.String.appendChar.254 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1615) call Output.printString 1
(main.Output.printString.255) // call Output.printString 1
@main.Output.printString.255 // call Output.printString // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-1617) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1619) push constant 0 // local(1) init
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

// (-1621) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-1624) call Output.println 0
(main.Output.println.256) // call Output.println 0

// (-1626) push constant 9999 // call Output.println // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Output.println // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@main.Output.println.256 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1628) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-1630) label WHILE_EXP4
(main.WHILE_EXP4) // label WHILE_EXP4

// (-1633) push local 4
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

// (-1635) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1637) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1639) if-goto WHILE_END4
@0 // if-goto WHILE_END4
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
@main.WHILE_END4
D;JNE // jump if not zero

// (-1641) push constant 36
@36 // push constant 36
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1644) call String.new 1
(main.String.new.257) // call String.new 1
@main.String.new.257 // call String.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1646) push constant 80
@80 // push constant 80
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1649) call String.appendChar 2
(main.String.appendChar.258) // call String.appendChar 2
@main.String.appendChar.258 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1651) push constant 108
@108 // push constant 108
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1654) call String.appendChar 2
(main.String.appendChar.259) // call String.appendChar 2
@main.String.appendChar.259 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1656) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1659) call String.appendChar 2
(main.String.appendChar.260) // call String.appendChar 2
@main.String.appendChar.260 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1661) push constant 97
@97 // push constant 97
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1664) call String.appendChar 2
(main.String.appendChar.261) // call String.appendChar 2
@main.String.appendChar.261 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1666) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1669) call String.appendChar 2
(main.String.appendChar.262) // call String.appendChar 2
@main.String.appendChar.262 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1671) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1674) call String.appendChar 2
(main.String.appendChar.263) // call String.appendChar 2
@main.String.appendChar.263 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1676) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1679) call String.appendChar 2
(main.String.appendChar.264) // call String.appendChar 2
@main.String.appendChar.264 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1681) push constant 116
@116 // push constant 116
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1684) call String.appendChar 2
(main.String.appendChar.265) // call String.appendChar 2
@main.String.appendChar.265 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1686) push constant 121
@121 // push constant 121
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1689) call String.appendChar 2
(main.String.appendChar.266) // call String.appendChar 2
@main.String.appendChar.266 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1691) push constant 112
@112 // push constant 112
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1694) call String.appendChar 2
(main.String.appendChar.267) // call String.appendChar 2
@main.String.appendChar.267 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1696) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1699) call String.appendChar 2
(main.String.appendChar.268) // call String.appendChar 2
@main.String.appendChar.268 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1701) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1704) call String.appendChar 2
(main.String.appendChar.269) // call String.appendChar 2
@main.String.appendChar.269 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1706) push constant 39
@39 // push constant 39
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1709) call String.appendChar 2
(main.String.appendChar.270) // call String.appendChar 2
@main.String.appendChar.270 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1711) push constant 74
@74 // push constant 74
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1714) call String.appendChar 2
(main.String.appendChar.271) // call String.appendChar 2
@main.String.appendChar.271 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1716) push constant 65
@65 // push constant 65
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1719) call String.appendChar 2
(main.String.appendChar.272) // call String.appendChar 2
@main.String.appendChar.272 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1721) push constant 67
@67 // push constant 67
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1724) call String.appendChar 2
(main.String.appendChar.273) // call String.appendChar 2
@main.String.appendChar.273 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1726) push constant 75
@75 // push constant 75
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1729) call String.appendChar 2
(main.String.appendChar.274) // call String.appendChar 2
@main.String.appendChar.274 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1731) push constant 39
@39 // push constant 39
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1734) call String.appendChar 2
(main.String.appendChar.275) // call String.appendChar 2
@main.String.appendChar.275 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1736) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1739) call String.appendChar 2
(main.String.appendChar.276) // call String.appendChar 2
@main.String.appendChar.276 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1741) push constant 97
@97 // push constant 97
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1744) call String.appendChar 2
(main.String.appendChar.277) // call String.appendChar 2
@main.String.appendChar.277 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1746) push constant 110
@110 // push constant 110
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1749) call String.appendChar 2
(main.String.appendChar.278) // call String.appendChar 2
@main.String.appendChar.278 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1751) push constant 100
@100 // push constant 100
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1754) call String.appendChar 2
(main.String.appendChar.279) // call String.appendChar 2
@main.String.appendChar.279 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1756) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1759) call String.appendChar 2
(main.String.appendChar.280) // call String.appendChar 2
@main.String.appendChar.280 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1761) push constant 112
@112 // push constant 112
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1764) call String.appendChar 2
(main.String.appendChar.281) // call String.appendChar 2
@main.String.appendChar.281 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1766) push constant 114
@114 // push constant 114
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1769) call String.appendChar 2
(main.String.appendChar.282) // call String.appendChar 2
@main.String.appendChar.282 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1771) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1774) call String.appendChar 2
(main.String.appendChar.283) // call String.appendChar 2
@main.String.appendChar.283 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1776) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1779) call String.appendChar 2
(main.String.appendChar.284) // call String.appendChar 2
@main.String.appendChar.284 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1781) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1784) call String.appendChar 2
(main.String.appendChar.285) // call String.appendChar 2
@main.String.appendChar.285 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1786) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1789) call String.appendChar 2
(main.String.appendChar.286) // call String.appendChar 2
@main.String.appendChar.286 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1791) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1794) call String.appendChar 2
(main.String.appendChar.287) // call String.appendChar 2
@main.String.appendChar.287 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1796) push constant 110
@110 // push constant 110
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1799) call String.appendChar 2
(main.String.appendChar.288) // call String.appendChar 2
@main.String.appendChar.288 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1801) push constant 116
@116 // push constant 116
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1804) call String.appendChar 2
(main.String.appendChar.289) // call String.appendChar 2
@main.String.appendChar.289 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1806) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1809) call String.appendChar 2
(main.String.appendChar.290) // call String.appendChar 2
@main.String.appendChar.290 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1811) push constant 114
@114 // push constant 114
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1814) call String.appendChar 2
(main.String.appendChar.291) // call String.appendChar 2
@main.String.appendChar.291 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1816) push constant 58
@58 // push constant 58
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1819) call String.appendChar 2
(main.String.appendChar.292) // call String.appendChar 2
@main.String.appendChar.292 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1821) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1824) call String.appendChar 2
(main.String.appendChar.293) // call String.appendChar 2
@main.String.appendChar.293 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1827) call Keyboard.readLine 1
(main.Keyboard.readLine.294) // call Keyboard.readLine 1
@main.Keyboard.readLine.294 // call Keyboard.readLine // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-1829) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1831) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1833) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1835) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1837) push constant 0 // local(4) init
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

// (-1839) pop local 2
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

// (-1841) push local 2
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

// (-1844) call String.length 1
(main.String.length.295) // call String.length 1
@main.String.length.295 // call String.length // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1846) push constant 4
@4 // push constant 4
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1848) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_296
D;JEQ
(EQ_FALSE_296)
@0
D=A // d = false
@EQ_END_296
0;JMP
(EQ_TRUE_296)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_296)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1853) if-goto IF_TRUE2
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
@main.IF_TRUE2
D;JNE // jump if not zero

// (-1855) goto IF_FALSE2
@main.IF_FALSE2 // goto IF_FALSE2
0;JMP // unconditional jump

// (-1857) label IF_TRUE2
(main.IF_TRUE2) // label IF_TRUE2

// (-1860) push local 2
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

// (-1862) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1865) call String.charAt 2
(main.String.charAt.297) // call String.charAt 2
@main.String.charAt.297 // call String.charAt // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1867) push constant 74
@74 // push constant 74
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1869) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_298
D;JEQ
(EQ_FALSE_298)
@0
D=A // d = false
@EQ_END_298
0;JMP
(EQ_TRUE_298)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_298)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1874) push local 2
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

// (-1876) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1879) call String.charAt 2
(main.String.charAt.299) // call String.charAt 2
@main.String.charAt.299 // call String.charAt // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1881) push constant 65
@65 // push constant 65
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1883) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_300
D;JEQ
(EQ_FALSE_300)
@0
D=A // d = false
@EQ_END_300
0;JMP
(EQ_TRUE_300)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_300)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1888) and
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

// (-1890) push local 2
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

// (-1892) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1895) call String.charAt 2
(main.String.charAt.301) // call String.charAt 2
@main.String.charAt.301 // call String.charAt // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1897) push constant 67
@67 // push constant 67
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1899) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_302
D;JEQ
(EQ_FALSE_302)
@0
D=A // d = false
@EQ_END_302
0;JMP
(EQ_TRUE_302)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_302)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1904) and
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

// (-1906) push local 2
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

// (-1908) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1911) call String.charAt 2
(main.String.charAt.303) // call String.charAt 2
@main.String.charAt.303 // call String.charAt // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1913) push constant 75
@75 // push constant 75
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1915) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_304
D;JEQ
(EQ_FALSE_304)
@0
D=A // d = false
@EQ_END_304
0;JMP
(EQ_TRUE_304)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_304)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-1920) and
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

// (-1922) if-goto IF_TRUE3
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
@main.IF_TRUE3
D;JNE // jump if not zero

// (-1924) goto IF_FALSE3
@main.IF_FALSE3 // goto IF_FALSE3
0;JMP // unconditional jump

// (-1926) label IF_TRUE3
(main.IF_TRUE3) // label IF_TRUE3

// (-1929) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1932) call String.new 1
(main.String.new.305) // call String.new 1
@main.String.new.305 // call String.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1934) push constant 111
@111 // push constant 111
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1937) call String.appendChar 2
(main.String.appendChar.306) // call String.appendChar 2
@main.String.appendChar.306 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1939) push constant 107
@107 // push constant 107
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1942) call String.appendChar 2
(main.String.appendChar.307) // call String.appendChar 2
@main.String.appendChar.307 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1945) call Output.printString 1
(main.Output.printString.308) // call Output.printString 1
@main.Output.printString.308 // call Output.printString // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-1947) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1949) push constant 0 // local(1) init
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

// (-1951) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-1954) call Output.println 0
(main.Output.println.309) // call Output.println 0

// (-1956) push constant 9999 // call Output.println // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Output.println // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@main.Output.println.309 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1958) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-1960) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1962) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-1964) pop local 4
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

// (-1966) label IF_FALSE3
(main.IF_FALSE3) // label IF_FALSE3

// (-1969) label IF_FALSE2
(main.IF_FALSE2) // label IF_FALSE2

// (-1972) goto WHILE_EXP4
@main.WHILE_EXP4 // goto WHILE_EXP4
0;JMP // unconditional jump

// (-1974) label WHILE_END4
(main.WHILE_END4) // label WHILE_END4

// (-1977) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1979) pop local 4
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

// (-1981) push constant 13
@13 // push constant 13
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1984) call String.new 1
(main.String.new.310) // call String.new 1
@main.String.new.310 // call String.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1986) push constant 114
@114 // push constant 114
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1989) call String.appendChar 2
(main.String.appendChar.311) // call String.appendChar 2
@main.String.appendChar.311 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1991) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1994) call String.appendChar 2
(main.String.appendChar.312) // call String.appendChar 2
@main.String.appendChar.312 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-1996) push constant 97
@97 // push constant 97
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-1999) call String.appendChar 2
(main.String.appendChar.313) // call String.appendChar 2
@main.String.appendChar.313 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2001) push constant 100
@100 // push constant 100
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2004) call String.appendChar 2
(main.String.appendChar.314) // call String.appendChar 2
@main.String.appendChar.314 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2006) push constant 73
@73 // push constant 73
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2009) call String.appendChar 2
(main.String.appendChar.315) // call String.appendChar 2
@main.String.appendChar.315 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2011) push constant 110
@110 // push constant 110
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2014) call String.appendChar 2
(main.String.appendChar.316) // call String.appendChar 2
@main.String.appendChar.316 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2016) push constant 116
@116 // push constant 116
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2019) call String.appendChar 2
(main.String.appendChar.317) // call String.appendChar 2
@main.String.appendChar.317 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2021) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2024) call String.appendChar 2
(main.String.appendChar.318) // call String.appendChar 2
@main.String.appendChar.318 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2026) push constant 116
@116 // push constant 116
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2029) call String.appendChar 2
(main.String.appendChar.319) // call String.appendChar 2
@main.String.appendChar.319 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2031) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2034) call String.appendChar 2
(main.String.appendChar.320) // call String.appendChar 2
@main.String.appendChar.320 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2036) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2039) call String.appendChar 2
(main.String.appendChar.321) // call String.appendChar 2
@main.String.appendChar.321 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2041) push constant 116
@116 // push constant 116
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2044) call String.appendChar 2
(main.String.appendChar.322) // call String.appendChar 2
@main.String.appendChar.322 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2046) push constant 58
@58 // push constant 58
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2049) call String.appendChar 2
(main.String.appendChar.323) // call String.appendChar 2
@main.String.appendChar.323 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2052) call Output.printString 1
(main.Output.printString.324) // call Output.printString 1
@main.Output.printString.324 // call Output.printString // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-2054) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2056) push constant 0 // local(1) init
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

// (-2058) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2061) call Output.println 0
(main.Output.println.325) // call Output.println 0

// (-2063) push constant 9999 // call Output.println // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Output.println // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@main.Output.println.325 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2065) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2067) push constant 38
@38 // push constant 38
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2070) call String.new 1
(main.String.new.326) // call String.new 1
@main.String.new.326 // call String.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2072) push constant 40
@40 // push constant 40
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2075) call String.appendChar 2
(main.String.appendChar.327) // call String.appendChar 2
@main.String.appendChar.327 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2077) push constant 86
@86 // push constant 86
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2080) call String.appendChar 2
(main.String.appendChar.328) // call String.appendChar 2
@main.String.appendChar.328 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2082) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2085) call String.appendChar 2
(main.String.appendChar.329) // call String.appendChar 2
@main.String.appendChar.329 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2087) push constant 114
@114 // push constant 114
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2090) call String.appendChar 2
(main.String.appendChar.330) // call String.appendChar 2
@main.String.appendChar.330 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2092) push constant 105
@105 // push constant 105
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2095) call String.appendChar 2
(main.String.appendChar.331) // call String.appendChar 2
@main.String.appendChar.331 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2097) push constant 102
@102 // push constant 102
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2100) call String.appendChar 2
(main.String.appendChar.332) // call String.appendChar 2
@main.String.appendChar.332 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2102) push constant 121
@121 // push constant 121
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2105) call String.appendChar 2
(main.String.appendChar.333) // call String.appendChar 2
@main.String.appendChar.333 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2107) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2110) call String.appendChar 2
(main.String.appendChar.334) // call String.appendChar 2
@main.String.appendChar.334 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2112) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2115) call String.appendChar 2
(main.String.appendChar.335) // call String.appendChar 2
@main.String.appendChar.335 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2117) push constant 99
@99 // push constant 99
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2120) call String.appendChar 2
(main.String.appendChar.336) // call String.appendChar 2
@main.String.appendChar.336 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2122) push constant 104
@104 // push constant 104
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2125) call String.appendChar 2
(main.String.appendChar.337) // call String.appendChar 2
@main.String.appendChar.337 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2127) push constant 111
@111 // push constant 111
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2130) call String.appendChar 2
(main.String.appendChar.338) // call String.appendChar 2
@main.String.appendChar.338 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2132) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2135) call String.appendChar 2
(main.String.appendChar.339) // call String.appendChar 2
@main.String.appendChar.339 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2137) push constant 97
@97 // push constant 97
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2140) call String.appendChar 2
(main.String.appendChar.340) // call String.appendChar 2
@main.String.appendChar.340 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2142) push constant 110
@110 // push constant 110
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2145) call String.appendChar 2
(main.String.appendChar.341) // call String.appendChar 2
@main.String.appendChar.341 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2147) push constant 100
@100 // push constant 100
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2150) call String.appendChar 2
(main.String.appendChar.342) // call String.appendChar 2
@main.String.appendChar.342 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2152) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2155) call String.appendChar 2
(main.String.appendChar.343) // call String.appendChar 2
@main.String.appendChar.343 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2157) push constant 117
@117 // push constant 117
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2160) call String.appendChar 2
(main.String.appendChar.344) // call String.appendChar 2
@main.String.appendChar.344 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2162) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2165) call String.appendChar 2
(main.String.appendChar.345) // call String.appendChar 2
@main.String.appendChar.345 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2167) push constant 97
@97 // push constant 97
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2170) call String.appendChar 2
(main.String.appendChar.346) // call String.appendChar 2
@main.String.appendChar.346 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2172) push constant 103
@103 // push constant 103
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2175) call String.appendChar 2
(main.String.appendChar.347) // call String.appendChar 2
@main.String.appendChar.347 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2177) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2180) call String.appendChar 2
(main.String.appendChar.348) // call String.appendChar 2
@main.String.appendChar.348 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2182) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2185) call String.appendChar 2
(main.String.appendChar.349) // call String.appendChar 2
@main.String.appendChar.349 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2187) push constant 111
@111 // push constant 111
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2190) call String.appendChar 2
(main.String.appendChar.350) // call String.appendChar 2
@main.String.appendChar.350 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2192) push constant 102
@102 // push constant 102
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2195) call String.appendChar 2
(main.String.appendChar.351) // call String.appendChar 2
@main.String.appendChar.351 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2197) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2200) call String.appendChar 2
(main.String.appendChar.352) // call String.appendChar 2
@main.String.appendChar.352 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2202) push constant 39
@39 // push constant 39
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2205) call String.appendChar 2
(main.String.appendChar.353) // call String.appendChar 2
@main.String.appendChar.353 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2207) push constant 98
@98 // push constant 98
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2210) call String.appendChar 2
(main.String.appendChar.354) // call String.appendChar 2
@main.String.appendChar.354 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2212) push constant 97
@97 // push constant 97
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2215) call String.appendChar 2
(main.String.appendChar.355) // call String.appendChar 2
@main.String.appendChar.355 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2217) push constant 99
@99 // push constant 99
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2220) call String.appendChar 2
(main.String.appendChar.356) // call String.appendChar 2
@main.String.appendChar.356 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2222) push constant 107
@107 // push constant 107
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2225) call String.appendChar 2
(main.String.appendChar.357) // call String.appendChar 2
@main.String.appendChar.357 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2227) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2230) call String.appendChar 2
(main.String.appendChar.358) // call String.appendChar 2
@main.String.appendChar.358 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2232) push constant 112
@112 // push constant 112
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2235) call String.appendChar 2
(main.String.appendChar.359) // call String.appendChar 2
@main.String.appendChar.359 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2237) push constant 97
@97 // push constant 97
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2240) call String.appendChar 2
(main.String.appendChar.360) // call String.appendChar 2
@main.String.appendChar.360 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2242) push constant 99
@99 // push constant 99
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2245) call String.appendChar 2
(main.String.appendChar.361) // call String.appendChar 2
@main.String.appendChar.361 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2247) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2250) call String.appendChar 2
(main.String.appendChar.362) // call String.appendChar 2
@main.String.appendChar.362 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2252) push constant 39
@39 // push constant 39
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2255) call String.appendChar 2
(main.String.appendChar.363) // call String.appendChar 2
@main.String.appendChar.363 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2257) push constant 41
@41 // push constant 41
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2260) call String.appendChar 2
(main.String.appendChar.364) // call String.appendChar 2
@main.String.appendChar.364 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2263) call Output.printString 1
(main.Output.printString.365) // call Output.printString 1
@main.Output.printString.365 // call Output.printString // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-2265) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2267) push constant 0 // local(1) init
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

// (-2269) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2272) call Output.println 0
(main.Output.println.366) // call Output.println 0

// (-2274) push constant 9999 // call Output.println // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Output.println // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@main.Output.println.366 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2276) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2278) label WHILE_EXP5
(main.WHILE_EXP5) // label WHILE_EXP5

// (-2281) push local 4
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

// (-2283) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-2285) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-2287) if-goto WHILE_END5
@0 // if-goto WHILE_END5
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
@main.WHILE_END5
D;JNE // jump if not zero

// (-2289) push constant 38
@38 // push constant 38
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2292) call String.new 1
(main.String.new.367) // call String.new 1
@main.String.new.367 // call String.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2294) push constant 80
@80 // push constant 80
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2297) call String.appendChar 2
(main.String.appendChar.368) // call String.appendChar 2
@main.String.appendChar.368 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2299) push constant 108
@108 // push constant 108
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2302) call String.appendChar 2
(main.String.appendChar.369) // call String.appendChar 2
@main.String.appendChar.369 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2304) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2307) call String.appendChar 2
(main.String.appendChar.370) // call String.appendChar 2
@main.String.appendChar.370 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2309) push constant 97
@97 // push constant 97
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2312) call String.appendChar 2
(main.String.appendChar.371) // call String.appendChar 2
@main.String.appendChar.371 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2314) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2317) call String.appendChar 2
(main.String.appendChar.372) // call String.appendChar 2
@main.String.appendChar.372 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2319) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2322) call String.appendChar 2
(main.String.appendChar.373) // call String.appendChar 2
@main.String.appendChar.373 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2324) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2327) call String.appendChar 2
(main.String.appendChar.374) // call String.appendChar 2
@main.String.appendChar.374 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2329) push constant 116
@116 // push constant 116
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2332) call String.appendChar 2
(main.String.appendChar.375) // call String.appendChar 2
@main.String.appendChar.375 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2334) push constant 121
@121 // push constant 121
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2337) call String.appendChar 2
(main.String.appendChar.376) // call String.appendChar 2
@main.String.appendChar.376 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2339) push constant 112
@112 // push constant 112
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2342) call String.appendChar 2
(main.String.appendChar.377) // call String.appendChar 2
@main.String.appendChar.377 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2344) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2347) call String.appendChar 2
(main.String.appendChar.378) // call String.appendChar 2
@main.String.appendChar.378 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2349) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2352) call String.appendChar 2
(main.String.appendChar.379) // call String.appendChar 2
@main.String.appendChar.379 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2354) push constant 39
@39 // push constant 39
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2357) call String.appendChar 2
(main.String.appendChar.380) // call String.appendChar 2
@main.String.appendChar.380 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2359) push constant 45
@45 // push constant 45
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2362) call String.appendChar 2
(main.String.appendChar.381) // call String.appendChar 2
@main.String.appendChar.381 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2364) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2367) call String.appendChar 2
(main.String.appendChar.382) // call String.appendChar 2
@main.String.appendChar.382 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2369) push constant 50
@50 // push constant 50
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2372) call String.appendChar 2
(main.String.appendChar.383) // call String.appendChar 2
@main.String.appendChar.383 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2374) push constant 49
@49 // push constant 49
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2377) call String.appendChar 2
(main.String.appendChar.384) // call String.appendChar 2
@main.String.appendChar.384 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2379) push constant 50
@50 // push constant 50
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2382) call String.appendChar 2
(main.String.appendChar.385) // call String.appendChar 2
@main.String.appendChar.385 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2384) push constant 51
@51 // push constant 51
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2387) call String.appendChar 2
(main.String.appendChar.386) // call String.appendChar 2
@main.String.appendChar.386 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2389) push constant 39
@39 // push constant 39
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2392) call String.appendChar 2
(main.String.appendChar.387) // call String.appendChar 2
@main.String.appendChar.387 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2394) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2397) call String.appendChar 2
(main.String.appendChar.388) // call String.appendChar 2
@main.String.appendChar.388 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2399) push constant 97
@97 // push constant 97
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2402) call String.appendChar 2
(main.String.appendChar.389) // call String.appendChar 2
@main.String.appendChar.389 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2404) push constant 110
@110 // push constant 110
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2407) call String.appendChar 2
(main.String.appendChar.390) // call String.appendChar 2
@main.String.appendChar.390 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2409) push constant 100
@100 // push constant 100
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2412) call String.appendChar 2
(main.String.appendChar.391) // call String.appendChar 2
@main.String.appendChar.391 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2414) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2417) call String.appendChar 2
(main.String.appendChar.392) // call String.appendChar 2
@main.String.appendChar.392 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2419) push constant 112
@112 // push constant 112
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2422) call String.appendChar 2
(main.String.appendChar.393) // call String.appendChar 2
@main.String.appendChar.393 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2424) push constant 114
@114 // push constant 114
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2427) call String.appendChar 2
(main.String.appendChar.394) // call String.appendChar 2
@main.String.appendChar.394 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2429) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2432) call String.appendChar 2
(main.String.appendChar.395) // call String.appendChar 2
@main.String.appendChar.395 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2434) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2437) call String.appendChar 2
(main.String.appendChar.396) // call String.appendChar 2
@main.String.appendChar.396 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2439) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2442) call String.appendChar 2
(main.String.appendChar.397) // call String.appendChar 2
@main.String.appendChar.397 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2444) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2447) call String.appendChar 2
(main.String.appendChar.398) // call String.appendChar 2
@main.String.appendChar.398 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2449) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2452) call String.appendChar 2
(main.String.appendChar.399) // call String.appendChar 2
@main.String.appendChar.399 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2454) push constant 110
@110 // push constant 110
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2457) call String.appendChar 2
(main.String.appendChar.400) // call String.appendChar 2
@main.String.appendChar.400 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2459) push constant 116
@116 // push constant 116
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2462) call String.appendChar 2
(main.String.appendChar.401) // call String.appendChar 2
@main.String.appendChar.401 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2464) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2467) call String.appendChar 2
(main.String.appendChar.402) // call String.appendChar 2
@main.String.appendChar.402 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2469) push constant 114
@114 // push constant 114
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2472) call String.appendChar 2
(main.String.appendChar.403) // call String.appendChar 2
@main.String.appendChar.403 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2474) push constant 58
@58 // push constant 58
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2477) call String.appendChar 2
(main.String.appendChar.404) // call String.appendChar 2
@main.String.appendChar.404 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2479) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2482) call String.appendChar 2
(main.String.appendChar.405) // call String.appendChar 2
@main.String.appendChar.405 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2485) call Keyboard.readInt 1
(main.Keyboard.readInt.406) // call Keyboard.readInt 1
@main.Keyboard.readInt.406 // call Keyboard.readInt // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-2487) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2489) push constant 0 // local(1) init
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
@Keyboard.readInt // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-2491) pop local 3
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

// (-2493) push local 3
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

// (-2495) push constant 32123
@32123 // push constant 32123
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2497) neg
@SP // neg
M=M-1
A=M
M=-M
@SP
M=M+1

// (-2499) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_407
D;JEQ
(EQ_FALSE_407)
@0
D=A // d = false
@EQ_END_407
0;JMP
(EQ_TRUE_407)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_407)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2504) if-goto IF_TRUE4
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
@main.IF_TRUE4
D;JNE // jump if not zero

// (-2506) goto IF_FALSE4
@main.IF_FALSE4 // goto IF_FALSE4
0;JMP // unconditional jump

// (-2508) label IF_TRUE4
(main.IF_TRUE4) // label IF_TRUE4

// (-2511) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2514) call String.new 1
(main.String.new.408) // call String.new 1
@main.String.new.408 // call String.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2516) push constant 111
@111 // push constant 111
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2519) call String.appendChar 2
(main.String.appendChar.409) // call String.appendChar 2
@main.String.appendChar.409 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2521) push constant 107
@107 // push constant 107
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2524) call String.appendChar 2
(main.String.appendChar.410) // call String.appendChar 2
@main.String.appendChar.410 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2527) call Output.printString 1
(main.Output.printString.411) // call Output.printString 1
@main.Output.printString.411 // call Output.printString // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-2529) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2531) push constant 0 // local(1) init
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

// (-2533) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2536) call Output.println 0
(main.Output.println.412) // call Output.println 0

// (-2538) push constant 9999 // call Output.println // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Output.println // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@main.Output.println.412 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2540) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2542) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2544) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-2546) pop local 4
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

// (-2548) label IF_FALSE4
(main.IF_FALSE4) // label IF_FALSE4

// (-2551) goto WHILE_EXP5
@main.WHILE_EXP5 // goto WHILE_EXP5
0;JMP // unconditional jump

// (-2553) label WHILE_END5
(main.WHILE_END5) // label WHILE_END5

// (-2557) call Output.println 0
(main.Output.println.413) // call Output.println 0

// (-2559) push constant 9999 // call Output.println // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Output.println // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@main.Output.println.413 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2561) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2563) push constant 27
@27 // push constant 27
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2566) call String.new 1
(main.String.new.414) // call String.new 1
@main.String.new.414 // call String.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2568) push constant 84
@84 // push constant 84
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2571) call String.appendChar 2
(main.String.appendChar.415) // call String.appendChar 2
@main.String.appendChar.415 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2573) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2576) call String.appendChar 2
(main.String.appendChar.416) // call String.appendChar 2
@main.String.appendChar.416 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2578) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2581) call String.appendChar 2
(main.String.appendChar.417) // call String.appendChar 2
@main.String.appendChar.417 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2583) push constant 116
@116 // push constant 116
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2586) call String.appendChar 2
(main.String.appendChar.418) // call String.appendChar 2
@main.String.appendChar.418 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2588) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2591) call String.appendChar 2
(main.String.appendChar.419) // call String.appendChar 2
@main.String.appendChar.419 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2593) push constant 99
@99 // push constant 99
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2596) call String.appendChar 2
(main.String.appendChar.420) // call String.appendChar 2
@main.String.appendChar.420 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2598) push constant 111
@111 // push constant 111
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2601) call String.appendChar 2
(main.String.appendChar.421) // call String.appendChar 2
@main.String.appendChar.421 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2603) push constant 109
@109 // push constant 109
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2606) call String.appendChar 2
(main.String.appendChar.422) // call String.appendChar 2
@main.String.appendChar.422 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2608) push constant 112
@112 // push constant 112
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2611) call String.appendChar 2
(main.String.appendChar.423) // call String.appendChar 2
@main.String.appendChar.423 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2613) push constant 108
@108 // push constant 108
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2616) call String.appendChar 2
(main.String.appendChar.424) // call String.appendChar 2
@main.String.appendChar.424 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2618) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2621) call String.appendChar 2
(main.String.appendChar.425) // call String.appendChar 2
@main.String.appendChar.425 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2623) push constant 116
@116 // push constant 116
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2626) call String.appendChar 2
(main.String.appendChar.426) // call String.appendChar 2
@main.String.appendChar.426 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2628) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2631) call String.appendChar 2
(main.String.appendChar.427) // call String.appendChar 2
@main.String.appendChar.427 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2633) push constant 100
@100 // push constant 100
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2636) call String.appendChar 2
(main.String.appendChar.428) // call String.appendChar 2
@main.String.appendChar.428 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2638) push constant 32
@32 // push constant 32
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2641) call String.appendChar 2
(main.String.appendChar.429) // call String.appendChar 2
@main.String.appendChar.429 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2643) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2646) call String.appendChar 2
(main.String.appendChar.430) // call String.appendChar 2
@main.String.appendChar.430 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2648) push constant 117
@117 // push constant 117
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2651) call String.appendChar 2
(main.String.appendChar.431) // call String.appendChar 2
@main.String.appendChar.431 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2653) push constant 99
@99 // push constant 99
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2656) call String.appendChar 2
(main.String.appendChar.432) // call String.appendChar 2
@main.String.appendChar.432 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2658) push constant 99
@99 // push constant 99
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2661) call String.appendChar 2
(main.String.appendChar.433) // call String.appendChar 2
@main.String.appendChar.433 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2663) push constant 101
@101 // push constant 101
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2666) call String.appendChar 2
(main.String.appendChar.434) // call String.appendChar 2
@main.String.appendChar.434 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2668) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2671) call String.appendChar 2
(main.String.appendChar.435) // call String.appendChar 2
@main.String.appendChar.435 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2673) push constant 115
@115 // push constant 115
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2676) call String.appendChar 2
(main.String.appendChar.436) // call String.appendChar 2
@main.String.appendChar.436 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2678) push constant 102
@102 // push constant 102
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2681) call String.appendChar 2
(main.String.appendChar.437) // call String.appendChar 2
@main.String.appendChar.437 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2683) push constant 117
@117 // push constant 117
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2686) call String.appendChar 2
(main.String.appendChar.438) // call String.appendChar 2
@main.String.appendChar.438 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2688) push constant 108
@108 // push constant 108
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2691) call String.appendChar 2
(main.String.appendChar.439) // call String.appendChar 2
@main.String.appendChar.439 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2693) push constant 108
@108 // push constant 108
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2696) call String.appendChar 2
(main.String.appendChar.440) // call String.appendChar 2
@main.String.appendChar.440 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2698) push constant 121
@121 // push constant 121
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2701) call String.appendChar 2
(main.String.appendChar.441) // call String.appendChar 2
@main.String.appendChar.441 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2704) call Output.printString 1
(main.Output.printString.442) // call Output.printString 1
@main.Output.printString.442 // call Output.printString // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-2706) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2708) push constant 0 // local(1) init
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

// (-2710) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2712) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2714) return

// (-2716) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-2718) function Array.new 0
(Array.new) // function Array.new 0

// (-2721) push argument 0
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
// (-2723) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2725) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_443
D;JGT
(JGT_FALSE_443)
@0
D=A // d = false
@JGT_END_443
0;JMP
(JGT_TRUE_443)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_443)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2730) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-2732) if-goto IF_TRUE0
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

// (-2734) goto IF_FALSE0
@Array.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-2736) label IF_TRUE0
(Array.IF_TRUE0) // label IF_TRUE0

// (-2739) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2742) call Sys.error 1
(Array.Sys.error.444) // call Sys.error 1
@Array.Sys.error.444 // call Sys.error // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2744) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2746) label IF_FALSE0
(Array.IF_FALSE0) // label IF_FALSE0

// (-2749) push argument 0
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

// (-2752) call Memory.alloc 1
(Array.Memory.alloc.445) // call Memory.alloc 1
@Array.Memory.alloc.445 // call Memory.alloc // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2756) push constant 0 // local(1) init
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
@Memory.alloc // *func (parsed from call <label> <num_args>)
0;JMP // jump into EIP (*func)

// (-2758) return

// (-2760) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-2762) function Array.dispose 0
(Array.dispose) // function Array.dispose 0

// (-2765) push argument 0
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
// (-2767) pop pointer 0
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

// (-2769) push pointer 0
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

// (-2772) call Memory.deAlloc 1
(Array.Memory.deAlloc.446) // call Memory.deAlloc 1
@Array.Memory.deAlloc.446 // call Memory.deAlloc // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2776) push constant 0 // local(1) init
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

// (-2778) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2780) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2782) return

// (-2784) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-2786) function Keyboard.init 0
(Keyboard.init) // function Keyboard.init 0

// (-2789) push constant 0
@0 // push constant 0 // function Keyboard.init 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-2791) return

// (-2793) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-2795) function Keyboard.keyPressed 0
(Keyboard.keyPressed) // function Keyboard.keyPressed 0

// (-2798) push constant 24576
@24576 // push constant 24576 // function Keyboard.keyPressed 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-2801) call Memory.peek 1
(Keyboard.Memory.peek.447) // call Memory.peek 1
@Keyboard.Memory.peek.447 // call Memory.peek // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2803) return

// (-2805) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-2807) function Keyboard.readChar 2
(Keyboard.readChar) // function Keyboard.readChar 2

// (-2810) push constant 0
@0 // push constant 0 // function Keyboard.readChar 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-2813) call Output.printChar 1
(Keyboard.Output.printChar.448) // call Output.printChar 1
@Keyboard.Output.printChar.448 // call Output.printChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2815) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2817) label WHILE_EXP0
(Keyboard.WHILE_EXP0) // label WHILE_EXP0

// (-2820) push local 1
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

// (-2822) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2824) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_449
D;JEQ
(EQ_FALSE_449)
@0
D=A // d = false
@EQ_END_449
0;JMP
(EQ_TRUE_449)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_449)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2829) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
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

// (-2833) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_450
D;JGT
(JGT_FALSE_450)
@0
D=A // d = false
@JGT_END_450
0;JMP
(JGT_TRUE_450)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_450)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2838) or
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

// (-2840) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-2842) if-goto WHILE_END0
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

// (-2845) call Keyboard.keyPressed 0
(Keyboard.Keyboard.keyPressed.451) // call Keyboard.keyPressed 0

// (-2847) push constant 9999 // call Keyboard.keyPressed // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Keyboard.keyPressed // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Keyboard.Keyboard.keyPressed.451 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2849) pop local 0
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

// (-2851) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
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

// (-2855) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_452
D;JGT
(JGT_FALSE_452)
@0
D=A // d = false
@JGT_END_452
0;JMP
(JGT_TRUE_452)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_452)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2860) if-goto IF_TRUE0
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

// (-2862) goto IF_FALSE0
@Keyboard.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-2864) label IF_TRUE0
(Keyboard.IF_TRUE0) // label IF_TRUE0

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

// (-2869) pop local 1
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

// (-2871) label IF_FALSE0
(Keyboard.IF_FALSE0) // label IF_FALSE0

// (-2874) goto WHILE_EXP0
@Keyboard.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-2876) label WHILE_END0
(Keyboard.WHILE_END0) // label WHILE_END0

// (-2880) call String.backSpace 0
(Keyboard.String.backSpace.453) // call String.backSpace 0

// (-2882) push constant 9999 // call String.backSpace // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call String.backSpace // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Keyboard.String.backSpace.453 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2885) call Output.printChar 1
(Keyboard.Output.printChar.454) // call Output.printChar 1
@Keyboard.Output.printChar.454 // call Output.printChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2887) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2889) push local 1
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

// (-2892) call Output.printChar 1
(Keyboard.Output.printChar.455) // call Output.printChar 1
@Keyboard.Output.printChar.455 // call Output.printChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2894) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2896) push local 1
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

// (-2898) return

// (-2900) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-2902) function Keyboard.readLine 5
(Keyboard.readLine) // function Keyboard.readLine 5

// (-2905) push constant 80
@80 // push constant 80 // function Keyboard.readLine 5
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-2908) call String.new 1
(Keyboard.String.new.456) // call String.new 1
@Keyboard.String.new.456 // call String.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2910) pop local 3
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

// (-2912) push argument 0
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

// (-2915) call Output.printString 1
(Keyboard.Output.printString.457) // call Output.printString 1
@Keyboard.Output.printString.457 // call Output.printString // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-2917) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2919) push constant 0 // local(1) init
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

// (-2921) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-2924) call String.newLine 0
(Keyboard.String.newLine.458) // call String.newLine 0

// (-2926) push constant 9999 // call String.newLine // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call String.newLine // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Keyboard.String.newLine.458 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2928) pop local 1
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

// (-2931) call String.backSpace 0
(Keyboard.String.backSpace.459) // call String.backSpace 0

// (-2933) push constant 9999 // call String.backSpace // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call String.backSpace // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Keyboard.String.backSpace.459 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-2935) pop local 2
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

// (-2937) label WHILE_EXP0
(Keyboard.WHILE_EXP0) // label WHILE_EXP0

// (-2940) push local 4
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

// (-2942) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-2944) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-2946) if-goto WHILE_END0
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

// (-2949) call Keyboard.readChar 0
(Keyboard.Keyboard.readChar.460) // call Keyboard.readChar 0

// (-2951) push constant 9999 // call Keyboard.readChar // if no args, create a space on the stack for the return
@9999 // push constant 9999 // call Keyboard.readChar // if no args, create a space on the stack for the return
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
@Keyboard.Keyboard.readChar.460 // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-2953) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2955) push constant 0 // local(1) init
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

// (-2957) pop local 0
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

// (-2959) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2961) push local 1
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

// (-2963) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_461
D;JEQ
(EQ_FALSE_461)
@0
D=A // d = false
@EQ_END_461
0;JMP
(EQ_TRUE_461)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_461)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2968) pop local 4
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

// (-2970) push local 4
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

// (-2972) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-2974) if-goto IF_TRUE0
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

// (-2976) goto IF_FALSE0
@Keyboard.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-2978) label IF_TRUE0
(Keyboard.IF_TRUE0) // label IF_TRUE0

// (-2981) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-2983) push local 2
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

// (-2985) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_462
D;JEQ
(EQ_FALSE_462)
@0
D=A // d = false
@EQ_END_462
0;JMP
(EQ_TRUE_462)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_462)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-2990) if-goto IF_TRUE1
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

// (-2992) goto IF_FALSE1
@Keyboard.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-2994) label IF_TRUE1
(Keyboard.IF_TRUE1) // label IF_TRUE1

// (-2997) push local 3
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

// (-3000) call String.eraseLastChar 1
(Keyboard.String.eraseLastChar.463) // call String.eraseLastChar 1
@Keyboard.String.eraseLastChar.463 // call String.eraseLastChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-3002) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3004) goto IF_END1
@Keyboard.IF_END1 // goto IF_END1
0;JMP // unconditional jump

// (-3006) label IF_FALSE1
(Keyboard.IF_FALSE1) // label IF_FALSE1

// (-3009) push local 3
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

// (-3011) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3014) call String.appendChar 2
(Keyboard.String.appendChar.464) // call String.appendChar 2
@Keyboard.String.appendChar.464 // call String.appendChar // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-3016) pop local 3
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

// (-3018) label IF_END1
(Keyboard.IF_END1) // label IF_END1

// (-3021) label IF_FALSE0
(Keyboard.IF_FALSE0) // label IF_FALSE0

// (-3024) goto WHILE_EXP0
@Keyboard.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-3026) label WHILE_END0
(Keyboard.WHILE_END0) // label WHILE_END0

// (-3029) push local 3
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

// (-3031) return

// (-3033) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-3035) function Keyboard.readInt 2
(Keyboard.readInt) // function Keyboard.readInt 2

// (-3038) push argument 0
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
// (-3041) call Keyboard.readLine 1
(Keyboard.Keyboard.readLine.465) // call Keyboard.readLine 1
@Keyboard.Keyboard.readLine.465 // call Keyboard.readLine // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-3043) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3045) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3047) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3049) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3051) push constant 0 // local(4) init
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

// (-3053) pop local 0
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

// (-3055) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3058) call String.intValue 1
(Keyboard.String.intValue.466) // call String.intValue 1
@Keyboard.String.intValue.466 // call String.intValue // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-3060) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3062) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3064) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3066) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3068) push constant 0 // local(4) init
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

// (-3070) pop local 1
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

// (-3072) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3075) call String.dispose 1
(Keyboard.String.dispose.467) // call String.dispose 1
@Keyboard.String.dispose.467 // call String.dispose // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-3077) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3079) push local 1
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

// (-3081) return

// (-3083) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-3085) function Math.init 1
(Math.init) // function Math.init 1

// (-3088) push constant 16
@16 // push constant 16 // function Math.init 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-3091) call Array.new 1
(Math.Array.new.468) // call Array.new 1
@Math.Array.new.468 // call Array.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-3093) pop static 1
@16 // pop static 1 // static + src segment offset (..\projects\12\KeyboardTest\Math.vm)
D=A
@1 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3095) push constant 16
@16 // push constant 16
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3098) call Array.new 1
(Math.Array.new.469) // call Array.new 1
@Math.Array.new.469 // call Array.new // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-3100) pop static 0
@16 // pop static 0 // static + src segment offset (..\projects\12\KeyboardTest\Math.vm)
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3102) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3104) push static 0
@16 // push static 0 // static + src segment offset (..\projects\12\KeyboardTest\Math.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3106) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-3108) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3110) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3112) pop pointer 1
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

// (-3114) push temp 0
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

// (-3116) pop that 0
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

// (-3118) label WHILE_EXP0
(Math.WHILE_EXP0) // label WHILE_EXP0

// (-3121) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3123) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3125) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_470
D;JLT
(JLT_FALSE_470)
@0
D=A // d = false
@JLT_END_470
0;JMP
(JLT_TRUE_470)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_470)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-3130) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-3132) if-goto WHILE_END0
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

// (-3134) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3136) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3138) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-3140) pop local 0
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

// (-3142) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3144) push static 0
@16 // push static 0 // static + src segment offset (..\projects\12\KeyboardTest\Math.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3146) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-3148) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3150) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3152) sub
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

// (-3154) push static 0
@16 // push static 0 // static + src segment offset (..\projects\12\KeyboardTest\Math.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3156) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-3158) pop pointer 1
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

// (-3160) push that 0
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

// (-3162) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3164) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3166) sub
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

// (-3168) push static 0
@16 // push static 0 // static + src segment offset (..\projects\12\KeyboardTest\Math.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3170) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-3172) pop pointer 1
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

// (-3174) push that 0
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

// (-3176) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-3178) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3180) pop pointer 1
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

// (-3182) push temp 0
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

// (-3184) pop that 0
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

// (-3186) goto WHILE_EXP0
@Math.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-3188) label WHILE_END0
(Math.WHILE_END0) // label WHILE_END0

// (-3191) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3193) return

// (-3195) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-3197) function Math.abs 0
(Math.abs) // function Math.abs 0

// (-3200) push argument 0
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
// (-3202) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3204) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_471
D;JLT
(JLT_FALSE_471)
@0
D=A // d = false
@JLT_END_471
0;JMP
(JLT_TRUE_471)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_471)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-3209) if-goto IF_TRUE0
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

// (-3211) goto IF_FALSE0
@Math.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-3213) label IF_TRUE0
(Math.IF_TRUE0) // label IF_TRUE0

// (-3216) push argument 0
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

// (-3218) neg
@SP // neg
M=M-1
A=M
M=-M
@SP
M=M+1

// (-3220) pop argument 0
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

// (-3222) label IF_FALSE0
(Math.IF_FALSE0) // label IF_FALSE0

// (-3225) push argument 0
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

// (-3227) return

// (-3229) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-3231) function Math.multiply 5
(Math.multiply) // function Math.multiply 5

// (-3234) push argument 0
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
// (-3236) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3238) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_472
D;JLT
(JLT_FALSE_472)
@0
D=A // d = false
@JLT_END_472
0;JMP
(JLT_TRUE_472)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_472)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-3243) push argument 1
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

// (-3245) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3247) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_473
D;JGT
(JGT_FALSE_473)
@0
D=A // d = false
@JGT_END_473
0;JMP
(JGT_TRUE_473)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_473)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-3252) and
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

// (-3254) push argument 0
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

// (-3256) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3258) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_474
D;JGT
(JGT_FALSE_474)
@0
D=A // d = false
@JGT_END_474
0;JMP
(JGT_TRUE_474)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_474)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-3263) push argument 1
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

// (-3265) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3267) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_475
D;JLT
(JLT_FALSE_475)
@0
D=A // d = false
@JLT_END_475
0;JMP
(JLT_TRUE_475)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_475)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-3272) and
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

// (-3274) or
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

// (-3276) pop local 4
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

// (-3278) push argument 0
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

// (-3281) call Math.abs 1
(Math.Math.abs.476) // call Math.abs 1
@Math.Math.abs.476 // call Math.abs // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-3283) pop argument 0
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

// (-3285) push argument 1
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

// (-3288) call Math.abs 1
(Math.Math.abs.477) // call Math.abs 1
@Math.Math.abs.477 // call Math.abs // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-3290) pop argument 1
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

// (-3292) push argument 0
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

// (-3294) push argument 1
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

// (-3296) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_478
D;JLT
(JLT_FALSE_478)
@0
D=A // d = false
@JLT_END_478
0;JMP
(JLT_TRUE_478)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_478)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-3301) if-goto IF_TRUE0
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

// (-3303) goto IF_FALSE0
@Math.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-3305) label IF_TRUE0
(Math.IF_TRUE0) // label IF_TRUE0

// (-3308) push argument 0
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

// (-3310) pop local 1
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

// (-3312) push argument 1
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

// (-3314) pop argument 0
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

// (-3316) push local 1
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

// (-3318) pop argument 1
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

// (-3320) label IF_FALSE0
(Math.IF_FALSE0) // label IF_FALSE0

// (-3323) label WHILE_EXP0
(Math.WHILE_EXP0) // label WHILE_EXP0

// (-3326) push local 2
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

// (-3328) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3330) sub
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

// (-3332) push argument 1
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

// (-3334) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3336) sub
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

// (-3338) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_479
D;JLT
(JLT_FALSE_479)
@0
D=A // d = false
@JLT_END_479
0;JMP
(JLT_TRUE_479)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_479)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-3343) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-3345) if-goto WHILE_END0
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

// (-3347) push local 3
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

// (-3349) push static 0
@16 // push static 0 // static + src segment offset (..\projects\12\KeyboardTest\Math.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3351) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-3353) pop pointer 1
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

// (-3355) push that 0
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

// (-3357) push argument 1
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

// (-3359) and
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

// (-3361) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3363) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_480
D;JEQ
(EQ_FALSE_480)
@0
D=A // d = false
@EQ_END_480
0;JMP
(EQ_TRUE_480)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_480)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-3368) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-3370) if-goto IF_TRUE1
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

// (-3372) goto IF_FALSE1
@Math.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-3374) label IF_TRUE1
(Math.IF_TRUE1) // label IF_TRUE1

// (-3377) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3379) push argument 0
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

// (-3381) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-3383) pop local 0
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

// (-3385) push local 2
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

// (-3387) push local 3
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

// (-3389) push static 0
@16 // push static 0 // static + src segment offset (..\projects\12\KeyboardTest\Math.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3391) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-3393) pop pointer 1
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

// (-3395) push that 0
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

// (-3397) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-3399) pop local 2
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

// (-3401) label IF_FALSE1
(Math.IF_FALSE1) // label IF_FALSE1

// (-3404) push argument 0
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

// (-3406) push argument 0
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

// (-3408) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-3410) pop argument 0
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

// (-3412) push local 3
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

// (-3414) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3416) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-3418) pop local 3
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

// (-3420) goto WHILE_EXP0
@Math.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-3422) label WHILE_END0
(Math.WHILE_END0) // label WHILE_END0

// (-3425) push local 4
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

// (-3427) if-goto IF_TRUE2
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

// (-3429) goto IF_FALSE2
@Math.IF_FALSE2 // goto IF_FALSE2
0;JMP // unconditional jump

// (-3431) label IF_TRUE2
(Math.IF_TRUE2) // label IF_TRUE2

// (-3434) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3436) neg
@SP // neg
M=M-1
A=M
M=-M
@SP
M=M+1

// (-3438) pop local 0
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

// (-3440) label IF_FALSE2
(Math.IF_FALSE2) // label IF_FALSE2

// (-3443) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3445) return

// (-3447) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-3449) function Math.divide 4
(Math.divide) // function Math.divide 4

// (-3452) push argument 1
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
// (-3454) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3456) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_481
D;JEQ
(EQ_FALSE_481)
@0
D=A // d = false
@EQ_END_481
0;JMP
(EQ_TRUE_481)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_481)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-3461) if-goto IF_TRUE0
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

// (-3463) goto IF_FALSE0
@Math.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-3465) label IF_TRUE0
(Math.IF_TRUE0) // label IF_TRUE0

// (-3468) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3471) call Sys.error 1
(Math.Sys.error.482) // call Sys.error 1
@Math.Sys.error.482 // call Sys.error // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-3473) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3475) label IF_FALSE0
(Math.IF_FALSE0) // label IF_FALSE0

// (-3478) push argument 0
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

// (-3480) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3482) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_483
D;JLT
(JLT_FALSE_483)
@0
D=A // d = false
@JLT_END_483
0;JMP
(JLT_TRUE_483)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_483)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-3487) push argument 1
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

// (-3489) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3491) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_484
D;JGT
(JGT_FALSE_484)
@0
D=A // d = false
@JGT_END_484
0;JMP
(JGT_TRUE_484)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_484)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-3496) and
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

// (-3498) push argument 0
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

// (-3500) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3502) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_485
D;JGT
(JGT_FALSE_485)
@0
D=A // d = false
@JGT_END_485
0;JMP
(JGT_TRUE_485)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_485)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-3507) push argument 1
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

// (-3509) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3511) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_486
D;JLT
(JLT_FALSE_486)
@0
D=A // d = false
@JLT_END_486
0;JMP
(JLT_TRUE_486)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_486)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-3516) and
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

// (-3518) or
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

// (-3520) pop local 2
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

// (-3522) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3524) push static 1
@16 // push static 1 // static + src segment offset (..\projects\12\KeyboardTest\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3526) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-3528) push argument 1
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

// (-3531) call Math.abs 1
(Math.Math.abs.487) // call Math.abs 1
@Math.Math.abs.487 // call Math.abs // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-3533) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3535) pop pointer 1
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

// (-3537) push temp 0
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

// (-3539) pop that 0
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

// (-3541) push argument 0
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

// (-3544) call Math.abs 1
(Math.Math.abs.488) // call Math.abs 1
@Math.Math.abs.488 // call Math.abs // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-3546) pop argument 0
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

// (-3548) label WHILE_EXP0
(Math.WHILE_EXP0) // label WHILE_EXP0

// (-3551) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3553) push constant 15
@15 // push constant 15
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3555) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_489
D;JLT
(JLT_FALSE_489)
@0
D=A // d = false
@JLT_END_489
0;JMP
(JLT_TRUE_489)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_489)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-3560) push local 3
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

// (-3562) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-3564) and
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

// (-3566) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-3568) if-goto WHILE_END0
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

// (-3570) push constant 32767
@32767 // push constant 32767
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3572) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3574) push static 1
@16 // push static 1 // static + src segment offset (..\projects\12\KeyboardTest\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3576) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-3578) pop pointer 1
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

// (-3580) push that 0
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

// (-3582) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3584) sub
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

// (-3586) sub
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

// (-3588) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3590) push static 1
@16 // push static 1 // static + src segment offset (..\projects\12\KeyboardTest\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3592) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-3594) pop pointer 1
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

// (-3596) push that 0
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

// (-3598) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3600) sub
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

// (-3602) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_490
D;JLT
(JLT_FALSE_490)
@0
D=A // d = false
@JLT_END_490
0;JMP
(JLT_TRUE_490)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_490)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-3607) pop local 3
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

// (-3609) push local 3
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

// (-3611) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-3613) if-goto IF_TRUE1
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

// (-3615) goto IF_FALSE1
@Math.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-3617) label IF_TRUE1
(Math.IF_TRUE1) // label IF_TRUE1

// (-3620) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3622) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3624) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-3626) push static 1
@16 // push static 1 // static + src segment offset (..\projects\12\KeyboardTest\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3628) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-3630) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3632) push static 1
@16 // push static 1 // static + src segment offset (..\projects\12\KeyboardTest\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3634) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-3636) pop pointer 1
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

// (-3638) push that 0
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

// (-3640) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3642) push static 1
@16 // push static 1 // static + src segment offset (..\projects\12\KeyboardTest\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3644) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-3646) pop pointer 1
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

// (-3648) push that 0
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

// (-3650) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-3652) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3654) pop pointer 1
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

// (-3656) push temp 0
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

// (-3658) pop that 0
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

// (-3660) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3662) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3664) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-3666) push static 1
@16 // push static 1 // static + src segment offset (..\projects\12\KeyboardTest\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3668) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-3670) pop pointer 1
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

// (-3672) push that 0
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

// (-3674) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3676) sub
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

// (-3678) push argument 0
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

// (-3680) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3682) sub
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

// (-3684) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_491
D;JGT
(JGT_FALSE_491)
@0
D=A // d = false
@JGT_END_491
0;JMP
(JGT_TRUE_491)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_491)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-3689) pop local 3
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

// (-3691) push local 3
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

// (-3693) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-3695) if-goto IF_TRUE2
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

// (-3697) goto IF_FALSE2
@Math.IF_FALSE2 // goto IF_FALSE2
0;JMP // unconditional jump

// (-3699) label IF_TRUE2
(Math.IF_TRUE2) // label IF_TRUE2

// (-3702) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3704) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3706) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-3708) pop local 0
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

// (-3710) label IF_FALSE2
(Math.IF_FALSE2) // label IF_FALSE2

// (-3713) label IF_FALSE1
(Math.IF_FALSE1) // label IF_FALSE1

// (-3716) goto WHILE_EXP0
@Math.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-3718) label WHILE_END0
(Math.WHILE_END0) // label WHILE_END0

// (-3721) label WHILE_EXP1
(Math.WHILE_EXP1) // label WHILE_EXP1

// (-3724) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3726) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3728) neg
@SP // neg
M=M-1
A=M
M=-M
@SP
M=M+1

// (-3730) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_492
D;JGT
(JGT_FALSE_492)
@0
D=A // d = false
@JGT_END_492
0;JMP
(JGT_TRUE_492)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_492)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-3735) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-3737) if-goto WHILE_END1
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

// (-3739) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3741) push static 1
@16 // push static 1 // static + src segment offset (..\projects\12\KeyboardTest\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3743) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-3745) pop pointer 1
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

// (-3747) push that 0
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

// (-3749) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3751) sub
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

// (-3753) push argument 0
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

// (-3755) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3757) sub
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

// (-3759) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_493
D;JGT
(JGT_FALSE_493)
@0
D=A // d = false
@JGT_END_493
0;JMP
(JGT_TRUE_493)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_493)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-3764) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-3766) if-goto IF_TRUE3
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

// (-3768) goto IF_FALSE3
@Math.IF_FALSE3 // goto IF_FALSE3
0;JMP // unconditional jump

// (-3770) label IF_TRUE3
(Math.IF_TRUE3) // label IF_TRUE3

// (-3773) push local 1
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

// (-3775) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3777) push static 0
@16 // push static 0 // static + src segment offset (..\projects\12\KeyboardTest\Math.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3779) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-3781) pop pointer 1
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

// (-3783) push that 0
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

// (-3785) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-3787) pop local 1
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

// (-3789) push argument 0
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

// (-3791) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3793) push static 1
@16 // push static 1 // static + src segment offset (..\projects\12\KeyboardTest\Math.vm)
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3795) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-3797) pop pointer 1
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

// (-3799) push that 0
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

// (-3801) sub
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

// (-3803) pop argument 0
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

// (-3805) label IF_FALSE3
(Math.IF_FALSE3) // label IF_FALSE3

// (-3808) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3810) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3812) sub
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

// (-3814) pop local 0
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

// (-3816) goto WHILE_EXP1
@Math.WHILE_EXP1 // goto WHILE_EXP1
0;JMP // unconditional jump

// (-3818) label WHILE_END1
(Math.WHILE_END1) // label WHILE_END1

// (-3821) push local 2
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

// (-3823) if-goto IF_TRUE4
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

// (-3825) goto IF_FALSE4
@Math.IF_FALSE4 // goto IF_FALSE4
0;JMP // unconditional jump

// (-3827) label IF_TRUE4
(Math.IF_TRUE4) // label IF_TRUE4

// (-3830) push local 1
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

// (-3832) neg
@SP // neg
M=M-1
A=M
M=-M
@SP
M=M+1

// (-3834) pop local 1
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

// (-3836) label IF_FALSE4
(Math.IF_FALSE4) // label IF_FALSE4

// (-3839) push local 1
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

// (-3841) return

// (-3843) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-3845) function Math.sqrt 4
(Math.sqrt) // function Math.sqrt 4

// (-3848) push argument 0
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
// (-3850) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3852) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_494
D;JLT
(JLT_FALSE_494)
@0
D=A // d = false
@JLT_END_494
0;JMP
(JLT_TRUE_494)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_494)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-3857) if-goto IF_TRUE0
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

// (-3859) goto IF_FALSE0
@Math.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-3861) label IF_TRUE0
(Math.IF_TRUE0) // label IF_TRUE0

// (-3864) push constant 4
@4 // push constant 4
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3867) call Sys.error 1
(Math.Sys.error.495) // call Sys.error 1
@Math.Sys.error.495 // call Sys.error // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-3869) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-3871) label IF_FALSE0
(Math.IF_FALSE0) // label IF_FALSE0

// (-3874) push constant 7
@7 // push constant 7
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3876) pop local 0
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

// (-3878) label WHILE_EXP0
(Math.WHILE_EXP0) // label WHILE_EXP0

// (-3881) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3883) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3885) neg
@SP // neg
M=M-1
A=M
M=-M
@SP
M=M+1

// (-3887) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_496
D;JGT
(JGT_FALSE_496)
@0
D=A // d = false
@JGT_END_496
0;JMP
(JGT_TRUE_496)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_496)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-3892) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-3894) if-goto WHILE_END0
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

// (-3896) push local 3
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

// (-3898) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3900) push static 0
@16 // push static 0 // static + src segment offset (..\projects\12\KeyboardTest\Math.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3902) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-3904) pop pointer 1
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

// (-3906) push that 0
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

// (-3908) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-3910) pop local 1
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

// (-3912) push local 1
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

// (-3914) push local 1
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

// (-3917) call Math.multiply 2
(Math.Math.multiply.497) // call Math.multiply 2
@Math.Math.multiply.497 // call Math.multiply // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT // capture the THAT pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1

// (-3919) push constant 0 // local(0) init
@0 // push constant 0 // local(0) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3921) push constant 0 // local(1) init
@0 // push constant 0 // local(1) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3923) push constant 0 // local(2) init
@0 // push constant 0 // local(2) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3925) push constant 0 // local(3) init
@0 // push constant 0 // local(3) init
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3927) push constant 0 // local(4) init
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

// (-3929) pop local 2
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

// (-3931) push local 2
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

// (-3933) push argument 0
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

// (-3935) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_498
D;JGT
(JGT_FALSE_498)
@0
D=A // d = false
@JGT_END_498
0;JMP
(JGT_TRUE_498)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_498)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-3940) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-3942) push local 2
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

// (-3944) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3946) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_499
D;JLT
(JLT_FALSE_499)
@0
D=A // d = false
@JLT_END_499
0;JMP
(JLT_TRUE_499)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_499)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-3951) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-3953) and
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

// (-3955) if-goto IF_TRUE1
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

// (-3957) goto IF_FALSE1
@Math.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-3959) label IF_TRUE1
(Math.IF_TRUE1) // label IF_TRUE1

// (-3962) push local 1
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

// (-3964) pop local 3
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

// (-3966) label IF_FALSE1
(Math.IF_FALSE1) // label IF_FALSE1

// (-3969) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3971) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-3973) sub
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

// (-3975) pop local 0
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

// (-3977) goto WHILE_EXP0
@Math.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-3979) label WHILE_END0
(Math.WHILE_END0) // label WHILE_END0

// (-3982) push local 3
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

// (-3984) return

// (-3986) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-3988) function Math.max 0
(Math.max) // function Math.max 0

// (-3991) push argument 0
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
// (-3993) push argument 1
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

// (-3995) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_500
D;JGT
(JGT_FALSE_500)
@0
D=A // d = false
@JGT_END_500
0;JMP
(JGT_TRUE_500)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_500)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-4000) if-goto IF_TRUE0
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

// (-4002) goto IF_FALSE0
@Math.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-4004) label IF_TRUE0
(Math.IF_TRUE0) // label IF_TRUE0

// (-4007) push argument 0
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

// (-4009) pop argument 1
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

// (-4011) label IF_FALSE0
(Math.IF_FALSE0) // label IF_FALSE0

// (-4014) push argument 1
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

// (-4016) return

// (-4018) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-4020) function Math.min 0
(Math.min) // function Math.min 0

// (-4023) push argument 0
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
// (-4025) push argument 1
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

// (-4027) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_501
D;JLT
(JLT_FALSE_501)
@0
D=A // d = false
@JLT_END_501
0;JMP
(JLT_TRUE_501)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_501)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-4032) if-goto IF_TRUE0
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

// (-4034) goto IF_FALSE0
@Math.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-4036) label IF_TRUE0
(Math.IF_TRUE0) // label IF_TRUE0

// (-4039) push argument 0
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

// (-4041) pop argument 1
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

// (-4043) label IF_FALSE0
(Math.IF_FALSE0) // label IF_FALSE0

// (-4046) push argument 1
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

// (-4048) return

// (-4050) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-4052) function Memory.init 0
(Memory.init) // function Memory.init 0

// (-4055) push constant 0
@0 // push constant 0 // function Memory.init 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++
// (-4057) pop static 0
@18 // pop static 0 // static + src segment offset (..\projects\12\KeyboardTest\Memory.vm)
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4059) push constant 2048
@2048 // push constant 2048
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4061) push static 0
@18 // push static 0 // static + src segment offset (..\projects\12\KeyboardTest\Memory.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4063) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4065) push constant 14334
@14334 // push constant 14334
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

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

// (-4069) pop pointer 1
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

// (-4071) push temp 0
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

// (-4073) pop that 0
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

// (-4075) push constant 2049
@2049 // push constant 2049
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4077) push static 0
@18 // push static 0 // static + src segment offset (..\projects\12\KeyboardTest\Memory.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4079) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4081) push constant 2050
@2050 // push constant 2050
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4083) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4085) pop pointer 1
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

// (-4087) push temp 0
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

// (-4089) pop that 0
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

// (-4091) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4093) return

// (-4095) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-4097) function Memory.peek 0
(Memory.peek) // function Memory.peek 0

// (-4100) push argument 0
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
// (-4102) push static 0
@18 // push static 0 // static + src segment offset (..\projects\12\KeyboardTest\Memory.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4104) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4106) pop pointer 1
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

// (-4108) push that 0
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

// (-4110) return

// (-4112) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-4114) function Memory.poke 0
(Memory.poke) // function Memory.poke 0

// (-4117) push argument 0
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
// (-4119) push static 0
@18 // push static 0 // static + src segment offset (..\projects\12\KeyboardTest\Memory.vm)
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4121) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4123) push argument 1
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

// (-4125) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4127) pop pointer 1
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

// (-4129) push temp 0
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

// (-4131) pop that 0
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

// (-4133) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4135) return

// (-4137) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-4139) function Memory.alloc 2
(Memory.alloc) // function Memory.alloc 2

// (-4142) push argument 0
@ARG // push argument 0 // function Memory.alloc 2
D=M
@0
A=D+A
D=M
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

// (-4146) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_502
D;JLT
(JLT_FALSE_502)
@0
D=A // d = false
@JLT_END_502
0;JMP
(JLT_TRUE_502)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_502)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-4151) if-goto IF_TRUE0
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

// (-4153) goto IF_FALSE0
@Memory.IF_FALSE0 // goto IF_FALSE0
0;JMP // unconditional jump

// (-4155) label IF_TRUE0
(Memory.IF_TRUE0) // label IF_TRUE0

// (-4158) push constant 5
@5 // push constant 5
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4161) call Sys.error 1
(Memory.Sys.error.503) // call Sys.error 1
@Memory.Sys.error.503 // call Sys.error // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-4163) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4165) label IF_FALSE0
(Memory.IF_FALSE0) // label IF_FALSE0

// (-4168) push argument 0
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

// (-4170) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4172) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_504
D;JEQ
(EQ_FALSE_504)
@0
D=A // d = false
@EQ_END_504
0;JMP
(EQ_TRUE_504)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_504)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-4177) if-goto IF_TRUE1
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

// (-4179) goto IF_FALSE1
@Memory.IF_FALSE1 // goto IF_FALSE1
0;JMP // unconditional jump

// (-4181) label IF_TRUE1
(Memory.IF_TRUE1) // label IF_TRUE1

// (-4184) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4186) pop argument 0
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

// (-4188) label IF_FALSE1
(Memory.IF_FALSE1) // label IF_FALSE1

// (-4191) push constant 2048
@2048 // push constant 2048
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4193) pop local 0
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

// (-4195) label WHILE_EXP0
(Memory.WHILE_EXP0) // label WHILE_EXP0

// (-4198) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4200) push constant 16383
@16383 // push constant 16383
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4202) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_505
D;JLT
(JLT_FALSE_505)
@0
D=A // d = false
@JLT_END_505
0;JMP
(JLT_TRUE_505)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_505)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-4207) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4209) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4211) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4213) pop pointer 1
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

// (-4215) push that 0
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

// (-4217) push argument 0
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

// (-4219) lt
@SP // *esp // lt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JLT_TRUE_506
D;JLT
(JLT_FALSE_506)
@0
D=A // d = false
@JLT_END_506
0;JMP
(JLT_TRUE_506)
@0
D=A
D=D-1 // d = -1 (true)
(JLT_END_506)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-4224) and
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

// (-4226) not
@SP // not
M=M-1
A=M
M=!M
@SP
M=M+1

// (-4228) if-goto WHILE_END0
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

// (-4230) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4232) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4234) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4236) pop pointer 1
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

// (-4238) push that 0
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

// (-4240) pop local 1
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

// (-4242) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4244) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4246) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4248) pop pointer 1
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

// (-4250) push that 0
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

// (-4252) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4254) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_507
D;JEQ
(EQ_FALSE_507)
@0
D=A // d = false
@EQ_END_507
0;JMP
(EQ_TRUE_507)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_507)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-4259) push local 1
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

// (-4261) push constant 16382
@16382 // push constant 16382
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4263) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_508
D;JGT
(JGT_FALSE_508)
@0
D=A // d = false
@JGT_END_508
0;JMP
(JGT_TRUE_508)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_508)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-4268) or
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

// (-4270) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4272) push local 1
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

// (-4274) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4276) pop pointer 1
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

// (-4278) push that 0
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

// (-4280) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4282) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_509
D;JEQ
(EQ_FALSE_509)
@0
D=A // d = false
@EQ_END_509
0;JMP
(EQ_TRUE_509)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_509)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-4287) or
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

// (-4289) if-goto IF_TRUE2
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

// (-4291) goto IF_FALSE2
@Memory.IF_FALSE2 // goto IF_FALSE2
0;JMP // unconditional jump

// (-4293) label IF_TRUE2
(Memory.IF_TRUE2) // label IF_TRUE2

// (-4296) push local 1
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

// (-4298) pop local 0
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

// (-4300) goto IF_END2
@Memory.IF_END2 // goto IF_END2
0;JMP // unconditional jump

// (-4302) label IF_FALSE2
(Memory.IF_FALSE2) // label IF_FALSE2

// (-4305) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4307) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4309) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4311) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4313) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4315) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4317) pop pointer 1
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

// (-4319) push that 0
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

// (-4321) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4323) sub
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

// (-4325) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4327) push local 1
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

// (-4329) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4331) pop pointer 1
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

// (-4333) push that 0
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

// (-4335) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

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

// (-4339) pop pointer 1
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

// (-4341) push temp 0
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

// (-4343) pop that 0
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

// (-4345) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4347) push local 1
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

// (-4349) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4351) pop pointer 1
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

// (-4353) push that 0
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

// (-4355) push local 1
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

// (-4357) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4359) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4361) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_510
D;JEQ
(EQ_FALSE_510)
@0
D=A // d = false
@EQ_END_510
0;JMP
(EQ_TRUE_510)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_510)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-4366) if-goto IF_TRUE3
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

// (-4368) goto IF_FALSE3
@Memory.IF_FALSE3 // goto IF_FALSE3
0;JMP // unconditional jump

// (-4370) label IF_TRUE3
(Memory.IF_TRUE3) // label IF_TRUE3

// (-4373) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4375) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4377) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4379) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4381) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4383) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4385) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4387) pop pointer 1
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

// (-4389) push temp 0
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

// (-4391) pop that 0
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

// (-4393) goto IF_END3
@Memory.IF_END3 // goto IF_END3
0;JMP // unconditional jump

// (-4395) label IF_FALSE3
(Memory.IF_FALSE3) // label IF_FALSE3

// (-4398) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4400) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4402) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4404) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4406) push local 1
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

// (-4408) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4410) pop pointer 1
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

// (-4412) push that 0
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

// (-4414) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4416) pop pointer 1
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

// (-4418) push temp 0
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

// (-4420) pop that 0
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

// (-4422) label IF_END3
(Memory.IF_END3) // label IF_END3

// (-4425) label IF_END2
(Memory.IF_END2) // label IF_END2

// (-4428) goto WHILE_EXP0
@Memory.WHILE_EXP0 // goto WHILE_EXP0
0;JMP // unconditional jump

// (-4430) label WHILE_END0
(Memory.WHILE_END0) // label WHILE_END0

// (-4433) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4435) push argument 0
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

// (-4437) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4439) push constant 16379
@16379 // push constant 16379
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4441) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_511
D;JGT
(JGT_FALSE_511)
@0
D=A // d = false
@JGT_END_511
0;JMP
(JGT_TRUE_511)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_511)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-4446) if-goto IF_TRUE4
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
@Memory.IF_TRUE4
D;JNE // jump if not zero

// (-4448) goto IF_FALSE4
@Memory.IF_FALSE4 // goto IF_FALSE4
0;JMP // unconditional jump

// (-4450) label IF_TRUE4
(Memory.IF_TRUE4) // label IF_TRUE4

// (-4453) push constant 6
@6 // push constant 6
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4456) call Sys.error 1
(Memory.Sys.error.512) // call Sys.error 1
@Memory.Sys.error.512 // call Sys.error // push RIP
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL // capture the LCL pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG // capture the ARG pointer and push it to the stack
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS // capture the THIS pointer and push it to the stack
D=M
@SP
A=M
M=D
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

// (-4458) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4460) label IF_FALSE4
(Memory.IF_FALSE4) // label IF_FALSE4

// (-4463) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4465) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4467) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4469) pop pointer 1
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

// (-4471) push that 0
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

// (-4473) push argument 0
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

// (-4475) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4477) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4479) gt
@SP // *esp // gt
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@JGT_TRUE_513
D;JGT
(JGT_FALSE_513)
@0
D=A // d = false
@JGT_END_513
0;JMP
(JGT_TRUE_513)
@0
D=A
D=D-1 // d = -1 (true)
(JGT_END_513)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-4484) if-goto IF_TRUE5
@0 // if-goto IF_TRUE5
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
@Memory.IF_TRUE5
D;JNE // jump if not zero

// (-4486) goto IF_FALSE5
@Memory.IF_FALSE5 // goto IF_FALSE5
0;JMP // unconditional jump

// (-4488) label IF_TRUE5
(Memory.IF_TRUE5) // label IF_TRUE5

// (-4491) push argument 0
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

// (-4493) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4495) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4497) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4499) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4501) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4503) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4505) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4507) pop pointer 1
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

// (-4509) push that 0
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

// (-4511) push argument 0
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

// (-4513) sub
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

// (-4515) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4517) sub
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

// (-4519) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4521) pop pointer 1
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

// (-4523) push temp 0
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

// (-4525) pop that 0
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

// (-4527) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4529) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4531) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4533) pop pointer 1
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

// (-4535) push that 0
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

// (-4537) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4539) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4541) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4543) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_514
D;JEQ
(EQ_FALSE_514)
@0
D=A // d = false
@EQ_END_514
0;JMP
(EQ_TRUE_514)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_514)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-4548) if-goto IF_TRUE6
@0 // if-goto IF_TRUE6
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
@Memory.IF_TRUE6
D;JNE // jump if not zero

// (-4550) goto IF_FALSE6
@Memory.IF_FALSE6 // goto IF_FALSE6
0;JMP // unconditional jump

// (-4552) label IF_TRUE6
(Memory.IF_TRUE6) // label IF_TRUE6

// (-4555) push argument 0
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

// (-4557) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4559) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4561) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4563) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4565) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4567) push argument 0
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

// (-4569) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4571) push constant 4
@4 // push constant 4
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4573) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4575) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4577) pop pointer 1
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

// (-4579) push temp 0
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

// (-4581) pop that 0
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

// (-4583) goto IF_END6
@Memory.IF_END6 // goto IF_END6
0;JMP // unconditional jump

// (-4585) label IF_FALSE6
(Memory.IF_FALSE6) // label IF_FALSE6

// (-4588) push argument 0
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

// (-4590) push constant 3
@3 // push constant 3
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4592) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4594) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4596) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4598) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4600) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4602) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4604) pop pointer 1
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

// (-4606) push that 0
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

// (-4608) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4610) pop pointer 1
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

// (-4612) push temp 0
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

// (-4614) pop that 0
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

// (-4616) label IF_END6
(Memory.IF_END6) // label IF_END6

// (-4619) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4621) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4623) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4625) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4627) push argument 0
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

// (-4629) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4631) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4633) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4635) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4637) pop pointer 1
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

// (-4639) push temp 0
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

// (-4641) pop that 0
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

// (-4643) label IF_FALSE5
(Memory.IF_FALSE5) // label IF_FALSE5

// (-4646) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4648) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4650) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4652) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4654) pop temp 0
@5 // pop temp 0
D=A
@0 // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset
D=D+A // d = [asm_segment+offset] (*dst)
@SP // *esp
A=M // [esp]
M=D // [esp] = *dst
@SP // retrieve the *src pointer from esp-1 // *esp
M=M-1 // *esp-- (*src)
A=M // [src]
D=M // d = [src]
@SP // restore esp (*esp)
M=M+1 // *esp++ (**dst)
A=M // copy [src] to [dst] // *dst
A=M // [dst]
M=D // [dst] = [src] (pop)
@SP // *esp
M=M-1 // *esp-- (*src) // stacksize--

// (-4656) pop pointer 1
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

// (-4658) push temp 0
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

// (-4660) pop that 0
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

// (-4662) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4664) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4666) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4668) return

// (-4670) pop argument 0 // return // move result to ARG[0] (soon to be last stack item)
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

// (-4672) function Memory.deAlloc 2
(Memory.deAlloc) // function Memory.deAlloc 2

// (-4675) push argument 0
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
// (-4677) push constant 2
@2 // push constant 2
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4679) sub
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

// (-4681) pop local 0
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

// (-4683) push constant 1
@1 // push constant 1
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4685) push local 0
@LCL // push local 0
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4687) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4689) pop pointer 1
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

// (-4691) push that 0
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

// (-4693) pop local 1
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

// (-4695) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4697) push local 1
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

// (-4699) add
@SP // add
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

// (-4701) pop pointer 1
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

// (-4703) push that 0
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

// (-4705) push constant 0
@0 // push constant 0
D=A
@SP
A=M
M=D
@SP
M=M+1 // stacksize++

// (-4707) eq
@SP // eq // *esp 
M=M-1 // *esp-- (*val2)
A=M // [val2]
D=M // d = [val2]
@SP // *esp (*val2)
M=M-1 // *esp-- (*val1)
A=M // [esp] ([val1])
D=M-D // d = [val1] - [val2]
@EQ_TRUE_515
D;JEQ
(EQ_FALSE_515)
@0
D=A // d = false
@EQ_END_515
0;JMP
(EQ_TRUE_515)
@0
D=A
D=D-1 // d = -1 (true)
(EQ_END_515)
@SP // *esp (*val1)
A=M // [esp] ([val1])
M=D // [esp] = eq result
@SP // *esp
M=M+1 // *esp++

// (-4712) if-goto IF_TRUE0
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



